SET check_function_bodies = false;
CREATE TABLE public.qq (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.qq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.qq_id_seq OWNED BY public.qq.id;
ALTER TABLE ONLY public.qq ALTER COLUMN id SET DEFAULT nextval('public.qq_id_seq'::regclass);
ALTER TABLE ONLY public.qq
    ADD CONSTRAINT qq_pkey PRIMARY KEY (id);
