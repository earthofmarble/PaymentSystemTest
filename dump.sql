toc.dat                                                                                             0000600 0004000 0002000 00000016421 13504764717 0014461 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           7                 w         
   paymentsdb    11.2    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                    1262    24609 
   paymentsdb    DATABASE     �   CREATE DATABASE paymentsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';
    DROP DATABASE paymentsdb;
             postgres    false         �            1259    24618    accounts    TABLE     �   CREATE TABLE public.accounts (
    number_account integer NOT NULL,
    balance_account double precision NOT NULL,
    ownersid_account integer NOT NULL,
    isblocked_account boolean NOT NULL,
    id_account bigint NOT NULL
);
    DROP TABLE public.accounts;
       public         postgres    false                    0    0    TABLE accounts    COMMENT     M   COMMENT ON TABLE public.accounts IS 'Счета пользователей';
            public       postgres    false    197         �            1259    24676    accounts_id_accountt_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_id_accountt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.accounts_id_accountt_seq;
       public       postgres    false    197                    0    0    accounts_id_accountt_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.accounts_id_accountt_seq OWNED BY public.accounts.id_account;
            public       postgres    false    199         �            1259    24628    payments    TABLE     �   CREATE TABLE public.payments (
    amount_payment double precision NOT NULL,
    from_payment integer NOT NULL,
    to_payment integer NOT NULL,
    id_payment bigint NOT NULL
);
    DROP TABLE public.payments;
       public         postgres    false                    0    0    TABLE payments    COMMENT     6   COMMENT ON TABLE public.payments IS 'Платежи';
            public       postgres    false    198         �            1259    24685    payments_id_paymentt_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_id_paymentt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.payments_id_paymentt_seq;
       public       postgres    false    198                    0    0    payments_id_paymentt_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.payments_id_paymentt_seq OWNED BY public.payments.id_payment;
            public       postgres    false    200         �            1259    24610    users    TABLE       CREATE TABLE public.users (
    firstname_user character varying NOT NULL,
    secondname_user character varying NOT NULL,
    login_user character varying NOT NULL,
    password_user character varying NOT NULL,
    isadmin_user boolean NOT NULL,
    id_user bigint NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false                    0    0    TABLE users    COMMENT     L   COMMENT ON TABLE public.users IS 'Список пользователей';
            public       postgres    false    196         �            1259    24694    users_id_userr_seq    SEQUENCE     {   CREATE SEQUENCE public.users_id_userr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_id_userr_seq;
       public       postgres    false    196                    0    0    users_id_userr_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.users_id_userr_seq OWNED BY public.users.id_user;
            public       postgres    false    201         �
           2604    24678    accounts id_account    DEFAULT     {   ALTER TABLE ONLY public.accounts ALTER COLUMN id_account SET DEFAULT nextval('public.accounts_id_accountt_seq'::regclass);
 B   ALTER TABLE public.accounts ALTER COLUMN id_account DROP DEFAULT;
       public       postgres    false    199    197         �
           2604    24687    payments id_payment    DEFAULT     {   ALTER TABLE ONLY public.payments ALTER COLUMN id_payment SET DEFAULT nextval('public.payments_id_paymentt_seq'::regclass);
 B   ALTER TABLE public.payments ALTER COLUMN id_payment DROP DEFAULT;
       public       postgres    false    200    198         �
           2604    24696    users id_user    DEFAULT     o   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_userr_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    201    196                   0    24618    accounts 
   TABLE DATA               t   COPY public.accounts (number_account, balance_account, ownersid_account, isblocked_account, id_account) FROM stdin;
    public       postgres    false    197       2829.dat           0    24628    payments 
   TABLE DATA               X   COPY public.payments (amount_payment, from_payment, to_payment, id_payment) FROM stdin;
    public       postgres    false    198       2830.dat           0    24610    users 
   TABLE DATA               r   COPY public.users (firstname_user, secondname_user, login_user, password_user, isadmin_user, id_user) FROM stdin;
    public       postgres    false    196       2828.dat            0    0    accounts_id_accountt_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_id_accountt_seq', 5, true);
            public       postgres    false    199                    0    0    payments_id_paymentt_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.payments_id_paymentt_seq', 14, true);
            public       postgres    false    200                     0    0    users_id_userr_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_id_userr_seq', 17, true);
            public       postgres    false    201         �
           2606    24684    accounts accounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id_account);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         postgres    false    197         �
           2606    24693    payments payments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id_payment);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public         postgres    false    198         �
           2606    24705    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    196                                                                                                                                                                                                                                                       2829.dat                                                                                            0000600 0004000 0002000 00000000141 13504764717 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        12345	5	4	f	4
96412	5406.10000000000036	2	f	2
23677	0	2	f	5
58426	2.60000000000000009	2	t	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                               2830.dat                                                                                            0000600 0004000 0002000 00000000155 13504764717 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	58426	96421	1
2	58426	123123	2
123	85124	96421	3
509	44444	96421	4
9	12345	96421	9
180	96412	58426	14
\.


                                                                                                                                                                                                                                                                                                                                                                                                                   2828.dat                                                                                            0000600 0004000 0002000 00000000272 13504764717 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Женя	Гончарик	zhenya11	qwerty12345	f	2
Админ	Админ	admin	root	t	3
Вадим	Денисик	vadim222	1	f	4
Женя	Гончарик	zhenya11	qwerty12345	f	17
\.


                                                                                                                                                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000015146 13504764717 0015411 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE paymentsdb;
--
-- Name: paymentsdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE paymentsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';


ALTER DATABASE paymentsdb OWNER TO postgres;

\connect paymentsdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    number_account integer NOT NULL,
    balance_account double precision NOT NULL,
    ownersid_account integer NOT NULL,
    isblocked_account boolean NOT NULL,
    id_account bigint NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: TABLE accounts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.accounts IS 'Счета пользователей';


--
-- Name: accounts_id_accountt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_accountt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_accountt_seq OWNER TO postgres;

--
-- Name: accounts_id_accountt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_accountt_seq OWNED BY public.accounts.id_account;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    amount_payment double precision NOT NULL,
    from_payment integer NOT NULL,
    to_payment integer NOT NULL,
    id_payment bigint NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: TABLE payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.payments IS 'Платежи';


--
-- Name: payments_id_paymentt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_paymentt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_paymentt_seq OWNER TO postgres;

--
-- Name: payments_id_paymentt_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_paymentt_seq OWNED BY public.payments.id_payment;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    firstname_user character varying NOT NULL,
    secondname_user character varying NOT NULL,
    login_user character varying NOT NULL,
    password_user character varying NOT NULL,
    isadmin_user boolean NOT NULL,
    id_user bigint NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users IS 'Список пользователей';


--
-- Name: users_id_userr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_userr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_userr_seq OWNER TO postgres;

--
-- Name: users_id_userr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_userr_seq OWNED BY public.users.id_user;


--
-- Name: accounts id_account; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id_account SET DEFAULT nextval('public.accounts_id_accountt_seq'::regclass);


--
-- Name: payments id_payment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id_payment SET DEFAULT nextval('public.payments_id_paymentt_seq'::regclass);


--
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_userr_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (number_account, balance_account, ownersid_account, isblocked_account, id_account) FROM stdin;
\.
COPY public.accounts (number_account, balance_account, ownersid_account, isblocked_account, id_account) FROM '$$PATH$$/2829.dat';

--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (amount_payment, from_payment, to_payment, id_payment) FROM stdin;
\.
COPY public.payments (amount_payment, from_payment, to_payment, id_payment) FROM '$$PATH$$/2830.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (firstname_user, secondname_user, login_user, password_user, isadmin_user, id_user) FROM stdin;
\.
COPY public.users (firstname_user, secondname_user, login_user, password_user, isadmin_user, id_user) FROM '$$PATH$$/2828.dat';

--
-- Name: accounts_id_accountt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_accountt_seq', 5, true);


--
-- Name: payments_id_paymentt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_paymentt_seq', 14, true);


--
-- Name: users_id_userr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_userr_seq', 17, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id_account);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id_payment);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          