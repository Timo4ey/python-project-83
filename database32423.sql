-
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.urls (id, name, created_at) OVERRIDING SYSTEM VALUE VALUES (1, 'https://ru.hexlet.io', '2023-04-10 12:39:15.031636');
INSERT INTO public.urls (id, name, created_at) OVERRIDING SYSTEM VALUE VALUES (2, 'https://stepik.org', '2023-04-10 12:39:37.138841');
INSERT INTO public.urls (id, name, created_at) OVERRIDING SYSTEM VALUE VALUES (3, 'https://docs.sqlalchemy.org', '2023-04-10 12:40:11.089756');


--
-- Data for Name: url_checks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (1, 1, 200, 'Онлайн-школа программирования, за выпускниками которой охотятся компании
', 'Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов', 'Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения', '2023-04-10 12:39:04.535051');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (2, 2, 200, '

        Скачай курс в приложении

    ', '
', 'Promoting efficient learning by developing innovative educational technologies. Create an interactive lesson and employ automated grading software.', '2023-04-10 12:39:04.535051');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (3, 3, 200, 'SQLAlchemy 2.0 Documentation', '



    SQLAlchemy Documentation
 —
    SQLAlchemy 2.0 Documentation


    ', 'None', '2023-04-10 12:39:04.535051');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (4, 3, 200, 'SQLAlchemy 2.0 Documentation', '



    SQLAlchemy Documentation
 —
    SQLAlchemy 2.0 Documentation


    ', 'None', '2023-04-10 12:44:09.363142');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (5, 3, 200, 'SQLAlchemy 2.0 Documentation', '



    SQLAlchemy Documentation
 —
    SQLAlchemy 2.0 Documentation


    ', 'None', '2023-04-10 12:52:04.573461');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (6, 1, 200, 'Онлайн-школа программирования, за выпускниками которой охотятся компании
', 'Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов', 'Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения', '2023-04-10 12:52:04.824145');
INSERT INTO public.url_checks (id, url_id, status_code, h1, title, description, created_at) OVERRIDING SYSTEM VALUE VALUES (7, 3, 200, 'SQLAlchemy 2.0 Documentation', '



    SQLAlchemy Documentation
 —
    SQLAlchemy 2.0 Documentation


    ', 'None', '2023-04-10 10:03:35.097156');


--
-- Name: url_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.url_checks_id_seq', 7, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--