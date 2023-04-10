--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

-- Started on 2023-04-10 14:45:16 MSK

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

ALTER TABLE ONLY public.url_checks DROP CONSTRAINT url_checks_url_id_fkey;
ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
ALTER TABLE ONLY public.url_checks DROP CONSTRAINT url_checks_pkey;
ALTER TABLE public.urls ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.urls_id_seq;
DROP TABLE public.urls;
DROP TABLE public.url_checks;
DROP EXTENSION timescaledb;
--
-- TOC entry 2 (class 3079 OID 16927)
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 247 (class 1259 OID 17473)
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
-- TOC entry 248 (class 1259 OID 17479)
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
-- TOC entry 249 (class 1259 OID 17481)
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    name character varying(255) DEFAULT '255'::bpchar NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17485)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 250
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- TOC entry 3247 (class 2604 OID 17487)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- TOC entry 3222 (class 0 OID 17376)
-- Dependencies: 237
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;


--
-- TOC entry 3221 (class 0 OID 17379)
-- Dependencies: 238
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;



--
-- TOC entry 3220 (class 0 OID 17373)
-- Dependencies: 236
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;



--
-- TOC entry 3197 (class 0 OID 16944)
-- Dependencies: 207
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;



--
-- TOC entry 3204 (class 0 OID 17030)
-- Dependencies: 216
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;



--
-- TOC entry 3200 (class 0 OID 16995)
-- Dependencies: 212
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;



--
-- TOC entry 3202 (class 0 OID 17014)
-- Dependencies: 214
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;



--
-- TOC entry 3206 (class 0 OID 17051)
-- Dependencies: 217
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;



--
-- TOC entry 3209 (class 0 OID 17085)
-- Dependencies: 220
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;



--
-- TOC entry 3208 (class 0 OID 17069)
-- Dependencies: 219
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;



--
-- TOC entry 3218 (class 0 OID 17221)
-- Dependencies: 232
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;



--
-- TOC entry 3213 (class 0 OID 17150)
-- Dependencies: 226
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;



--
-- TOC entry 3215 (class 0 OID 17181)
-- Dependencies: 228
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;



--
-- TOC entry 3214 (class 0 OID 17171)
-- Dependencies: 227
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;



--
-- TOC entry 3216 (class 0 OID 17185)
-- Dependencies: 229
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;



--
-- TOC entry 3217 (class 0 OID 17202)
-- Dependencies: 231
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;



--
-- TOC entry 3198 (class 0 OID 16966)
-- Dependencies: 208
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;



--
-- TOC entry 3212 (class 0 OID 17142)
-- Dependencies: 225
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
exported_uuid	297f21a7-717e-4124-9823-df641de0b81f	t




--
-- TOC entry 3219 (class 0 OID 17236)
-- Dependencies: 233
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;



--
-- TOC entry 3199 (class 0 OID 16980)
-- Dependencies: 210
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;



--
-- TOC entry 3211 (class 0 OID 17099)
-- Dependencies: 222
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: postgres
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;



--
-- TOC entry 3464 (class 0 OID 17473)
-- Dependencies: 247
-- Data for Name: url_checks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.url_checks (id, url_id, status_code, h1, title, description, created_at) FROM stdin;
1	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:39:04.535051
2	2	200	\n      \n        Скачай курс в приложении\n      \n    	\n	Promoting efficient learning by developing innovative educational technologies. Create an interactive lesson and employ automated grading software.	2023-04-10 12:39:04.535051
3	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:39:04.535051
4	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:44:09.363142
5	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:52:04.573461
6	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:52:04.824145
7	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 10:03:35.097156



--
-- TOC entry 3466 (class 0 OID 17481)
-- Dependencies: 249
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, name, created_at) FROM stdin;
1	https://ru.hexlet.io	2023-04-10 12:39:15.031636
2	https://stepik.org	2023-04-10 12:39:37.138841
3	https://docs.sqlalchemy.org	2023-04-10 12:40:11.089756



--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 218
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 215
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 211
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 213
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 206
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 221
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 248
-- Name: url_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.url_checks_id_seq', 7, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 250
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 3, true);


--
-- TOC entry 3320 (class 2606 OID 17489)
-- Name: url_checks url_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 17491)
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 17492)
-- Name: url_checks url_checks_url_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url_checks
    ADD CONSTRAINT url_checks_url_id_fkey FOREIGN KEY (url_id) REFERENCES public.urls(id);


-- Completed on 2023-04-10 14:46:33 MSK

--
-- PostgreSQL database dump complete
--
\.