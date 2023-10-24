PGDMP         ;            	    {           Piotrek    14.9    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16385    Piotrek    DATABASE     u   CREATE DATABASE "Piotrek" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "Piotrek";
                Piotrek    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            	           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    16409    movie_makers    TABLE     �   CREATE TABLE public.movie_makers (
    id integer NOT NULL,
    director text,
    scenario text,
    shots text,
    music text,
    movie_id integer
);
     DROP TABLE public.movie_makers;
       public         heap    postgres    false    4            �            1259    16428    movie_staff    TABLE     �   CREATE TABLE public.movie_staff (
    id integer NOT NULL,
    male_main text,
    woman_main text,
    male_supp text,
    woman_supp text,
    movie_id integer
);
    DROP TABLE public.movie_staff;
       public         heap    postgres    false    4            �            1259    16400    movies    TABLE     �   CREATE TABLE public.movies (
    id integer NOT NULL,
    title text,
    category text,
    release_year integer,
    runtime_minutes integer,
    rating real,
    usd_earnings money
);
    DROP TABLE public.movies;
       public         heap    postgres    false    4            s           2606    16415    movie_makers movie_staff_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.movie_makers
    ADD CONSTRAINT movie_staff_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.movie_makers DROP CONSTRAINT movie_staff_pkey;
       public            postgres    false    210            u           2606    16434    movie_staff movie_staff_pkey1 
   CONSTRAINT     [   ALTER TABLE ONLY public.movie_staff
    ADD CONSTRAINT movie_staff_pkey1 PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.movie_staff DROP CONSTRAINT movie_staff_pkey1;
       public            postgres    false    211            o           2606    16406    movies movies_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    209            q           2606    16408    movies movies_title_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_title_key UNIQUE (title);
 A   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_title_key;
       public            postgres    false    209            v           2606    17023    movie_makers fk_movie_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.movie_makers
    ADD CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 B   ALTER TABLE ONLY public.movie_makers DROP CONSTRAINT fk_movie_id;
       public          postgres    false    3439    210    209            w           2606    17028    movie_staff fk_movie_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.movie_staff
    ADD CONSTRAINT fk_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 A   ALTER TABLE ONLY public.movie_staff DROP CONSTRAINT fk_movie_id;
       public          postgres    false    209    211    3439           