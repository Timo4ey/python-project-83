from flask import (render_template, request,
                   Blueprint, flash,
                   get_flashed_messages,
                   redirect,
                   url_for)
from .link_validator import validate_link

main = Blueprint("main", __name__)


@main.route('/')
def main_page():
    messages = get_flashed_messages(with_categories=True)
    return render_template('index.html', messages=messages)


@main.route('/urls', methods=["GET"])
def urls():
    return render_template('urls.html')


@main.route('/urls', methods=["POST"])
def get_url():
    url = request.form['url']
    validation = validate_link(url)
    if not url:
        flash("URL обязателен", "failed")
    if not validation:
        flash("Некорректный URL", "failed")
    if not url or not validation:
        return redirect(url_for('main.main_page'))
    flash("Страница успешно добавлена", "success")
    return redirect(url_for('main.urls'))
