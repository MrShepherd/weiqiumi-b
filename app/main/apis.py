import random

from flask import request, jsonify

from . import main
from .. import db
from ..models import Questions, Users


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


@main.route('/api/questions', methods=['GET'])
def questions():
    typekey = request.values.get('typekey')
    typevalue = request.values.get('typevalue')
    # print(typekey)
    # print(typevalue)
    # all_difficulty = ['变态'] * 3 + ['困难'] * 5 + ['简单'] * 7 + ['容易'] * 10
    all_difficulty = ['变态'] * 1 + ['困难'] * 1 + ['简单'] * 1 + ['容易'] * 1
    question_ids_picked = []
    category_picked = []
    for difficulty in all_difficulty:
        # print(category_picked)
        temp_question = db.session.query(Questions.id, Questions.category).filter(Questions.typekey == typekey, Questions.typevalue == typevalue, Questions.difficulty == difficulty).filter(~Questions.category.in_(category_picked)).all()
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
    print(result)
    return jsonify(result)
