from page_analyzer.config import PsqlConfig
from .extensions import db
from datetime import datetime

url_base = PsqlConfig().DATABASE_URL


class Urls(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    created_at = db.Column(db.DateTime, default=datetime.now)


class UrlChecks(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    url_id = db.Column(db.Integer, db.ForeignKey(Urls.id))
    status_code = db.Column(db.Integer)
    h1 = db.Column(db.String(255))
    title = db.Column(db.String(255))
    description = db.Column(db.String(255))
    created_at = db.Column(db.DateTime, default=datetime.now)
