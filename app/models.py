from . import db


class Questions(db.Model):
    __tablename__ = 'questions'


class Users(db.Model):
    __tablename__ = 'users'


class TestHistory(db.Model):
    __tablename__ = 'testhistory'


class PayHistory(db.Model):
    __tablename__ = 'payhistory'


class GradeHistory(db.Model):
    __tablename__ = 'gradehistory'


class TestCode(db.Model):
    __tablename__ = 'testcode'


class Articles(db.Model):
    __tablename__ = 'articles'


class Issues(db.Model):
    __tablename__ = 'issues'
