--
-- PostgreSQL database dump
--

\restrict UwxVoh0U6QNFe15gwcJKBYOGG8IMWoctHkIcQacxU7NNtPdrb7saVF3hM0EYYi1

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-12 03:08:51

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
-- TOC entry 224 (class 1259 OID 16560)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16559)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 222 (class 1259 OID 16544)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    country_id integer,
    name character varying(100) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL,
    timezone character varying(50)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16543)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 221
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 220 (class 1259 OID 16533)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16532)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 219
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 234 (class 1259 OID 16654)
-- Name: forecasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forecasts (
    id integer NOT NULL,
    city_id integer,
    condition_value_id integer,
    source_id integer,
    forecast_date timestamp without time zone NOT NULL,
    created_date timestamp without time zone NOT NULL,
    temperature numeric(4,1),
    humidity integer,
    pressure integer,
    wind_speed numeric(4,1),
    wind_direction integer,
    cloudiness integer,
    precipitation numeric(4,1),
    visibility numeric(4,1)
);


ALTER TABLE public.forecasts OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16653)
-- Name: forecasts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forecasts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forecasts_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 233
-- Name: forecasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forecasts_id_seq OWNED BY public.forecasts.id;


--
-- TOC entry 226 (class 1259 OID 16569)
-- Name: indicator_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator_values (
    id integer NOT NULL,
    category_id integer,
    value character varying(50) NOT NULL
);


ALTER TABLE public.indicator_values OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16568)
-- Name: indicator_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indicator_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.indicator_values_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 225
-- Name: indicator_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indicator_values_id_seq OWNED BY public.indicator_values.id;


--
-- TOC entry 232 (class 1259 OID 16630)
-- Name: observations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observations (
    id integer NOT NULL,
    city_id integer,
    condition_value_id integer,
    source_id integer,
    measurement_date timestamp without time zone NOT NULL,
    temperature numeric(4,1),
    humidity integer,
    pressure integer,
    wind_speed numeric(4,1),
    wind_direction integer,
    cloudiness integer,
    precipitation numeric(4,1),
    visibility numeric(4,1)
);


ALTER TABLE public.observations OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16629)
-- Name: observations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.observations_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 231
-- Name: observations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observations_id_seq OWNED BY public.observations.id;


--
-- TOC entry 230 (class 1259 OID 16594)
-- Name: sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sources (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    api_url character varying(255),
    id_unit integer
);


ALTER TABLE public.sources OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16593)
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sources_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 229
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sources_id_seq OWNED BY public.sources.id;


--
-- TOC entry 228 (class 1259 OID 16583)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id integer NOT NULL,
    parameter character varying(50) NOT NULL,
    unit character varying(20) NOT NULL,
    coefficient numeric(10,4) NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16582)
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.units_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


--
-- TOC entry 237 (class 1259 OID 16742)
-- Name: user_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_locations (
    user_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.user_locations OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16726)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(50),
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    temperature_unit_id integer,
    location_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16725)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 235
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4801 (class 2604 OID 16563)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 16547)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16536)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 16657)
-- Name: forecasts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecasts ALTER COLUMN id SET DEFAULT nextval('public.forecasts_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 16572)
-- Name: indicator_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_values ALTER COLUMN id SET DEFAULT nextval('public.indicator_values_id_seq'::regclass);


--
-- TOC entry 4805 (class 2604 OID 16633)
-- Name: observations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations ALTER COLUMN id SET DEFAULT nextval('public.observations_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 16597)
-- Name: sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources ALTER COLUMN id SET DEFAULT nextval('public.sources_id_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 16586)
-- Name: units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 16729)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4998 (class 0 OID 16560)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Облачность
2	Осадки
\.


--
-- TOC entry 4996 (class 0 OID 16544)
-- Dependencies: 222
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, country_id, name, latitude, longitude, timezone) FROM stdin;
1	1	Москва	55.755800	37.617300	Europe/Moscow
2	1	Санкт-Петербург	59.934300	30.335100	Europe/Moscow
3	1	Владивосток	43.115500	131.885500	Asia/Vladivostok
\.


--
-- TOC entry 4994 (class 0 OID 16533)
-- Dependencies: 220
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name) FROM stdin;
1	Россия
\.


--
-- TOC entry 5008 (class 0 OID 16654)
-- Dependencies: 234
-- Data for Name: forecasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forecasts (id, city_id, condition_value_id, source_id, forecast_date, created_date, temperature, humidity, pressure, wind_speed, wind_direction, cloudiness, precipitation, visibility) FROM stdin;
1	1	5	1	2026-10-08 12:00:00	2026-10-07 08:00:00	7.0	75	746	4.0	200	85	2.0	9.0
2	1	1	2	2026-10-09 12:00:00	2026-10-07 08:00:00	9.5	60	748	2.5	150	30	0.0	12.0
\.


--
-- TOC entry 5000 (class 0 OID 16569)
-- Dependencies: 226
-- Data for Name: indicator_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator_values (id, category_id, value) FROM stdin;
1	1	Безоблачно
2	1	Малооблачно
3	1	Пасмурно
4	2	Нет
5	2	Дождь
6	2	Снег
\.


--
-- TOC entry 5006 (class 0 OID 16630)
-- Dependencies: 232
-- Data for Name: observations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.observations (id, city_id, condition_value_id, source_id, measurement_date, temperature, humidity, pressure, wind_speed, wind_direction, cloudiness, precipitation, visibility) FROM stdin;
1	1	1	1	2026-10-07 12:00:00	8.5	78	745	3.2	180	90	1.2	10.0
2	1	5	1	2026-10-07 15:00:00	8.1	80	744	3.5	190	95	0.8	8.0
3	2	1	2	2026-10-07 15:00:00	6.0	65	750	2.0	90	20	0.0	15.0
4	3	6	1	2026-10-07 16:00:00	-2.0	88	752	4.5	270	100	2.5	6.0
\.


--
-- TOC entry 5004 (class 0 OID 16594)
-- Dependencies: 230
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sources (id, name, api_url, id_unit) FROM stdin;
1	OpenWeather	https://api.openweathermap.org	1
2	Gismeteo	https://api.gismeteo.ru	1
\.


--
-- TOC entry 5002 (class 0 OID 16583)
-- Dependencies: 228
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, parameter, unit, coefficient) FROM stdin;
1	Температура	°C	1.0000
2	Температура	°F	0.5555
3	Давление	мм рт.ст.	1.0000
\.


--
-- TOC entry 5011 (class 0 OID 16742)
-- Dependencies: 237
-- Data for Name: user_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_locations (user_id, location_id) FROM stdin;
1	1
1	2
2	3
\.


--
-- TOC entry 5010 (class 0 OID 16726)
-- Dependencies: 236
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, registration_date, temperature_unit_id, location_id) FROM stdin;
1	ivan@mail.ru	Иван	2026-11-03 14:07:30.609672	1	\N
2	petr@mail.ru	Пётр	2026-11-03 14:07:30.609672	1	\N
\.


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 221
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 219
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 233
-- Name: forecasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forecasts_id_seq', 2, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 225
-- Name: indicator_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indicator_values_id_seq', 6, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 231
-- Name: observations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.observations_id_seq', 4, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 229
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sources_id_seq', 2, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 227
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 3, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 235
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4816 (class 2606 OID 16567)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4814 (class 2606 OID 16553)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 16542)
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- TOC entry 4812 (class 2606 OID 16540)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 16662)
-- Name: forecasts forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecasts
    ADD CONSTRAINT forecasts_pkey PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 16576)
-- Name: indicator_values indicator_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_values
    ADD CONSTRAINT indicator_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 16637)
-- Name: observations observations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 16601)
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 16592)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 16748)
-- Name: user_locations user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (user_id, location_id);


--
-- TOC entry 4828 (class 2606 OID 16736)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4830 (class 2606 OID 16734)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4833 (class 2606 OID 16554)
-- Name: cities cities_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- TOC entry 4839 (class 2606 OID 16663)
-- Name: forecasts forecasts_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecasts
    ADD CONSTRAINT forecasts_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 4840 (class 2606 OID 16668)
-- Name: forecasts forecasts_condition_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecasts
    ADD CONSTRAINT forecasts_condition_value_id_fkey FOREIGN KEY (condition_value_id) REFERENCES public.indicator_values(id);


--
-- TOC entry 4841 (class 2606 OID 16673)
-- Name: forecasts forecasts_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forecasts
    ADD CONSTRAINT forecasts_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.sources(id);


--
-- TOC entry 4834 (class 2606 OID 16577)
-- Name: indicator_values indicator_values_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_values
    ADD CONSTRAINT indicator_values_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16638)
-- Name: observations observations_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 4837 (class 2606 OID 16643)
-- Name: observations observations_condition_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_condition_value_id_fkey FOREIGN KEY (condition_value_id) REFERENCES public.indicator_values(id);


--
-- TOC entry 4838 (class 2606 OID 16648)
-- Name: observations observations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.sources(id);


--
-- TOC entry 4835 (class 2606 OID 16602)
-- Name: sources sources_id_unit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_id_unit_fkey FOREIGN KEY (id_unit) REFERENCES public.units(id);


--
-- TOC entry 4844 (class 2606 OID 16754)
-- Name: user_locations user_locations_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- TOC entry 4845 (class 2606 OID 16749)
-- Name: user_locations user_locations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4842 (class 2606 OID 16759)
-- Name: users users_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.cities(id);


--
-- TOC entry 4843 (class 2606 OID 16737)
-- Name: users users_temperature_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_temperature_unit_id_fkey FOREIGN KEY (temperature_unit_id) REFERENCES public.units(id);


-- Completed on 2026-11-12 03:08:51

--
-- PostgreSQL database dump complete
--

\unrestrict UwxVoh0U6QNFe15gwcJKBYOGG8IMWoctHkIcQacxU7NNtPdrb7saVF3hM0EYYi1

