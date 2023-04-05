from page_analyzer.configuration import Psqlconfig
from .extensions import db
from datetime import datetime

access = Psqlconfig()
url_base = access.url


class Urls(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    created_at = db.Column(db.DateTime, default=datetime.now)
