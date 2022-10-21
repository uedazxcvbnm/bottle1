--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12
-- Dumped by pg_dump version 11.12

-- Started on 2022-10-17 14:40:00

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

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 32798)
-- Name: book_categories; Type: TABLE; Schema: public; Owner: book_user
--

CREATE TABLE public.book_categories (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE public.book_categories OWNER TO book_user;

--
-- TOC entry 198 (class 1259 OID 32796)
-- Name: book_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: book_user
--

CREATE SEQUENCE public.book_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_categories_id_seq OWNER TO book_user;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 198
-- Name: book_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: book_user
--

ALTER SEQUENCE public.book_categories_id_seq OWNED BY public.book_categories.id;


--
-- TOC entry 200 (class 1259 OID 40977)
-- Name: book_user; Type: TABLE; Schema: public; Owner: book_user
--

CREATE TABLE public.book_user (
    user_id character varying(255) NOT NULL,
    passwd character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    user_shi character varying(255),
    user_mei character varying(255),
    del boolean
);


ALTER TABLE public.book_user OWNER TO book_user;

--
-- TOC entry 197 (class 1259 OID 32787)
-- Name: books; Type: TABLE; Schema: public; Owner: book_user
--

CREATE TABLE public.books (
    id integer NOT NULL,
    name character varying(255),
    volume character varying(255),
    author character varying(255),
    publisher character varying(255),
    memo text,
    create_date timestamp with time zone NOT NULL,
    del boolean
);


ALTER TABLE public.books OWNER TO book_user;

--
-- TOC entry 196 (class 1259 OID 32785)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: book_user
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO book_user;

--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 196
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: book_user
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 2699 (class 2604 OID 32801)
-- Name: book_categories id; Type: DEFAULT; Schema: public; Owner: book_user
--

ALTER TABLE ONLY public.book_categories ALTER COLUMN id SET DEFAULT nextval('public.book_categories_id_seq'::regclass);


--
-- TOC entry 2698 (class 2604 OID 32790)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: book_user
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 2830 (class 0 OID 32798)
-- Dependencies: 199
-- Data for Name: book_categories; Type: TABLE DATA; Schema: public; Owner: book_user
--

COPY public.book_categories (id, code, name) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 40977)
-- Dependencies: 200
-- Data for Name: book_user; Type: TABLE DATA; Schema: public; Owner: book_user
--

COPY public.book_user (user_id, passwd, email, user_shi, user_mei, del) FROM stdin;
naokiokada@kobedenshi.ac.jp	WECWEC	naokiokada@kobedenshi.ac.jp	\N	\N	f
aaa	aaa	aaa	岡田	直己	f
bbb	bbbc	bbb	岡田	直己	f
ccc	ccc	ccc			\N
ddd	ddd	ddd			\N
eee	eee	eee			f
fff	fff	fff			f
\.


--
-- TOC entry 2828 (class 0 OID 32787)
-- Dependencies: 197
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: book_user
--

COPY public.books (id, name, volume, author, publisher, memo, create_date, del) FROM stdin;
2	AI特論	上巻	岡田直己	新潮社	面白い	2022-06-06 21:55:59.477211+09	f
1	テスト書籍	１巻	岡田 直己	新潮社	面白い	2022-06-06 21:55:59.149303+09	t
3	AI概論	上巻	岡田直己	新潮社	面白かった	2022-06-16 17:45:21.688119+09	f
\.


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 198
-- Name: book_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: book_user
--

SELECT pg_catalog.setval('public.book_categories_id_seq', 1, false);


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 196
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: book_user
--

SELECT pg_catalog.setval('public.books_id_seq', 3, true);


--
-- TOC entry 2703 (class 2606 OID 32806)
-- Name: book_categories book_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: book_user
--

ALTER TABLE ONLY public.book_categories
    ADD CONSTRAINT book_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 40984)
-- Name: book_user book_user_pkey; Type: CONSTRAINT; Schema: public; Owner: book_user
--

ALTER TABLE ONLY public.book_user
    ADD CONSTRAINT book_user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2701 (class 2606 OID 32795)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: book_user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


-- Completed on 2022-10-17 14:40:01

--
-- PostgreSQL database dump complete
--

