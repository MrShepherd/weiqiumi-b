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


class InviteCode(db.Model):
    __tablename__ = 'invitecode'
