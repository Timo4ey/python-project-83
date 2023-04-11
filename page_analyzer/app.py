from flask import Flask
from flask_bootstrap import Bootstrap4
from page_analyzer.config import ProdConfig  # DevConfig
from flask import (render_template, request,
                   flash,
                   abort, redirect, url_for)
from page_analyzer.link_validator import Validator
from page_analyzer.url_handler import DataBuilder
from page_analyzer.db import Urls, UrlChecks, MergeData


def create_app():
    created_app = Flask(__name__)
    created_app.config.from_object(ProdConfig)
    Bootstrap4(created_app)
    return created_app


app = create_app()


@app.route('/')
def main_page():
    return render_template('index.html')


@app.route('/urls', methods=["GET"])
def urls():
    url = MergeData()
    executed = url.get_merge()
    return render_template('urls.html', data=executed)


@app.route('/urls/<int:id>')
def url_page(id):
    data = Urls().get_certain_id(id)
    if data:
        checked = UrlChecks().certain_url(id)
        return render_template('url.html', data=data, checked=checked)
    abort(404, description="Resource not found")


@app.route('/urls', methods=["POST"])
def get_url():
    url = request.form['url']
    validator = Validator(url)
    validator.validation()
    if validator.is_valid:
        if not url:
            flash("URL обязателен", "danger")
        if validator.is_valid.get('wrong'):
            flash("Некорректный URL", "danger")
        if validator.is_valid.get('size'):
            flash("URL превышает 255 символов", "danger")
        return render_template('index.html'), 422
    validator.cut_link()
    data = Urls()
    val = data.get_certain_name(validator.new_link)
    if val:
        flash("Страница уже существует", "info")
        id = val.id
    else:
        flash("Страница успешно добавлена", "success")
        data.create_url(name=validator.new_link)
        id = data.get_certain_name(validator.new_link).id
    return redirect(url_for('url_page', id=id))


@app.post("/urls/<id>/checks")
def checker_page(id):
    data = Urls().get_certain_id(id)
    link = data.name
    response = DataBuilder(link, id)

    urls_check = UrlChecks()
    if 200 >= response.s_code < 300:
        urls_check.create_check(response.get_all_data())
        checked = urls_check.certain_url(id)
        flash('Страница успешно проверена', 'success')
        return render_template('url.html', data=data, checked=checked), 200
    else:
        flash('Произошла ошибка при проверке', "danger")
    checked = urls_check.certain_url(id)
    return render_template('url.html', data=data, checked=checked), 422


@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"), 404


if __name__ == "__main__":
    app.config.from_object(ProdConfig)
    app.run()
