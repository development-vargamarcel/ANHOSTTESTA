SET check_function_bodies = false;
CREATE TABLE public.aa (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.aa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.aa_id_seq OWNED BY public.aa.id;
ALTER TABLE ONLY public.aa ALTER COLUMN id SET DEFAULT nextval('public.aa_id_seq'::regclass);
ALTER TABLE ONLY public.aa
    ADD CONSTRAINT aa_pkey PRIMARY KEY (id);
