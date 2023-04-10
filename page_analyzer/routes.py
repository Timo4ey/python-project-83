from flask import (render_template, request,
                   Blueprint, flash,
                   get_flashed_messages,
                   redirect, abort,
                   url_for)
from .link_validator import Validator
from .url_handler import DataBuilder
from .db import Urls, UrlChecks, MergeData

main = Blueprint("main", __name__)


@main.route('/')
def main_page():
    messages = get_flashed_messages(with_categories=True)
    return render_template('index.html', messages=messages)


@main.route('/urls', methods=["GET"])
def urls():
    url = MergeData()
    executed = url.get_merge()
    return render_template('urls.html', data=executed, url_checks={})


@main.route('/urls/<int:id>')
def url_page(id):
    data = Urls().get_certain_id(id)
    message = get_flashed_messages(with_categories=True)
    if data:
        checked = [x for x in UrlChecks().get_all_data()
                   if x.url_id == id][::-1]
        return render_template('url.html', data=data,
                               messages=message, checked=checked)
    abort(404, description="Resource not found")


@main.route('/urls', methods=["POST"])
def get_url():
    url = request.form['url']
    validator = Validator(url)
    if not url:
        flash("URL обязателен", "failed")
    if not validator.is_valid:
        flash("Некорректный URL", "failed")
    if not url or not validator.is_valid:
        abort(422)
        # return redirect(url_for('main.main_page'))
    data = Urls()
    db_data = data.get_all_data()
    val = validator.validate_unique_link(db_data)
    if val:
        flash("Страница уже существует", "info")
        return redirect(url_for('main.url_page'))

    data.create_url(name=validator.get_link)
    id = data.get_all_data()[-1].id
    flash("Страница успешно добавлена", "success")
    return redirect(url_for('main.url_page', id=id))


@main.post("/urls/<id>/checks")
def checker_page(id):
    link = Urls().get_certain_id(id=id).name
    response = DataBuilder(link, id)
    if 200 <= response.status_code() < 300:
        urls_check = UrlChecks()
        urls_check.create_check(response.get_all_data())
        flash('Страница успешно проверена', 'success')
    else:
        flash('Произошла ошибка при проверке', "danger")
    return redirect(url_for("main.url_page", id=id))


@main.errorhandler(404)
def page_not_found(e):
    return render_template("unknown_page.html"), 404


@main.errorhandler(500)
def internal_server_error(e):
    return render_template("unknown_page.html"), 500


@main.errorhandler(422)
def unprocessable_content(e):
    return redirect(url_for('main.main_page'))
