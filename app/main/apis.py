from flask import request

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
    print(request.values.get('openid'))
    print(request.values.get('nickname'))
    print(request.values.get('gender'))
    print(request.values.get('city'))
    print(request.values.get('province'))
    print(request.values.get('avatarurl'))
    user = Users(openid=request.values.get('openid'), nickname=request.values.get('nickname'), gender=request.values.get('gender'), city=request.values.get('city'),
                 province=request.values.get('province'), avatarurl=request.values.get('avatarurl'))
    db.session.merge(user)
    user = Users(openid=request.values.get('openid'), dongqiudiID='1000')
    db.session.merge(user)
    return 'hello'
