--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.23
-- Dumped by pg_dump version 10.5

-- Started on 2018-10-21 22:54:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "CRM-rb_development";
--
-- TOC entry 1997 (class 1262 OID 17603)
-- Name: CRM-rb_development; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CRM-rb_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Philippines.1252' LC_CTYPE = 'English_Philippines.1252';


ALTER DATABASE "CRM-rb_development" OWNER TO postgres;

\connect -reuse-previous=on "dbname='CRM-rb_development'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 17669)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 17607)
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    prename character varying,
    company_name character varying,
    regtype character varying,
    streeta character varying,
    streetb character varying,
    streetc character varying,
    city character varying,
    region character varying,
    postcode character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    country_id integer
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 17605)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 171
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- TOC entry 174 (class 1259 OID 17618)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 17616)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 173
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 176 (class 1259 OID 17629)
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    id bigint NOT NULL,
    salutation_id bigint,
    firstname character varying,
    lastname character varying,
    company_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.people OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 17627)
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO postgres;

--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 175
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- TOC entry 178 (class 1259 OID 17642)
-- Name: salutations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salutations (
    id bigint NOT NULL,
    name character varying,
    "order" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.salutations OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 17640)
-- Name: salutations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salutations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salutations_id_seq OWNER TO postgres;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 177
-- Name: salutations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salutations_id_seq OWNED BY public.salutations.id;


--
-- TOC entry 179 (class 1259 OID 17661)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 1855 (class 2604 OID 17610)
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 17621)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 1857 (class 2604 OID 17632)
-- Name: people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- TOC entry 1858 (class 2604 OID 17645)
-- Name: salutations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salutations ALTER COLUMN id SET DEFAULT nextval('public.salutations_id_seq'::regclass);


--
-- TOC entry 1991 (class 0 OID 17669)
-- Dependencies: 180
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ar_internal_metadata (key, value, created_at, updated_at) VALUES ('environment', 'development', '2018-10-21 14:24:27.858179', '2018-10-21 14:24:27.858179');


--
-- TOC entry 1983 (class 0 OID 17607)
-- Dependencies: 172
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (1, 'The', 'Pie Company', NULL, 'Fen Street', NULL, NULL, 'Norwich', 'Norfolk', NULL, '2018-10-21 14:24:28.922894', '2018-10-21 14:24:28.922894', NULL, 1);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (2, NULL, 'TMIT', 'Ltd', '42 Lily Close', NULL, NULL, 'Bicester', 'Oxon', 'OX26 3EJ', '2018-10-21 14:24:28.942503', '2018-10-21 14:24:28.942503', NULL, 2);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (3, 'La', 'Monde Reale', NULL, 'Rue De LAu', NULL, NULL, 'Paris', NULL, NULL, '2018-10-21 14:24:28.94547', '2018-10-21 14:24:28.94547', NULL, 3);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (4, NULL, 'Burger Jack', 'Inc', 'King Lane', NULL, NULL, 'NY', 'NY', 'NY777', '2018-10-21 14:24:28.948462', '2018-10-21 14:24:28.948462', NULL, 4);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (5, 'The', 'Really Great Car', 'Co', 'Pickle Ave.', NULL, NULL, 'Douglas', 'IOM', 'IM99', '2018-10-21 14:24:28.95136', '2018-10-21 14:24:28.95136', NULL, 5);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (6, NULL, 'Fish', 'PLC', 'Cod Row', NULL, NULL, 'Billingsgate', 'London', 'E14', '2018-10-21 14:24:28.95453', '2018-10-21 14:24:28.95453', NULL, 6);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (7, NULL, 'Extravaganza', NULL, 'Superheros Road', NULL, NULL, NULL, 'Neverland', NULL, '2018-10-21 14:24:28.957951', '2018-10-21 14:24:28.957951', NULL, 7);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (8, NULL, 'Baggins Bags', NULL, 'Bag End', NULL, NULL, 'Hobiton', 'Gwynedd', NULL, '2018-10-21 14:24:28.960944', '2018-10-21 14:24:28.960944', NULL, 8);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (9, 'Da', 'Roy Company', 'best', '44 Aramismis St. Project 7', '', '', 'Quezon City', 'National Capital Region', '1105', '2018-10-21 14:38:34.713768', '2018-10-21 14:38:34.713768', NULL, 169);
INSERT INTO public.companies (id, prename, company_name, regtype, streeta, streetb, streetc, city, region, postcode, created_at, updated_at, email, country_id) VALUES (10, 'Da', 'Roy Company', 'best', '44 Aramismis St. Project 7', '', '', 'Quezon City', 'National Capital Region', '1105', '2018-10-21 14:41:18.875071', '2018-10-21 14:41:18.875071', NULL, 113);


--
-- TOC entry 1985 (class 0 OID 17618)
-- Dependencies: 174
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (1, 'Afghanistan', '2018-10-21 14:24:28.177067', '2018-10-21 14:24:28.177067');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (2, 'Albania', '2018-10-21 14:24:28.192169', '2018-10-21 14:24:28.192169');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (3, 'Algeria', '2018-10-21 14:24:28.194807', '2018-10-21 14:24:28.194807');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (4, 'American Samoa', '2018-10-21 14:24:28.197349', '2018-10-21 14:24:28.197349');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (5, 'Andorra', '2018-10-21 14:24:28.199545', '2018-10-21 14:24:28.199545');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (6, 'Angola', '2018-10-21 14:24:28.202565', '2018-10-21 14:24:28.202565');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (7, 'Anguilla', '2018-10-21 14:24:28.20553', '2018-10-21 14:24:28.20553');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (8, 'Antarctica', '2018-10-21 14:24:28.208031', '2018-10-21 14:24:28.208031');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (9, 'Antigua and Barbuda', '2018-10-21 14:24:28.210671', '2018-10-21 14:24:28.210671');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (10, 'Argentina', '2018-10-21 14:24:28.212665', '2018-10-21 14:24:28.212665');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (11, 'Armenia', '2018-10-21 14:24:28.216049', '2018-10-21 14:24:28.216049');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (12, 'Aruba', '2018-10-21 14:24:28.21807', '2018-10-21 14:24:28.21807');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (13, 'Australia', '2018-10-21 14:24:28.221569', '2018-10-21 14:24:28.221569');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (14, 'Austria', '2018-10-21 14:24:28.223956', '2018-10-21 14:24:28.223956');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (15, 'Azerbaijan', '2018-10-21 14:24:28.22595', '2018-10-21 14:24:28.22595');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (16, 'Bahrain', '2018-10-21 14:24:28.229334', '2018-10-21 14:24:28.229334');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (17, 'Bangladesh', '2018-10-21 14:24:28.232326', '2018-10-21 14:24:28.232326');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (18, 'Barbados', '2018-10-21 14:24:28.235753', '2018-10-21 14:24:28.235753');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (19, 'Belarus', '2018-10-21 14:24:28.238804', '2018-10-21 14:24:28.238804');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (20, 'Belgium', '2018-10-21 14:24:28.241468', '2018-10-21 14:24:28.241468');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (21, 'Belize', '2018-10-21 14:24:28.24359', '2018-10-21 14:24:28.24359');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (22, 'Benin', '2018-10-21 14:24:28.24693', '2018-10-21 14:24:28.24693');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (23, 'Bermuda', '2018-10-21 14:24:28.249455', '2018-10-21 14:24:28.249455');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (24, 'Bhutan', '2018-10-21 14:24:28.251449', '2018-10-21 14:24:28.251449');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (25, 'Bolivia', '2018-10-21 14:24:28.254836', '2018-10-21 14:24:28.254836');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (26, 'Bosnia and Herzegovina', '2018-10-21 14:24:28.256863', '2018-10-21 14:24:28.256863');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (27, 'Botswana', '2018-10-21 14:24:28.259959', '2018-10-21 14:24:28.259959');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (28, 'Bouvet Island', '2018-10-21 14:24:28.261954', '2018-10-21 14:24:28.261954');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (29, 'Brazil', '2018-10-21 14:24:28.264975', '2018-10-21 14:24:28.264975');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (30, 'British Indian Ocean Territory', '2018-10-21 14:24:28.267939', '2018-10-21 14:24:28.267939');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (31, 'Virgin Islands, British', '2018-10-21 14:24:28.270402', '2018-10-21 14:24:28.270402');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (32, 'Brunei Darussalam', '2018-10-21 14:24:28.272429', '2018-10-21 14:24:28.272429');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (33, 'Bulgaria', '2018-10-21 14:24:28.275522', '2018-10-21 14:24:28.275522');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (34, 'Burkina Faso', '2018-10-21 14:24:28.277517', '2018-10-21 14:24:28.277517');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (35, 'Myanmar', '2018-10-21 14:24:28.280533', '2018-10-21 14:24:28.280533');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (36, 'Burundi', '2018-10-21 14:24:28.283565', '2018-10-21 14:24:28.283565');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (37, 'Cambodia', '2018-10-21 14:24:28.286021', '2018-10-21 14:24:28.286021');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (38, 'Cameroon', '2018-10-21 14:24:28.288049', '2018-10-21 14:24:28.288049');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (39, 'Canada', '2018-10-21 14:24:28.291184', '2018-10-21 14:24:28.291184');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (40, 'Cape Verde', '2018-10-21 14:24:28.293701', '2018-10-21 14:24:28.293701');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (41, 'Cayman Islands', '2018-10-21 14:24:28.295709', '2018-10-21 14:24:28.295709');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (42, 'Central African Republic', '2018-10-21 14:24:28.29898', '2018-10-21 14:24:28.29898');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (43, 'Chad', '2018-10-21 14:24:28.300975', '2018-10-21 14:24:28.300975');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (44, 'Chile', '2018-10-21 14:24:28.304295', '2018-10-21 14:24:28.304295');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (45, 'China', '2018-10-21 14:24:28.30629', '2018-10-21 14:24:28.30629');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (46, 'Christmas Island', '2018-10-21 14:24:28.309566', '2018-10-21 14:24:28.309566');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (47, 'Cocos (Keeling) Islands', '2018-10-21 14:24:28.311562', '2018-10-21 14:24:28.311562');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (48, 'Colombia', '2018-10-21 14:24:28.315092', '2018-10-21 14:24:28.315092');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (49, 'Comoros', '2018-10-21 14:24:28.317631', '2018-10-21 14:24:28.317631');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (50, 'Congo, The Democratic Republic of the', '2018-10-21 14:24:28.319625', '2018-10-21 14:24:28.319625');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (51, 'Congo', '2018-10-21 14:24:28.322912', '2018-10-21 14:24:28.322912');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (52, 'Cook Islands', '2018-10-21 14:24:28.325981', '2018-10-21 14:24:28.325981');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (53, 'Costa Rica', '2018-10-21 14:24:28.328972', '2018-10-21 14:24:28.328972');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (54, 'Côte d''Ivoire', '2018-10-21 14:24:28.331946', '2018-10-21 14:24:28.331946');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (55, 'Croatia', '2018-10-21 14:24:28.333909', '2018-10-21 14:24:28.333909');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (56, 'Cuba', '2018-10-21 14:24:28.3369', '2018-10-21 14:24:28.3369');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (57, 'Cyprus', '2018-10-21 14:24:28.338825', '2018-10-21 14:24:28.338825');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (58, 'Czech Republic', '2018-10-21 14:24:28.341848', '2018-10-21 14:24:28.341848');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (59, 'Denmark', '2018-10-21 14:24:28.344809', '2018-10-21 14:24:28.344809');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (60, 'Djibouti', '2018-10-21 14:24:28.347868', '2018-10-21 14:24:28.347868');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (61, 'Dominica', '2018-10-21 14:24:28.350896', '2018-10-21 14:24:28.350896');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (62, 'Dominican Republic', '2018-10-21 14:24:28.353977', '2018-10-21 14:24:28.353977');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (63, 'Timor-Leste', '2018-10-21 14:24:28.35697', '2018-10-21 14:24:28.35697');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (64, 'Ecuador', '2018-10-21 14:24:28.359149', '2018-10-21 14:24:28.359149');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (65, 'Egypt', '2018-10-21 14:24:28.361146', '2018-10-21 14:24:28.361146');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (66, 'El Salvador', '2018-10-21 14:24:28.364325', '2018-10-21 14:24:28.364325');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (67, 'Equatorial Guinea', '2018-10-21 14:24:28.367189', '2018-10-21 14:24:28.367189');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (68, 'Eritrea', '2018-10-21 14:24:28.369183', '2018-10-21 14:24:28.369183');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (69, 'Estonia', '2018-10-21 14:24:28.37247', '2018-10-21 14:24:28.37247');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (70, 'Ethiopia', '2018-10-21 14:24:28.374464', '2018-10-21 14:24:28.374464');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (71, 'Falkland Islands (Malvinas)', '2018-10-21 14:24:28.377192', '2018-10-21 14:24:28.377192');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (72, 'Faroe Islands', '2018-10-21 14:24:28.380186', '2018-10-21 14:24:28.380186');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (73, 'Fiji', '2018-10-21 14:24:28.383343', '2018-10-21 14:24:28.383343');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (74, 'Finland', '2018-10-21 14:24:28.385715', '2018-10-21 14:24:28.385715');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (75, 'France', '2018-10-21 14:24:28.387709', '2018-10-21 14:24:28.387709');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (76, 'French Guiana', '2018-10-21 14:24:28.390733', '2018-10-21 14:24:28.390733');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (77, 'French Polynesia', '2018-10-21 14:24:28.393818', '2018-10-21 14:24:28.393818');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (78, 'French Southern Territories', '2018-10-21 14:24:28.395813', '2018-10-21 14:24:28.395813');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (79, 'Gabon', '2018-10-21 14:24:28.398453', '2018-10-21 14:24:28.398453');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (80, 'Georgia', '2018-10-21 14:24:28.401478', '2018-10-21 14:24:28.401478');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (81, 'Germany', '2018-10-21 14:24:28.404498', '2018-10-21 14:24:28.404498');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (82, 'Ghana', '2018-10-21 14:24:28.406616', '2018-10-21 14:24:28.406616');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (83, 'Gibraltar', '2018-10-21 14:24:28.409887', '2018-10-21 14:24:28.409887');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (84, 'Greece', '2018-10-21 14:24:28.411882', '2018-10-21 14:24:28.411882');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (85, 'Greenland', '2018-10-21 14:24:28.41521', '2018-10-21 14:24:28.41521');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (86, 'Grenada', '2018-10-21 14:24:28.417204', '2018-10-21 14:24:28.417204');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (87, 'Guadeloupe', '2018-10-21 14:24:28.42048', '2018-10-21 14:24:28.42048');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (88, 'Guam', '2018-10-21 14:24:28.423607', '2018-10-21 14:24:28.423607');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (89, 'Guatemala', '2018-10-21 14:24:28.425966', '2018-10-21 14:24:28.425966');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (90, 'Guinea', '2018-10-21 14:24:28.428547', '2018-10-21 14:24:28.428547');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (91, 'Guinea-Bissau', '2018-10-21 14:24:28.430541', '2018-10-21 14:24:28.430541');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (92, 'Guyana', '2018-10-21 14:24:28.43373', '2018-10-21 14:24:28.43373');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (93, 'Haiti', '2018-10-21 14:24:28.436855', '2018-10-21 14:24:28.436855');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (94, 'Heard Island and McDonald Islands', '2018-10-21 14:24:28.439727', '2018-10-21 14:24:28.439727');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (95, 'Holy See (Vatican City State)', '2018-10-21 14:24:28.441754', '2018-10-21 14:24:28.441754');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (96, 'Honduras', '2018-10-21 14:24:28.444727', '2018-10-21 14:24:28.444727');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (97, 'Hong Kong', '2018-10-21 14:24:28.44711', '2018-10-21 14:24:28.44711');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (98, 'Hungary', '2018-10-21 14:24:28.450164', '2018-10-21 14:24:28.450164');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (99, 'Iceland', '2018-10-21 14:24:28.452157', '2018-10-21 14:24:28.452157');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (100, 'India', '2018-10-21 14:24:28.455328', '2018-10-21 14:24:28.455328');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (101, 'Indonesia', '2018-10-21 14:24:28.458288', '2018-10-21 14:24:28.458288');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (102, 'Iran, Islamic Republic of', '2018-10-21 14:24:28.460937', '2018-10-21 14:24:28.460937');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (103, 'Iraq', '2018-10-21 14:24:28.46293', '2018-10-21 14:24:28.46293');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (104, 'Ireland', '2018-10-21 14:24:28.466097', '2018-10-21 14:24:28.466097');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (105, 'Israel', '2018-10-21 14:24:28.46809', '2018-10-21 14:24:28.46809');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (106, 'Italy', '2018-10-21 14:24:28.471237', '2018-10-21 14:24:28.471237');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (107, 'Jamaica', '2018-10-21 14:24:28.474196', '2018-10-21 14:24:28.474196');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (108, 'Japan', '2018-10-21 14:24:28.476664', '2018-10-21 14:24:28.476664');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (109, 'Jordan', '2018-10-21 14:24:28.478659', '2018-10-21 14:24:28.478659');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (110, 'Kazakhstan', '2018-10-21 14:24:28.481946', '2018-10-21 14:24:28.481946');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (111, 'Kenya', '2018-10-21 14:24:28.484643', '2018-10-21 14:24:28.484643');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (112, 'Kiribati', '2018-10-21 14:24:28.487926', '2018-10-21 14:24:28.487926');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (113, 'Korea, Democratic People''s Republic of', '2018-10-21 14:24:28.489888', '2018-10-21 14:24:28.489888');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (114, 'Korea, Republic of', '2018-10-21 14:24:28.492912', '2018-10-21 14:24:28.492912');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (115, 'Kuwait', '2018-10-21 14:24:28.494865', '2018-10-21 14:24:28.494865');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (116, 'Kyrgyzstan', '2018-10-21 14:24:28.497857', '2018-10-21 14:24:28.497857');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (117, 'Lao People''s Democratic Republic', '2018-10-21 14:24:28.500861', '2018-10-21 14:24:28.500861');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (118, 'Latvia', '2018-10-21 14:24:28.505194', '2018-10-21 14:24:28.505194');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (119, 'Lebanon', '2018-10-21 14:24:28.507189', '2018-10-21 14:24:28.507189');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (120, 'Lesotho', '2018-10-21 14:24:28.510207', '2018-10-21 14:24:28.510207');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (121, 'Liberia', '2018-10-21 14:24:28.512174', '2018-10-21 14:24:28.512174');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (122, 'Libyan Arab Jamahiriya', '2018-10-21 14:24:28.515461', '2018-10-21 14:24:28.515461');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (123, 'Liechtenstein', '2018-10-21 14:24:28.518757', '2018-10-21 14:24:28.518757');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (124, 'Lithuania', '2018-10-21 14:24:28.520782', '2018-10-21 14:24:28.520782');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (125, 'Luxembourg', '2018-10-21 14:24:28.524739', '2018-10-21 14:24:28.524739');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (126, 'Macao', '2018-10-21 14:24:28.526734', '2018-10-21 14:24:28.526734');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (127, 'Macedonia, Republic of', '2018-10-21 14:24:28.529727', '2018-10-21 14:24:28.529727');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (128, 'Madagascar', '2018-10-21 14:24:28.532437', '2018-10-21 14:24:28.532437');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (129, 'Malawi', '2018-10-21 14:24:28.534464', '2018-10-21 14:24:28.534464');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (130, 'Malaysia', '2018-10-21 14:24:28.537548', '2018-10-21 14:24:28.537548');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (131, 'Maldives', '2018-10-21 14:24:28.539547', '2018-10-21 14:24:28.539547');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (132, 'Mali', '2018-10-21 14:24:28.542564', '2018-10-21 14:24:28.542564');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (133, 'Malta', '2018-10-21 14:24:28.545527', '2018-10-21 14:24:28.545527');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (134, 'Marshall Islands', '2018-10-21 14:24:28.549986', '2018-10-21 14:24:28.549986');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (135, 'Martinique', '2018-10-21 14:24:28.553113', '2018-10-21 14:24:28.553113');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (136, 'Mauritania', '2018-10-21 14:24:28.555738', '2018-10-21 14:24:28.555738');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (137, 'Mauritius', '2018-10-21 14:24:28.558341', '2018-10-21 14:24:28.558341');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (138, 'Mayotte', '2018-10-21 14:24:28.560983', '2018-10-21 14:24:28.560983');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (139, 'Mexico', '2018-10-21 14:24:28.563645', '2018-10-21 14:24:28.563645');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (140, 'Micronesia, Federated States of', '2018-10-21 14:24:28.565667', '2018-10-21 14:24:28.565667');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (141, 'Moldova', '2018-10-21 14:24:28.56873', '2018-10-21 14:24:28.56873');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (142, 'Monaco', '2018-10-21 14:24:28.570724', '2018-10-21 14:24:28.570724');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (143, 'Mongolia', '2018-10-21 14:24:28.573719', '2018-10-21 14:24:28.573719');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (144, 'Montserrat', '2018-10-21 14:24:28.576666', '2018-10-21 14:24:28.576666');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (145, 'Morocco', '2018-10-21 14:24:28.578635', '2018-10-21 14:24:28.578635');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (146, 'Mozambique', '2018-10-21 14:24:28.581732', '2018-10-21 14:24:28.581732');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (147, 'Namibia', '2018-10-21 14:24:28.584224', '2018-10-21 14:24:28.584224');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (148, 'Nauru', '2018-10-21 14:24:28.586849', '2018-10-21 14:24:28.586849');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (149, 'Nepal', '2018-10-21 14:24:28.589517', '2018-10-21 14:24:28.589517');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (150, 'Netherlands Antilles', '2018-10-21 14:24:28.592157', '2018-10-21 14:24:28.592157');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (151, 'Netherlands', '2018-10-21 14:24:28.594868', '2018-10-21 14:24:28.594868');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (152, 'New Caledonia', '2018-10-21 14:24:28.59689', '2018-10-21 14:24:28.59689');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (153, 'New Zealand', '2018-10-21 14:24:28.599333', '2018-10-21 14:24:28.599333');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (154, 'Nicaragua', '2018-10-21 14:24:28.602329', '2018-10-21 14:24:28.602329');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (155, 'Niger', '2018-10-21 14:24:28.604322', '2018-10-21 14:24:28.604322');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (156, 'Nigeria', '2018-10-21 14:24:28.607316', '2018-10-21 14:24:28.607316');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (157, 'Niue', '2018-10-21 14:24:28.609738', '2018-10-21 14:24:28.609738');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (158, 'Norfolk Island', '2018-10-21 14:24:28.612733', '2018-10-21 14:24:28.612733');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (159, 'Northern Mariana Islands', '2018-10-21 14:24:28.615725', '2018-10-21 14:24:28.615725');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (160, 'Norway', '2018-10-21 14:24:28.617471', '2018-10-21 14:24:28.617471');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (161, 'Oman', '2018-10-21 14:24:28.620466', '2018-10-21 14:24:28.620466');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (162, 'Pakistan', '2018-10-21 14:24:28.622459', '2018-10-21 14:24:28.622459');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (163, 'Palau', '2018-10-21 14:24:28.625452', '2018-10-21 14:24:28.625452');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (164, 'Palestinian Territory, Occupied', '2018-10-21 14:24:28.628444', '2018-10-21 14:24:28.628444');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (165, 'Panama', '2018-10-21 14:24:28.630438', '2018-10-21 14:24:28.630438');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (166, 'Papua New Guinea', '2018-10-21 14:24:28.63292', '2018-10-21 14:24:28.63292');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (167, 'Paraguay', '2018-10-21 14:24:28.635915', '2018-10-21 14:24:28.635915');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (168, 'Peru', '2018-10-21 14:24:28.637908', '2018-10-21 14:24:28.637908');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (169, 'Philippines', '2018-10-21 14:24:28.640901', '2018-10-21 14:24:28.640901');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (170, 'Pitcairn', '2018-10-21 14:24:28.643893', '2018-10-21 14:24:28.643893');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (171, 'Poland', '2018-10-21 14:24:28.646258', '2018-10-21 14:24:28.646258');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (172, 'Portugal', '2018-10-21 14:24:28.648278', '2018-10-21 14:24:28.648278');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (173, 'Puerto Rico', '2018-10-21 14:24:28.651249', '2018-10-21 14:24:28.651249');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (174, 'Qatar', '2018-10-21 14:24:28.653827', '2018-10-21 14:24:28.653827');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (175, 'Romania', '2018-10-21 14:24:28.656489', '2018-10-21 14:24:28.656489');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (176, 'Russian Federation', '2018-10-21 14:24:28.658513', '2018-10-21 14:24:28.658513');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (177, 'Rwanda', '2018-10-21 14:24:28.660933', '2018-10-21 14:24:28.660933');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (178, 'Reunion', '2018-10-21 14:24:28.664127', '2018-10-21 14:24:28.664127');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (179, 'Saint Helena', '2018-10-21 14:24:28.666195', '2018-10-21 14:24:28.666195');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (180, 'Saint Kitts and Nevis', '2018-10-21 14:24:28.66919', '2018-10-21 14:24:28.66919');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (181, 'Saint Lucia', '2018-10-21 14:24:28.671911', '2018-10-21 14:24:28.671911');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (182, 'Saint Pierre and Miquelon', '2018-10-21 14:24:28.673957', '2018-10-21 14:24:28.673957');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (183, 'Saint Vincent and the Grenadines', '2018-10-21 14:24:28.676953', '2018-10-21 14:24:28.676953');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (184, 'Samoa', '2018-10-21 14:24:28.678846', '2018-10-21 14:24:28.678846');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (185, 'San Marino', '2018-10-21 14:24:28.68184', '2018-10-21 14:24:28.68184');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (186, 'Saudi Arabia', '2018-10-21 14:24:28.683832', '2018-10-21 14:24:28.683832');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (187, 'Senegal', '2018-10-21 14:24:28.687294', '2018-10-21 14:24:28.687294');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (188, 'Seychelles', '2018-10-21 14:24:28.689629', '2018-10-21 14:24:28.689629');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (189, 'Sierra Leone', '2018-10-21 14:24:28.691649', '2018-10-21 14:24:28.691649');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (190, 'Singapore', '2018-10-21 14:24:28.694619', '2018-10-21 14:24:28.694619');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (191, 'Slovakia', '2018-10-21 14:24:28.697611', '2018-10-21 14:24:28.697611');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (192, 'Slovenia', '2018-10-21 14:24:28.699605', '2018-10-21 14:24:28.699605');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (193, 'Solomon Islands', '2018-10-21 14:24:28.7026', '2018-10-21 14:24:28.7026');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (194, 'Somalia', '2018-10-21 14:24:28.705134', '2018-10-21 14:24:28.705134');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (195, 'South Africa', '2018-10-21 14:24:28.707746', '2018-10-21 14:24:28.707746');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (196, 'South Georgia and the South Sandwich Islands', '2018-10-21 14:24:28.709747', '2018-10-21 14:24:28.709747');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (197, 'Spain', '2018-10-21 14:24:28.712736', '2018-10-21 14:24:28.712736');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (198, 'Sri Lanka', '2018-10-21 14:24:28.715726', '2018-10-21 14:24:28.715726');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (199, 'Sudan', '2018-10-21 14:24:28.717756', '2018-10-21 14:24:28.717756');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (200, 'Suriname', '2018-10-21 14:24:28.720991', '2018-10-21 14:24:28.720991');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (201, 'Svalbard and Jan Mayen', '2018-10-21 14:24:28.723019', '2018-10-21 14:24:28.723019');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (202, 'Swaziland', '2018-10-21 14:24:28.725981', '2018-10-21 14:24:28.725981');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (203, 'Sweden', '2018-10-21 14:24:28.727974', '2018-10-21 14:24:28.727974');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (204, 'Switzerland', '2018-10-21 14:24:28.731294', '2018-10-21 14:24:28.731294');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (205, 'Syrian Arab Republic', '2018-10-21 14:24:28.733322', '2018-10-21 14:24:28.733322');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (206, 'Sao Tome and Principe', '2018-10-21 14:24:28.735871', '2018-10-21 14:24:28.735871');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (207, 'Taiwan', '2018-10-21 14:24:28.738865', '2018-10-21 14:24:28.738865');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (208, 'Tajikistan', '2018-10-21 14:24:28.740858', '2018-10-21 14:24:28.740858');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (209, 'Tanzania, United Republic of', '2018-10-21 14:24:28.74341', '2018-10-21 14:24:28.74341');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (210, 'Thailand', '2018-10-21 14:24:28.746406', '2018-10-21 14:24:28.746406');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (211, 'Bahamas', '2018-10-21 14:24:28.749395', '2018-10-21 14:24:28.749395');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (212, 'Gambia', '2018-10-21 14:24:28.752386', '2018-10-21 14:24:28.752386');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (213, 'Togo', '2018-10-21 14:24:28.754384', '2018-10-21 14:24:28.754384');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (214, 'Tokelau', '2018-10-21 14:24:28.757376', '2018-10-21 14:24:28.757376');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (215, 'Tonga', '2018-10-21 14:24:28.759398', '2018-10-21 14:24:28.759398');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (216, 'Trinidad and Tobago', '2018-10-21 14:24:28.762363', '2018-10-21 14:24:28.762363');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (217, 'Tunisia', '2018-10-21 14:24:28.765355', '2018-10-21 14:24:28.765355');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (218, 'Turkey', '2018-10-21 14:24:28.767369', '2018-10-21 14:24:28.767369');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (219, 'Turkmenistan', '2018-10-21 14:24:28.770342', '2018-10-21 14:24:28.770342');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (220, 'Turks and Caicos Islands', '2018-10-21 14:24:28.772334', '2018-10-21 14:24:28.772334');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (221, 'Tuvalu', '2018-10-21 14:24:28.774837', '2018-10-21 14:24:28.774837');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (222, 'Uganda', '2018-10-21 14:24:28.777832', '2018-10-21 14:24:28.777832');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (223, 'Ukraine', '2018-10-21 14:24:28.780822', '2018-10-21 14:24:28.780822');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (224, 'United Arab Emirates', '2018-10-21 14:24:28.782817', '2018-10-21 14:24:28.782817');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (225, 'United Kingdom', '2018-10-21 14:24:28.785811', '2018-10-21 14:24:28.785811');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (226, 'United States Minor Outlying Islands', '2018-10-21 14:24:28.788802', '2018-10-21 14:24:28.788802');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (227, 'United States', '2018-10-21 14:24:28.790811', '2018-10-21 14:24:28.790811');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (228, 'Uruguay', '2018-10-21 14:24:28.793789', '2018-10-21 14:24:28.793789');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (229, 'Uzbekistan', '2018-10-21 14:24:28.796902', '2018-10-21 14:24:28.796902');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (230, 'Vanuatu', '2018-10-21 14:24:28.799897', '2018-10-21 14:24:28.799897');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (231, 'Venezuela', '2018-10-21 14:24:28.801891', '2018-10-21 14:24:28.801891');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (232, 'Viet Nam', '2018-10-21 14:24:28.804883', '2018-10-21 14:24:28.804883');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (233, 'Virgin Islands, U.S.', '2018-10-21 14:24:28.806876', '2018-10-21 14:24:28.806876');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (234, 'Wallis and Futuna', '2018-10-21 14:24:28.811287', '2018-10-21 14:24:28.811287');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (235, 'Western Sahara', '2018-10-21 14:24:28.815495', '2018-10-21 14:24:28.815495');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (236, 'Yemen', '2018-10-21 14:24:28.817991', '2018-10-21 14:24:28.817991');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (237, 'Serbia and Montenegro', '2018-10-21 14:24:28.819985', '2018-10-21 14:24:28.819985');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (238, 'Zambia', '2018-10-21 14:24:28.823004', '2018-10-21 14:24:28.823004');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (239, 'Zimbabwe', '2018-10-21 14:24:28.824973', '2018-10-21 14:24:28.824973');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (240, 'Åland Islands', '2018-10-21 14:24:28.828371', '2018-10-21 14:24:28.828371');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (241, 'Serbia', '2018-10-21 14:24:28.830365', '2018-10-21 14:24:28.830365');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (242, 'Montenegro', '2018-10-21 14:24:28.833654', '2018-10-21 14:24:28.833654');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (243, 'Jersey', '2018-10-21 14:24:28.836304', '2018-10-21 14:24:28.836304');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (244, 'Guernsey', '2018-10-21 14:24:28.838955', '2018-10-21 14:24:28.838955');
INSERT INTO public.countries (id, name, created_at, updated_at) VALUES (245, 'Isle of Man', '2018-10-21 14:24:28.841629', '2018-10-21 14:24:28.841629');


--
-- TOC entry 1987 (class 0 OID 17629)
-- Dependencies: 176
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (1, 1, 'Mike', 'Freighn', 4, '2018-10-21 14:24:29.006824', '2018-10-21 14:24:29.006824');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (2, 2, 'Kathie', 'Arnott', 2, '2018-10-21 14:24:29.013785', '2018-10-21 14:24:29.013785');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (3, 3, 'Zeta', 'Flowers', 1, '2018-10-21 14:24:29.020112', '2018-10-21 14:24:29.020112');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (4, 4, 'Guy', 'Donnet', 3, '2018-10-21 14:24:29.028496', '2018-10-21 14:24:29.028496');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (5, 5, 'Harriet', 'Hennesey', 3, '2018-10-21 14:24:29.039862', '2018-10-21 14:24:29.039862');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (6, 6, 'George', 'Terry', 2, '2018-10-21 14:24:29.051419', '2018-10-21 14:24:29.051419');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (7, 7, 'Geoffrey', 'Paul', 1, '2018-10-21 14:24:29.058455', '2018-10-21 14:24:29.058455');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (8, 8, 'Laura', 'Winalott', 4, '2018-10-21 14:24:29.064947', '2018-10-21 14:24:29.064947');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (9, 15, 'Peter', 'Bellows', 1, '2018-10-21 14:24:29.07121', '2018-10-21 14:24:29.07121');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (10, 9, 'Russell', 'Tandie', 2, '2018-10-21 14:24:29.07756', '2018-10-21 14:24:29.07756');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (11, 10, 'Riley', 'Goffs', 1, '2018-10-21 14:24:29.083758', '2018-10-21 14:24:29.083758');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (12, 11, 'Sue', 'Gentle', 3, '2018-10-21 14:24:29.089521', '2018-10-21 14:24:29.089521');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (13, 12, 'Taylor', 'McFly', 1, '2018-10-21 14:24:29.09452', '2018-10-21 14:24:29.09452');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (14, 13, 'William', 'Brite', 5, '2018-10-21 14:24:29.103604', '2018-10-21 14:24:29.103604');
INSERT INTO public.people (id, salutation_id, firstname, lastname, company_id, created_at, updated_at) VALUES (15, 14, 'Peter', 'Flynn', 5, '2018-10-21 14:24:29.110161', '2018-10-21 14:24:29.110161');


--
-- TOC entry 1989 (class 0 OID 17642)
-- Dependencies: 178
-- Data for Name: salutations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (1, 'Mr', 1, '2018-10-21 14:24:28.854801', '2018-10-21 14:24:28.854801');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (2, 'Mrs', 2, '2018-10-21 14:24:28.862424', '2018-10-21 14:24:28.862424');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (3, 'Ms', 3, '2018-10-21 14:24:28.865613', '2018-10-21 14:24:28.865613');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (4, 'Miss', 4, '2018-10-21 14:24:28.868527', '2018-10-21 14:24:28.868527');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (5, 'Dr', 5, '2018-10-21 14:24:28.870495', '2018-10-21 14:24:28.870495');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (6, 'Prof.', 6, '2018-10-21 14:24:28.874043', '2018-10-21 14:24:28.874043');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (7, 'Sir', 7, '2018-10-21 14:24:28.877002', '2018-10-21 14:24:28.877002');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (8, 'Lord', 8, '2018-10-21 14:24:28.879125', '2018-10-21 14:24:28.879125');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (9, 'Lady', 9, '2018-10-21 14:24:28.882322', '2018-10-21 14:24:28.882322');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (10, 'Hon.', 10, '2018-10-21 14:24:28.884453', '2018-10-21 14:24:28.884453');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (11, 'Rt.Hon.', 11, '2018-10-21 14:24:28.887807', '2018-10-21 14:24:28.887807');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (12, 'Rev.', 12, '2018-10-21 14:24:28.89037', '2018-10-21 14:24:28.89037');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (13, 'Rt.Rev.', 13, '2018-10-21 14:24:28.893362', '2018-10-21 14:24:28.893362');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (14, 'Baron', 14, '2018-10-21 14:24:28.895934', '2018-10-21 14:24:28.895934');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (15, 'Baroness', 15, '2018-10-21 14:24:28.897929', '2018-10-21 14:24:28.897929');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (16, 'Count', 16, '2018-10-21 14:24:28.900947', '2018-10-21 14:24:28.900947');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (17, 'Countess', 17, '2018-10-21 14:24:28.903943', '2018-10-21 14:24:28.903943');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (18, 'Capt.', 18, '2018-10-21 14:24:28.906848', '2018-10-21 14:24:28.906848');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (19, 'Major', 19, '2018-10-21 14:24:28.909866', '2018-10-21 14:24:28.909866');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (20, 'Col.', 20, '2018-10-21 14:24:28.912876', '2018-10-21 14:24:28.912876');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (21, 'Gen.', 21, '2018-10-21 14:24:28.915909', '2018-10-21 14:24:28.915909');
INSERT INTO public.salutations (id, name, "order", created_at, updated_at) VALUES (22, 'M.', 22, '2018-10-21 14:24:28.917878', '2018-10-21 14:24:28.917878');


--
-- TOC entry 1990 (class 0 OID 17661)
-- Dependencies: 179
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schema_migrations (version) VALUES ('20181021142321');
INSERT INTO public.schema_migrations (version) VALUES ('20181011001300');
INSERT INTO public.schema_migrations (version) VALUES ('20181012033447');
INSERT INTO public.schema_migrations (version) VALUES ('20181020003908');
INSERT INTO public.schema_migrations (version) VALUES ('20181021084825');
INSERT INTO public.schema_migrations (version) VALUES ('20181021091129');
INSERT INTO public.schema_migrations (version) VALUES ('20181021141433');
INSERT INTO public.schema_migrations (version) VALUES ('20181021141704');
INSERT INTO public.schema_migrations (version) VALUES ('20181021142243');


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 171
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 10, true);


--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 173
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 245, true);


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 175
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.people_id_seq', 15, true);


--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 177
-- Name: salutations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salutations_id_seq', 22, true);


--
-- TOC entry 1872 (class 2606 OID 17676)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 1860 (class 2606 OID 17615)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 1862 (class 2606 OID 17626)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 1866 (class 2606 OID 17637)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- TOC entry 1868 (class 2606 OID 17650)
-- Name: salutations salutations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salutations
    ADD CONSTRAINT salutations_pkey PRIMARY KEY (id);


--
-- TOC entry 1870 (class 2606 OID 17668)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 1863 (class 1259 OID 17638)
-- Name: index_people_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_people_on_company_id ON public.people USING btree (company_id);


--
-- TOC entry 1864 (class 1259 OID 17639)
-- Name: index_people_on_salutation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_people_on_salutation_id ON public.people USING btree (salutation_id);


--
-- TOC entry 1873 (class 2606 OID 17651)
-- Name: people fk_rails_3f14afd23d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT fk_rails_3f14afd23d FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 1874 (class 2606 OID 17656)
-- Name: people fk_rails_d62403630e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT fk_rails_d62403630e FOREIGN KEY (salutation_id) REFERENCES public.salutations(id);


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-10-21 22:54:27

--
-- PostgreSQL database dump complete
--

