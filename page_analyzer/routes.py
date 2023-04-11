from flask import (render_template, request,
                   Blueprint, flash,
                   abort, redirect, url_for)
from .link_validator import Validator
from .url_handler import DataBuilder
from .db import Urls, UrlChecks, MergeData

main = Blueprint("main", __name__)


@main.route('/')
def main_page():
    return render_template('index.html')


@main.route('/urls', methods=["GET"])
def urls():
    url = MergeData()
    executed = url.get_merge()
    return render_template('urls.html', data=executed, url_checks={})


@main.route('/urls/<int:id>')
def url_page(id):
    data = Urls().get_certain_id(id)
    if data:
        checked = UrlChecks().certain_url(id)
        return render_template('url.html', data=data, checked=checked)
    abort(404, description="Resource not found")


@main.route('/urls', methods=["POST"])
def get_url():
    url = request.form['url']
    validator = Validator(url)
    if not url:
        flash("URL обязателен", "danger")
    if not validator.is_valid:
        flash("Некорректный URL", "danger")
    if not validator.is_correct_len():
        flash("URL превышает 255 символов", "danger")
    if not url or not validator.is_valid or not validator.is_correct_len():
        return render_template('index.html'), 422
    data = Urls()
    db_data = data.get_all_data()
    val = validator.validate_unique_link(db_data)
    if val:
        flash("Страница уже существует", "info")
        # checked = UrlChecks().certain_url(val[0].id)
        # return render_template('url.html', data=val[0], checked=checked)
        return redirect(url_for('main.url_page', id=val[0].id))

    data.create_url(name=validator.get_link)
    page_url = data.get_all_data()[-1]
    flash("Страница успешно добавлена", "success")
    return render_template('url.html', data=page_url), 200


@main.post("/urls/<id>/checks")
def checker_page(id):
    data = Urls().get_certain_id(id)
    link = data.name
    response = DataBuilder(link, id)

    urls_check = UrlChecks()
    if 200 <= response.s_code < 300:
        urls_check.create_check(response.get_all_data())
        checked = urls_check.certain_url(id)
        flash('Страница успешно проверена', 'success')
        return render_template('url.html', data=data, checked=checked), 200
    else:
        flash('Произошла ошибка при проверке', "danger")
    checked = urls_check.certain_url(id)
    return render_template('url.html', data=data, checked=checked), 422


@main.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"), 404

