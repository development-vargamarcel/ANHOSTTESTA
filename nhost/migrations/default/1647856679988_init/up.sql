SET check_function_bodies = false;
CREATE TABLE public.ww (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.ww_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.ww_id_seq OWNED BY public.ww.id;
ALTER TABLE ONLY public.ww ALTER COLUMN id SET DEFAULT nextval('public.ww_id_seq'::regclass);
ALTER TABLE ONLY public.ww
    ADD CONSTRAINT ww_pkey PRIMARY KEY (id);
