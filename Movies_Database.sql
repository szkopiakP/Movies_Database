--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 15.4

-- Started on 2023-10-26 10:28:54 CEST

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16409)
-- Name: movie_makers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_makers (
    movie_id integer NOT NULL,
    director text,
    scenario text,
    shots text,
    music text
);


ALTER TABLE public.movie_makers OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16428)
-- Name: movie_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_staff (
    movie_id integer NOT NULL,
    male_main text,
    female_main text,
    male_supp text,
    female_supp text
);


ALTER TABLE public.movie_staff OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16400)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title text,
    category text,
    release_year integer,
    runtime_minutes integer,
    rating real,
    usd_earnings money
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 3439 (class 2606 OID 16406)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3441 (class 2606 OID 16408)
-- Name: movies movies_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_title_key UNIQUE (title);


--
-- TOC entry 3443 (class 2606 OID 17050)
-- Name: movie_staff fkey_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_staff
    ADD CONSTRAINT fkey_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- TOC entry 3442 (class 2606 OID 17057)
-- Name: movie_makers fkey_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_makers
    ADD CONSTRAINT fkey_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-10-26 10:28:55 CEST

--
-- PostgreSQL database dump complete
--

