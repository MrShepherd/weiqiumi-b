import os
import random
from datetime import datetime

from flask import Response
from flask import json, request, jsonify

from . import main
from .. import db
from ..models import Questions, Users, TestHistory, GradeHistory, Articles, Issues, TestCode


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
    openid = request.values.get('openid')
    user = Users(openid=openid, nickname=request.values.get('nickname'), gender=request.values.get('gender'), city=request.values.get('city'), province=request.values.get('province'),
                 avatarurl=request.values.get('avatarurl'))
    db.session.merge(user)
    # user = Users(openid=request.values.get('openid'), dongqiudiID='1000')
    # db.session.merge(user)
    # result = {}
    # rows = db.session.query(TestCode.code).filter(TestCode.openid == openid, TestCode.enable == 1).all()
    # result['testcode'] = [item[0] for item in rows]
    # rows = db.session.query(GradeHistory.date, GradeHistory.gradetime, GradeHistory.grade, GradeHistory.typevalue).filter(GradeHistory.openid == openid).order_by(GradeHistory.date,
    #                                                                                                                                                               GradeHistory.gradetime).all()
    # result['gradehistory'] = [{'gradedate': item[0].strftime('%Y-%m-%d'), 'gradetime': item[1].strftime('%H:%M:%S'), 'gradeteam': item[3], 'grade': item[2]} for item in rows]
    # rows = db.session.execute('select max(grade),typevalue from gradehistory where openid="%s" group by typevalue  order by max(grade) DESC ' % openid)
    # # print(rows)
    # result['honor'] = [{'team': item[1], 'grade': item[0]} for item in rows]
    return 'ok'


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
        temp_dict = {'id': temp_question[0], 'title': temp_question[1], 'image': temp_question[2], 'option': temp_list}
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
    timestart = datetime.strptime(data['timestart'], '%H:%M:%S').strftime('%H:%M:%S')
    timeend = datetime.strptime(data['timeend'], '%H:%M:%S').strftime('%H:%M:%S')
    timecost = (datetime.strptime(data['timeend'], '%H:%M:%S') - datetime.strptime(data['timestart'], '%H:%M:%S')).seconds
    new_test_history = TestHistory(openid=data['openid'], date=data['date'], typekey=data['typekey'], typevalue=data['typevalue'], rightnum=rightnum, wrongnum=wrongnum, mark=min(totalmark, 100),
                                   timestart=timestart, timeend=timeend, timecost=timecost)
    db.session.merge(new_test_history)
    result = {'rightnum': rightnum, 'wrongnum': wrongnum, 'mark': min(totalmark, 100), 'timecost': timecost, 'timestart': timestart, 'timeend': timeend}
    return jsonify(result)


@main.route('/api/grade', methods=['POST'])
def grade():
    data = json.loads(request.data)
    openid = data['openid']
    team = data['typevalue']
    question_ids = [item['id'] for item in data['questions']]
    rows = db.session.query(Questions.id, Questions.answer).filter(Questions.id.in_(question_ids)).all()
    answers = [{'id': row[0], 'answer': row[1]} for row in rows]
    row = db.session.execute('select max(grade) from gradehistory where openid="%s" and typevalue="%s" ' % (openid, team))
    # print(row.fetchone())
    try:
        grade_max = row.fetchone()[0]
    except Exception as e:
        grade_max = 0
    grade_result = data['mark'] // 5
    result = {'answers': answers, 'grade_result': grade_result, 'grade_max': grade_max}
    new_grade_history = GradeHistory(openid=data['openid'], date=data['date'], gradetime=data['gradetime'], typekey=data['typekey'], typevalue=data['typevalue'], grade=grade_result)
    db.session.merge(new_grade_history)
    return jsonify(result)


@main.route('/api/article', methods=['POST'])
def article():
    rows = db.session.query(Articles.id, Articles.title, Articles.abbr, Articles.content, Articles.image).filter(Articles.enable == 1).order_by(Articles.id.desc()).all()
    articles = [{'id': row[0], 'title': row[1], 'abbr': row[2], 'content': row[3], 'image': row[4]} for row in rows]
    return jsonify(articles)


@main.route('/api/issues', methods=['POST'])
def issues():
    openid = request.values.get('openid')
    title = request.values.get('title')
    content = request.values.get('content')
    issuedate = datetime.now().strftime('%Y-%m-%d')
    new_issue = Issues(id=None, openid=openid, title=title, issuedate=issuedate, content=content)
    db.session.merge(new_issue)
    return 'ok'


@main.route('/api/study', methods=['POST'])
def study():
    data = json.loads(request.data)
    typekey = data.get('typekey')
    typevalue = data.get('typevalue')
    id_learned = data.get('id_learned') + [9999999]
    # print(id_learned)
    temp_questions = db.session.query(Questions.id, Questions.title, Questions.image, Questions.answer, Questions.optionlist).filter(Questions.typekey == typekey,
                                                                                                                                     Questions.typevalue == typevalue).filter(
        ~Questions.id.in_(id_learned)).all()
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
        temp_dict = {'id': temp_question[0], 'title': temp_question[1], 'image': temp_question[2], 'answer': temp_question[3], 'option': temp_list}
        result.append(temp_dict)
    # print(result)
    return jsonify(result)


@main.route('/api/testcode', methods=['POST'])
def testcode():
    openid = request.values.get('openid')
    result = {}
    rows = db.session.query(TestCode.code).filter(TestCode.openid == openid, TestCode.enable == 1).all()
    result['testcode'] = [item[0] for item in rows]
    return jsonify(result)


@main.route('/api/honor', methods=['POST'])
def honor():
    openid = request.values.get('openid')
    result = {}
    rows = db.session.execute('select max(grade),typevalue from gradehistory where openid="%s" group by typevalue  order by max(grade) DESC ' % openid)
    # print(rows)
    result['honor'] = [{'team': item[1], 'grade': item[0]} for item in rows]
    return jsonify(result)


@main.route('/api/gradehistory', methods=['POST'])
def gradehistory():
    openid = request.values.get('openid')
    result = {}
    rows = db.session.query(GradeHistory.date, GradeHistory.gradetime, GradeHistory.grade, GradeHistory.typevalue).filter(GradeHistory.openid == openid).order_by(db.desc(GradeHistory.date),
                                                                                                                                                                  db.desc(GradeHistory.gradetime)).all()
    result['gradehistory'] = [{'gradedate': item[0].strftime('%Y-%m-%d'), 'gradetime': item[1].strftime('%H:%M:%S'), 'gradeteam': item[3], 'grade': item[2]} for item in rows]
    return jsonify(result)


@main.route('/api/homeimages', methods=['POST'])
def homeimages():
    result = {'homeimages': ['league.jpg', 'baobei.jpg', 'water.jpg', 'keeper.jpg']}
    return jsonify(result)


@main.route("/image/<imagename>", methods=['GET'])
def images(imagename):
    image = None
    base_dir = os.path.dirname(__file__)
    with open(os.path.join(base_dir, 'images/' + imagename), 'rb') as fr:
        image = fr.read()
    resp = Response(image, mimetype="image/jpeg")
    return resp
