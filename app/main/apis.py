from . import main
from .. import db
from ..models import Questions


@main.route('/')
def index():
    # return '<h1>hello world</h1>'
    testcnt = db.session.query(Questions.title).first()
    return '<h1>%s</h1>' % testcnt
