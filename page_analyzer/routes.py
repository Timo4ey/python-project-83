from flask import (render_template, request,
                   Blueprint, flash,
                   get_flashed_messages,
                   redirect, abort,
                   url_for)
from .link_validator import Validator
from .models import db, Urls, UrlChecks
from .url_handler import DataBuilder
from .url_handler import arrange_data

main = Blueprint("main", __name__)


@main.route('/')
def main_page():
    messages = get_flashed_messages(with_categories=True)
    return render_template('index.html', messages=messages)


@main.route('/urls', methods=["GET"])
def urls():
    url_check = UrlChecks.query.all()
    join_data = db.session.query(
        Urls.id, Urls.name, UrlChecks.status_code, UrlChecks.created_at
    ).join(UrlChecks,
           UrlChecks.url_id == Urls.id,
           isouter=True
           ).all()

    data = arrange_data(join_data)
    return render_template('urls.html', data=data, url_checks=url_check)


@main.route('/urls/<id>')
def url_page(id):
    data = Urls.query.filter_by(id=id)
    checked = UrlChecks.query.filter_by(url_id=id)
    message = get_flashed_messages(with_categories=True)
    if list(data):
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
        return redirect(url_for('main.main_page'))

    data = Urls.query.all()
    val = validator.validate_unique_link(data)

    if val:
        flash("Страница уже существует", "info")
        return redirect(url_for('main.url_page', id=val[0].id))

    db.session.add(Urls(name=validator.get_link))

    db.session.commit()
    id = 1 if not data else data[-1].id + 1
    flash("Страница успешно добавлена", "success")
    return redirect(url_for('main.url_page', id=id))


@main.errorhandler(404)
def page_not_found(e):
    return render_template("unknown_page.html"), 404


@main.errorhandler(500)
def internal_server_error(e):
    return render_template("unknown_page.html"), 500


@main.post("/urls/<id>/checks")
def checker_page(id):
    link = Urls.query.filter_by(id=id)[0].name
    response = DataBuilder(link)
    if 200 <= response.status_code() < 300:
        db.session.add(UrlChecks(
            url_id=id, status_code=response.status_code(),
            h1=response.get_head_one(), title=response.get_title(),
            description=response.get_description()
        ))
        db.session.commit()
        flash('Страница успешно проверена', 'success')
    else:
        flash('Произошла ошибка при проверке', "danger")
    return redirect(url_for("main.url_page", id=id))
