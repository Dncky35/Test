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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2018, 'Final', 182, 183, 4, 2, 1);
INSERT INTO public.games VALUES (2018, 'Third Place', 184, 185, 2, 0, 2);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 183, 185, 2, 1, 3);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 182, 184, 1, 0, 4);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 183, 186, 3, 2, 5);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 185, 187, 2, 0, 6);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 184, 188, 2, 1, 7);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 182, 189, 2, 0, 8);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 185, 190, 2, 1, 9);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 187, 191, 1, 0, 10);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 184, 192, 3, 2, 11);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 188, 193, 2, 0, 12);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 183, 194, 2, 1, 13);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 186, 195, 2, 1, 14);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 189, 196, 2, 1, 15);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 182, 197, 4, 3, 16);
INSERT INTO public.games VALUES (2014, 'Final', 198, 197, 1, 0, 17);
INSERT INTO public.games VALUES (2014, 'Third Place', 199, 188, 3, 0, 18);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 197, 199, 1, 0, 19);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 198, 188, 7, 1, 20);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 199, 200, 1, 0, 21);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 197, 184, 1, 0, 22);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 188, 190, 2, 1, 23);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 198, 182, 1, 0, 24);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 188, 201, 2, 1, 25);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 190, 189, 2, 0, 26);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 182, 202, 2, 0, 27);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 198, 203, 2, 1, 28);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 199, 193, 2, 1, 29);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 200, 204, 2, 1, 30);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 197, 191, 1, 0, 31);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 184, 205, 2, 1, 32);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (182, 'France');
INSERT INTO public.teams VALUES (183, 'Croatia');
INSERT INTO public.teams VALUES (184, 'Belgium');
INSERT INTO public.teams VALUES (185, 'England');
INSERT INTO public.teams VALUES (186, 'Russia');
INSERT INTO public.teams VALUES (187, 'Sweden');
INSERT INTO public.teams VALUES (188, 'Brazil');
INSERT INTO public.teams VALUES (189, 'Uruguay');
INSERT INTO public.teams VALUES (190, 'Colombia');
INSERT INTO public.teams VALUES (191, 'Switzerland');
INSERT INTO public.teams VALUES (192, 'Japan');
INSERT INTO public.teams VALUES (193, 'Mexico');
INSERT INTO public.teams VALUES (194, 'Denmark');
INSERT INTO public.teams VALUES (195, 'Spain');
INSERT INTO public.teams VALUES (196, 'Portugal');
INSERT INTO public.teams VALUES (197, 'Argentina');
INSERT INTO public.teams VALUES (198, 'Germany');
INSERT INTO public.teams VALUES (199, 'Netherlands');
INSERT INTO public.teams VALUES (200, 'Costa Rica');
INSERT INTO public.teams VALUES (201, 'Chile');
INSERT INTO public.teams VALUES (202, 'Nigeria');
INSERT INTO public.teams VALUES (203, 'Algeria');
INSERT INTO public.teams VALUES (204, 'Greece');
INSERT INTO public.teams VALUES (205, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 205, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

