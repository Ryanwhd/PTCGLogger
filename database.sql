--
-- PostgreSQL database dump
--

\restrict vruD1a4EFhgCdaJRuRSOlh1I6GbpvvCwYxh86MPF7ecXXBPeJzTv8lneqFUkuRv

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.3 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE public.cards (
    card_id integer NOT NULL,
    card_name character varying(100) NOT NULL,
    card_number character varying(20) NOT NULL,
    set_id integer,
    rarity character varying(20)
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_card_id_seq OWNER TO postgres;

--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    collector_id integer,
    card_id integer,
    acquired_date date
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- Name: collection_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collection_collection_id_seq OWNER TO postgres;

--
-- Name: collection_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_collection_id_seq OWNED BY public.collection.collection_id;


--
-- Name: collectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collectors (
    collector_id integer NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(50)
);


ALTER TABLE public.collectors OWNER TO postgres;

--
-- Name: collectors_collector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collectors_collector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collectors_collector_id_seq OWNER TO postgres;

--
-- Name: collectors_collector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collectors_collector_id_seq OWNED BY public.collectors.collector_id;


--
-- Name: sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sets (
    set_id integer NOT NULL,
    set_code character varying(10),
    set_name character varying(100),
    set_generation character varying(50),
    release_date date,
    num_cards integer
);


ALTER TABLE public.sets OWNER TO postgres;

--
-- Name: sets_set_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sets_set_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sets_set_id_seq OWNER TO postgres;

--
-- Name: sets_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sets_set_id_seq OWNED BY public.sets.set_id;


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: collection collection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN collection_id SET DEFAULT nextval('public.collection_collection_id_seq'::regclass);


--
-- Name: collectors collector_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collectors ALTER COLUMN collector_id SET DEFAULT nextval('public.collectors_collector_id_seq'::regclass);


--
-- Name: sets set_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets ALTER COLUMN set_id SET DEFAULT nextval('public.sets_set_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (card_id, card_name, card_number, set_id, rarity) FROM stdin;
1	Acerola's Intuition	255/284	1	SR
2	Mew VMAX	280/284	1	UR
3	Serena	81/94	2	SR
4	Serperior V	84/94	2	CSR
5	Serperior VSTAR	92/94	2	UR
6	Lillie's Clefairy ex	115/132	3	SR
7	Lillie's Clefairy ex	126/132	3	SAR
8	Spike Energy	132/132	3	UR
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (collection_id, collector_id, card_id, acquired_date) FROM stdin;
1	1	1	2021-12-03
2	1	3	2024-07-20
3	1	4	2024-07-20
4	1	6	2025-03-12
5	1	7	2025-03-12
\.


--
-- Data for Name: collectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collectors (collector_id, email, name, country) FROM stdin;
1	hwei26@cranbrook.edu	Ryan	USA
2	user1@sth.com	User1	Somewhere
3	user2@sth.com	User2	Somewhere
4	user3@sth.com	User3	SomewhereElse
5	user4@sth.com	User4	SomewhereElse
\.


--
-- Data for Name: sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sets (set_id, set_code, set_name, set_generation, release_date, num_cards) FROM stdin;
1	s8b	VMAX Climax	Sword & Shield	2021-12-03	284
2	s11a	Incandescent Arcana	Sword & Shield	2022-09-02	94
3	sv9	Battle Partners	Scarlet & Violet	2025-01-24	132
\.


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 8, true);


--
-- Name: collection_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_collection_id_seq', 5, true);


--
-- Name: collectors_collector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collectors_collector_id_seq', 5, true);


--
-- Name: sets_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sets_set_id_seq', 3, true);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);


--
-- Name: collectors collectors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collectors
    ADD CONSTRAINT collectors_email_key UNIQUE (email);


--
-- Name: collectors collectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collectors
    ADD CONSTRAINT collectors_pkey PRIMARY KEY (collector_id);


--
-- Name: sets sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (set_id);


--
-- Name: cards cards_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(set_id);


--
-- Name: collection collection_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(card_id);


--
-- Name: collection collection_collector_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_collector_id_fkey FOREIGN KEY (collector_id) REFERENCES public.collectors(collector_id);


--
-- PostgreSQL database dump complete
--

\unrestrict vruD1a4EFhgCdaJRuRSOlh1I6GbpvvCwYxh86MPF7ecXXBPeJzTv8lneqFUkuRv

