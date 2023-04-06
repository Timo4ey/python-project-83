# import logging
#
# import pytest
# from pytest_postgresql import factories
# from datetime import datetime
# from pytest_postgresql.janitor import DatabaseJanitor
# from sqlalchemy import create_engine, select
# from sqlalchemy.orm.session import sessionmaker
#
#
# from page_analyzer.config import PsqlConfig
#

# logging.basicConfig()
# logger = logging.getLogger()
# logger.setLevel(logging.DEBUG)
#
# test_db = factories.postgresql_proc(port=None, dbname='urls')
#
# @pytest.fixture(scope="module")
# def create_test_data():
#     urls = ['https://example.com', 'https://example_1.com', 'https://example_2.com']
