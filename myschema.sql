--
-- PostgreSQL database dump
--

\restrict 54wLJDdht9A0ZoLNV0AFGhZainMLMNKeZXjHMJr7QEnsj7hBVwkN5npBNSKoAUV

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_messages (
    id integer NOT NULL,
    sender_id text NOT NULL,
    receiver_id text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.admin_messages OWNER TO postgres;

--
-- Name: admin_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_messages_id_seq OWNER TO postgres;

--
-- Name: admin_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_messages_id_seq OWNED BY public.admin_messages.id;


--
-- Name: admin_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_notifications (
    id integer NOT NULL,
    type text NOT NULL,
    user_id text NOT NULL,
    user_email text,
    user_nickname text,
    message text NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.admin_notifications OWNER TO postgres;

--
-- Name: admin_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_notifications_id_seq OWNER TO postgres;

--
-- Name: admin_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_notifications_id_seq OWNED BY public.admin_notifications.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcements (
    id integer NOT NULL,
    title text NOT NULL,
    content text,
    image_url text,
    link_url text,
    type text DEFAULT 'banner'::text NOT NULL,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.announcements OWNER TO postgres;

--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.announcements_id_seq OWNER TO postgres;

--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    author_name text NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    title text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conversations_id_seq OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coupons (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    discount_type text DEFAULT 'percent'::text NOT NULL,
    discount_value integer DEFAULT 0 NOT NULL,
    valid_from timestamp without time zone,
    valid_until timestamp without time zone,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    place_id integer,
    is_welcome_coupon boolean DEFAULT false,
    service_description text
);


ALTER TABLE public.coupons OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupons_id_seq OWNER TO postgres;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: customer_chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_chat_messages (
    id integer NOT NULL,
    room_id integer NOT NULL,
    sender_id text NOT NULL,
    sender_role text DEFAULT 'customer'::text NOT NULL,
    sender_name text DEFAULT '방문자'::text NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customer_chat_messages OWNER TO postgres;

--
-- Name: customer_chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_chat_messages_id_seq OWNER TO postgres;

--
-- Name: customer_chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_chat_messages_id_seq OWNED BY public.customer_chat_messages.id;


--
-- Name: customer_chat_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_chat_rooms (
    id integer NOT NULL,
    visitor_id text NOT NULL,
    visitor_name text DEFAULT '방문자'::text NOT NULL,
    status text DEFAULT 'open'::text NOT NULL,
    last_message text,
    last_message_at timestamp without time zone,
    unread_by_admin integer DEFAULT 0,
    unread_by_visitor integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customer_chat_rooms OWNER TO postgres;

--
-- Name: customer_chat_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_chat_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_chat_rooms_id_seq OWNER TO postgres;

--
-- Name: customer_chat_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_chat_rooms_id_seq OWNED BY public.customer_chat_rooms.id;


--
-- Name: eco_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eco_profiles (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    image_url text DEFAULT ''::text NOT NULL,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.eco_profiles OWNER TO postgres;

--
-- Name: eco_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eco_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eco_profiles_id_seq OWNER TO postgres;

--
-- Name: eco_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eco_profiles_id_seq OWNED BY public.eco_profiles.id;


--
-- Name: expense_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense_groups (
    id integer NOT NULL,
    name text NOT NULL,
    participants jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    user_id text NOT NULL,
    budget integer DEFAULT 0
);


ALTER TABLE public.expense_groups OWNER TO postgres;

--
-- Name: expense_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expense_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expense_groups_id_seq OWNER TO postgres;

--
-- Name: expense_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expense_groups_id_seq OWNED BY public.expense_groups.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    group_id integer NOT NULL,
    description text DEFAULT ''::text,
    amount integer DEFAULT 0 NOT NULL,
    category text DEFAULT 'other'::text,
    paid_by text DEFAULT ''::text,
    split_among jsonb DEFAULT '[]'::jsonb,
    date text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    memo text DEFAULT ''::text
);


ALTER TABLE public.expenses OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expenses_id_seq OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: instagram_synced_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instagram_synced_posts (
    id integer NOT NULL,
    instagram_id text NOT NULL,
    post_id integer NOT NULL,
    synced_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.instagram_synced_posts OWNER TO postgres;

--
-- Name: instagram_synced_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instagram_synced_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instagram_synced_posts_id_seq OWNER TO postgres;

--
-- Name: instagram_synced_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instagram_synced_posts_id_seq OWNED BY public.instagram_synced_posts.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    role text NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: place_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place_categories (
    id text NOT NULL,
    label_ko text NOT NULL,
    label_en text NOT NULL,
    label_zh text,
    label_vi text,
    label_ru text,
    label_ja text,
    color text DEFAULT '#64748b'::text,
    gradient text DEFAULT 'from-gray-600 to-gray-700'::text,
    icon text DEFAULT 'MapPin'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    is_adult_only boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.place_categories OWNER TO postgres;

--
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id integer NOT NULL,
    name text NOT NULL,
    category text DEFAULT 'attraction'::text NOT NULL,
    description text,
    main_image text,
    images jsonb DEFAULT '[]'::jsonb,
    latitude text,
    longitude text,
    address text,
    phone text,
    website text,
    opening_hours text,
    price_range text,
    tags jsonb DEFAULT '[]'::jsonb,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    is_partner boolean DEFAULT false,
    discount_text text,
    menu_images jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.places OWNER TO postgres;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO postgres;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    image_url text,
    author_id text NOT NULL,
    author_name text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    is_hidden boolean DEFAULT false,
    view_count integer DEFAULT 0
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: push_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_subscriptions (
    id integer NOT NULL,
    user_id text NOT NULL,
    endpoint text NOT NULL,
    p256dh text NOT NULL,
    auth text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.push_subscriptions OWNER TO postgres;

--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.push_subscriptions_id_seq OWNER TO postgres;

--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_subscriptions_id_seq OWNED BY public.push_subscriptions.id;


--
-- Name: quote_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quote_categories (
    id integer NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text,
    image_url text DEFAULT ''::text,
    price_per_unit integer DEFAULT 0 NOT NULL,
    unit_label text DEFAULT '인'::text NOT NULL,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    images text[] DEFAULT '{}'::text[],
    options text DEFAULT '[]'::text
);


ALTER TABLE public.quote_categories OWNER TO postgres;

--
-- Name: quote_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quote_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quote_categories_id_seq OWNER TO postgres;

--
-- Name: quote_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quote_categories_id_seq OWNED BY public.quote_categories.id;


--
-- Name: quotes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quotes (
    id integer NOT NULL,
    customer_name text NOT NULL,
    total_price integer NOT NULL,
    breakdown jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    user_id text,
    deposit_paid boolean DEFAULT false,
    check_in_date text,
    check_out_date text,
    memo text DEFAULT ''::text,
    deposit_amount integer DEFAULT 0,
    memo_images jsonb DEFAULT '[]'::jsonb,
    eco_picks jsonb DEFAULT '{}'::jsonb,
    assigned_by text,
    user_memo text DEFAULT ''::text
);


ALTER TABLE public.quotes OWNER TO postgres;

--
-- Name: quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quotes_id_seq OWNER TO postgres;

--
-- Name: quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quotes_id_seq OWNED BY public.quotes.id;


--
-- Name: saved_travel_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_travel_plans (
    id integer NOT NULL,
    user_id text NOT NULL,
    title text NOT NULL,
    purpose text NOT NULL,
    start_date text NOT NULL,
    end_date text NOT NULL,
    plan_data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.saved_travel_plans OWNER TO postgres;

--
-- Name: saved_travel_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saved_travel_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.saved_travel_plans_id_seq OWNER TO postgres;

--
-- Name: saved_travel_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saved_travel_plans_id_seq OWNED BY public.saved_travel_plans.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    sid character varying NOT NULL,
    sess jsonb NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_products (
    id integer NOT NULL,
    name text NOT NULL,
    brand text DEFAULT ''::text,
    price integer DEFAULT 0 NOT NULL,
    quantity text DEFAULT ''::text,
    description text DEFAULT ''::text,
    image text DEFAULT ''::text,
    images text[] DEFAULT '{}'::text[],
    benefits text[] DEFAULT '{}'::text[],
    ingredients text DEFAULT ''::text,
    usage text DEFAULT ''::text,
    caution text DEFAULT ''::text,
    gradient text DEFAULT 'from-primary to-purple-600'::text,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.shop_products OWNER TO postgres;

--
-- Name: shop_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_products_id_seq OWNER TO postgres;

--
-- Name: shop_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_products_id_seq OWNED BY public.shop_products.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.site_settings OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_settings_id_seq OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: user_coupons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_coupons (
    id integer NOT NULL,
    user_id text NOT NULL,
    coupon_id integer NOT NULL,
    is_used boolean DEFAULT false,
    used_at timestamp without time zone,
    issued_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_coupons OWNER TO postgres;

--
-- Name: user_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_coupons_id_seq OWNER TO postgres;

--
-- Name: user_coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_coupons_id_seq OWNED BY public.user_coupons.id;


--
-- Name: user_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_locations (
    id integer NOT NULL,
    nickname text NOT NULL,
    latitude text NOT NULL,
    longitude text NOT NULL,
    place_name text,
    place_category text,
    message text,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_locations OWNER TO postgres;

--
-- Name: user_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_locations_id_seq OWNER TO postgres;

--
-- Name: user_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_locations_id_seq OWNED BY public.user_locations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    email character varying,
    first_name character varying,
    last_name character varying,
    profile_image_url character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    gender character varying,
    nickname character varying,
    birth_date character varying,
    password character varying,
    login_method character varying,
    email_verified boolean DEFAULT false,
    email_verification_token character varying,
    email_verification_expires timestamp without time zone,
    welcome_coupon_issued boolean DEFAULT false,
    is_admin boolean DEFAULT false,
    can_view_nightlife18 boolean DEFAULT false,
    can_view_eco boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: villas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villas (
    id integer NOT NULL,
    name text NOT NULL,
    main_image text,
    images jsonb DEFAULT '[]'::jsonb,
    weekday_price integer DEFAULT 350 NOT NULL,
    friday_price integer DEFAULT 380 NOT NULL,
    weekend_price integer DEFAULT 500 NOT NULL,
    latitude text,
    longitude text,
    address text,
    notes text,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    holiday_price integer DEFAULT 550 NOT NULL,
    map_url text,
    max_guests integer DEFAULT 10,
    bedrooms integer DEFAULT 3,
    amenities jsonb DEFAULT '[]'::jsonb,
    is_best boolean DEFAULT false
);


ALTER TABLE public.villas OWNER TO postgres;

--
-- Name: villas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.villas_id_seq OWNER TO postgres;

--
-- Name: villas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villas_id_seq OWNED BY public.villas.id;


--
-- Name: visitor_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitor_count (
    id integer NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    last_reset_date text,
    total_count integer DEFAULT 15000 NOT NULL,
    real_count integer DEFAULT 0 NOT NULL,
    real_total_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.visitor_count OWNER TO postgres;

--
-- Name: visitor_count_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visitor_count_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visitor_count_id_seq OWNER TO postgres;

--
-- Name: visitor_count_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visitor_count_id_seq OWNED BY public.visitor_count.id;


--
-- Name: admin_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_messages ALTER COLUMN id SET DEFAULT nextval('public.admin_messages_id_seq'::regclass);


--
-- Name: admin_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_notifications ALTER COLUMN id SET DEFAULT nextval('public.admin_notifications_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: customer_chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_chat_messages ALTER COLUMN id SET DEFAULT nextval('public.customer_chat_messages_id_seq'::regclass);


--
-- Name: customer_chat_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_chat_rooms ALTER COLUMN id SET DEFAULT nextval('public.customer_chat_rooms_id_seq'::regclass);


--
-- Name: eco_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eco_profiles ALTER COLUMN id SET DEFAULT nextval('public.eco_profiles_id_seq'::regclass);


--
-- Name: expense_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_groups ALTER COLUMN id SET DEFAULT nextval('public.expense_groups_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: instagram_synced_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instagram_synced_posts ALTER COLUMN id SET DEFAULT nextval('public.instagram_synced_posts_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: push_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.push_subscriptions_id_seq'::regclass);


--
-- Name: quote_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_categories ALTER COLUMN id SET DEFAULT nextval('public.quote_categories_id_seq'::regclass);


--
-- Name: quotes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes ALTER COLUMN id SET DEFAULT nextval('public.quotes_id_seq'::regclass);


--
-- Name: saved_travel_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_travel_plans ALTER COLUMN id SET DEFAULT nextval('public.saved_travel_plans_id_seq'::regclass);


--
-- Name: shop_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products ALTER COLUMN id SET DEFAULT nextval('public.shop_products_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: user_coupons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons ALTER COLUMN id SET DEFAULT nextval('public.user_coupons_id_seq'::regclass);


--
-- Name: user_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations ALTER COLUMN id SET DEFAULT nextval('public.user_locations_id_seq'::regclass);


--
-- Name: villas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villas ALTER COLUMN id SET DEFAULT nextval('public.villas_id_seq'::regclass);


--
-- Name: visitor_count id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitor_count ALTER COLUMN id SET DEFAULT nextval('public.visitor_count_id_seq'::regclass);


--
-- Name: admin_messages admin_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_messages
    ADD CONSTRAINT admin_messages_pkey PRIMARY KEY (id);


--
-- Name: admin_notifications admin_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_notifications
    ADD CONSTRAINT admin_notifications_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: customer_chat_messages customer_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_chat_messages
    ADD CONSTRAINT customer_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: customer_chat_rooms customer_chat_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_chat_rooms
    ADD CONSTRAINT customer_chat_rooms_pkey PRIMARY KEY (id);


--
-- Name: eco_profiles eco_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eco_profiles
    ADD CONSTRAINT eco_profiles_pkey PRIMARY KEY (id);


--
-- Name: expense_groups expense_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense_groups
    ADD CONSTRAINT expense_groups_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: instagram_synced_posts instagram_synced_posts_instagram_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instagram_synced_posts
    ADD CONSTRAINT instagram_synced_posts_instagram_id_unique UNIQUE (instagram_id);


--
-- Name: instagram_synced_posts instagram_synced_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instagram_synced_posts
    ADD CONSTRAINT instagram_synced_posts_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: place_categories place_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_categories
    ADD CONSTRAINT place_categories_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: push_subscriptions push_subscriptions_endpoint_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_subscriptions
    ADD CONSTRAINT push_subscriptions_endpoint_unique UNIQUE (endpoint);


--
-- Name: push_subscriptions push_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_subscriptions
    ADD CONSTRAINT push_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: quote_categories quote_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_categories
    ADD CONSTRAINT quote_categories_pkey PRIMARY KEY (id);


--
-- Name: quotes quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pkey PRIMARY KEY (id);


--
-- Name: saved_travel_plans saved_travel_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_travel_plans
    ADD CONSTRAINT saved_travel_plans_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);


--
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_key_unique UNIQUE (key);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: user_coupons user_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_coupons
    ADD CONSTRAINT user_coupons_pkey PRIMARY KEY (id);


--
-- Name: user_locations user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: villas villas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villas
    ADD CONSTRAINT villas_pkey PRIMARY KEY (id);


--
-- Name: visitor_count visitor_count_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitor_count
    ADD CONSTRAINT visitor_count_pkey PRIMARY KEY (id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.sessions USING btree (expire);


--
-- Name: messages messages_conversation_id_conversations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_conversation_id_conversations_id_fk FOREIGN KEY (conversation_id) REFERENCES public.conversations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 54wLJDdht9A0ZoLNV0AFGhZainMLMNKeZXjHMJr7QEnsj7hBVwkN5npBNSKoAUV

