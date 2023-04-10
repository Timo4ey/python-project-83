--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
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
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE _timescaledb_cache.cache_inval_bgw_job DISABLE TRIGGER ALL;

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


ALTER TABLE _timescaledb_cache.cache_inval_bgw_job ENABLE TRIGGER ALL;

--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

ALTER TABLE _timescaledb_cache.cache_inval_extension DISABLE TRIGGER ALL;

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


ALTER TABLE _timescaledb_cache.cache_inval_extension ENABLE TRIGGER ALL;

--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

ALTER TABLE _timescaledb_cache.cache_inval_hypertable DISABLE TRIGGER ALL;

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


ALTER TABLE _timescaledb_cache.cache_inval_hypertable ENABLE TRIGGER ALL;

--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.hypertable DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.hypertable ENABLE TRIGGER ALL;

--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.chunk DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.chunk ENABLE TRIGGER ALL;

--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.dimension DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.dimension ENABLE TRIGGER ALL;

--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.dimension_slice DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.dimension_slice ENABLE TRIGGER ALL;

--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.chunk_constraint DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.chunk_constraint ENABLE TRIGGER ALL;

--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.chunk_data_node DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.chunk_data_node ENABLE TRIGGER ALL;

--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.chunk_index DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.chunk_index ENABLE TRIGGER ALL;

--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.compression_chunk_size DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.compression_chunk_size ENABLE TRIGGER ALL;

--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.continuous_agg DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.continuous_agg ENABLE TRIGGER ALL;

--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log ENABLE TRIGGER ALL;

--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.continuous_aggs_invalidation_threshold DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.continuous_aggs_invalidation_threshold ENABLE TRIGGER ALL;

--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.continuous_aggs_materialization_invalidation_log DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.continuous_aggs_materialization_invalidation_log ENABLE TRIGGER ALL;

--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.hypertable_compression DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.hypertable_compression ENABLE TRIGGER ALL;

--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.hypertable_data_node DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.hypertable_data_node ENABLE TRIGGER ALL;

--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.metadata DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
exported_uuid	297f21a7-717e-4124-9823-df641de0b81f	t
\.


ALTER TABLE _timescaledb_catalog.metadata ENABLE TRIGGER ALL;

--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.remote_txn DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.remote_txn ENABLE TRIGGER ALL;

--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

ALTER TABLE _timescaledb_catalog.tablespace DISABLE TRIGGER ALL;

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


ALTER TABLE _timescaledb_catalog.tablespace ENABLE TRIGGER ALL;

--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: postgres
--

ALTER TABLE _timescaledb_config.bgw_job DISABLE TRIGGER ALL;

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;
\.


ALTER TABLE _timescaledb_config.bgw_job ENABLE TRIGGER ALL;

--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.urls DISABLE TRIGGER ALL;

COPY public.urls (id, name, created_at) FROM stdin;
1	https://ru.hexlet.io	2023-04-10 12:39:15.031636
2	https://stepik.org	2023-04-10 12:39:37.138841
3	https://docs.sqlalchemy.org	2023-04-10 12:40:11.089756
\.


ALTER TABLE public.urls ENABLE TRIGGER ALL;

--
-- Data for Name: url_checks; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.url_checks DISABLE TRIGGER ALL;

COPY public.url_checks (id, url_id, status_code, h1, title, description, created_at) FROM stdin;
1	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:39:04.535051
2	2	200	\n      \n        Скачай курс в приложении\n      \n    	\n	Promoting efficient learning by developing innovative educational technologies. Create an interactive lesson and employ automated grading software.	2023-04-10 12:39:04.535051
3	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:39:04.535051
4	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:44:09.363142
5	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 12:52:04.573461
6	1	200	Онлайн-школа программирования, за выпускниками которой охотятся компании\n	Хекслет — больше чем школа программирования. Онлайн курсы, сообщество программистов	Живое онлайн сообщество программистов и разработчиков на JS, Python, Java, PHP, Ruby. Авторские программы обучения с практикой и готовыми проектами в резюме. Помощь в трудоустройстве после успешного окончания обучения	2023-04-10 12:52:04.824145
7	3	200	SQLAlchemy 2.0 Documentation	\n        \n        \n    \n    SQLAlchemy Documentation\n —\n    SQLAlchemy 2.0 Documentation\n\n        \n    	None	2023-04-10 10:03:35.097156
\.


ALTER TABLE public.url_checks ENABLE TRIGGER ALL;

--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


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

