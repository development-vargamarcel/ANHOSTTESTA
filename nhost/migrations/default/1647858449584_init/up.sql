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
CREATE TABLE public.ingredients (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL
);
CREATE TABLE public.products (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    title character varying,
    provider integer
);
CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
CREATE TABLE public.products_ingredients (
    id integer NOT NULL,
    product integer,
    ingredient character varying
);
CREATE SEQUENCE public.products_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.products_ingredients_id_seq OWNED BY public.products_ingredients.id;
CREATE TABLE public.providers (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    "user" uuid
);
CREATE SEQUENCE public.providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;
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
CREATE TABLE public.test (
    id integer NOT NULL,
    location point NOT NULL
);
CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;
ALTER TABLE ONLY public.aa ALTER COLUMN id SET DEFAULT nextval('public.aa_id_seq'::regclass);
ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
ALTER TABLE ONLY public.products_ingredients ALTER COLUMN id SET DEFAULT nextval('public.products_ingredients_id_seq'::regclass);
ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);
ALTER TABLE ONLY public.qq ALTER COLUMN id SET DEFAULT nextval('public.qq_id_seq'::regclass);
ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);
ALTER TABLE ONLY public.aa
    ADD CONSTRAINT aa_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (title);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_title_key UNIQUE (title);
ALTER TABLE ONLY public.products_ingredients
    ADD CONSTRAINT products_ingredients_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_title_key UNIQUE (title);
ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.qq
    ADD CONSTRAINT qq_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);
CREATE TRIGGER set_public_ingredients_updated_at BEFORE UPDATE ON public.ingredients FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_ingredients_updated_at ON public.ingredients IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_products_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_products_updated_at ON public.products IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_providers_updated_at BEFORE UPDATE ON public.providers FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_providers_updated_at ON public.providers IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public.products_ingredients
    ADD CONSTRAINT products_ingredients_ingredient_fkey FOREIGN KEY (ingredient) REFERENCES public.ingredients(title) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.products_ingredients
    ADD CONSTRAINT products_ingredients_product_fkey FOREIGN KEY (product) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_provider_fkey FOREIGN KEY (provider) REFERENCES public.providers(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_user_fkey FOREIGN KEY ("user") REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
