SET check_function_bodies = false;
CREATE TABLE public.qw (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.qw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.qw_id_seq OWNED BY public.qw.id;
ALTER TABLE ONLY public.qw ALTER COLUMN id SET DEFAULT nextval('public.qw_id_seq'::regclass);
ALTER TABLE ONLY public.qw
    ADD CONSTRAINT qw_pkey PRIMARY KEY (id);
