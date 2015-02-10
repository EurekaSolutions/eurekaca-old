--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: eureka; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON DATABASE eureka IS 'Portal de Eureka';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: migration; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO eureka;

--
-- Name: subscripciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE subscripciones (
    id integer NOT NULL,
    correo character varying(255) NOT NULL,
    nombre character varying(255),
    apellido character varying(255)
);


ALTER TABLE public.subscripciones OWNER TO eureka;

--
-- Name: TABLE subscripciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE subscripciones IS 'Personas subscritas de la página';


--
-- Name: COLUMN subscripciones.correo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN subscripciones.correo IS 'Correo del subscriptor';


--
-- Name: COLUMN subscripciones.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN subscripciones.nombre IS 'Nombre del subscriptor';


--
-- Name: COLUMN subscripciones.apellido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN subscripciones.apellido IS 'Apellido del subscriptor';


--
-- Name: subscripciones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE subscripciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscripciones_id_seq OWNER TO eureka;

--
-- Name: subscripciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE subscripciones_id_seq OWNED BY subscripciones.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL
);


ALTER TABLE public."user" OWNER TO eureka;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO eureka;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY subscripciones ALTER COLUMN id SET DEFAULT nextval('subscripciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1423540038
m130524_201442_init	1423540042
\.


--
-- Data for Name: subscripciones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY subscripciones (id, correo, nombre, apellido) FROM stdin;
\.


--
-- Name: subscripciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('subscripciones_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY "user" (id, username, auth_key, password_hash, password_reset_token, email, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: subscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY subscripciones
    ADD CONSTRAINT subscripciones_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

