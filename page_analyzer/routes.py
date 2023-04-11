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


@main.post('/urls')
def post_urls():
    url = request.form.to_dict().get('url')
    validation = Validator(url)
    if validation.is_valid:
        if validation.is_valid.get('wrong'):
            flash('Некорректный URL', 'danger')
        if validation.is_valid.get('empty'):
            flash('URL обязателен', 'danger')
        if validation.is_valid.get('size'):
            flash('URL превышает 255 символов', 'danger')
        return render_template('index.html'), 422
    db = Urls()
    url = validation.cut_link()
    id_url = db.get_certain_name(url)
    if id_url:
        id_url = id_url.id
        flash('Страница уже существует', 'info')
    else:
        db.create_url(url)
        id_url = db.get_certain_name(url).id
        flash('Страница успешно добавлена', 'success')

    return redirect(url_for('main.url_page', id=id_url))


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
