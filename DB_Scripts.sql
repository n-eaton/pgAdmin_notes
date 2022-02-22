--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-22 14:30:17

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
-- TOC entry 212 (class 1259 OID 16787)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    user_id integer,
    body text
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16786)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 211
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 210 (class 1259 OID 16764)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(70)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16763)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 214 (class 1259 OID 16801)
-- Name: website; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website (
    id integer NOT NULL,
    title character varying(30),
    url character varying(100)
);


ALTER TABLE public.website OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16800)
-- Name: website_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 213
-- Name: website_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_id_seq OWNED BY public.website.id;


--
-- TOC entry 3175 (class 2604 OID 16790)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 16767)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3176 (class 2604 OID 16804)
-- Name: website id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website ALTER COLUMN id SET DEFAULT nextval('public.website_id_seq'::regclass);


--
-- TOC entry 3328 (class 0 OID 16787)
-- Dependencies: 212
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (id, user_id, body) FROM stdin;
1	3	This is the first post
2	1	This is the second post
3	3	This is the test post for the same user
4	2	Life is the best thing that has ever been invented
\.


--
-- TOC entry 3326 (class 0 OID 16764)
-- Dependencies: 210
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, first_name, last_name, email) FROM stdin;
2	Gabriel G	Márquez 	example_1@mail.com
3	Leo	Tolstoy 	example_2@mail.com
4	User A	LastNameA 	example_4@mail.com
5	User B	LastNameB 	example_5@mail.com
6	User C	LastNameC 	example_6@mail.com
7	User D	LastNameD 	example_7@mail.com
1	Erich M	Remarque	example@mail.com
\.


--
-- TOC entry 3330 (class 0 OID 16801)
-- Dependencies: 214
-- Data for Name: website; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website (id, title, url) FROM stdin;
2	Test	www.yahoo.com
3	Test	www.bing.com
4	Test	www.ask.com
1	Google	www.google.com
\.


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 211
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 1, false);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 213
-- Name: website_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_id_seq', 4, true);


--
-- TOC entry 3182 (class 2606 OID 16794)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3178 (class 2606 OID 16771)
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- TOC entry 3180 (class 2606 OID 16769)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16806)
-- Name: website website_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 16795)
-- Name: post fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_user FOREIGN KEY (id) REFERENCES public."user"(id);


-- Completed on 2022-02-22 14:30:17

--
-- PostgreSQL database dump complete
--

