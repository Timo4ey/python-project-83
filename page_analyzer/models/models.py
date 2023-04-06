from page_analyzer.config import PsqlConfig
from .extensions import db
from datetime import datetime

url_base = PsqlConfig().DATABASE_URL


class Urls(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    created_at = db.Column(db.DateTime, default=datetime.now)
