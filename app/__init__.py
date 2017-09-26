from flask import Flask
from config import config
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    db.init_app(app)
    db.reflect(app=app)
    # tables = ['questions', 'user', 'testhistory', 'payhistory', 'gradehistory', 'invitecode']
    # op = getattr(db.Model.metedata, 'reflect')
    # op(bind=db.get_engine(app, 'weiqiumi'), views=True, only=tables)
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    return app
