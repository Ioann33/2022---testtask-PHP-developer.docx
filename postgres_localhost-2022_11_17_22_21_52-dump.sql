toc.dat                                                                                             0000600 0004000 0002000 00000024077 14335513741 0014457 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       4                
    z            test    14.4    14.5 (Homebrew) '    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         %           1262    22205    test    DATABASE     X   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE test;
                postgres    false         �            1259    68959 	   countries    TABLE     e   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false         �            1259    68962    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    211         &           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    212         �            1259    68985    emails    TABLE     �   CREATE TABLE public.emails (
    id integer NOT NULL,
    email character varying(150),
    user_id integer NOT NULL,
    public integer
);
    DROP TABLE public.emails;
       public         heap    postgres    false         �            1259    68988    emails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.emails_id_seq;
       public          postgres    false    215         '           0    0    emails_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.emails_id_seq OWNED BY public.emails.id;
          public          postgres    false    216         �            1259    68972    phones    TABLE     �   CREATE TABLE public.phones (
    id integer NOT NULL,
    number character varying(50),
    user_id integer NOT NULL,
    public integer
);
    DROP TABLE public.phones;
       public         heap    postgres    false         �            1259    68975    phones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.phones_id_seq;
       public          postgres    false    213         (           0    0    phones_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;
          public          postgres    false    214         �            1259    68947    users    TABLE     C  CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(100),
    firstname character varying(100),
    lastname character varying(100),
    address character varying(255),
    city character varying(150),
    country_id integer,
    public integer
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    68950    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    209         )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    210         {           2604    68963    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211         }           2604    68989 	   emails id    DEFAULT     f   ALTER TABLE ONLY public.emails ALTER COLUMN id SET DEFAULT nextval('public.emails_id_seq'::regclass);
 8   ALTER TABLE public.emails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215         |           2604    68976 	   phones id    DEFAULT     f   ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);
 8   ALTER TABLE public.phones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213         z           2604    68951    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209                   0    68959 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public          postgres    false    211       3354.dat           0    68985    emails 
   TABLE DATA           <   COPY public.emails (id, email, user_id, public) FROM stdin;
    public          postgres    false    215       3358.dat           0    68972    phones 
   TABLE DATA           =   COPY public.phones (id, number, user_id, public) FROM stdin;
    public          postgres    false    213       3356.dat           0    68947    users 
   TABLE DATA           l   COPY public.users (id, login, password, firstname, lastname, address, city, country_id, public) FROM stdin;
    public          postgres    false    209       3352.dat *           0    0    countries_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.countries_id_seq', 5, true);
          public          postgres    false    212         +           0    0    emails_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.emails_id_seq', 14, true);
          public          postgres    false    216         ,           0    0    phones_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.phones_id_seq', 17, true);
          public          postgres    false    214         -           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    210         �           2606    68966    countries countries_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pk;
       public            postgres    false    211         �           2606    68992    emails emails_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.emails DROP CONSTRAINT emails_pk;
       public            postgres    false    215         �           2606    68979    phones phones_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.phones DROP CONSTRAINT phones_pk;
       public            postgres    false    213         �           2606    68954    users users_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
       public            postgres    false    209         �           1259    68964    countries_id_uindex    INDEX     N   CREATE UNIQUE INDEX countries_id_uindex ON public.countries USING btree (id);
 '   DROP INDEX public.countries_id_uindex;
       public            postgres    false    211         �           1259    68990    emails_id_uindex    INDEX     H   CREATE UNIQUE INDEX emails_id_uindex ON public.emails USING btree (id);
 $   DROP INDEX public.emails_id_uindex;
       public            postgres    false    215         �           1259    68977    phones_id_uindex    INDEX     H   CREATE UNIQUE INDEX phones_id_uindex ON public.phones USING btree (id);
 $   DROP INDEX public.phones_id_uindex;
       public            postgres    false    213         ~           1259    68952    users_id_uindex    INDEX     F   CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);
 #   DROP INDEX public.users_id_uindex;
       public            postgres    false    209         �           2606    68967    users foreign_key_country    FK CONSTRAINT        ALTER TABLE ONLY public.users
    ADD CONSTRAINT foreign_key_country FOREIGN KEY (country_id) REFERENCES public.countries(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT foreign_key_country;
       public          postgres    false    209    211    3201         �           2606    68980    phones foreign_key_user    FK CONSTRAINT     v   ALTER TABLE ONLY public.phones
    ADD CONSTRAINT foreign_key_user FOREIGN KEY (user_id) REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.phones DROP CONSTRAINT foreign_key_user;
       public          postgres    false    213    3198    209         �           2606    68993    emails foreign_key_user_email    FK CONSTRAINT     |   ALTER TABLE ONLY public.emails
    ADD CONSTRAINT foreign_key_user_email FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.emails DROP CONSTRAINT foreign_key_user_email;
       public          postgres    false    215    3198    209                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3354.dat                                                                                            0000600 0004000 0002000 00000000060 14335513741 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Ukraine
2	Russian
3	USA
4	Japan 
5	China
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                3358.dat                                                                                            0000600 0004000 0002000 00000000056 14335513741 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        14	ioann@gamil.com	1	1
13	some@email	3	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3356.dat                                                                                            0000600 0004000 0002000 00000000137 14335513741 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	+380992973369	1	1
7	+780234324	1	0
1	+380679382	3	1
2	+7900324324	3	0
5	+3809003453	3	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 3352.dat                                                                                            0000600 0004000 0002000 00000000346 14335513741 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	danil	81dc9bdb52d04dc20036dbd8313ed055	Bux	Ax	Lazary	Dnipro	1	1
1	ioann	81dc9bdb52d04dc20036dbd8313ed055	Ivan	Karmaluk	Lazaryna 22	Dnipro	1	1
3	alex	81dc9bdb52d04dc20036dbd8313ed055	Alex	Zabroda	Haker Street 24	Florida	3	1
\.


                                                                                                                                                                                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000020260 14335513741 0015372 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.5 (Homebrew)

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

DROP DATABASE test;
--
-- Name: test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE test OWNER TO postgres;

\connect test

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
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emails (
    id integer NOT NULL,
    email character varying(150),
    user_id integer NOT NULL,
    public integer
);


ALTER TABLE public.emails OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emails_id_seq OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emails_id_seq OWNED BY public.emails.id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    number character varying(50),
    user_id integer NOT NULL,
    public integer
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_id_seq OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(100),
    firstname character varying(100),
    lastname character varying(100),
    address character varying(255),
    city character varying(150),
    country_id integer,
    public integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails ALTER COLUMN id SET DEFAULT nextval('public.emails_id_seq'::regclass);


--
-- Name: phones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name) FROM stdin;
\.
COPY public.countries (id, name) FROM '$$PATH$$/3354.dat';

--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emails (id, email, user_id, public) FROM stdin;
\.
COPY public.emails (id, email, user_id, public) FROM '$$PATH$$/3358.dat';

--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, number, user_id, public) FROM stdin;
\.
COPY public.phones (id, number, user_id, public) FROM '$$PATH$$/3356.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, password, firstname, lastname, address, city, country_id, public) FROM stdin;
\.
COPY public.users (id, login, password, firstname, lastname, address, city, country_id, public) FROM '$$PATH$$/3352.dat';

--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 5, true);


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emails_id_seq', 14, true);


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_seq', 17, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);


--
-- Name: emails emails_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_pk PRIMARY KEY (id);


--
-- Name: phones phones_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: countries_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX countries_id_uindex ON public.countries USING btree (id);


--
-- Name: emails_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emails_id_uindex ON public.emails USING btree (id);


--
-- Name: phones_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX phones_id_uindex ON public.phones USING btree (id);


--
-- Name: users_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);


--
-- Name: users foreign_key_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT foreign_key_country FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: phones foreign_key_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT foreign_key_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: emails foreign_key_user_email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT foreign_key_user_email FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                