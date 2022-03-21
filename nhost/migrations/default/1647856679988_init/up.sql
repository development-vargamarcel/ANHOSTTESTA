SET check_function_bodies = false;
CREATE TABLE public.bb (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.bb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.bb_id_seq OWNED BY public.bb.id;
ALTER TABLE ONLY public.bb ALTER COLUMN id SET DEFAULT nextval('public.bb_id_seq'::regclass);
ALTER TABLE ONLY public.bb
    ADD CONSTRAINT bb_pkey PRIMARY KEY (id);
