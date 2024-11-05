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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_count integer DEFAULT 0,
    planet_count integer DEFAULT 0,
    description text
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
    name character varying(50) NOT NULL,
    radius numeric(4,1),
    weight numeric(4,1),
    planet_id integer
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
    name character varying(50) NOT NULL,
    radius numeric(6,1),
    weight numeric(6,1),
    has_life boolean DEFAULT false,
    star_id integer
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
    name character varying(50) NOT NULL,
    radius numeric(4,1),
    weight numeric(4,1),
    is_active boolean DEFAULT true,
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 2);
INSERT INTO public.black_hole VALUES (2, 'Messier 87 Black Hole', 10);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 3);
INSERT INTO public.black_hole VALUES (4, 'TON 618', 1);
INSERT INTO public.black_hole VALUES (5, 'NGC 1277 Black Hole', 4);
INSERT INTO public.black_hole VALUES (6, 'Abell 1201 Black Hole', 5);
INSERT INTO public.black_hole VALUES (7, 'Holmberg 15A Black Hole', 6);
INSERT INTO public.black_hole VALUES (8, 'IC 1101 Black Hole', 20);
INSERT INTO public.black_hole VALUES (9, 'Centaurus A Black Hole', 9);
INSERT INTO public.black_hole VALUES (10, 'NGC 1600 Black Hole', 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 95, 70, 'Nearest major galaxy to the Milky Way, with a massive star system.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 87, 65, 'Our home galaxy, containing the Solar System.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 72, 50, 'The third-largest galaxy in the Local Group, known for bright star-forming regions.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 58, 30, 'Famous for its spiral structure and close companion galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 85, 25, 'A large spiral galaxy in the Ursa Major constellation.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 60, 15, 'Notable for its bright nucleus and large central bulge, shaped like a sombrero.');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 93, 40, 'A large, face-on spiral galaxy with high star formation activity.');
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 45, 10, 'An unusual ring galaxy with a distinctive shape caused by a collision.');
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 77, 50, 'Known for its peculiar shape and active galactic nucleus.');
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 98, 60, 'A giant elliptical galaxy with a massive black hole at its center.');
INSERT INTO public.galaxy VALUES (11, 'NGC 1300', 69, 25, 'A barred spiral galaxy known for its intricate spiral arms.');
INSERT INTO public.galaxy VALUES (12, 'Circinus', 34, 18, 'A nearby spiral galaxy with active star-forming regions.');
INSERT INTO public.galaxy VALUES (13, 'Antennae', 48, 9, 'A pair of colliding galaxies forming new stars at a high rate.');
INSERT INTO public.galaxy VALUES (14, 'NGC 6744', 79, 35, 'A Milky Way-like spiral galaxy with an extensive halo of stars.');
INSERT INTO public.galaxy VALUES (15, 'NGC 253', 54, 28, 'Known as the Sculptor Galaxy, with high rates of star formation.');
INSERT INTO public.galaxy VALUES (16, 'NGC 488', 88, 20, 'A nearly perfect spiral galaxy with a distinct bulge and disk.');
INSERT INTO public.galaxy VALUES (17, 'Messier 94', 62, 22, 'Notable for its high surface brightness and tightly wound arms.');
INSERT INTO public.galaxy VALUES (18, 'NGC 300', 43, 15, 'A spiral galaxy in the Sculptor Group, with an active star-forming region.');
INSERT INTO public.galaxy VALUES (19, 'NGC 1097', 71, 38, 'A barred spiral galaxy with a supermassive black hole at its center.');
INSERT INTO public.galaxy VALUES (20, 'IC 1101', 100, 100, 'One of the largest known galaxies, located in the Abell 2029 cluster.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1.7, 0.7, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.1, 0.0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.1, 0.0, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1.8, 0.9, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 1.6, 0.8, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2.6, 1.5, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 2.4, 1.1, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 2.5, 1.3, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 1.5, 0.5, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1.4, 0.6, 5);
INSERT INTO public.moon VALUES (11, 'Oberon', 1.2, 0.5, 5);
INSERT INTO public.moon VALUES (12, 'Triton', 1.4, 0.6, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 0.6, 0.2, 1);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1.0, 0.4, 12);
INSERT INTO public.moon VALUES (15, 'Miranda', 0.5, 0.1, 12);
INSERT INTO public.moon VALUES (16, 'Enceladus', 0.5, 0.2, 5);
INSERT INTO public.moon VALUES (17, 'Dione', 1.1, 0.4, 5);
INSERT INTO public.moon VALUES (18, 'Mimas', 0.4, 0.1, 5);
INSERT INTO public.moon VALUES (19, 'Hyperion', 0.6, 0.2, 5);
INSERT INTO public.moon VALUES (20, 'Nereid', 0.3, 0.1, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6.4, 5.9, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 3.4, 0.6, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 6.1, 4.9, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 71.5, 1898.0, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 60.2, 568.3, false, 1);
INSERT INTO public.planet VALUES (6, 'Proxima b', 0.9, 1.0, true, 6);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 1.3, 1.2, false, 2);
INSERT INTO public.planet VALUES (8, 'Rigel I', 4.1, 7.5, false, 7);
INSERT INTO public.planet VALUES (9, 'Rigel II', 3.9, 8.2, false, 7);
INSERT INTO public.planet VALUES (10, 'Polaris A', 5.0, 9.8, false, 9);
INSERT INTO public.planet VALUES (11, 'Polaris B', 4.8, 8.9, false, 9);
INSERT INTO public.planet VALUES (12, 'Aldebaran I', 6.2, 10.0, false, 11);
INSERT INTO public.planet VALUES (13, 'Deneb Prime', 4.5, 12.1, false, 17);
INSERT INTO public.planet VALUES (14, 'Altair I', 2.1, 4.2, false, 18);
INSERT INTO public.planet VALUES (15, 'Vega VII', 3.2, 7.1, false, 8);
INSERT INTO public.planet VALUES (16, 'Capella III', 5.6, 9.2, false, 19);
INSERT INTO public.planet VALUES (17, 'Bellatrix A', 4.0, 5.4, false, 20);
INSERT INTO public.planet VALUES (18, 'Betelgeuse IV', 4.4, 10.7, false, 3);
INSERT INTO public.planet VALUES (19, 'Sirius A Prime', 3.8, 6.0, false, 4);
INSERT INTO public.planet VALUES (20, 'Antares V', 4.9, 11.6, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 1.2, 1.1, true, 2);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 0.9, 0.8, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 5.5, 10.1, true, 3);
INSERT INTO public.star VALUES (4, 'Sirius A', 1.7, 2.1, true, 2);
INSERT INTO public.star VALUES (5, 'Sirius B', 0.5, 1.0, false, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 0.2, 0.1, true, 2);
INSERT INTO public.star VALUES (7, 'Rigel', 4.5, 17.0, true, 1);
INSERT INTO public.star VALUES (8, 'Vega', 2.4, 2.1, true, 1);
INSERT INTO public.star VALUES (9, 'Polaris', 3.8, 6.0, true, 4);
INSERT INTO public.star VALUES (10, 'Arcturus', 2.0, 3.5, true, 5);
INSERT INTO public.star VALUES (11, 'Aldebaran', 1.6, 2.5, true, 5);
INSERT INTO public.star VALUES (12, 'Antares', 5.1, 12.4, false, 3);
INSERT INTO public.star VALUES (13, 'Spica', 2.3, 2.4, true, 4);
INSERT INTO public.star VALUES (14, 'Castor', 1.4, 1.6, true, 6);
INSERT INTO public.star VALUES (15, 'Pollux', 1.9, 1.9, true, 6);
INSERT INTO public.star VALUES (16, 'Fomalhaut', 1.8, 1.7, true, 7);
INSERT INTO public.star VALUES (17, 'Deneb', 6.0, 19.0, true, 1);
INSERT INTO public.star VALUES (18, 'Altair', 1.5, 1.8, true, 8);
INSERT INTO public.star VALUES (19, 'Capella', 2.2, 2.7, true, 9);
INSERT INTO public.star VALUES (20, 'Bellatrix', 3.0, 8.6, true, 10);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

