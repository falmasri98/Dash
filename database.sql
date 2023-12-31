-- CREATE TABLE post (
--   id SERIAL PRIMARY KEY,
--   user_id INT,
--   title VARCHAR(255),
--   description TEXT,
--   likes INT,
--   timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- Post Table Edited by FA
CREATE TABLE IF NOT EXISTS public.post
(

        -- edit id
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer,
    title character varying(255) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    likes integer DEFAULT 0,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status text COLLATE pg_catalog."default" NOT NULL DEFAULT 'pending'::text,
    CONSTRAINT post_pkey PRIMARY KEY (id),
    CONSTRAINT user_id_fk FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
                -- when delete user
        ON DELETE CASCADE 
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.post
    OWNER to postgres;

-- --------------------------------------------------------
-- Comment Table -- FA
CREATE TABLE IF NOT EXISTS public.comments
(

    -- edit id
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    post_id integer,
    user_id integer,
    comment text COLLATE pg_catalog."default",
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT comments_pkey PRIMARY KEY (id),
    CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES public.post (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.comments
    OWNER to postgres;

-- --------------------------------------------------------
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- CREATE TABLE users (
--   user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
--   user_name VARCHAR(255) NOT NULL, 
--   user_email VARCHAR(255) NOT NULL,
--   user_password VARCHAR(255) NOT NULL,
--   deleted BOOLEAN DEFAULT false
-- );


-- UserTable Edited by FA 
CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_name text COLLATE pg_catalog."default" NOT NULL,
    user_email text COLLATE pg_catalog."default" NOT NULL,
    user_password text COLLATE pg_catalog."default" NOT NULL,
    deleted boolean NOT NULL DEFAULT false,
    CONSTRAINT users_pkey1 PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;


-- aboutUs table -- FA


CREATE TABLE IF NOT EXISTS public.aboutus
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    main_us_text text COLLATE pg_catalog."default" NOT NULL,
    why_choose_us text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "about-us_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.aboutus
    OWNER to postgres;

-- ContactUs table -- FA


CREATE TABLE IF NOT EXISTS public.contactus
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    our_location text COLLATE pg_catalog."default" NOT NULL,
    phonenumber text COLLATE pg_catalog."default" NOT NULL,
    email text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT contactus_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contactus
    OWNER to postgres;







-- Admin table --- FA
CREATE TABLE IF NOT EXISTS public.admin
(
    admin_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    admin_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    admin_email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    admin_password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    deleted boolean DEFAULT false,
    role text COLLATE pg_catalog."default" NOT NULL DEFAULT 'admin'::text,
    CONSTRAINT users_pkey PRIMARY KEY (admin_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.admin
    OWNER to postgres;



    -- get user Msg's -- FA
    CREATE TABLE IF NOT EXISTS public.users_feedback
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_email text COLLATE pg_catalog."default" NOT NULL,
    user_phone text COLLATE pg_catalog."default" NOT NULL,
    user_name text COLLATE pg_catalog."default" NOT NULL,
    message text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_feedback_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users_feedback
    OWNER to postgres;