SET check_function_bodies = false;
CREATE TABLE public.xx (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.xx_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.xx_id_seq OWNED BY public.xx.id;
ALTER TABLE ONLY public.xx ALTER COLUMN id SET DEFAULT nextval('public.xx_id_seq'::regclass);
ALTER TABLE ONLY public.xx
    ADD CONSTRAINT xx_pkey PRIMARY KEY (id);
