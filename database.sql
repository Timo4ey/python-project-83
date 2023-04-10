--
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: url_checks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.url_checks (
    id bigint NOT NULL,
    url_id bigint,
    status_code integer,
    h1 character varying(255),
    title character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.url_checks OWNER TO postgres;

--
-- Name: url_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.url_checks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.url_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.urls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: url_checks; Type: TABLE DATA; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.url_checks_id_seq', 7, true);
1	https://ru.hexlet.io	2023-04-10 12:39:15.031636
2	https://stepik.org	2023-04-10 12:39:37.138841
3	https://docs.sqlalchemy.org	2023-04-10 12:40:11.089756
\.


--
-- Name: url_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

COPY public.url_checks (id, url_id, status_code, h1, title, description, created_at) FROM stdin;
1	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:39:04.535051
2	2	200	\n      \n        Скачай курс в приложении\n      \n    	\n	Promoting efficient learning by developing innovative educational technologies. Create an interactive lesson and employ automated grading software.	2023-04-10 12:39:04.535051
3	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:39:04.535051
4	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:44:09.363142
5	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:52:04.573461
6	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:52:04.824145
7	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 10:03:35.097156
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, name, created_at) FROM stdin;


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 3, true);


--
-- Name: url_checks url_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: url_checks url_checks_url_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_url_id_fkey FOREIGN KEY (url_id) REFERENCES public.urls(id);


--
-- PostgreSQL database dump complete
--

