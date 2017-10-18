import random

from flask import json
from flask import request, jsonify
from datetime import datetime

from . import main
from .. import db
from ..models import Questions, Users, TestHistory, GradeHistory, Articles


@main.route('/')
def index():
    # return '<h1>hello world</h1>'
    testcnt = db.session.query(Questions.title).first()
    return '<h1>%s</h1>' % testcnt


@main.route('/api/userinfo', methods=['POST'])
def userinfo():
    # print(request.values.get('openid'))
    # print(request.values.get('nickname'))
    # print(request.values.get('gender'))
    # print(request.values.get('city'))
    # print(request.values.get('province'))
    # print(request.values.get('avatarurl'))
    user = Users(openid=request.values.get('openid'), nickname=request.values.get('nickname'), gender=request.values.get('gender'), city=request.values.get('city'),
                 province=request.values.get('province'), avatarurl=request.values.get('avatarurl'))
    db.session.merge(user)
    # user = Users(openid=request.values.get('openid'), dongqiudiID='1000')
    # db.session.merge(user)
    return 'hello'


@main.route('/api/questions', methods=['POST'])
def questions():
    typekey = request.values.get('typekey')
    typevalue = request.values.get('typevalue')
    # print(typekey)
    # print(typevalue)
    # all_difficulty = ['变态'] * 3 + ['困难'] * 5 + ['简单'] * 7 + ['容易'] * 10
    all_difficulty = ['变态'] * 1 + ['困难'] * 2 + ['简单'] * 1 + ['容易'] * 2
    question_ids_picked = []
    category_picked = [999999999]
    for difficulty in all_difficulty:
        # print(category_picked)
        temp_question = db.session.query(Questions.id, Questions.category).filter(Questions.typekey == typekey, Questions.typevalue == typevalue, Questions.difficulty == difficulty).filter(
            ~Questions.category.in_(category_picked)).all()
        # print(temp_question)
        temp_question = random.sample(temp_question, 1)
        # print(temp_question)
        question_ids_picked.append(temp_question[0][0])
        category_picked.append(temp_question[0][1])
    temp_questions = db.session.query(Questions.id, Questions.title, Questions.image, Questions.answer, Questions.optionlist).filter(Questions.id.in_(question_ids_picked)).all()
    # print(temp_questions)
    result = []
    for temp_question in temp_questions:
        temp_list = temp_question[4].split('-')
        # print(temp_list)
        try:
            temp_list.remove(temp_question[3])
        except Exception:
            pass
        # print(temp_list)
        temp_list = random.sample(temp_list, 3)
        # print(temp_list)
        temp_list.append(temp_question[3])
        # print(temp_list)
        random.shuffle(temp_list)
        # print(temp_list)
        temp_dict = {'id': temp_question[0], 'title': temp_question[1], 'image': temp_question[2], 'optionA': temp_list[0], 'optionB': temp_list[1], 'optionC': temp_list[2], 'optionD': temp_list[3]}
        result.append(temp_dict)
    # print(result)
    return jsonify(result)


@main.route('/api/mark', methods=['POST'])
def mark():
    data = json.loads(request.data)
    answers = data['answers']
    # print(answers)
    rightnum = 0
    wrongnum = 0
    totalmark = 0
    timecost = 0
    mark_dict = {'容易': 3, '简单': 4, '困难': 5, '变态': 6}
    for answer in answers:
        question = db.session.query(Questions.id, Questions.answer, Questions.difficulty, Questions.righttimes, Questions.wrongtimes).filter(Questions.id == answer['id']).first()
        righttimes = question[3]
        wrongtimes = question[4]
        # print(question[2])
        if question[1] == answer['answer']:
            rightnum += 1
            righttimes += 1
            totalmark += mark_dict[question[2]]
        else:
            wrongnum += 1
            wrongtimes += 1
        new_question = Questions(id=question[0], righttimes=righttimes, wrongtimes=wrongtimes)
        db.session.merge(new_question)
    timecost = (datetime.strptime(data['timeend'], '%H:%M:%S') - datetime.strptime(data['timestart'], '%H:%M:%S')).seconds
    new_test_history = TestHistory(openid=data['openid'], date=data['date'], typekey=data['typekey'], typevalue=data['typevalue'], rightnum=rightnum, wrongnum=wrongnum, mark=min(totalmark, 100),
                                   timestart=data['timestart'], timeend=data['timeend'], timecost=timecost)
    db.session.merge(new_test_history)
    result = {'rightnum': rightnum, 'wrongnum': wrongnum, 'mark': min(totalmark, 100), 'timecost': timecost}
    return jsonify(result)


@main.route('/api/grade', methods=['POST'])
def grade():
    data = json.loads(request.data)
    rows = db.session.query(Questions.id, Questions.answer).filter(Questions.id.in_(data['questions'])).all()
    answers = [{'id': row[0], 'answer': row[1]} for row in rows]
    # print(answers)
    grade_result = data['mark'] // 5
    result = {'answers': answers, 'grade': grade_result}
    new_grade_history = GradeHistory(openid=data['openid'], date=data['date'], gradetime=data['gradetime'], typekey=data['typekey'], typevalue=data['typevalue'], grade=grade_result)
    db.session.merge(new_grade_history)
    return jsonify(result)


@main.route('/api/article', methods=['POST'])
def article():
    rows = db.session.query(Articles.id, Articles.title, Articles.abbr, Articles.content, Articles.image).filter(Articles.enable == 1).order_by(Articles.id.desc()).all()
    articles = [{'id': row[0], 'title': row[1], 'abbr': row[2], 'content': row[3], 'image': row[4]} for row in rows]
    return jsonify(articles)
