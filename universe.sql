--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: continents; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continents (
    name character varying NOT NULL,
    population numeric(10,0) NOT NULL,
    area numeric(8,0),
    density numeric(3,0),
    continents_id integer NOT NULL
);


ALTER TABLE public.continents OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continents_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continents_continent_id_seq OWNED BY public.continents.continents_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    constellation text,
    image text,
    name_origin text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    mean_distance numeric(6,3),
    mean_period numeric(6,3),
    diameter text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    no_of_moons integer,
    tilt_degrees integer,
    mass_earth_1 numeric(6,3),
    visited boolean,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    stellar_class text,
    mass numeric(4,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: continents continents_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continents ALTER COLUMN continents_id SET DEFAULT nextval('public.continents_continent_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continents VALUES ('Asia', 4753079726, 31033131, 153, 1);
INSERT INTO public.continents VALUES ('Africa', 1460481772, 29648481, 49, 2);
INSERT INTO public.continents VALUES ('Europe', 740433713, 22134710, 33, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', '70px-Andromeda_Galaxy_%28with_h-alpha%29.jpg', 'The area of sky which it appears');
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Corvus', 'Antennae_Galaxies_reloaded.jpg', 'The area of sky which it appears');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Centaurus', 'NGC_4622HSTFull.jpg', 'It appears to rotate backwards');
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 'Lynx', 'NGC2537_-_SDSS_DR14.jpg', 'Resembles a bear claw');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Coma Berenices', 'Blackeyegalaxy.jpg', 'Dark band of absorbing dust');
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'Ursa Major', 'Messier_81_HST.jpg', 'Named for Johnson Elert Bode who discovered it');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384.000, 27.322, '3476');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9.380, 0.319, '28,22,18');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23.460, 1.262, '16,12,10');
INSERT INTO public.moon VALUES (4, 'Metis', 4, 127.960, 0.295, '40');
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, 128.980, 0.298, '24,20,16');
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, 181.300, 0.498, '270, 170, 150');
INSERT INTO public.moon VALUES (7, 'Thebe', 5, 221.900, 0.675, '110,90');
INSERT INTO public.moon VALUES (8, 'Io', 5, 421.600, 1.769, '3,652');
INSERT INTO public.moon VALUES (9, 'Europa', 5, 670.900, 3.551, '3,138');
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, 970.000, 7.155, '5,262');
INSERT INTO public.moon VALUES (11, 'Atlas', 6, 137.670, 0.602, '38,26');
INSERT INTO public.moon VALUES (12, 'Prometheus', 6, 139.350, 0.613, '140,100,74');
INSERT INTO public.moon VALUES (13, 'Pandora', 6, 141.700, 0.629, '110,84,66');
INSERT INTO public.moon VALUES (14, 'Janus', 6, 151.470, 0.695, '220,190,160');
INSERT INTO public.moon VALUES (15, 'Epimetheus', 6, 151.420, 0.694, '140,114,100');
INSERT INTO public.moon VALUES (16, 'Mimus', 6, 185.400, 0.942, '392');
INSERT INTO public.moon VALUES (17, 'Enceladus', 6, 238.040, 1.370, '500');
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 294.670, 1.888, '24,22');
INSERT INTO public.moon VALUES (19, 'Calypso', 6, 294.670, 1.888, '30,24,16');
INSERT INTO public.moon VALUES (20, 'Dione', 6, 377.420, 2.737, '36');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 7, 0.060, false, false);
INSERT INTO public.planet VALUES (2, 'Venu', 1, 0, 177, 0.820, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 23, 1.000, true, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 25, 0.110, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 16, 3, 317.890, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 17, 27, 95.170, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, 98, 14.560, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 8, 30, 17.240, false, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1, 118, 0.002, false, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 0, 0, 0.000, false, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 0, 0, 0.000, false, false);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 0, 0, 0.000, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 0.122);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 2, 'G2V', 1.079);
INSERT INTO public.star VALUES (4, 'Toliman', 2, 'K1V', 0.909);
INSERT INTO public.star VALUES (5, 'Bernards Star', 3, 'M4.0Ve', 0.144);
INSERT INTO public.star VALUES (6, 'Wolf 359', 3, 'M6.0V', 0.090);


--
-- Name: continents_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continents_continent_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: continents continents_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_name_key UNIQUE (name);


--
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (continents_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

