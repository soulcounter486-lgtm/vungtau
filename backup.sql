--
-- PostgreSQL database dump
--

\restrict Rdj17xHpRh2mUfJoEa5WyCe3qvltHDsG7ub2aLjFT5YCPfPlq3pcXA7Jedo6orj

-- Dumped from database version 16.12 (6d3029c)
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

ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_conversation_id_conversations_id_fk;
DROP INDEX IF EXISTS public."IDX_session_expire";
DROP INDEX IF EXISTS _system.idx_replit_database_migrations_v1_build_id;
ALTER TABLE IF EXISTS ONLY public.visitor_count DROP CONSTRAINT IF EXISTS visitor_count_pkey;
ALTER TABLE IF EXISTS ONLY public.villas DROP CONSTRAINT IF EXISTS villas_pkey;
ALTER TABLE IF EXISTS ONLY public.vehicle_types DROP CONSTRAINT IF EXISTS vehicle_types_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_locations DROP CONSTRAINT IF EXISTS user_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.user_coupons DROP CONSTRAINT IF EXISTS user_coupons_pkey;
ALTER TABLE IF EXISTS ONLY public.site_settings DROP CONSTRAINT IF EXISTS site_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.site_settings DROP CONSTRAINT IF EXISTS site_settings_key_unique;
ALTER TABLE IF EXISTS ONLY public.shop_products DROP CONSTRAINT IF EXISTS shop_products_pkey;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.saved_travel_plans DROP CONSTRAINT IF EXISTS saved_travel_plans_pkey;
ALTER TABLE IF EXISTS ONLY public.real_estate_listings DROP CONSTRAINT IF EXISTS real_estate_listings_pkey;
ALTER TABLE IF EXISTS ONLY public.real_estate_categories DROP CONSTRAINT IF EXISTS real_estate_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.quotes DROP CONSTRAINT IF EXISTS quotes_pkey;
ALTER TABLE IF EXISTS ONLY public.quote_categories DROP CONSTRAINT IF EXISTS quote_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.push_subscriptions DROP CONSTRAINT IF EXISTS push_subscriptions_pkey;
ALTER TABLE IF EXISTS ONLY public.push_subscriptions DROP CONSTRAINT IF EXISTS push_subscriptions_endpoint_unique;
ALTER TABLE IF EXISTS ONLY public.posts DROP CONSTRAINT IF EXISTS posts_pkey;
ALTER TABLE IF EXISTS ONLY public.places DROP CONSTRAINT IF EXISTS places_pkey;
ALTER TABLE IF EXISTS ONLY public.place_categories DROP CONSTRAINT IF EXISTS place_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.instagram_synced_posts DROP CONSTRAINT IF EXISTS instagram_synced_posts_pkey;
ALTER TABLE IF EXISTS ONLY public.instagram_synced_posts DROP CONSTRAINT IF EXISTS instagram_synced_posts_instagram_id_unique;
ALTER TABLE IF EXISTS ONLY public.expenses DROP CONSTRAINT IF EXISTS expenses_pkey;
ALTER TABLE IF EXISTS ONLY public.expense_groups DROP CONSTRAINT IF EXISTS expense_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.eco_profiles DROP CONSTRAINT IF EXISTS eco_profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.eco_date_unavailability DROP CONSTRAINT IF EXISTS eco_date_unavailability_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_chat_rooms DROP CONSTRAINT IF EXISTS customer_chat_rooms_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_chat_messages DROP CONSTRAINT IF EXISTS customer_chat_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.coupons DROP CONSTRAINT IF EXISTS coupons_pkey;
ALTER TABLE IF EXISTS ONLY public.conversations DROP CONSTRAINT IF EXISTS conversations_pkey;
ALTER TABLE IF EXISTS ONLY public.comments DROP CONSTRAINT IF EXISTS comments_pkey;
ALTER TABLE IF EXISTS ONLY public.announcements DROP CONSTRAINT IF EXISTS announcements_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_notifications DROP CONSTRAINT IF EXISTS admin_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_messages DROP CONSTRAINT IF EXISTS admin_messages_pkey;
ALTER TABLE IF EXISTS ONLY _system.replit_database_migrations_v1 DROP CONSTRAINT IF EXISTS replit_database_migrations_v1_pkey;
ALTER TABLE IF EXISTS public.visitor_count ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.villas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.vehicle_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_coupons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.site_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.shop_products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.saved_travel_plans ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.real_estate_listings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.quotes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.quote_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.push_subscriptions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.places ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.instagram_synced_posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.expenses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.expense_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.eco_profiles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.eco_date_unavailability ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customer_chat_rooms ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customer_chat_messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.coupons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conversations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.announcements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS _system.replit_database_migrations_v1 ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.visitor_count_id_seq;
DROP TABLE IF EXISTS public.visitor_count;
DROP SEQUENCE IF EXISTS public.villas_id_seq;
DROP TABLE IF EXISTS public.villas;
DROP SEQUENCE IF EXISTS public.vehicle_types_id_seq;
DROP TABLE IF EXISTS public.vehicle_types;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.user_locations_id_seq;
DROP TABLE IF EXISTS public.user_locations;
DROP SEQUENCE IF EXISTS public.user_coupons_id_seq;
DROP TABLE IF EXISTS public.user_coupons;
DROP SEQUENCE IF EXISTS public.site_settings_id_seq;
DROP TABLE IF EXISTS public.site_settings;
DROP SEQUENCE IF EXISTS public.shop_products_id_seq;
DROP TABLE IF EXISTS public.shop_products;
DROP TABLE IF EXISTS public.sessions;
DROP SEQUENCE IF EXISTS public.saved_travel_plans_id_seq;
DROP TABLE IF EXISTS public.saved_travel_plans;
DROP SEQUENCE IF EXISTS public.real_estate_listings_id_seq;
DROP TABLE IF EXISTS public.real_estate_listings;
DROP TABLE IF EXISTS public.real_estate_categories;
DROP SEQUENCE IF EXISTS public.quotes_id_seq;
DROP TABLE IF EXISTS public.quotes;
DROP SEQUENCE IF EXISTS public.quote_categories_id_seq;
DROP TABLE IF EXISTS public.quote_categories;
DROP SEQUENCE IF EXISTS public.push_subscriptions_id_seq;
DROP TABLE IF EXISTS public.push_subscriptions;
DROP SEQUENCE IF EXISTS public.posts_id_seq;
DROP TABLE IF EXISTS public.posts;
DROP SEQUENCE IF EXISTS public.places_id_seq;
DROP TABLE IF EXISTS public.places;
DROP TABLE IF EXISTS public.place_categories;
DROP SEQUENCE IF EXISTS public.messages_id_seq;
DROP TABLE IF EXISTS public.messages;
DROP SEQUENCE IF EXISTS public.instagram_synced_posts_id_seq;
DROP TABLE IF EXISTS public.instagram_synced_posts;
DROP SEQUENCE IF EXISTS public.expenses_id_seq;
DROP TABLE IF EXISTS public.expenses;
DROP SEQUENCE IF EXISTS public.expense_groups_id_seq;
DROP TABLE IF EXISTS public.expense_groups;
DROP SEQUENCE IF EXISTS public.eco_profiles_id_seq;
DROP TABLE IF EXISTS public.eco_profiles;
DROP SEQUENCE IF EXISTS public.eco_date_unavailability_id_seq;
DROP TABLE IF EXISTS public.eco_date_unavailability;
DROP SEQUENCE IF EXISTS public.customer_chat_rooms_id_seq;
DROP TABLE IF EXISTS public.customer_chat_rooms;
DROP SEQUENCE IF EXISTS public.customer_chat_messages_id_seq;
DROP TABLE IF EXISTS public.customer_chat_messages;
DROP SEQUENCE IF EXISTS public.coupons_id_seq;
DROP TABLE IF EXISTS public.coupons;
DROP SEQUENCE IF EXISTS public.conversations_id_seq;
DROP TABLE IF EXISTS public.conversations;
DROP SEQUENCE IF EXISTS public.comments_id_seq;
DROP TABLE IF EXISTS public.comments;
DROP SEQUENCE IF EXISTS public.announcements_id_seq;
DROP TABLE IF EXISTS public.announcements;
DROP SEQUENCE IF EXISTS public.admin_notifications_id_seq;
DROP TABLE IF EXISTS public.admin_notifications;
DROP SEQUENCE IF EXISTS public.admin_messages_id_seq;
DROP TABLE IF EXISTS public.admin_messages;
DROP SEQUENCE IF EXISTS _system.replit_database_migrations_v1_id_seq;
DROP TABLE IF EXISTS _system.replit_database_migrations_v1;
DROP SCHEMA IF EXISTS _system;
--
-- Name: _system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _system;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: replit_database_migrations_v1; Type: TABLE; Schema: _system; Owner: -
--

CREATE TABLE _system.replit_database_migrations_v1 (
    id bigint NOT NULL,
    build_id text NOT NULL,
    deployment_id text NOT NULL,
    statement_count bigint NOT NULL,
    applied_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE; Schema: _system; Owner: -
--

CREATE SEQUENCE _system.replit_database_migrations_v1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: _system; Owner: -
--

ALTER SEQUENCE _system.replit_database_migrations_v1_id_seq OWNED BY _system.replit_database_migrations_v1.id;


--
-- Name: admin_messages; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: admin_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_messages_id_seq OWNED BY public.admin_messages.id;


--
-- Name: admin_notifications; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: admin_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_notifications_id_seq OWNED BY public.admin_notifications.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    author_name text NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    title text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -
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
    service_description text,
    code text,
    category text DEFAULT 'all'::text,
    max_uses integer,
    current_uses integer DEFAULT 0
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: customer_chat_messages; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: customer_chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_chat_messages_id_seq OWNED BY public.customer_chat_messages.id;


--
-- Name: customer_chat_rooms; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: customer_chat_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_chat_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_chat_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_chat_rooms_id_seq OWNED BY public.customer_chat_rooms.id;


--
-- Name: eco_date_unavailability; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eco_date_unavailability (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    date text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: eco_date_unavailability_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eco_date_unavailability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eco_date_unavailability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eco_date_unavailability_id_seq OWNED BY public.eco_date_unavailability.id;


--
-- Name: eco_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eco_profiles (
    id integer NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    image_url text DEFAULT ''::text NOT NULL,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: eco_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eco_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eco_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eco_profiles_id_seq OWNED BY public.eco_profiles.id;


--
-- Name: expense_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_groups (
    id integer NOT NULL,
    name text NOT NULL,
    participants jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    user_id text NOT NULL,
    budget integer DEFAULT 0
);


--
-- Name: expense_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expense_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: expense_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expense_groups_id_seq OWNED BY public.expense_groups.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: instagram_synced_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instagram_synced_posts (
    id integer NOT NULL,
    instagram_id text NOT NULL,
    post_id integer NOT NULL,
    synced_at timestamp without time zone DEFAULT now()
);


--
-- Name: instagram_synced_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.instagram_synced_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: instagram_synced_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.instagram_synced_posts_id_seq OWNED BY public.instagram_synced_posts.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    role text NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: place_categories; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: places; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: push_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.push_subscriptions (
    id integer NOT NULL,
    endpoint text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    user_id text NOT NULL,
    p256dh text NOT NULL,
    auth text NOT NULL
);


--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.push_subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.push_subscriptions_id_seq OWNED BY public.push_subscriptions.id;


--
-- Name: quote_categories; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: quote_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quote_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quote_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quote_categories_id_seq OWNED BY public.quote_categories.id;


--
-- Name: quotes; Type: TABLE; Schema: public; Owner: -
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
    user_memo text DEFAULT ''::text,
    assigned_users jsonb DEFAULT '[]'::jsonb,
    people_count integer DEFAULT 1,
    eco_confirmed boolean DEFAULT false,
    completed boolean DEFAULT false,
    completed_at timestamp without time zone,
    eco_confirmed_picks jsonb DEFAULT '{}'::jsonb,
    eco_unavailable_profiles jsonb DEFAULT '[]'::jsonb,
    vehicle_images jsonb DEFAULT '[]'::jsonb
);


--
-- Name: quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quotes_id_seq OWNED BY public.quotes.id;


--
-- Name: real_estate_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.real_estate_categories (
    id text NOT NULL,
    label_ko text NOT NULL,
    label_en text NOT NULL,
    label_zh text,
    label_vi text,
    label_ru text,
    label_ja text,
    color text DEFAULT '#64748b'::text,
    gradient text DEFAULT 'from-gray-600 to-gray-700'::text,
    icon text DEFAULT 'Building'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: real_estate_listings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.real_estate_listings (
    id integer NOT NULL,
    name text NOT NULL,
    category text DEFAULT 'apartment'::text NOT NULL,
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
    is_partner boolean DEFAULT false,
    discount_text text,
    menu_images jsonb DEFAULT '[]'::jsonb,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    website_label text
);


--
-- Name: real_estate_listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.real_estate_listings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: real_estate_listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.real_estate_listings_id_seq OWNED BY public.real_estate_listings.id;


--
-- Name: saved_travel_plans; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: saved_travel_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saved_travel_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: saved_travel_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saved_travel_plans_id_seq OWNED BY public.saved_travel_plans.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    sid character varying NOT NULL,
    sess jsonb NOT NULL,
    expire timestamp without time zone NOT NULL
);


--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: shop_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shop_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shop_products_id_seq OWNED BY public.shop_products.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: user_coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_coupons (
    id integer NOT NULL,
    user_id text NOT NULL,
    coupon_id integer NOT NULL,
    is_used boolean DEFAULT false,
    used_at timestamp without time zone,
    issued_at timestamp without time zone DEFAULT now()
);


--
-- Name: user_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_coupons_id_seq OWNED BY public.user_coupons.id;


--
-- Name: user_locations; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: user_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_locations_id_seq OWNED BY public.user_locations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: vehicle_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vehicle_types (
    id integer NOT NULL,
    key text DEFAULT ''::text NOT NULL,
    name_ko text DEFAULT ''::text NOT NULL,
    name_en text DEFAULT ''::text NOT NULL,
    description_ko text DEFAULT ''::text NOT NULL,
    description_en text DEFAULT ''::text NOT NULL,
    city_price integer DEFAULT 0 NOT NULL,
    oneway_price integer DEFAULT 0 NOT NULL,
    hocham_oneway_price integer DEFAULT 0 NOT NULL,
    phanthiet_oneway_price integer DEFAULT 0 NOT NULL,
    roundtrip_price integer DEFAULT 0 NOT NULL,
    city_pickup_drop_price integer DEFAULT 0 NOT NULL,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    city_label text DEFAULT '붕따우 시내'::text,
    oneway_label text DEFAULT '호치민 ↔ 붕따우 (편도)'::text,
    hocham_oneway_label text DEFAULT '호치민 ↔ 호짬 (편도)'::text,
    phanthiet_oneway_label text DEFAULT '호치민 ↔ 판티엣 (편도)'::text,
    roundtrip_label text DEFAULT '호치민 ↔ 붕따우 (왕복)'::text,
    city_pickup_drop_label text DEFAULT '호치민 ↔ 붕따우(픽드랍+시내)'::text,
    custom_routes jsonb DEFAULT '[]'::jsonb,
    images jsonb DEFAULT '[]'::jsonb
);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vehicle_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vehicle_types_id_seq OWNED BY public.vehicle_types.id;


--
-- Name: villas; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: villas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.villas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: villas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.villas_id_seq OWNED BY public.villas.id;


--
-- Name: visitor_count; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visitor_count (
    id integer NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    last_reset_date text,
    total_count integer DEFAULT 15000 NOT NULL,
    real_count integer DEFAULT 0 NOT NULL,
    real_total_count integer DEFAULT 0 NOT NULL
);


--
-- Name: visitor_count_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visitor_count_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visitor_count_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visitor_count_id_seq OWNED BY public.visitor_count.id;


--
-- Name: replit_database_migrations_v1 id; Type: DEFAULT; Schema: _system; Owner: -
--

ALTER TABLE ONLY _system.replit_database_migrations_v1 ALTER COLUMN id SET DEFAULT nextval('_system.replit_database_migrations_v1_id_seq'::regclass);


--
-- Name: admin_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_messages ALTER COLUMN id SET DEFAULT nextval('public.admin_messages_id_seq'::regclass);


--
-- Name: admin_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_notifications ALTER COLUMN id SET DEFAULT nextval('public.admin_notifications_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: customer_chat_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_chat_messages ALTER COLUMN id SET DEFAULT nextval('public.customer_chat_messages_id_seq'::regclass);


--
-- Name: customer_chat_rooms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_chat_rooms ALTER COLUMN id SET DEFAULT nextval('public.customer_chat_rooms_id_seq'::regclass);


--
-- Name: eco_date_unavailability id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eco_date_unavailability ALTER COLUMN id SET DEFAULT nextval('public.eco_date_unavailability_id_seq'::regclass);


--
-- Name: eco_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eco_profiles ALTER COLUMN id SET DEFAULT nextval('public.eco_profiles_id_seq'::regclass);


--
-- Name: expense_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_groups ALTER COLUMN id SET DEFAULT nextval('public.expense_groups_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: instagram_synced_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instagram_synced_posts ALTER COLUMN id SET DEFAULT nextval('public.instagram_synced_posts_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: push_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.push_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.push_subscriptions_id_seq'::regclass);


--
-- Name: quote_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_categories ALTER COLUMN id SET DEFAULT nextval('public.quote_categories_id_seq'::regclass);


--
-- Name: quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes ALTER COLUMN id SET DEFAULT nextval('public.quotes_id_seq'::regclass);


--
-- Name: real_estate_listings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.real_estate_listings ALTER COLUMN id SET DEFAULT nextval('public.real_estate_listings_id_seq'::regclass);


--
-- Name: saved_travel_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_travel_plans ALTER COLUMN id SET DEFAULT nextval('public.saved_travel_plans_id_seq'::regclass);


--
-- Name: shop_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_products ALTER COLUMN id SET DEFAULT nextval('public.shop_products_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: user_coupons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons ALTER COLUMN id SET DEFAULT nextval('public.user_coupons_id_seq'::regclass);


--
-- Name: user_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_locations ALTER COLUMN id SET DEFAULT nextval('public.user_locations_id_seq'::regclass);


--
-- Name: vehicle_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_types ALTER COLUMN id SET DEFAULT nextval('public.vehicle_types_id_seq'::regclass);


--
-- Name: villas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villas ALTER COLUMN id SET DEFAULT nextval('public.villas_id_seq'::regclass);


--
-- Name: visitor_count id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitor_count ALTER COLUMN id SET DEFAULT nextval('public.visitor_count_id_seq'::regclass);


--
-- Data for Name: replit_database_migrations_v1; Type: TABLE DATA; Schema: _system; Owner: -
--

COPY _system.replit_database_migrations_v1 (id, build_id, deployment_id, statement_count, applied_at) FROM stdin;
1	ce5775fb-4b07-4cd3-9fdb-b6461a188395	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-14 05:53:56.562878+00
2	c081533a-63b4-4274-b9b0-c55a1758950a	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-01-15 17:16:58.367466+00
3	73185f84-7053-419a-8731-69f697778136	eae69b35-87fe-4932-8267-1b1f80403786	14	2026-01-15 18:44:48.728512+00
4	d65a081d-5a0e-4411-ac1c-74e940673425	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-16 04:26:57.919377+00
5	bd3059bd-009e-46f9-b246-857655e6d7c4	eae69b35-87fe-4932-8267-1b1f80403786	3	2026-01-16 11:41:20.366201+00
6	0b8b3ad6-6022-4399-b794-41cc1e55fb3d	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-01-16 17:35:48.788305+00
7	33ec71b4-051d-4268-9835-a3bb4c2751f1	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-16 18:57:56.864306+00
8	9a01abc9-a01c-4d8b-850e-78580db71dab	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-16 19:50:28.249862+00
9	d640ce21-146e-47da-9497-1c850d2a8786	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-18 14:26:54.992802+00
10	fa80acac-bf68-48af-b2ec-85ef94033ca3	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-21 14:20:15.429303+00
11	94a199f4-60b9-4ccb-b270-8ecb06b4ffc7	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-22 10:22:33.51778+00
12	7342b907-fd56-4b7c-9829-df8a3ebde9ce	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-23 11:08:59.473186+00
13	73173ba6-81d5-4386-bda7-ec7b95ffd4c9	eae69b35-87fe-4932-8267-1b1f80403786	5	2026-01-26 20:17:51.663138+00
14	2886d88d-77d3-4e88-bcaf-7aa54eb9c139	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-26 20:49:34.902904+00
15	8aae4f09-dd69-4128-aef9-85c2675d245f	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-26 22:11:56.950911+00
16	ddab3faa-bb3d-4a15-a8bb-f1781de721cd	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-31 05:31:21.848196+00
17	45410f46-eb38-4e06-8582-ac7be558e17e	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-31 06:23:14.6365+00
18	8c7de530-29a2-43cb-953a-7287e282d6d3	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-31 08:49:56.667136+00
19	b049db08-59ed-4e18-b1f9-175d0241c4c6	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-01-31 17:21:26.742126+00
20	66608eb9-f7d0-48c5-8975-215967c0764e	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-01 05:04:57.035076+00
21	71ee4710-065c-4352-8040-6853826b5b28	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-01 05:14:57.600117+00
22	756bd7b8-dba3-4785-95b6-b248cba91e0c	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-02 07:32:36.172739+00
23	e087fe10-85bb-4ce2-9fb5-71e303f8e3dd	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-02 08:07:48.950583+00
24	36e91c4f-eb82-4c32-be8d-d505c853b9b2	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-03 02:58:02.52744+00
25	0ba760c7-eddd-401b-bf28-3d717456dbee	eae69b35-87fe-4932-8267-1b1f80403786	4	2026-02-03 10:40:39.744804+00
26	3bf9654c-d152-43b2-9008-7867a663787c	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-03 16:59:41.726047+00
27	96540f6d-eb46-411b-8574-ce2ef86bfabe	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-04 02:55:06.446565+00
28	5fd595f1-a16c-4138-b119-b1afb367bb20	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-04 03:27:58.164249+00
29	53fa85d9-71ac-4a0e-a07a-1decd726eee2	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-04 04:33:12.47706+00
30	ef19a772-c5e5-4d46-92c3-7b5ef5d767ea	eae69b35-87fe-4932-8267-1b1f80403786	3	2026-02-04 09:54:15.934474+00
31	4a890199-198e-4731-b7d0-56a16647ca90	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-04 11:28:11.277861+00
32	cdfc2972-5f89-4178-a72a-4e389752e71d	eae69b35-87fe-4932-8267-1b1f80403786	6	2026-02-04 11:47:40.80969+00
33	8414b0b4-cd60-4251-a5f0-2427eebc7442	eae69b35-87fe-4932-8267-1b1f80403786	3	2026-02-05 03:21:17.202507+00
34	1e6b2ebd-6cac-44db-81c4-637c94128ad3	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-05 03:50:57.560444+00
35	8b0894b9-715f-4016-baf8-ef97b9cd457d	eae69b35-87fe-4932-8267-1b1f80403786	3	2026-02-05 05:22:50.741614+00
36	7a106ce6-8e4f-4826-bc41-a8798b47db4f	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-06 09:18:12.883938+00
37	38de8158-85be-429e-b02b-30128bb8b5ce	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-08 05:45:25.430999+00
38	560f1fa8-c81f-4048-8cf2-db9f627454b5	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-08 13:24:45.180319+00
39	598e3020-514d-4bcc-98cb-cba00886e206	eae69b35-87fe-4932-8267-1b1f80403786	3	2026-02-08 19:43:29.247139+00
40	0b5228c9-5592-47ba-b8d5-fdcc3b7d8589	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-15 02:26:47.902891+00
41	f785ae09-5a7f-4e64-9175-5c2977c6dce8	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-16 14:23:06.142679+00
42	755fb812-41f8-40ad-8312-16cb1b0ec20e	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-16 17:10:17.909511+00
43	5ee79424-4b15-43c8-96af-7dee2469c079	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-17 05:51:24.696836+00
44	ae0f8bff-b08f-4792-8ce5-66def3a58373	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-17 15:47:24.522201+00
45	5e83e6c2-c60f-45f2-8837-0dd8b37478a1	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-23 06:16:25.69352+00
46	f1e867d6-adc2-4412-9a2f-085cd894965d	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-23 08:34:44.09599+00
47	eab66c44-3c36-4a14-832b-0596a94be096	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-24 02:57:52.513814+00
48	1b41d177-80e0-401c-a1ab-f2b4f97ae10a	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-24 03:11:40.785293+00
49	8bf89ffa-4d25-4493-a746-bff9bde22ba3	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-24 19:12:14.301912+00
50	b2c82478-59df-461c-bc52-ac73a6a43c17	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-02-26 06:37:00.199698+00
51	2aa62cd8-17b5-46aa-b075-2897aef0cc20	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-26 08:04:03.315762+00
52	608f41e2-7f0e-4b5c-9e21-87fc771fca53	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-27 09:00:41.096971+00
53	b163faf7-bd1d-46f0-852f-5ba7330d4839	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-27 12:55:14.78978+00
54	4d2103d5-db79-4790-93c5-240845327245	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-02-28 06:34:39.787503+00
55	38bcbd57-ce58-460d-a118-677113df044e	eae69b35-87fe-4932-8267-1b1f80403786	6	2026-03-05 05:39:23.747094+00
56	2351c061-402a-463e-b727-8acbf5274fec	eae69b35-87fe-4932-8267-1b1f80403786	1	2026-03-05 06:01:31.405207+00
57	a64abf53-f328-4fae-ade5-5949adb96147	eae69b35-87fe-4932-8267-1b1f80403786	10	2026-03-05 08:32:24.607584+00
58	6bc68f2e-adff-46c9-bfd5-8a7070c28723	eae69b35-87fe-4932-8267-1b1f80403786	2	2026-03-10 06:08:06.184062+00
\.


--
-- Data for Name: admin_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_messages (id, sender_id, receiver_id, title, content, is_read, created_at) FROM stdin;
1	kakao_4725775455	google:108651636810815709948	ㅇ	ㅇ	t	2026-02-04 02:30:36.933047
2	kakao_4725775455	ea020e75-810c-478d-8d6f-18a77590b677	ㄴㄴ	ㅇㅇ	t	2026-02-04 11:07:40.03831
3	kakao_4725775455	kakao_4725775455	ㄴ	ㅇ	t	2026-02-04 11:54:10.338322
4	kakao_4725775455	kakao_4725775455	ㅍㅅㅍ	ㄹ	t	2026-02-04 11:55:38.163161
5	kakao_4725775455	kakao_4725775455	ㅅㅁㅍㅁ	ㅅㅁㅊㅁ	t	2026-02-04 12:00:00.712552
\.


--
-- Data for Name: admin_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_notifications (id, type, user_id, user_email, user_nickname, message, is_read, created_at) FROM stdin;
1	login	ea020e75-810c-478d-8d6f-18a77590b677	d2271347@gmail.com	붕따우세이버	로그인: 붕따우세이버 (이메일)	t	2026-02-05 05:39:36.118393
2	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 05:40:00.056628
3	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 06:42:48.494547
4	login	ea020e75-810c-478d-8d6f-18a77590b677	d2271347@gmail.com	붕따우세이버	로그인: 붕따우세이버 (이메일)	t	2026-02-05 06:43:36.647826
5	login	ea020e75-810c-478d-8d6f-18a77590b677	d2271347@gmail.com	붕따우세이버	로그인: 붕따우세이버 (이메일)	t	2026-02-05 06:53:32.028398
6	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 06:53:59.690159
7	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 06:54:16.567412
8	login	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 06:55:17.399038
9	login	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 06:59:50.316054
10	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:00:58.275849
11	new_member	69928be4-b307-4263-9e13-dcc7492a2f3a	d2271347@gmail.com	세이버	새 회원 가입: 세이버 (이메일)	t	2026-02-05 07:02:49.969568
12	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:04:07.012159
13	new_member	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	새 회원 가입: d2271347 (이메일)	t	2026-02-05 07:11:18.39297
14	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:11:45.918398
15	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:12:09.516819
16	new_member	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	새 회원 가입: 카카오 사용자 (카카오)	t	2026-02-05 07:13:07.605876
17	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:16:14.504376
18	new_member	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	새 회원 가입: 카카오 사용자 (카카오)	t	2026-02-05 07:19:58.502746
19	login	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:23:49.494549
20	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:25:26.208516
21	new_member	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	새 회원 가입: 카카오 사용자 (카카오)	t	2026-02-05 07:27:00.313583
22	login	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:28:07.349045
23	login	kakao_4734761654	vietnamdiet0486@gmail.com	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:28:21.127187
24	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-05 07:29:05.546233
25	new_member	kakao_4735869916	nguyenngoctuyet1004@gmail.com	카카오 사용자	새 회원 가입: 카카오 사용자 (카카오)	t	2026-02-05 14:38:05.801253
26	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-06 09:05:12.924394
27	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-06 09:27:45.710357
28	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-07 01:20:50.92539
29	new_member	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01@gmail.com	soulcounter01	새 회원 가입: soulcounter01 (이메일)	t	2026-02-07 06:59:50.447169
30	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-07 07:00:35.304402
31	login	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01@gmail.com	soulcounter01	로그인: soulcounter01 (이메일)	t	2026-02-07 07:01:41.570527
32	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-07 07:07:57.241489
33	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-07 10:11:41.905933
34	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 08:22:48.92313
35	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 15:59:05.763124
36	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 16:24:48.744148
37	login	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01@gmail.com	soulcounter01	로그인: soulcounter01 (이메일)	t	2026-02-08 19:46:01.540482
38	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 20:19:12.765864
39	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 20:27:27.516112
40	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 20:35:47.039636
41	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 20:55:16.910955
42	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 21:03:08.787741
43	login	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01@gmail.com	soulcounter01	로그인: soulcounter01 (이메일)	t	2026-02-08 21:07:57.497036
44	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 21:14:44.426945
45	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 21:42:16.385946
46	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 21:47:04.732599
47	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 22:21:13.252783
48	login	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01@gmail.com	soulcounter01	로그인: soulcounter01 (이메일)	t	2026-02-08 22:21:53.122092
49	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 22:28:02.258136
50	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-08 22:30:59.551814
51	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-08 22:37:13.58079
52	new_member	kakao_4741495121	oekcj55@naver.com	카카오 사용자	새 회원 가입: 카카오 사용자 (카카오)	t	2026-02-09 03:48:41.440881
53	login	kakao_4725775455	vungtau1004@daum.net	카카오 사용자	로그인: 카카오 사용자 (카카오)	t	2026-02-09 07:13:05.737441
54	login	kakao_4734761654	vietnamdiet0486@gmail.com	홍바라기	로그인: 홍바라기 (카카오)	t	2026-02-09 07:36:21.849924
55	login	kakao_4734761654	vietnamdiet0486@gmail.com	홍바라기	로그인: 홍바라기 (카카오)	t	2026-02-09 07:38:13.857199
56	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-09 14:45:09.940623
57	new_member	kakao_4745081898	kyuphil9873@hanmail.net	정규필	새 회원 가입: 정규필 (카카오)	t	2026-02-11 04:47:22.786504
58	login	kakao_4745081898	kyuphil9873@hanmail.net	정규필	로그인: 정규필 (카카오)	t	2026-02-11 04:47:30.981938
59	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-11 11:00:02.37988
60	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-16 15:09:22.797117
61	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-16 16:12:07.836419
62	new_member	a0ba1066-13dd-458a-9bff-d533eb8ddd73	soulcounter02@gmail.com	soulcounter02	새 회원 가입: soulcounter02 (이메일)	t	2026-02-16 19:25:37.698525
63	login	a0ba1066-13dd-458a-9bff-d533eb8ddd73	soulcounter02@gmail.com	soulcounter02	로그인: soulcounter02 (이메일)	t	2026-02-16 19:27:49.73731
64	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-16 19:28:34.070401
65	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-16 19:39:20.890109
66	new_member	kakao_4731861003	soulcounter01@gmail.com	붕따우 도깨비	새 회원 가입: 붕따우 도깨비 (카카오)	t	2026-02-17 02:24:28.343142
67	login	kakao_4731861003	soulcounter01@gmail.com	붕따우 도깨비	로그인: 붕따우 도깨비 (카카오)	t	2026-02-17 05:29:11.666939
68	login	kakao_4731861003	soulcounter01@gmail.com	붕따우 도깨비	로그인: 붕따우 도깨비 (카카오)	t	2026-02-17 05:29:59.205304
69	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-18 09:27:35.396959
70	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-18 11:27:55.435794
71	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-18 16:27:40.182648
72	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:13:03.621173
73	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:13:26.818194
74	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:13:44.936343
75	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:13:45.724643
76	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:14:25.358178
77	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:15:20.807839
78	new_member	google:108455658112888249075	soulcounter486@gmail.com	trade	새 회원 가입: trade (구글)	t	2026-02-19 01:15:26.009297
79	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:15:51.754807
80	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:17:10.136496
81	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:17:12.028397
82	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:18:50.886087
83	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:20:00.361457
84	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:23:16.493566
85	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 01:38:20.89122
86	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-19 16:45:07.804558
87	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-20 02:10:56.203426
88	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-20 02:50:21.972347
89	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-20 04:01:38.139181
90	new_member	kakao_4763895380	jace00@naver.com	Joo	새 회원 가입: Joo (카카오)	t	2026-02-23 05:59:01.217223
91	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-23 06:20:34.626713
92	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-02-23 08:20:58.29716
93	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-23 09:00:39.474987
94	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-02-23 09:11:55.727512
95	login	kakao_4735869916	nguyenngoctuyet1004@gmail.com	Snow99	로그인: Snow99 (카카오)	t	2026-02-26 18:10:10.443831
96	new_member	kakao_4772362496	hny104@hanmail.net	케이밥&케이투어	새 회원 가입: 케이밥&케이투어 (카카오)	t	2026-02-28 06:32:30.886039
97	login	kakao_4772362496	hny104@hanmail.net	케이밥&케이투어	로그인: 케이밥&케이투어 (카카오)	t	2026-02-28 06:32:32.303279
98	new_member	kakao_4773928854	lswlsw73@gmail.com	이상우	새 회원 가입: 이상우 (카카오)	t	2026-03-01 05:29:22.580216
99	login	kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)	로그인: 도깨비(SaoViet) (카카오)	t	2026-03-03 04:55:52.758543
100	login	kakao_4763895380	jace00@naver.com	Joo	로그인: Joo (카카오)	t	2026-03-03 11:37:20.702998
101	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-03-03 11:47:31.128389
102	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-03-03 11:51:30.80934
103	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-03-03 11:53:15.92801
104	login	kakao_4731861003	soulcounter01@gmail.com	붕따우 도깨비	로그인: 붕따우 도깨비 (카카오)	t	2026-03-04 02:58:22.550799
105	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	t	2026-03-05 06:31:05.102554
106	new_member	google:105130107752673204690	hotramtour@gmail.com	Na	새 회원 가입: Na (구글)	t	2026-03-05 06:52:14.136356
107	new_member	570f6a44-c03d-4be3-8be5-24204b00e19e	kfckim@korea.com	붕따우4인방	새 회원 가입: 붕따우4인방 (이메일)	t	2026-03-09 06:06:50.817546
108	login	570f6a44-c03d-4be3-8be5-24204b00e19e	kfckim@korea.com	붕따우4인방	로그인: 붕따우4인방 (이메일)	t	2026-03-09 06:12:10.310414
109	new_member	kakao_4789723415	jihye3836@nate.com	임쥐☆	새 회원 가입: 임쥐☆ (카카오)	f	2026-03-10 10:02:23.393673
110	new_member	f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	jihye3836@naver.com	임지혜	새 회원 가입: 임지혜 (이메일)	f	2026-03-10 10:04:06.420438
111	login	f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	jihye3836@naver.com	임지혜	로그인: 임지혜 (이메일)	f	2026-03-10 10:05:12.734563
112	login	kakao_4735869916	nguyenngoctuyet1004@gmail.com	Snow99	로그인: Snow99 (카카오)	f	2026-03-10 10:11:50.14793
113	login	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	d2271347	로그인: d2271347 (이메일)	f	2026-03-10 10:31:57.696327
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, title, content, image_url, link_url, type, is_active, sort_order, start_date, end_date, created_at, updated_at) FROM stdin;
2	카톡로그인 시 더 많은 혜택!!!	카톡 로그인 시 더 다양혜택을 접할 수 있어요~^^			notice	t	0	\N	\N	2026-02-05 06:31:47.102743	2026-02-05 06:37:55.96
1	첫 로그인 시 돌판삼겹살 IANBBQ 10% 할인권	로그인 하시면 돌판삼겹살 IANBBQ 10% 할인권 드려요.			notice	t	1	\N	\N	2026-02-04 11:16:56.645603	2026-02-05 06:37:56.006
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, post_id, author_name, content, created_at) FROM stdin;
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conversations (id, title, created_at) FROM stdin;
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coupons (id, name, description, discount_type, discount_value, valid_from, valid_until, is_active, created_at, place_id, is_welcome_coupon, service_description, code, category, max_uses, current_uses) FROM stdin;
6	Ianbbq 돌판삼겹살 할인쿠폰		percent	10	2026-02-05 00:00:00	2026-06-30 00:00:00	t	2026-02-04 11:32:07.173074	52	t	\N	\N	all	\N	0
5	Ianbbq 돌판삼겹살  할인쿠폰		percent	10	2026-02-05 00:00:00	2026-06-30 00:00:00	t	2026-02-04 11:10:13.528009	52	f	\N	\N	all	\N	0
7	그랜드 마사지		service	0	2026-02-08 00:00:00	2026-06-30 00:00:00	t	2026-02-08 13:17:28.760454	5	t	사우나 무료	\N	all	\N	0
8	Bi Roen salon 이발소 할인쿠폰	518 Thống Nhất Mới, Phường 8, Vũng Tàu	percent	5	\N	2026-06-30 00:00:00	t	2026-02-11 05:30:22.459188	1	f		\N	all	\N	0
9	Bi Roen 이발소 할인쿠폰	209 Hoàng Hoa Thám, Phường 2, Vũng Tàu, Thành phố Hồ Chí Minh	percent	5	\N	2026-06-30 00:00:00	t	2026-02-11 06:00:17.658478	81	f		\N	all	\N	0
11	Day Spa 할인쿠폰		percent	5	\N	2026-06-30 00:00:00	t	2026-02-11 06:06:59.163158	7	f		\N	all	\N	0
10	Re.en 마사지 할인쿠폰		percent	5	2026-02-11 00:00:00	2026-06-30 00:00:00	t	2026-02-11 06:05:51.391751	4	f		\N	all	\N	0
12	IAN BBQ		service	10	\N	2026-06-30 00:00:00	t	2026-02-14 12:48:05.26015	52	f	라면 무료	\N	all	\N	0
\.


--
-- Data for Name: customer_chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_chat_messages (id, room_id, sender_id, sender_role, sender_name, message, created_at) FROM stdin;
1	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	cfhj	2026-02-08 19:46:10.615287
2	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅌㄴㄴㄴ	2026-02-08 19:59:02.280861
3	2	kakao_4725775455	admin	관리자	네	2026-02-08 20:20:27.962464
4	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇㅇ	2026-02-08 20:28:04.279484
5	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇ	2026-02-08 20:36:20.358181
6	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇ	2026-02-08 20:55:58.21768
7	2	kakao_4725775455	admin	관리자	gg	2026-02-08 21:03:16.967514
8	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇ	2026-02-08 21:03:39.375045
9	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅊㄹㅅㅍㅅ	2026-02-08 21:04:05.059575
10	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅊㅅㅍ	2026-02-08 21:05:47.820153
11	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅍ?ㅊㅇㄱ	2026-02-08 21:05:55.385539
12	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇㅇㅇㅇ	2026-02-08 21:08:24.37213
13	2	kakao_4725775455	admin	관리자	ㅇㄹㅅㄹ	2026-02-08 21:08:41.542605
14	2	kakao_4725775455	admin	관리자	ㅇㅅㅊㄹ	2026-02-08 21:09:08.02599
15	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇㅇ	2026-02-08 21:15:09.309146
16	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㄹㄹㄹ	2026-02-08 21:35:00.286387
17	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇㅇㅇ	2026-02-08 21:35:47.884767
18	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ㅇㅇㅇㅇㄴㄴㄴ	2026-02-08 21:36:38.824961
19	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	gghh	2026-02-08 21:47:48.252853
20	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	111	2026-02-08 21:54:52.405755
21	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	33	2026-02-08 22:03:15.283572
22	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	66	2026-02-08 22:12:20.164601
23	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	gg	2026-02-08 22:21:27.083659
24	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	ggh	2026-02-08 22:22:01.883388
25	2	4c21e5a7-2196-4650-9b31-304870f4f330	customer	soulcounter01	hjj	2026-02-08 22:28:34.667429
26	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅇㅇ	2026-02-08 22:31:12.721271
27	3	kakao_4725775455	admin	관리자	đ	2026-02-08 22:32:17.254246
28	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㄴㄴ	2026-02-08 22:37:25.861012
29	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅇㅇㅇㅇ	2026-02-08 22:45:28.385051
30	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅇㅇㅇㅇㅇ	2026-02-08 22:45:50.205508
31	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅇㅇㅇㅇ	2026-02-08 22:56:13.041932
32	4	kakao_4735869916	customer	카카오 사용자	Đ	2026-02-08 22:57:20.014683
33	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅃㅃㅃ	2026-02-08 22:58:38.678218
34	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㄲㄲㄲ	2026-02-08 23:01:41.726204
35	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㄷㄷㄷ	2026-02-08 23:04:01.837359
36	3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	customer	d2271347	ㅇㅇㅇ	2026-02-08 23:08:52.991375
\.


--
-- Data for Name: customer_chat_rooms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_chat_rooms (id, visitor_id, visitor_name, status, last_message, last_message_at, unread_by_admin, unread_by_visitor, created_at) FROM stdin;
1	kakao_4725775455	붕따우 도깨비	open	\N	\N	0	0	2026-02-08 19:44:35.730813
3	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347	open	ㅇㅇㅇ	2026-02-08 23:08:53.026	0	0	2026-02-08 22:31:08.810691
2	4c21e5a7-2196-4650-9b31-304870f4f330	soulcounter01	open	hjj	2026-02-08 22:28:34.703	0	0	2026-02-08 19:46:07.345054
4	kakao_4735869916	카카오 사용자	open	Đ	2026-02-08 22:57:20.042	0	0	2026-02-08 22:57:09.174665
\.


--
-- Data for Name: eco_date_unavailability; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.eco_date_unavailability (id, profile_id, date, created_at) FROM stdin;
1	18	2026-02-28	2026-02-28 06:53:32.158702
2	19	2026-03-01	2026-02-28 06:54:49.851111
\.


--
-- Data for Name: eco_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.eco_profiles (id, name, image_url, is_active, sort_order, created_at) FROM stdin;
47		/api/public-images/place_1771257988615_nzl0r.jpg	t	41	2026-02-16 16:06:29.266681
78		/api/public-images/place_1771258028878_b0ibhc.jpg	t	77	2026-02-16 16:07:09.510701
67		/api/public-images/place_1771258013100_kizz5q.jpg	t	61	2026-02-16 16:06:53.652519
64		/api/public-images/place_1771258009302_ld5w27.jpg	t	67	2026-02-16 16:06:50.04993
70		/api/public-images/place_1771258017627_qsziij.jpg	t	39	2026-02-16 16:06:58.342848
23		/api/public-images/place_1771257957344_fsae9b.jpg	t	7	2026-02-16 16:05:57.938051
76		/api/public-images/place_1771258025362_zg3l48.jpg	t	36	2026-02-16 16:07:06.036579
61		/api/public-images/place_1771258005739_7bj7d9.jpg	t	37	2026-02-16 16:06:46.312375
51		/api/public-images/place_1771257993362_d0u8ya.jpg	t	53	2026-02-16 16:06:33.965935
60		/api/public-images/place_1771258004446_zq5ern.jpg	t	58	2026-02-16 16:06:45.142047
29		/api/public-images/place_1771257966514_h1khme.jpg	t	0	2026-02-16 16:06:07.172782
48		/api/public-images/place_1771257989899_53s6b.jpg	t	42	2026-02-16 16:06:30.479351
56		/api/public-images/place_1771257999359_p7nbw6.jpg	t	57	2026-02-16 16:06:40.016833
37		/api/public-images/place_1771257976638_68a21i.jpg	t	26	2026-02-16 16:06:17.286643
98		/api/public-images/place_1771258053933_93f9a.jpg	t	94	2026-02-16 16:07:34.591124
24		/api/public-images/place_1771257958782_9ilc7b.jpg	t	8	2026-02-16 16:05:59.356555
41		/api/public-images/place_1771257981354_n3vasv.jpg	t	29	2026-02-16 16:06:21.913785
92		/api/public-images/place_1771258046616_4cxl6n.jpg	t	89	2026-02-16 16:07:27.196542
46		/api/public-images/place_1771257987311_77wa1r.jpg	t	35	2026-02-16 16:06:27.948342
43		/api/public-images/place_1771257983705_bdrg8a.jpg	t	21	2026-02-16 16:06:24.350255
32		/api/public-images/place_1771257970619_uxnd5p.jpg	t	14	2026-02-16 16:06:11.223488
79		/api/public-images/place_1771258030095_oz6blw.jpg	t	78	2026-02-16 16:07:10.731381
49		/api/public-images/place_1771257991033_ofejtl.jpg	t	43	2026-02-16 16:06:31.619373
34		/api/public-images/place_1771257973089_yub2qg.jpg	t	80	2026-02-16 16:06:13.714107
65		/api/public-images/place_1771258010666_xcb9na.jpg	t	68	2026-02-16 16:06:51.232063
87		/api/public-images/place_1771258040034_5buidl.jpg	t	85	2026-02-16 16:07:20.667571
93		/api/public-images/place_1771258047881_z1df7e.jpg	t	90	2026-02-16 16:07:28.574009
53		/api/public-images/place_1771257995912_4jwr4o.jpg	t	52	2026-02-16 16:06:36.63163
39		/api/public-images/place_1771257979054_x9jre.jpg	t	28	2026-02-16 16:06:19.635898
50		/api/public-images/place_1771257992199_iu9ule.jpg	t	44	2026-02-16 16:06:32.761105
33		/api/public-images/place_1771257971804_jl26ar.jpg	t	23	2026-02-16 16:06:12.467853
59		/api/public-images/place_1771258002849_3djoz.jpg	t	64	2026-02-16 16:06:43.424727
30		/api/public-images/place_1771257968132_xj4w9b.jpg	t	10	2026-02-16 16:06:08.730512
63		/api/public-images/place_1771258008143_ty179l.jpg	t	56	2026-02-16 16:06:48.708804
57		/api/public-images/place_1771258000593_mpki03.jpg	t	60	2026-02-16 16:06:41.15315
52		/api/public-images/place_1771257994588_aneipm.jpg	t	65	2026-02-16 16:06:35.211268
27		/api/public-images/place_1771257963775_hm0rzq.jpg	t	3	2026-02-16 16:06:04.385665
20		/api/public-images/place_1771257953594_lo2wx.jpg	t	2	2026-02-16 16:05:54.234894
40		/api/public-images/place_1771257980217_m96nzg.jpg	t	16	2026-02-16 16:06:20.781145
54		/api/public-images/place_1771257997251_t6sxic.jpg	t	54	2026-02-16 16:06:37.821769
80		/api/public-images/place_1771258031334_7vfyy.jpg	t	79	2026-02-16 16:07:11.888022
68		/api/public-images/place_1771258014225_zwvvwq.jpg	t	70	2026-02-16 16:06:54.797123
28		/api/public-images/place_1771257965103_7bqbo.jpg	t	13	2026-02-16 16:06:05.819691
22		/api/public-images/place_1771257956183_sep4y.jpg	t	6	2026-02-16 16:05:56.788276
90		/api/public-images/place_1771258043896_76t9rs.jpg	t	45	2026-02-16 16:07:24.557969
88		/api/public-images/place_1771258041312_27acev.jpg	t	86	2026-02-16 16:07:22.007236
77		/api/public-images/place_1771258027004_osudzc.jpg	t	17	2026-02-16 16:07:07.675149
36		/api/public-images/place_1771257975462_2takg.jpg	t	25	2026-02-16 16:06:16.061686
73		/api/public-images/place_1771258021381_ykpkno.jpg	t	75	2026-02-16 16:07:02.03357
45		/api/public-images/place_1771257986102_4brt0j.jpg	t	12	2026-02-16 16:06:26.702416
26		/api/public-images/place_1771257962608_25yi9q.jpg	t	9	2026-02-16 16:06:03.252898
31		/api/public-images/place_1771257969311_o1r1ba.jpg	t	11	2026-02-16 16:06:09.914561
84		/api/public-images/place_1771258036315_ki82pr.jpg	t	82	2026-02-16 16:07:16.983728
62		/api/public-images/place_1771258007005_6tgo9v.jpg	t	66	2026-02-16 16:06:47.6019
74		/api/public-images/place_1771258022614_0vkceo.jpg	t	76	2026-02-16 16:07:03.262
71		/api/public-images/place_1771258018993_tnreei.jpg	t	62	2026-02-16 16:06:59.560163
58		/api/public-images/place_1771258001711_45x3zt.jpg	t	63	2026-02-16 16:06:42.2764
72		/api/public-images/place_1771258020137_kk4y0d.jpg	t	74	2026-02-16 16:07:00.807142
83		/api/public-images/place_1771258034986_vxu25.jpg	t	71	2026-02-16 16:07:15.552961
55		/api/public-images/place_1771257998250_fjxjieg.jpg	t	72	2026-02-16 16:06:38.832325
85		/api/public-images/place_1771258037530_kru8nb6.jpg	t	83	2026-02-16 16:07:18.112831
86		/api/public-images/place_1771258038793_j0phr1.jpg	t	84	2026-02-16 16:07:19.443048
75		/api/public-images/place_1771258023994_l3240g.jpg	t	22	2026-02-16 16:07:04.603544
35		/api/public-images/place_1771257974333_2p57ks.jpg	t	24	2026-02-16 16:06:14.893325
89		/api/public-images/place_1771258042563_dvfsa.jpg	t	87	2026-02-16 16:07:23.228604
91		/api/public-images/place_1771258045242_gmiydq.jpg	t	88	2026-02-16 16:07:25.908913
95		/api/public-images/place_1771258050339_ntqkuc.jpg	t	92	2026-02-16 16:07:31.004706
38		/api/public-images/place_1771257977915_z56b7i.jpg	t	27	2026-02-16 16:06:18.492143
42		/api/public-images/place_1771257982525_w0z22q.jpg	t	30	2026-02-16 16:06:23.134469
97		/api/public-images/place_1771258052725_9hiofq.jpg	t	93	2026-02-16 16:07:33.365513
82		/api/public-images/place_1771258033737_oj3d5.jpg	t	122	2026-02-16 16:07:14.323331
96		/api/public-images/place_1771258051657_75o6ap.jpg	t	127	2026-02-16 16:07:32.22933
21		/api/public-images/place_1771257955067_zo71pl.jpg	t	5	2026-02-16 16:05:55.675298
103		/api/public-images/place_1771258061735_9a6tt.jpg	t	99	2026-02-16 16:07:42.288684
145		/api/public-images/place_1772182714566_csjzk.jpg	t	47	2026-02-27 08:58:35.42774
128		/api/public-images/place_1771258093174_o1wf3.jpg	t	114	2026-02-16 16:08:13.727717
106		/api/public-images/place_1771258065296_k6qza4.jpg	t	100	2026-02-16 16:07:45.8702
129		/api/public-images/place_1771258094293_1gs89.jpg	t	115	2026-02-16 16:08:14.941302
144		/api/public-images/place_1772182693933_0vx29.jpg	t	1	2026-02-27 08:58:14.563755
115		/api/public-images/place_1771258076023_54a1w.jpg	t	48	2026-02-16 16:07:56.575693
151		/api/public-images/place_1772800014423_f19coe.jpg	t	49	2026-03-06 12:26:55.027058
137		/api/public-images/place_1771258103914_64cljl.jpg	t	50	2026-02-16 16:08:24.573145
19		/api/public-images/place_1771257950642_w7nx4w.jpg	t	4	2026-02-16 16:05:51.217054
107		/api/public-images/place_1771258066547_75n91r.jpg	t	101	2026-02-16 16:07:47.143468
108		/api/public-images/place_1771258067703_f4hgxs.jpg	t	102	2026-02-16 16:07:48.264745
131		/api/public-images/place_1771258096687_0be7yd.jpg	t	116	2026-02-16 16:08:17.262791
124		/api/public-images/place_1771258087279_uko9v.jpg	t	15	2026-02-16 16:08:07.835893
109		/api/public-images/place_1771258068859_eo4gr4.jpg	t	103	2026-02-16 16:07:49.426659
110		/api/public-images/place_1771258069993_51ggqq.jpg	t	104	2026-02-16 16:07:50.54609
111		/api/public-images/place_1771258071129_cf2we.jpg	t	105	2026-02-16 16:07:51.711542
132		/api/public-images/place_1771258097877_93sq03.jpg	t	117	2026-02-16 16:08:18.411935
112		/api/public-images/place_1771258072434_fr0jpk.jpg	t	18	2026-02-16 16:07:53.080373
119		/api/public-images/place_1771258080805_q5f2vh.jpg	t	19	2026-02-16 16:08:01.36362
18		/api/public-images/place_1771257948109_rsqbxr.jpg	t	20	2026-02-16 16:05:49.409733
134		/api/public-images/place_1771258100355_exubgo.jpg	t	118	2026-02-16 16:08:20.917543
136		/api/public-images/place_1771258102792_fz7h2l9.jpg	t	119	2026-02-16 16:08:23.349309
138		/api/public-images/place_1771258105067_eoa02.jpg	t	120	2026-02-16 16:08:25.622938
113		/api/public-images/place_1771258073653_f8tcq.jpg	t	106	2026-02-16 16:07:54.238239
120		/api/public-images/place_1771258082110_20g0wx.jpg	t	51	2026-02-16 16:08:02.756525
139		/api/public-images/place_1771258106203_xk8emr.jpg	t	121	2026-02-16 16:08:26.758535
123		/api/public-images/place_1771258085847_1odtc8.jpg	t	31	2026-02-16 16:08:06.543717
44		/api/public-images/place_1771257984925_l1qt5i.jpg	t	32	2026-02-16 16:06:25.499165
114		/api/public-images/place_1771258074840_h0jb1r.jpg	t	107	2026-02-16 16:07:55.468016
147		/api/public-images/place_1772214766937_y5oix2.jpg	t	33	2026-02-27 17:52:47.849391
133		/api/public-images/place_1771258099113_8yrdg.jpg	t	34	2026-02-16 16:08:19.75544
148		/api/public-images/place_1772554292099_d302w8.jpg	t	55	2026-03-03 16:11:32.813803
135		/api/public-images/place_1771258101623_i4bt7c.jpg	t	59	2026-02-16 16:08:22.217725
116		/api/public-images/place_1771258077221_8uaxm8.jpg	t	108	2026-02-16 16:07:57.788465
118		/api/public-images/place_1771258079618_ni919w.jpg	t	109	2026-02-16 16:08:00.188727
66		/api/public-images/place_1771258011826_8fcwhq.jpg	t	69	2026-02-16 16:06:52.512569
69		/api/public-images/place_1771258015506_mfcba.jpg	t	73	2026-02-16 16:06:56.085692
141		/api/public-images/place_1771258108647_0yt3i.jpg	t	110	2026-02-16 16:08:29.198668
142		/api/public-images/place_1771258109947_21gywd.jpg	t	123	2026-02-16 16:08:30.506092
99		/api/public-images/place_1771258055162_60uqjv.jpg	t	124	2026-02-16 16:07:35.821039
140		/api/public-images/place_1771258107306_xddre.jpg	t	125	2026-02-16 16:08:27.952812
122		/api/public-images/place_1771258084602_pai83q.jpg	t	81	2026-02-16 16:08:05.153367
121		/api/public-images/place_1771258083378_k53uvl.jpg	t	111	2026-02-16 16:08:03.937354
94		/api/public-images/place_1771258049200_gpk9tu.jpg	t	91	2026-02-16 16:07:29.792981
100		/api/public-images/place_1771258056565_jke618.jpg	t	95	2026-02-16 16:07:37.148807
126		/api/public-images/place_1771258090763_2oj8ac.jpg	t	112	2026-02-16 16:08:11.357722
127		/api/public-images/place_1771258091932_lzl219.jpg	t	113	2026-02-16 16:08:12.590438
149		/api/public-images/place_1772800010290_hqp12p.jpg	t	126	2026-03-06 12:26:51.180209
101		/api/public-images/place_1771258057801_bz7v04.jpg	t	96	2026-02-16 16:07:39.962005
125		/api/public-images/place_1771258089555_d4p7k.jpg	t	128	2026-02-16 16:08:10.128531
143		/api/public-images/place_1771258111097_ns44t.jpg	t	38	2026-02-16 16:08:31.653736
130		/api/public-images/place_1771258095634_gcf6qs.jpg	t	40	2026-02-16 16:08:16.17502
104		/api/public-images/place_1771258062843_3p5iv9.jpg	t	129	2026-02-16 16:07:43.502423
117		/api/public-images/place_1771258078412_hgbra.jpg	t	97	2026-02-16 16:07:59.036384
150		/api/public-images/place_1772800012251_g6b1en.jpg	t	46	2026-03-06 12:26:53.118412
102		/api/public-images/place_1771258060516_eqcbhk.jpg	t	98	2026-02-16 16:07:41.07098
\.


--
-- Data for Name: expense_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_groups (id, name, participants, created_at, user_id, budget) FROM stdin;
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, group_id, description, amount, category, paid_by, split_among, date, created_at, memo) FROM stdin;
\.


--
-- Data for Name: instagram_synced_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.instagram_synced_posts (id, instagram_id, post_id, synced_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, conversation_id, role, content, created_at) FROM stdin;
\.


--
-- Data for Name: place_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.place_categories (id, label_ko, label_en, label_zh, label_vi, label_ru, label_ja, color, gradient, icon, sort_order, is_active, is_adult_only, created_at, updated_at) FROM stdin;
attraction	관광명소	Attractions	景点	Địa điểm du lịch	Достопримечательности	観光スポット	#3b82f6	from-blue-500 to-blue-700	Camera	0	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:05.866
services	마사지/이발소	Massage & Barber	按摩/理发	Massage/Cắt tóc	Массаж/Парикмахерская	マッサージ/理髪店	#0ea5e9	from-cyan-500 to-cyan-700	Scissors	1	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:05.91
golfjang	골프장	Golf Course	高尔夫球场	Sân golf	Гольф-поле	ゴルフ場	#0000ff	from-gray-600 to-gray-700	MapPin	2	t	f	2026-02-05 10:22:19.480773	2026-02-14 05:32:05.953
category_1770371971566	카지노	Casino	赌场	Sòng bạc	Казино	カジノ	#00b31e	from-gray-600 to-gray-700	MapPin	3	t	f	2026-02-06 09:59:35.916445	2026-02-14 05:32:05.997
cafe	커피숍	Coffee Shops	咖啡店	Quán cà phê	Кофейни	カフェ	#6366f1	from-indigo-500 to-indigo-700	Coffee	4	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.04
local_food	현지 음식점	Local Restaurants	当地餐厅	Nhà hàng địa phương	Местные рестораны	ローカルレストラン	#ef4444	from-red-500 to-red-700	Utensils	5	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.084
korean_food	한식	Korean Food	韩国料理	Món Hàn Quốc	Корейская еда	韓国料理	#f97316	from-orange-500 to-orange-700	Utensils	6	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.128
buffet	뷔페	Buffet	自助餐	Buffet	Буфет	ビュッフェ	#eab308	from-yellow-500 to-yellow-700	Utensils	7	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.171
chinese_food	중식	Chinese Food	中餐	Món Trung Quốc	Китайская еда	中華料理	#22c55e	from-green-500 to-green-700	Utensils	8	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.214
exchange	환전소	Currency Exchange	货币兑换	Đổi tiền	Обмен валюты	両替所	#64748b	from-gray-500 to-gray-700	DollarSign	9	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.257
nightlife	밤문화	Nightlife	夜生活	Cuộc sống về đêm	Ночная жизнь	ナイトライフ	#ec4899	from-pink-600 to-purple-700	Music	10	t	f	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.301
nightlife18	밤문화 18+	Nightlife 18+	夜生活 18+	Cuộc sống về đêm 18+	Ночная жизнь 18+	ナイトライフ 18+	#dc2626	from-red-600 to-pink-700	Music	11	t	t	2026-02-05 03:23:52.578019	2026-02-14 05:32:06.344
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.places (id, name, category, description, main_image, images, latitude, longitude, address, phone, website, opening_hours, price_range, tags, is_active, sort_order, created_at, updated_at, is_partner, discount_text, menu_images) FROM stdin;
24	붕따우 프론트 비치	attraction	도심에서 가까운 해변으로 일몰 감상에 최적. 저녁에는 해변 산책로가 활기차게 변합니다.	/assets/Vung-Tau-3_1768452191715-CradB0t0.jpg	["/assets/Vung-Tau-3_1768452191715-CradB0t0.jpg"]	10.342071	107.073666			https://maps.app.goo.gl/Uz5gy2Tsg3kQm4QCA			[]	t	60	2026-02-02 11:01:16.15274	2026-02-19 04:32:12.061	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
20	화이트 펠리스(띠우 별장)	attraction	1898년 프랑스 총독의 여름 별장으로 지어진 아름다운 백색 궁전. 열대 정원과 바다 전망이 인상적입니다.	/assets/154eaed7-b483-43eb-983f-b52566331719_(1)_1768452191696-Cr-GQrO5.jpeg	["/assets/154eaed7-b483-43eb-983f-b52566331719_(1)_1768452191696-Cr-GQrO5.jpeg"]	10.350726	107.068401			https://maps.app.goo.gl/LDkeQHy1Watfec51A			[]	t	40	2026-02-02 10:48:58.227101	2026-02-19 04:32:11.948	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
4	Re.en 마사지	services			[]	10.352801	107.087346			https://maps.app.goo.gl/zGjF1ZoN5TJY5jdu8			[]	t	40	2026-02-02 06:44:06.335331	2026-02-11 05:53:24.594	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	["/api/public-images/place_1770566551112_nfj9gn.jpg"]
7	DAY SPA	services			[]	10.349497	107.075023	63 Trần Hưng Đạo, Phường 1, Vũng Tàu		https://maps.app.goo.gl/JH3JEHhRRemgAm3VA			[]	t	50	2026-02-02 09:00:17.185202	2026-02-11 05:53:24.638	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
1	Bi Roen 현지 고급 이발소	services		/api/public-images/place_1770015493239_29hs4h.jpg	["/api/public-images/place_1770015493239_29hs4h.jpg", "/api/public-images/place_1770015494580_0kvc46.jpg", "/api/public-images/place_1770015495608_daft0j.jpg"]	10.358977	107.090855	518 Thống Nhất Mới, Phường 8, Vũng Tàu		https://maps.app.goo.gl/yCMh6jYoLXLq8fgn7			[]	t	20	2026-02-01 06:12:18.262012	2026-02-11 05:53:24.506	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	["/api/public-images/place_1770019746201_ntlhlb.jpg", "/api/public-images/place_1770019748310_ylmrf.jpg"]
21	놀이동산 Ho may park	attraction	케이블카로 올라가는 언덕 위 놀이공원. 워터파크, 동물원, 놀이기구를 즐길 수 있습니다.	/assets/%EB%B6%95%EB%94%B0%EC%9A%B0%ED%98%B8%EB%A9%94%EC%9D%B4%ED%8C%8C%ED%81%AC%EC%9E%85%EC%9E%A5%EA%B6%8C_1768452191701-DRCm6P3j.jpg	["/assets/%EB%B6%95%EB%94%B0%EC%9A%B0%ED%98%B8%EB%A9%94%EC%9D%B4%ED%8C%8C%ED%81%AC%EC%9E%85%EC%9E%A5%EA%B6%8C_1768452191701-DRCm6P3j.jpg"]	10.351082	107.066430			https://maps.app.goo.gl/vM6tXvAXi4tTNhUV6			[]	t	100	2026-02-02 10:59:44.239723	2026-02-19 04:33:17.722	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
2	금은방 환전소Tiệm Vàng Kim Hiền	exchange	12시부터 2시까지 점심시간	/api/public-images/place_1770024943299_6slbt.jpg	["/api/public-images/place_1770024943299_6slbt.jpg"]	10.348572	107.076896	63 Lý Thường Kiệt, Phường 1, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/pp62Bw8q6PCx7EQp9			[]	t	0	2026-02-02 06:26:07.751306	2026-02-13 02:16:20.451	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
13	이발소 Salon Kimha	services		/api/public-images/place_1770025010268_adbe.jpg	["/api/public-images/place_1770025010268_adbe.jpg"]	10.340434	107.077056	26 Đinh Tiên Hoàng, Phường 2, Vũng Tàu		https://maps.app.goo.gl/q2HpipbVVMpvMHYj7			[]	t	70	2026-02-02 09:36:43.584005	2026-02-11 05:53:24.727	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
9	김마싸 (MASSAGE 12C2)	services		/api/public-images/place_1770024409382_qdupa4j.jpg	["/api/public-images/place_1770024409382_qdupa4j.jpg", "/api/public-images/place_1770024410722_e2o53.jpg"]	10.340824	107.077428		0779 090 882	https://maps.app.goo.gl/WA7Wt63HWcsi5dVQA			[]	t	60	2026-02-02 09:26:02.749483	2026-02-11 05:53:24.682	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
17	세계무기박물관	attraction	전 세계의 다양한 무기와 갑옷을 전시하는 독특한 박물관. 역사적인 무기 컬렉션을 감상할 수 있습니다.	/assets/Screenshot_20260123_141912_Maps_1769152870673-RnP0oJKP.jpg	["/assets/Screenshot_20260123_141912_Maps_1769152870673-RnP0oJKP.jpg"]	10.351121	107.074798	98 Trần Hưng Đạo, Phường 1, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/k94uy7sPdR65fi23A			[]	t	50	2026-02-02 10:19:37.590666	2026-02-19 04:32:12.005	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
16	전쟁기념관	attraction	베트남 전쟁과 지역 역사를 보여주는 박물관. 전쟁 유물과 역사적 사진들이 전시되어 있습니다.	/assets/20230318%EF%BC%BF130556_1768452191689-C_MIrIvi.jpg	["/assets/20230318%EF%BC%BF130556_1768452191689-C_MIrIvi.jpg"]	10.350455	107.069673		0254 3852 421	https://maps.app.goo.gl/YiF3HpgZvXtKTfMCA			[]	t	30	2026-02-02 10:07:03.06217	2026-02-19 04:32:11.891	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
15	붕따우 등대	attraction	1910년 프랑스 식민지 시대에 건설된 역사적인 등대. 도시와 바다의 파노라마 전망을 제공합니다.	/assets/736414b25966415e9006dd674ec2aecf_1768452191679-CA6v-nbW.jpeg	["/assets/736414b25966415e9006dd674ec2aecf_1768452191679-CA6v-nbW.jpeg"]	10.334133	107.077672			https://maps.app.goo.gl/HMJbSLCR3bzZxsxy8			[]	t	20	2026-02-02 09:55:12.277904	2026-02-19 05:53:15.358	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
22	불교사찰	attraction	산 중턱에 위치한 고요한 불교 사찰. 명상과 평화로운 분위기를 경험할 수 있습니다.	/assets/static-images.vnncdn.net-vps_images_publish-000001-000003-2025_1768452191705-0WLfnP07.jpg	["/assets/static-images.vnncdn.net-vps_images_publish-000001-000003-2025_1768452191705-0WLfnP07.jpg"]	10.358083	107.071793			https://maps.app.goo.gl/THctAg3uEvx9q9ZLA			[]	t	110	2026-02-02 11:00:07.832623	2026-02-19 05:53:36.504	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
5	그랜드 마사지	services		/api/public-images/place_1770019930297_82up8h.jpg	["/api/public-images/place_1770019930297_82up8h.jpg", "/api/public-images/place_1770019931668_kvzbye.jpg", "/api/public-images/place_1770019932766_zkgsss.jpg", "/api/public-images/place_1770019934132_vif8jq.jpg"]	10.343932	107.075944			https://maps.app.goo.gl/4z3hEL8RF5acvtod7			[]	t	10	2026-02-02 08:09:36.289095	2026-02-11 05:53:24.46	t	붕따우 도깨비 카톡으로 예약 시 사우나 무료	["/api/public-images/place_1770019787350_913l2g.jpg"]
25	땀탕기념타워	attraction	베트남 해군의 역사적인 기념탑. 전쟁 영웅들을 기리는 곳으로 바다가 한눈에 보입니다.	/assets/2442f46d1c7d42b49c86ad80e4bec041_1768452191724-D2n9pV5c.jpeg	["/assets/2442f46d1c7d42b49c86ad80e4bec041_1768452191724-D2n9pV5c.jpeg"]	10.345267	107.097228			https://maps.app.goo.gl/HHr2NF7upTr7Djhy9			[]	t	90	2026-02-02 11:03:07.951987	2026-02-19 04:32:12.228	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
26	돼지언덕	attraction	돼지 모양을 닮은 언덕으로 포토존이 많습니다. 일몰 때 방문하면 아름다운 사진을 찍을 수 있습니다.	/assets/12-doi-con-heo-vung-tau_1768452191730-DJ87iHss.jpg	["/assets/12-doi-con-heo-vung-tau_1768452191730-DJ87iHss.jpg"]	10.327845	107.085673			https://maps.app.goo.gl/Y8nMHFU7xAdXH7e48			[]	t	120	2026-02-02 11:03:29.055922	2026-02-19 04:32:12.43	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
28	붕따우 해산물 시장	attraction	신선한 해산물을 저렴하게 구입할 수 있는 재래시장. 현지인들의 생활을 엿볼 수 있습니다.	/assets/cho-dem-vung-tau-2_1768452191738-Yz-iP6NJ.jpg	["/assets/cho-dem-vung-tau-2_1768452191738-Yz-iP6NJ.jpg"]	10.341439	107.076212			https://maps.app.goo.gl/BLVTP1tarzKrXZN28			[]	t	140	2026-02-02 11:33:32.879463	2026-02-19 04:32:12.545	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
23	붕따우 백비치	attraction	붕따우에서 가장 긴 해변. 수영과 해양 스포츠를 즐기기에 좋으며 해변가 레스토랑이 많습니다.	/assets/Things-to-do-in-Vung-Tau-2_1768452191711-C6JQ-saG.jpg	["/assets/Things-to-do-in-Vung-Tau-2_1768452191711-C6JQ-saG.jpg"]	10.342971	107.095844			https://maps.app.goo.gl/UCARs7msTkaUr2HW6			[]	t	70	2026-02-02 11:00:50.361815	2026-02-19 04:32:12.117	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
29	붕따우 시장	attraction	1985년부터 운영된 붕따우 중심부의 전통 시장. 현지 음식, 과일, 기념품을 구입할 수 있습니다.	/assets/c3d3213f-cho-vung-tau-2_1768452191743-ClnMzhcp.jpg	["/assets/c3d3213f-cho-vung-tau-2_1768452191743-ClnMzhcp.jpg"]	10.344948	107.085542			https://maps.app.goo.gl/1Zpepi95K4garY268			[]	t	150	2026-02-02 11:33:57.617507	2026-02-19 04:32:12.6	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
34	간하오 씨푸드2	local_food	바다가 보이는 고급 해산물 레스토랑. 일몰과 함께 신선한 해산물 요리를 즐길 수 있습니다.	/api/public-images/place_1770033811510_wpoevg.jpg	["/api/public-images/place_1770033811510_wpoevg.jpg"]	10.339330	107.071733	09 ha long Phường 2, Vũng Tàu, Bà Rịa - Vũng Tàu	0254 3550 909	https://maps.app.goo.gl/6WR9z79wLEFZjpJcA			[]	t	40	2026-02-02 12:01:35.380468	2026-02-06 10:16:41.93	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
31	꼬바붕따우 2호점 (반콧,반쎄오)	local_food	꼬바 2호점은 더 넓고 쾌적한 공간에서 동일한 맛을 즐길 수 있습니다. 단체 손님에게 추천.	/assets/Screenshot_20260122_000613_Maps_1769015581776-Bek8pBOO.jpg	["/assets/Screenshot_20260122_000613_Maps_1769015581776-Bek8pBOO.jpg"]	10.340505	107.078181			https://maps.app.goo.gl/ftQz4Z437ZJZn5g68			[]	t	20	2026-02-02 11:56:13.920297	2026-02-06 10:16:41.845	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
40	해산물 고급 식당 2호점	local_food	간하오 2호점은 현대적인 건물에서 대규모 연회와 행사에 적합한 해산물 전문점입니다.	/assets/Screenshot_20260122_000656_Maps_1769015581784-C_PFzq0t.jpg	[]	\N	\N			https://maps.app.goo.gl/JLXdK6XZC5SqHntC7	\N	\N	[]	f	120	2026-02-02 12:28:25.475744	2026-02-06 10:16:42.27	f	\N	[]
41	분짜 하노이	local_food	하노이 스타일 분짜 전문점. 숯불에 구운 돼지고기와 쌀국수, 신선한 채소가 어우러진 맛.	/assets/Screenshot_20260122_000727_Maps_1769015581794-Cvpxc2AT.jpg	["/assets/Screenshot_20260122_000727_Maps_1769015581794-Cvpxc2AT.jpg"]	10.347937	107.079063	32 Lê Lai, Phường 3, Vũng Tàu, Bà Rịa - Vũng Tàu 780000		https://maps.app.goo.gl/DbdLER7cjNZhcMJ19			[]	t	130	2026-02-02 12:33:46.477149	2026-02-06 10:16:42.313	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
32	간하오 1해산물 고급 식당	local_food	바다가 보이는 고급 해산물 레스토랑. 일몰과 함께 신선한 해산물 요리를 즐길 수 있습니다.	/assets/Screenshot_20260122_000631_Maps_1769015581781-EiLZFAaR.jpg	["/assets/Screenshot_20260122_000631_Maps_1769015581781-EiLZFAaR.jpg"]	10.362574	107.061254		0254 3550 909	https://maps.app.goo.gl/AVh5Qq9HMRNpbjzBA			[]	t	30	2026-02-02 11:56:30.709073	2026-02-06 10:16:41.887	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
33	Texas BBQ	local_food	정통 텍사스 스타일 바베큐 레스토랑. 훈연 고기와 시원한 맥주를 즐길 수 있는 분위기 좋은 곳. 영업시간 11AM-9PM.	/assets/Screenshot_20260121_234910_Maps_1769014231476-BfW4mbTX.jpg	["/assets/Screenshot_20260121_234910_Maps_1769014231476-BfW4mbTX.jpg"]	10.360340	107.091723			https://maps.app.goo.gl/nUQVw6bfdqiu8jMy7			[]	t	110	2026-02-02 11:58:17.232689	2026-02-06 10:16:42.228	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
43	해산물 야시장 로컬식당	local_food	야시장 분위기의 해산물 로컬 식당. 합리적인 가격에 신선한 해산물을 즐길 수 있습니다.	/assets/Screenshot_20260122_000711_Maps_1769015581789-Cdhi79fq.jpg	["/assets/Screenshot_20260122_000711_Maps_1769015581789-Cdhi79fq.jpg"]	10.347139	107.094755			https://maps.app.goo.gl/rWUGn1MYyzGH7Xg78			[]	t	50	2026-02-02 12:36:01.49314	2026-02-06 10:16:41.972	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
30	꼬바붕따우 1호점 (반콧,반쎄오)	local_food	붕따우에서 가장 유명한 반콧, 반쎄오 전문점. 현지인과 관광객 모두에게 사랑받는 맛집입니다.	/assets/Screenshot_20260122_000550_Maps_1769015581771-CgNj_fhW.jpg	["/assets/Screenshot_20260122_000550_Maps_1769015581771-CgNj_fhW.jpg"]	10.341469	107.078361		0254 3526 165	https://maps.app.goo.gl/LvFosNMLSi1LSRvz6			[]	t	10	2026-02-02 11:55:53.854813	2026-02-06 10:16:41.803	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
42	88 Food Garden (레스토랑)	local_food	세련된 인테리어의 대형 해산물 정원 레스토랑. 가족 모임이나 특별한 날에 적합합니다.	/assets/Screenshot_20260122_000755_Maps_1769015581799-DLjOvv4r.jpg	["/assets/Screenshot_20260122_000755_Maps_1769015581799-DLjOvv4r.jpg"]	10.335768	107.085991			https://maps.app.goo.gl/iwaEfxbuxutM9y2t9			[]	t	60	2026-02-02 12:34:18.634961	2026-02-06 10:16:42.015	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
53	가보정	korean_food		/api/public-images/place_1770046107292_k7m1x.jpg	["/api/public-images/place_1770046107292_k7m1x.jpg"]	10.374218	107.111077	B12-1/10 Khu Trung Tâm Chí Linh, Phường Nguyễn An Ninh		https://maps.app.goo.gl/Mr1MXkLFMA5xfBjB6			[]	t	50	2026-02-02 15:26:30.396573	2026-02-10 08:54:23.009	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
44	Panda BBQ (현지 바베큐)	local_food	현지에서 인기 있는 바베큐 & 핫팟 레스토랑. 다양한 고기와 해산물을 구워 먹을 수 있습니다.	/assets/Screenshot_20260122_000818_Maps_1769015581803-CVFbnaBn.jpg	["/assets/Screenshot_20260122_000818_Maps_1769015581803-CVFbnaBn.jpg"]	10.340770	107.073486	150 Hạ Long, Phường 2, Vũng Tàu		https://maps.app.goo.gl/9ruaWyxg9txKrJ6eA			[]	t	70	2026-02-02 12:36:33.696358	2026-02-06 10:16:42.057	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
47	해산물 쌀국수	local_food	오징어 쌀국수(후띠우 먹) 전문점. 진한 해산물 육수와 쫄깃한 면이 일품입니다.	/assets/Screenshot_20260122_000535_Maps_1769015581719-74VA6JJR.jpg	["/assets/Screenshot_20260122_000535_Maps_1769015581719-74VA6JJR.jpg"]	10.347728	107.094875			https://maps.app.goo.gl/hBzPccq4d6E2ufj66			[]	t	80	2026-02-02 12:40:24.053979	2026-02-06 10:16:42.1	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
46	베트남 가정식	local_food	베트남 전통 가정식을 맛볼 수 있는 식당. 뚝배기 밥과 다양한 반찬이 특징입니다.	/assets/Screenshot_20260122_000856_Maps_1769015581809-C93BWQbq.jpg	["/assets/Screenshot_20260122_000856_Maps_1769015581809-C93BWQbq.jpg"]	10.357948	107.080451		090 645 69 05	https://maps.app.goo.gl/Qcx6sfwFh7jrm9HU9			[]	t	150	2026-02-02 12:38:20.805115	2026-02-06 10:16:42.397	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
48	소고기 쌀국수 (에어컨)	local_food	시원한 에어컨이 있는 깔끔한 소고기 쌀국수 전문점. 더운 날씨에 쾌적하게 식사할 수 있습니다.	/assets/Screenshot_20260122_000924_Maps_1769015581814-CU1pZuJN.jpg	["/assets/Screenshot_20260122_000924_Maps_1769015581814-CU1pZuJN.jpg"]	10.357048	107.089676			https://maps.app.goo.gl/9hYEyyeQ1HFFCqY7A			[]	t	160	2026-02-02 12:41:08.852224	2026-02-06 10:16:42.439	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
49	로컬 식당 (껌땀)	local_food	베트남 대표 음식 껌땀(부서진 쌀밥) 전문점. 구운 돼지갈비와 함께 먹는 현지인 맛집.	/assets/Screenshot_20260122_000952_Maps_1769015581817-YL5-Meha.jpg	["/assets/Screenshot_20260122_000952_Maps_1769015581817-YL5-Meha.jpg"]	10.340767	107.083885		0254 3521 212	https://maps.app.goo.gl/M5g8ya358jC1YNYh7			[]	t	170	2026-02-02 15:23:58.055161	2026-02-06 10:16:42.481	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
50	오리국수 (오후 3시반 오픈)	local_food	오리고기 국수와 완탕 전문점. 오후 3시 30분부터 영업하며 현지인들에게 인기가 많습니다.	/assets/Screenshot_20260122_001013_Maps_1769015581823-sleWlmXa.jpg	["/assets/Screenshot_20260122_001013_Maps_1769015581823-sleWlmXa.jpg"]	10.362744	107.075478			https://maps.app.goo.gl/HrorS5czrq91WqPUA			[]	t	180	2026-02-02 15:24:49.006724	2026-02-06 10:16:42.524	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
51	토끼구이	local_food	베트남 스타일 토끼구이 전문점. 독특한 현지 음식을 경험하고 싶다면 추천합니다.	/assets/Screenshot_20260122_001100_Maps_1769015581829-e6snUxt_.jpg	["/assets/Screenshot_20260122_001100_Maps_1769015581829-e6snUxt_.jpg"]	10.386432	107.058936			https://maps.app.goo.gl/Cxpum3ne3fnLiBDz6			[]	t	190	2026-02-02 15:25:08.810733	2026-02-06 10:16:42.566	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
60	한국 치킨집 Nhà Hàng Gà Rán Chicken & Beer	korean_food		/api/public-images/place_1770046721021_qaoek.jpg	["/api/public-images/place_1770046721021_qaoek.jpg"]	10.375147	107.110130	Bc106, Nguyễn An Ninh, Vũng Tàu		https://maps.app.goo.gl/ELA868chEx15aRGG8			[]	t	20	2026-02-02 15:38:42.658737	2026-02-10 08:54:22.88	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
58	해산물 뷔페 (저녁 오픈)	buffet		/api/public-images/place_1770046472099_cz3xtb.jpg	["/api/public-images/place_1770046472099_cz3xtb.jpg"]	10.339290	107.071697			https://maps.app.goo.gl/1xGUZjTk1jfzbDhd9			[]	t	1000	2026-02-02 15:34:17.633546	2026-02-02 15:34:41.089	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
56	GoGi House	buffet		/api/public-images/place_1770046277056_da2zae.jpg	["/api/public-images/place_1770046277056_da2zae.jpg"]	10.348464	107.077230		0254 7300 339	https://maps.app.goo.gl/Ra6gm28jZwnmWtWx9			[]	t	10	2026-02-02 15:30:38.254672	2026-02-02 15:32:51.643	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
57	간하오 스시, 샤브샤브 뷔페	buffet		/api/public-images/place_1770046350458_4tz7q8.jpg	["/api/public-images/place_1770046350458_4tz7q8.jpg"]	10.339413	107.071689			https://maps.app.goo.gl/rrg1m5M57fpwKa5g6			[]	t	20	2026-02-02 15:32:22.793746	2026-02-02 15:32:51.688	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
59	린차이나	chinese_food		/api/public-images/place_1770046552436_vh27yl.jpg	["/api/public-images/place_1770046552436_vh27yl.jpg"]	10.349925	107.089870	422/7 Lê Hồng Phong, Phường 8, Vũng Tàu		https://maps.app.goo.gl/XhJsqpTm5pjWhN6LA			[]	t	1000	2026-02-02 15:35:45.740756	2026-02-02 15:36:50.522	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
54	비원식당	korean_food		/api/public-images/place_1770046178383_3jspt.jpg	["/api/public-images/place_1770046178383_3jspt.jpg"]	10.355659	107.101169	662A Nguyễn An Ninh, Phường 8, Vũng Tàu		https://maps.app.goo.gl/UrmsYuMjWGwMhAYq6			[]	t	30	2026-02-02 15:29:29.757237	2026-02-10 08:54:22.923	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
45	해산물 식당	local_food	다양한 조개 요리 전문점. 현지인들이 자주 찾는 해산물 맛집입니다.	/assets/Screenshot_20260122_000835_Maps_1769015581806-2x7dRL4S.jpg	["/assets/Screenshot_20260122_000835_Maps_1769015581806-2x7dRL4S.jpg"]	10.353310	107.064225	20 Trần Phú, Phường 1, Vũng Tàu		https://maps.app.goo.gl/37gvjz6hhkzP6ip2A			[]	t	140	2026-02-02 12:37:23.432831	2026-02-06 10:16:42.355	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
55	뚱보집 (포차)	korean_food		/api/public-images/place_1770046215155_mb1qie.jpg	["/api/public-images/place_1770046215155_mb1qie.jpg"]	10.339598	107.092334	151 Thùy Vân, Phường Thắng Tam, Vũng Tàu		https://maps.app.goo.gl/EXSWLjy4mdcwZkt36			[]	t	40	2026-02-02 15:30:08.861589	2026-02-10 08:54:22.966	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
62	붕따우 한국 가라오케 럭셔리	nightlife18	아가씨 6시30부터 출근	/api/public-images/place_1770048578482_bjzig.jpg	["/api/public-images/place_1770048578482_bjzig.jpg"]	10.353725	107.077005	Phường 4, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/yeHGRKeD9ZNnNEMf8	18:30~01:00	$$$	[]	t	10	2026-02-02 15:48:37.020406	2026-02-13 02:57:09.789	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
68	붕따우 가라오케 세븐	nightlife18	아가씨 6시30부터 출근	/api/public-images/place_1770048645675_ez7s7mj.jpg	["/api/public-images/place_1770048645675_ez7s7mj.jpg"]	10.351652	107.100485	Phường 8, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/FNhfFuoPuXgtuFbV9	18:00~01:00	$$$	[]	t	50	2026-02-02 16:10:54.303609	2026-02-13 02:57:32.874	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
69	도쿄마사지	nightlife18		/api/public-images/place_1770270196381_g5fhd.jpg	["/api/public-images/place_1770270196381_g5fhd.jpg", "/api/public-images/place_1770270198255_932k8h.jpg", "/api/public-images/place_1770270199287_yw0hxo.jpg", "/api/public-images/place_1770270201193_pbhjy.jpg"]	10.331901	107.088752	65 Thùy Vân, Phường 2, Vũng Tàu, Bà Rịa - Vũng Tàu 78000			10:00~01:00	$$	[]	t	20	2026-02-05 05:44:37.954817	2026-02-13 02:15:09.812	t	붕따우 도깨비 카톡으로 예약 시 100,000동 할인	["/api/public-images/place_1770270251875_nuhtr.jpg"]
72	호짬 더블러프	golfjang		/api/public-images/place_1770289581212_vwkzup.jpg	["/api/public-images/place_1770289581212_vwkzup.jpg"]	10.515127	107.507042						[]	t	20	2026-02-05 11:07:13.034287	2026-02-08 16:05:29.015	t	붕따우 도깨비 카톡으로 예약 시 할인	["/api/public-images/place_1770566727771_to385i.jpg"]
64	Revo 클럽	nightlife	현지인들에게 인기 있는 나이트클럽. EDM 음악과 열정적인 분위기.	/assets/Screenshot_20260116_184614_Maps_1768564285861-BzUpb8Mr.jpg	["/assets/Screenshot_20260116_184614_Maps_1768564285861-BzUpb8Mr.jpg"]	10.347689	107.075262	15 Lý Tự Trọng, Phường 1, Vũng Tàu		https://maps.app.goo.gl/ddpz3vhHGrWyPo8UA	21:00~03:00	$$	[]	t	20	2026-02-02 15:53:17.734006	2026-02-13 02:12:59.952	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
65	Lox 클럽	nightlife	화려한 인테리어의 프리미엄 나이트클럽. VIP 서비스 제공.	/assets/Screenshot_20260116_185045_Maps_1768564285866-bUVRaEPU.jpg	["/assets/Screenshot_20260116_185045_Maps_1768564285866-bUVRaEPU.jpg"]	10.341144	107.078297	12b Hoàng Hoa Thám, Phường 3, Vũng Tàu		https://maps.app.goo.gl/AaHcBWNUBEWZXxQM7	21:00~03:00	$$$	[]	t	30	2026-02-02 15:54:35.539562	2026-02-13 02:13:09.592	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
71	쩌우득 골프장	golfjang		/api/public-images/place_1770289472542_8vnwg7.jpg	["/api/public-images/place_1770289472542_8vnwg7.jpg"]	10.612735	107.180429	Suối Nghệ, Châu Đức, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/MfJC9MFMP1RfryVn7			[]	t	30	2026-02-05 11:05:57.503179	2026-02-08 16:09:04.08	t	붕따우 도깨비 카톡으로 예약 시 할인	["/api/public-images/place_1770566940058_wcvs8g.jpg"]
76	(내부수리중)Palace 카지노	category_1770371971566	현재 내부 수리중	/api/public-images/place_1770372282740_ii5m.jpg	["/api/public-images/place_1770372282740_ii5m.jpg"]	10.342816	107.075912						[]	t	30	2026-02-06 10:05:26.013705	2026-03-09 15:19:38.071	t	(내부 수리중)붕따우 도깨비 카톡으로 문의 시 차량지원	[]
66	U.S Bar Club	nightlife	아메리칸 스타일 바. 칵테일과 양주를 즐길 수 있는 분위기 좋은 곳.	/assets/Screenshot_20260116_184659_Maps_1768564285873-nh2uHXje.jpg	["/assets/Screenshot_20260116_184659_Maps_1768564285873-nh2uHXje.jpg"]	10.351023	107.078955	120 Ba Cu, Phường 3, Vũng Tàu		https://maps.app.goo.gl/p5z6m5vT6qCrEWth6	21:00~03:00	$$	[]	t	40	2026-02-02 15:55:04.960753	2026-02-13 02:13:22.855	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
67	Peace and Love 라이브바	nightlife	금, 토 라이브 공연. 간단히 맥주 즐기며 라이브 밴드 감상.	/assets/20260117_220334_1768668092372-XPKjGPtA.jpg	["/assets/20260117_220334_1768668092372-XPKjGPtA.jpg"]	10.337391	107.080178	126A Phan Chu Trinh, Phường 2, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/tF2X5pi7R1UmCamC7	19:00~01:00	$	[]	t	50	2026-02-02 15:56:08.159283	2026-02-13 02:13:50.82	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
74	임페리얼 seaside 클럽	category_1770371971566	첫 방문시 20불 바우처 지급	/api/public-images/place_1770372126712_cfqfwo.jpg	["/api/public-images/place_1770372126712_cfqfwo.jpg"]	10.344120	107.095049						[]	t	10	2026-02-06 10:02:27.737773	2026-02-06 10:07:31.736	t	붕따우 도깨비 카톡으로 문의 시 20불 바우처 지급 및 차량지원	[]
63	88 비어클럽	nightlife	붕따우 대표 비어클럽. 라이브 음악과 함께 즐기는 맥주와 야외 분위기.	/assets/Screenshot_20260116_184507_Maps_1768564285854-yQOQTuXu.jpg	["/assets/Screenshot_20260116_184507_Maps_1768564285854-yQOQTuXu.jpg"]	10.339938	107.092457	151 Thùy Vân, Phường Thắng Tam, Vũng Tàu		https://maps.app.goo.gl/iE9XDvduSDrn1wVc8	21:00~03:00	$$	[]	t	10	2026-02-02 15:52:53.369466	2026-02-13 02:12:46.042	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
75	(내부 수리중)Monaco casino	category_1770371971566		/api/public-images/place_1770372218535_2rzkvr.jpg	["/api/public-images/place_1770372218535_2rzkvr.jpg"]	10.349345	107.074998						[]	t	20	2026-02-06 10:04:14.09826	2026-03-09 15:18:38.319	t	붕따우 도깨비 카톡으로 문의시 50불 바우처 지급	[]
52	이안 돌판 삼겹살	korean_food		/assets/Screenshot_20260115_211048_Maps_1768486311169-CQBcAZ9L.jpg	["/assets/Screenshot_20260115_211048_Maps_1768486311169-CQBcAZ9L.jpg", "/api/public-images/place_1770049015985_5ifve.jpg", "/api/public-images/place_1770049016892_56e6v.jpg", "/api/public-images/place_1770049020009_sr85b6.jpg"]	10.329528	107.086860	300A Phan Chu Trinh, Phường 2, Vũng Tàu		https://maps.app.goo.gl/8FXU2u8Cn2AufLGz9			[]	t	10	2026-02-02 15:26:12.358017	2026-02-14 07:23:52.869	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	["/api/public-images/place_1771053817519_nsdy9e.jpg", "/api/public-images/place_1771053818527_mi81th.jpg", "/api/public-images/place_1771053819537_ypjev.jpg", "/api/public-images/place_1771053820376_c9dksi.jpg", "/api/public-images/place_1771053821179_52349e.jpg", "/api/public-images/place_1771053822399_gvmtws.jpg", "/api/public-images/place_1771053823221_e0r5k.jpg"]
81	Bi Roen 이발소	services		/api/public-images/place_1770789136778_k1k2tp.jpg	["/api/public-images/place_1770789136778_k1k2tp.jpg", "/api/public-images/place_1770789138438_m4f6th.jpg", "/api/public-images/place_1770789141127_j7hj9r.jpg"]	10.334949	107.087904	209 Hoàng Hoa Thám, Phường 2, Vũng Tàu, Thành phố Hồ Chí Minh					[]	t	30	2026-02-11 05:53:18.982339	2026-02-11 05:53:24.55	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	["/api/public-images/place_1770789170583_lbufn.jpg", "/api/public-images/place_1770789182871_671qo.jpg", "/api/public-images/place_1770789192594_7cvzp9.jpg"]
78	Zính Food 해산물	local_food		/api/public-images/place_1770372953042_t5f8u.jpg	["/api/public-images/place_1770372953042_t5f8u.jpg", "/api/public-images/place_1770372954584_48btx.jpg", "/api/public-images/place_1770372955503_0hlkhc.jpg", "/api/public-images/place_1770372956829_jp9dsl.jpg"]	10.353428	107.063880	28A Trần Phú, Phường 1, Vũng Tàu, Bà Rịa - Vũng Tàu 790000		https://maps.app.goo.gl/CWC6wb8j23beEXt16			[]	t	90	2026-02-06 10:16:22.830406	2026-02-06 10:16:42.143	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
80	Hu beach	nightlife	수영장에서 클럽음악과 함께 있는 즐기자	/api/public-images/place_1770556431548_t5t6l.jpg	["/api/public-images/place_1770556431548_t5t6l.jpg", "/api/public-images/place_1770556438572_5cp9.jpg", "/api/public-images/place_1770556443737_2y7rn.jpg", "/api/public-images/place_1770556452031_uousa.jpg", "/api/public-images/place_1770556456476_i79g9x.jpg", "/api/public-images/place_1770556459713_odago.jpg", "/api/public-images/place_1770556460835_e6svn.jpg"]	10.339912	107.091878	151 Thùy Vân, Phường Vũng Tàu, Tp Hồ Chí Minh, Hồ Chí Minh, Bà Rịa - Vũng Tàu			12:00~01:00	$$	[]	t	60	2026-02-08 13:15:45.57093	2026-02-13 02:14:13.488	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
70	파라다이스 골프장	golfjang	골프장 특징 및 코스\n​규모: 총 27홀 \n(A, B, C 코스 각 9홀 / Par 108)\n\n​디자인: 1992년 대만 골프 코퍼레이션에서 설계한 베트남 최초의 27홀 골프장 중 하나로, 세월의 흐름이 느껴지지만 관리가 잘 된 편입니다.\n\n​지형: 해안선을 따라 조성된 링크스(Links) 스타일로, 바다에서 불어오는 강한 바람이 변별력을 높이는 핵심 요소입니다.\n\n​코스 분위기: 페어웨이가 대체로 넓어 시야가 시원하지만, 곳곳에 배치된 천연 호수와 야생 수풀이 난이도를 조절합니다. 특히 12번~15번 홀은 환상적인 바다 조망을 자랑합니다.	/api/public-images/place_1770288251331_efundx.jpg	["/api/public-images/place_1770288251331_efundx.jpg"]	10.361374	107.104397						[]	t	10	2026-02-05 10:58:18.645611	2026-02-08 16:04:31.76	t	붕따우 도깨비 카톡으로 예약 시 할인	["/api/public-images/place_1770566631209_nwhyiu.jpg"]
77	Roma 해산물	local_food		/api/public-images/place_1770372616833_mgpbk.jpg	["/api/public-images/place_1770372616833_mgpbk.jpg", "/api/public-images/place_1770372622391_llcfgo.jpg", "/api/public-images/place_1770372626928_zyqx5.jpg", "/api/public-images/place_1770372631455_sv0vgc.jpg", "/api/public-images/place_1770372634192_mbeee.jpg", "/api/public-images/place_1770372638468_acfibc.jpg", "/api/public-images/place_1770372642306_x5ij3j.jpg", "/api/public-images/place_1770372647435_n38cse.jpg"]	10.338563	107.091122	151 Thùy Vân, Phường Thắng Tam, Vũng Tàu					[]	t	100	2026-02-06 10:12:46.53003	2026-02-15 14:32:22.443	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
82	T Back Bar 토킹바	nightlife18		/api/public-images/place_1770881516607_vdkifp.jpg	["/api/public-images/place_1770881516607_vdkifp.jpg", "/api/public-images/place_1770881518354_knj903.jpg", "/api/public-images/place_1770881519962_abmftq.jpg"]	10.342757	107.076949	25 Trương Công Định, Phường 1, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/6g9n3Km5WTJyS5fq9	18:00~01:00	$$	[]	t	40	2026-02-12 07:32:22.320182	2026-02-13 02:15:47.516	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
79	로컬가라오케	nightlife18	로컬의 찐 바이블\n아가씨 6시00부터 출근	/api/public-images/place_1770374106864_9ucqe.png	["/api/public-images/place_1770374106864_9ucqe.png"]	10.330068	107.086031				18:00~01:00	$$	[]	t	30	2026-02-06 10:35:24.856112	2026-02-13 02:57:23.104	t	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
14	붕따우 거대 예수상	attraction	높이 32m의 거대한 예수상. 붕따우의 대표적인 랜드마크로 811개의 계단을 올라가면 아름다운 해안 전경을 감상할 수 있습니다.\n예수상 이용 시간\n​산책로(공원) 입장: 오전 7:00 ~ 오후 5:00\n​예수상 내부(전망대) 입장:\n​오전: 07:15 ~ 11:30 (또는 12:00)\n​오후: 13:30 (또는 14:00) ~ 16:30\n​주의: 점심시간(11:30 ~ 13:30)\n\n복장 규정 (매우 중요):\n​예수상 내부는 신성한 장소로 간주되어 복장 검사가 엄격합니다.\n​반바지, 짧은 치마, 민소매(나시) 차림으로는 내부 입장이 불가능합니다. (무릎과 어깨를 가리는 복장 필수)\n​신발과 모자는 내부 입장 시 벗어야 합니다.	/assets/Screenshot_20260115_113154_Gallery_1768451530261-5NPJ3_Wg.jpg	["/assets/Screenshot_20260115_113154_Gallery_1768451530261-5NPJ3_Wg.jpg"]	10.323611	107.084181			https://maps.app.goo.gl/CgLqYEKGLxodn27B8			[]	t	10	2026-02-02 09:39:08.863721	2026-02-19 04:32:11.78	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
27	원숭이사원	attraction	야생 원숭이들이 서식하는 사원. 원숭이들과 교감하며 사진을 찍을 수 있습니다 (소지품 주의). 원숭이 물림 사고가 발생 할 수 있어요~ 항상 주의해 주세요	/assets/z40559387093017e7b56d8300d82363ef9c08685c1f765-167436802698717_1768452191734-BOY8C1yP.jpg	["/assets/z40559387093017e7b56d8300d82363ef9c08685c1f765-167436802698717_1768452191734-BOY8C1yP.jpg"]	10.355282	107.067425			https://maps.app.goo.gl/LmQ7U7VDgi9n8aGH8			[]	t	130	2026-02-02 11:32:17.721748	2026-02-19 05:53:28.524	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
84	Coffee Suối Bên Biển	cafe	바다를 바라보며 즐기는 야외 카페. 밤에는 조명과 함께 로맨틱한 분위기를 자아냅니다.	/assets/Screenshot_20260122_002226_Maps_1769016389675-D3HhY80G.jpg	[]	\N	\N			https://maps.app.goo.gl/Sd7JGZiZ1n6TrvmJ7	\N	\N	[]	t	10	2026-02-14 05:30:55.053815	2026-02-14 05:31:28.246	f	\N	[]
85	KATINAT 커피	cafe	베트남 유명 프랜차이즈 커피숍. 해변가 테라스에서 시원한 음료를 즐길 수 있습니다.	/assets/Screenshot_20260122_002241_Maps_1769016389683-JK7YT1Fn.jpg	[]	\N	\N			https://maps.app.goo.gl/ptgkTbJnVzwUzYPGA	\N	\N	[]	t	20	2026-02-14 05:31:09.088156	2026-02-14 05:31:28.291	f	\N	[]
83	Coffee Sea & Sun 1	cafe		/api/public-images/place_1771046880176_ezqy5k.jpg	["/api/public-images/place_1771046880176_ezqy5k.jpg", "/api/public-images/place_1771046884638_ixru5o.jpg", "/api/public-images/place_1771046888242_n8v8h.jpg", "/api/public-images/place_1771046892094_y064sp.jpg", "/api/public-images/place_1771046895484_m55nj5.jpg", "/api/public-images/place_1771046898374_drw90f.jpg"]	10.354340	107.061732	1 Trần Phú, Phường 1, Vũng Tàu, Bà Rịa - Vũng Tàu		https://maps.app.goo.gl/VoRrMJsp5g3wLBaKA			[]	t	30	2026-02-14 05:29:56.624352	2026-02-14 05:31:28.336	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	[]
86	Ten 커피숍	cafe	현지인들에게 인기 있는 분위기 좋은 커피숍. 다양한 음료와 편안한 공간에서 여유를 즐길 수 있습니다.	/assets/Screenshot_20260122_000040_Maps_1769016584832-BMcAWl1Q.jpg	[]	\N	\N			https://maps.app.goo.gl/2c67Nd3hhjFGdZj36	\N	\N	[]	t	40	2026-02-14 05:31:17.789929	2026-02-14 05:31:28.381	f	\N	[]
87	Sunworld 워터파크	attraction	붕따우 워터파크	/api/public-images/place_1771475492258_auugb.jpg	["/api/public-images/place_1771475492258_auugb.jpg", "/api/public-images/place_1771475493280_vlui1n.jpg", "/api/public-images/place_1771475493950_jsg4ce.jpg", "/api/public-images/place_1771475494835_orkgoh.jpg", "/api/public-images/place_1771475495750_cfeqp.jpg", "/api/public-images/place_1771475496525_sxqryk.jpg"]	10.383829	107.137569	Đ. 3 Tháng 2, Phường 12, Vũng Tàu, Bà Rịa - Vũng Tàu 790000		https://maps.app.goo.gl/YmMxnravZ7EBE4jA6			[]	t	80	2026-02-19 04:32:03.344455	2026-02-19 04:33:04.23	f	붕따우 도깨비 카톡으로 예약 시 5% 할인	["/api/public-images/place_1771475496945_fp7tsj.jpg"]
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, title, content, image_url, author_id, author_name, created_at, updated_at, is_hidden, view_count) FROM stdin;
20	붕따우 펍 vivu vivu	https://m.blog.naver.com/vungtausaver/224159325765	\N	42663365	붕따우도깨비	2026-01-25 12:00:42.329708	2026-01-25 12:00:42.329708	f	2
58	봄 분위기가 물씬 나는 붕따우	![이미지](https://vungtau.blog/objects/uploads/07d3de51-6c4d-4515-a409-aeba3a009ecc)\n\n\n![이미지](https://vungtau.blog/objects/uploads/069757b9-a6fb-4d4c-9872-2ad969ecc818)\n\n\n![이미지](https://vungtau.blog/objects/uploads/09fe0a9f-fca5-487d-b08b-b6dc8d2edabc)\n\n\n![이미지](https://vungtau.blog/objects/uploads/51f00c6d-741e-44a6-abf4-8f4210974ad4)\n\n\n![이미지](https://vungtau.blog/objects/uploads/bea3d8d1-e3b1-4e5a-bbe1-015acfc08b4b)\n\n\n![이미지](https://vungtau.blog/objects/uploads/3df27e8b-482d-473a-afc8-65281905c2a4)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-08 10:50:29.288358	2026-03-08 10:50:29.288358	f	6
36	2월16일 붕따우	\n![video](https://vungtau.blog/objects/uploads/4431f8dd-03a3-48d5-85f4-cab6bbd5c3c9)\n\n\n	/objects/uploads/c0d81a98-59fa-4835-870e-243b1d96efb3	kakao_4725775455	붕따우 도깨비	2026-02-16 06:15:28.204628	2026-02-16 06:15:28.204628	f	3
42	붕따우 아침	![이미지](https://vungtau.blog/objects/uploads/fd36b035-4902-45a9-b74e-f54ae880cc27)\n\n\n![이미지](https://vungtau.blog/objects/uploads/aa5dc6dd-742d-45fa-8bab-338fa4b22458)\n\n\n![이미지](https://vungtau.blog/objects/uploads/53c58065-cdb3-46f4-b4ac-13e9d9fc9d54)\n\n\n![이미지](https://vungtau.blog/objects/uploads/ed6f8588-0125-4f4e-82f1-1a747c900373)\n\n\n![이미지](https://vungtau.blog/objects/uploads/fc7397cf-b59f-4823-8b84-0fc1f817a0e1)\n\n\n![이미지](https://vungtau.blog/objects/uploads/b06b306a-307c-46be-9f1f-1b7247384eb2)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-20 02:51:07.492386	2026-02-20 02:51:07.492386	f	1
4	상쾌한 붕따우 아침	https://m.blog.naver.com/vungtausaver/224069349507	\N	42663365	붕따우도깨비	2026-01-17 02:45:14.275207	2026-01-17 02:45:14.275207	f	0
5	귀여운 냥이가 있는 커피숍	https://m.blog.naver.com/vungtausaver/224107532939	\N	42663365	붕따우도깨비	2026-01-17 02:45:52.729933	2026-01-17 02:45:52.729933	f	0
6	한창 공사중인 워터파크 Sun World 	https://m.blog.naver.com/vungtausaver/224109499310	\N	42663365	붕따우도깨비	2026-01-17 02:46:23.892877	2026-01-17 02:46:23.892877	f	0
7	바닷가 카페 360	https://m.blog.naver.com/vungtausaver/224138388661	\N	42663365	붕따우도깨비	2026-01-17 02:47:02.798022	2026-01-17 02:47:02.798022	f	0
18	6룸 신축 풀빌라	https://m.blog.naver.com/vungtausaver/224155969486	\N	42663365	붕따우도깨비	2026-01-22 07:05:19.650319	2026-01-22 07:05:19.650319	f	1
2	붕따우 커피숍 E timber	https://m.blog.naver.com/vungtausaver/224055379449	\N	42663365	붕따우도깨비	2026-01-16 19:52:17.03029	2026-01-22 03:56:07.173	f	1
14	패스트트랙 서비스	https://m.blog.naver.com/vungtausaver/223918265947	\N	42663365	붕따우도깨비	2026-01-18 08:48:26.702608	2026-01-18 08:48:26.702608	f	0
15	현지 금은방 환전 불가 안내	https://www.thetrippick.com/news/articleView.html?idxno=2545	\N	42663365	붕따우도깨비	2026-01-19 04:54:14.933018	2026-01-19 04:54:14.933018	f	0
16	붕따우 바닷가 이쁜 노을	https://m.blog.naver.com/vungtausaver/224153451886	\N	42663365	붕따우도깨비	2026-01-20 07:42:34.664884	2026-01-20 07:42:34.664884	f	0
17	Taxas BBQ	https://m.blog.naver.com/vungtausaver/224155253035	\N	42663365	붕따우도깨비	2026-01-22 03:55:34.824626	2026-01-22 03:55:34.824626	f	0
19	붕따우 도깨비 호치민 붕따우 무료픽업 서비스	https://m.blog.naver.com/vungtausaver/224157257921	\N	42663365	붕따우도깨비	2026-01-23 07:52:46.596383	2026-01-23 07:52:46.596383	f	1
24	붕따우 협력식당 로마에서 해산물	\n붕따우 도깨비 협력식당에서 손님과 함께\n해산물~~파티~~![이미지](https://vungtau.blog/objects/uploads/bf0c8545-b6dc-4fb0-a56a-19ecceafdb47)\n오도리도 달콤하네요~^ㅇ^\n\n![이미지](https://vungtau.blog/objects/uploads/88d72bd0-436a-451c-b37d-c4df40e87e12)\n\n이 꽃게탕이 은근 중독입니다~ㅎㅎ	\N	kakao_4725775455	붕따우 도깨비	2026-02-08 15:48:52.594906	2026-02-08 15:48:52.594906	f	5
33	붕따우 Monaco 카지노 이벤트	![이미지](https://vungtau.blog/objects/uploads/33d8f7af-4df9-457c-83a2-fb9a0f00072d)\n2월13일 금요일\n카드 등급별로 바우처 받아가세요~^^	\N	kakao_4725775455	붕따우 도깨비	2026-02-12 06:27:24.235313	2026-02-12 06:27:24.235313	f	0
54	커피 뽑는 커피숍	![이미지](https://vungtau.blog/objects/uploads/7dd44ed5-ea61-4625-aacd-ea813c82a80b)\n![이미지](https://vungtau.blog/objects/uploads/fcc6e114-74d5-4d9c-a81a-243b9ce98f7f)\n\n\n\n![이미지](https://vungtau.blog/objects/uploads/23f0631d-af1a-40f9-8995-47134f687a75)\n\n\n![이미지](https://vungtau.blog/objects/uploads/0e47cd77-d070-4c9b-bbbd-5f16a720ccbc)\n\n\n![이미지](https://vungtau.blog/objects/uploads/d7679cfc-f893-4732-a6f7-93e029222112)\n\n\nhttps://maps.app.goo.gl/iNLqe56AS4Kw6vVi6	\N	kakao_4725775455	붕따우 도깨비	2026-03-08 05:03:55.767882	2026-03-08 05:03:55.767882	f	1
44	북적북적한 붕따우	![이미지](https://vungtau.blog/objects/uploads/9d95c034-ea43-4443-9436-6a87df83d277)\n\n\n![이미지](https://vungtau.blog/objects/uploads/0dccd50d-8e52-4c52-bac9-0d5ba9cde059)\n\n\n![이미지](https://vungtau.blog/objects/uploads/d2373244-5616-4cd7-b30b-2f9fa7b4ab25)\n\n\n![이미지](https://vungtau.blog/objects/uploads/72e4b35c-8ee5-4634-9f26-80d70a67792f)\n20일 하루에만 6만6천명이 방문\n너무 복잡해요~~	\N	kakao_4725775455	붕따우 도깨비	2026-02-21 15:45:36.257748	2026-02-21 15:45:36.257748	f	6
60	이쁘게 사진 찍기	![이미지](https://vungtau.blog/objects/uploads/711aac0c-9f3a-49ec-a15c-c087c55a5d76)\n\n\n![이미지](https://vungtau.blog/objects/uploads/892c83cf-0463-45de-b9b1-4ee69621f3d4)\n\n\n![이미지](https://vungtau.blog/objects/uploads/08e3ff60-8a84-46fe-9fa5-09ff965b97d6)\n\n\n![이미지](https://vungtau.blog/objects/uploads/b6289f69-8f5c-4128-81e7-ef6f297f195e)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-10 11:19:38.640228	2026-03-10 11:19:38.640228	f	3
23	베트남 로컬에서 한잔	![이미지](https://vungtau.blog/objects/uploads/69215b0f-5c37-4eb8-9928-99ead397aeef)\n사이공 맥주에 로컬음식 순삭~	\N	kakao_4725775455	붕따우 도깨비	2026-02-06 14:38:33.617212	2026-02-06 14:38:33.617212	f	10
30	썬월드 워터파크 2월12일 개장	\n![video](https://vungtau.blog/objects/uploads/e2f97a09-c3b7-4d0d-8d69-3b16bbdf67da)\n\n\n	/objects/uploads/1b01f100-5973-48bb-b58b-0ada3f22fc61	kakao_4725775455	붕따우 도깨비	2026-02-11 04:03:37.670312	2026-02-11 04:03:37.670312	f	15
8	파라다이스 골프장 리뉴얼	https://m.blog.naver.com/vungtausaver/224140757654	\N	42663365	붕따우도깨비	2026-01-17 02:47:32.459347	2026-01-17 02:47:32.459347	f	0
9	해산물집 먹자골목	https://m.blog.naver.com/vungtausaver/224148163297	\N	42663365	붕따우도깨비	2026-01-17 02:48:01.349054	2026-01-17 02:48:01.349054	f	0
11	롱탄공항 오픈이 진짜 얼마 안 남았나 보네요~^^	https://m.blog.naver.com/vungtausaver/224111492294	\N	42663365	붕따우도깨비	2026-01-17 09:57:06.930251	2026-01-17 09:57:06.930251	f	0
13	Peace and love 라이브 클럽	https://m.blog.naver.com/vungtausaver/224150436046	\N	42663365	붕따우도깨비	2026-01-18 03:39:23.179216	2026-01-18 03:39:23.179216	f	0
21	껀저 붕따우를 있는 해상대교 건설	https://m.blog.naver.com/vungtausaver/224161460753	\N	42663365	붕따우도깨비	2026-01-27 05:51:00.992774	2026-01-27 05:51:00.992774	f	5
35	sea & sun 커피숍	![이미지](https://vungtau.blog/objects/uploads/94abd739-42f0-4f1a-b596-c5810af0d4ea)\n낮에는 더울 거 같은데 저녁에는 정말 좋겠네요\n![이미지](https://vungtau.blog/objects/uploads/608ccde5-1422-4cd9-8202-ecda12b0cae8)\n\n\n![이미지](https://vungtau.blog/objects/uploads/de0df984-9614-45da-981c-9d4501b6c005)\n\n\n![이미지](https://vungtau.blog/objects/uploads/e807934a-0eac-428d-a6b7-d0558d1f262e)\n\n\n![이미지](https://vungtau.blog/objects/uploads/2dbef796-5eaf-459e-8fc5-5120c20df463)\n![이미지](https://vungtau.blog/objects/uploads/7dad48ad-73db-44b2-8f7f-f139abd12b98)\n에어컨 방도 있어요~\n\n위치\nCoffee Sea & Sun 1 https://vungtau.blog/guide?p=83\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-14 05:26:47.581976	2026-02-14 05:32:39.365	f	5
32	파라다이스 골프장 설 연휴 일정	![이미지](https://vungtau.blog/objects/uploads/5e6968ee-c502-4ae1-9a37-b29443592b3a)\n2월 17,18일 휴일입니다~ 참고 하세요~^^	\N	kakao_4725775455	붕따우 도깨비	2026-02-12 06:23:01.444194	2026-02-12 06:23:01.444194	f	1
45	2월22일 붕따우 아침	![이미지](https://vungtau.blog/objects/uploads/2556d010-bd0c-4705-b172-38b6dc309172)\n\n\n![이미지](https://vungtau.blog/objects/uploads/8cda57bb-057b-4608-9ea9-c13e49d8f2ad)\n\n\n![이미지](https://vungtau.blog/objects/uploads/3aa2ff87-aa2c-4296-bd0c-ff3a37874896)\n\n\n![이미지](https://vungtau.blog/objects/uploads/cd6a36be-41c6-4b90-beee-0eac25efeb4b)\n\n\n![이미지](https://vungtau.blog/objects/uploads/1bfc1218-0918-462f-a22f-a67a0aa70abb)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-22 04:32:09.37038	2026-02-22 04:32:09.37038	f	6
48	노을이 멋진 붕따우 바닷가	![이미지](https://vungtau.blog/objects/uploads/da08cd59-3f5f-4f3b-9f68-16377607fbdd)\n\n\n![이미지](https://vungtau.blog/objects/uploads/3a7299dd-305b-4349-b2a3-3a9ce835c2a2)\n\n\n\n![이미지](/objects/uploads/64f68713-7434-464e-a5f2-1867613a8208)\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-24 11:39:44.157295	2026-02-24 11:44:14.685	f	4
52	언제나 멋있는 붕따우	![이미지](https://vungtau.blog/objects/uploads/121553a0-cc34-4869-9d13-cb52317be447)\n\n\n![이미지](https://vungtau.blog/objects/uploads/ba9949ea-2392-47b5-8bf4-8e8af3333d1b)\n\n\n![이미지](https://vungtau.blog/objects/uploads/de051238-da74-48bc-b171-acc249260ea7)\n\n\n![이미지](https://vungtau.blog/objects/uploads/c6c784fa-caf6-4658-bf74-fb81513aad7d)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-04 14:02:06.015207	2026-03-04 14:02:06.015207	f	4
43	비엔호아와 붕따우 연결하는 고속도로 4월30일 개통	![이미지](https://vungtau.blog/objects/uploads/fdf1c3f5-9b9a-44a2-b562-9e46e444fb43)\n​올해 초부터 비엔화(Bien Hoa) – 붕따우(Vung Tau) 고속도로 1단계 사업 현장은 긴박한 작업 분위기를 유지하고 있습니다. '제1건설 총공사(CC1)'의 현장 소장인 쩐딘타오(Tran Dinh Thao) 씨는 3월 말까지 프로젝트를 완료하고, 4월 30일(베트남 남부 해방 기념일)에 맞춰 공식 개통하는 것을 목표로 하고 있다고 밝혔습니다.\n​일정을 맞추기 위해 약 100명의 엔지니어와 노동자들이 중장비 시스템과 함께 설(Tet) 연휴 기간에도 쉬지 않고 근무했습니다. 이는 평일 인력의 약 1/3에 해당하는 규모입니다.\n​주요 공사 현황 및 계획\n​연휴 이후 복귀: 2월 24일(음력 1월 8일)부터 모든 인력이 현장에 복귀할 수 있도록 준비를 마쳤습니다. 공사 속도를 높이기 위해 "3교대 4조" 근무 모델을 적용할 예정입니다.\n​임시 개통 무산: 당초 설 이전에 한 방향 임시 개통을 고려했으나, 실무 점검 결과 가드레일, 보호 펜스, 표지판 시스템 및 도로 도색 등 일부 항목이 안전 기준을 충족하지 못해 승인되지 않았습니다.\n​프로젝트 개요 및 기대 효과\n​총 길이: 약 54km\n​총 투자비: 약 17조 8,000억 동 (VND)\n​기대 효과: 완공 시 호치민시에서 붕따우까지의 이동 시간이 70분으로 단축됩니다. 또한, 기존 51번 국도의 정체를 해소하고 동남부 지역의 연결성을 강화할 것으로 기대됩니다.	\N	kakao_4725775455	붕따우 도깨비	2026-02-20 04:35:00.452644	2026-02-20 04:35:00.452644	f	11
25	붕따우 노을영상	![video](https://vungtau.blog/objects/uploads/81287a65-b76d-4ef4-9745-9dc3ea946893)\n\n노을 너무 멋져요~	\N	kakao_4725775455	붕따우 도깨비	2026-02-09 05:13:46.836041	2026-02-09 05:48:02.504	f	4
57	프론트비치 포토존	![이미지](https://vungtau.blog/objects/uploads/b980a980-1b14-465d-bbff-83113201d774)\n\n\n![이미지](https://vungtau.blog/objects/uploads/e05906de-137b-4b49-9e08-a82162124560)\n\n\n![이미지](https://vungtau.blog/objects/uploads/5359570a-c837-48c5-8f9e-7b7b1c1af29f)\n\n\n![이미지](https://vungtau.blog/objects/uploads/b40b6bf9-223d-4d01-a9e6-51fa9e68e8b9)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-08 05:57:38.384176	2026-03-08 05:57:38.384176	f	7
39	26년 붕따우 불꽃축제	\n\n\n![video](https://vungtau.blog/objects/uploads/68cb879f-f8f8-4992-a1a3-57445c8b78f7)\n\n\n\n![동영상](/objects/uploads/1dbed436-8097-420e-b593-db4a8aaed538)\n	/objects/uploads/d39d2734-ffd8-4ce8-be99-e9446126b245	kakao_4725775455	붕따우 도깨비	2026-02-17 03:07:38.948071	2026-02-17 03:20:49.555	f	5
47	핫한 붕따우 바닷가	![이미지](https://vungtau.blog/objects/uploads/11b90c29-d8f5-4401-87a3-62a5f206f0be)\n\n\n![이미지](https://vungtau.blog/objects/uploads/2d4c244c-f9d3-4874-9707-d15f70a163c9)\n\n\n![이미지](https://vungtau.blog/objects/uploads/618db8a7-e0a3-4d48-817e-8c3b17d942f3)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-24 11:34:47.703166	2026-02-24 11:34:47.703166	f	4
37	롱탄공항 24시	\n![video](https://vungtau.blog/objects/uploads/e9a5710e-1f01-4079-9f70-b409305c3b2e)\n\n\n	/objects/uploads/5f2cff6c-f930-4581-bf2a-c1721be66701	kakao_4725775455	붕따우 도깨비	2026-02-16 08:08:18.373604	2026-02-16 08:08:18.373604	f	0
26	2월8일 붕따우	\n![video](https://vungtau.blog/objects/uploads/cd7bbe70-fe53-4f62-811b-4a5237f6ead5)\n\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-10 03:23:39.152329	2026-02-10 03:23:39.152329	f	7
53	핫포토존에서	![이미지](https://vungtau.blog/objects/uploads/ee9b20f6-4c05-4983-a086-b9af38bf14a8)\n\n\n![이미지](https://vungtau.blog/objects/uploads/ed857d9a-a91e-4770-a6d0-282b64e79624)\n\n\n![이미지](https://vungtau.blog/objects/uploads/86c24c37-8c44-41e8-94b8-be2e8b874cd0)\n\n\n![이미지](https://vungtau.blog/objects/uploads/01a03ac5-a949-4dda-ad52-d3e6dd2deff7)\n\n\n![이미지](https://vungtau.blog/objects/uploads/faeaba87-5e9d-454b-9be6-90b80ffca24a)\n\n\n![이미지](https://vungtau.blog/objects/uploads/30d1278a-75ee-426b-ba5f-3297a1a78bee)\n\n\n![이미지](https://vungtau.blog/objects/uploads/9932c1a3-3682-4756-a410-38e54c464ca8)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-07 03:20:14.364961	2026-03-07 03:20:14.364961	f	5
56	붕따우 바닷가 노을을 배경으로	![이미지](https://vungtau.blog/objects/uploads/6f1d589b-db29-4ae1-be88-7e28526552a0)\n\n\n![이미지](https://vungtau.blog/objects/uploads/fb7f256d-15ce-4809-a2ab-acc1238dd321)\n\n\n![이미지](https://vungtau.blog/objects/uploads/5fe68618-b07f-47bc-b721-8b395c5012e6)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-08 05:20:33.893244	2026-03-08 05:20:33.893244	f	2
31	2월12일 붕따우	설 준비가 한창이네요~^^\n![video](https://vungtau.blog/objects/uploads/ba118c4a-cf58-4412-a674-7cadaf5b3319)\n\n\n	/objects/uploads/51608f18-1e1d-48d6-8844-df82e58529d9	kakao_4725775455	붕따우 도깨비	2026-02-12 04:37:00.141545	2026-02-12 04:37:00.141545	f	1
40	아름다운 붕따우 해변가	https://m.blog.naver.com/vungtausaver/224187857827	\N	kakao_4725775455	붕따우 도깨비	2026-02-19 01:41:45.533607	2026-02-19 01:41:55.739	f	2
46	베트남 대나무 담배	\n![video](https://vungtau.blog/objects/uploads/f4d41683-901d-4793-99e5-59087939ee8c)\n\n\n\n\n![video](https://vungtau.blog/objects/uploads/0e3249cb-89af-4c94-b1cf-5aefd1a29750)\n\n니코틴 폭탄	/objects/uploads/fb493eda-e43b-4c0f-9a44-1dc579ae19d7	kakao_4725775455	붕따우 도깨비	2026-02-22 12:54:14.69142	2026-02-22 12:54:14.69142	f	3
41	2월19일 붕따우	\n![video](https://vungtau.blog/objects/uploads/80decbd0-c09a-4648-9003-1e437ddcecf6)\n\n\n	/objects/uploads/7c6b9e94-f83e-4c4d-8476-e7a2b669b401	kakao_4725775455	붕따우 도깨비	2026-02-19 03:39:55.89356	2026-02-19 03:39:55.89356	f	3
59	붕따우 프론트 비치	![이미지](https://vungtau.blog/objects/uploads/f867f556-0f8d-4550-bce8-dcbe96e70b74)\n\n\n![이미지](https://vungtau.blog/objects/uploads/56841a70-3edc-4894-8898-70d98b029156)\n\n\n![이미지](https://vungtau.blog/objects/uploads/9b292646-f41d-48c3-baa1-45a7287b8924)\n\n\n![이미지](https://vungtau.blog/objects/uploads/254ab12c-d0b0-4f56-b15e-4e40387cb66e)\n\n\n![이미지](https://vungtau.blog/objects/uploads/4d7e1bdf-800d-4c2d-8e44-e3cc7f74624b)\n\n\n![이미지](https://vungtau.blog/objects/uploads/9336fc53-8c91-4eb5-9a9e-c4a2f6b4b08a)\n\n\n![이미지](https://vungtau.blog/objects/uploads/916f6b10-2e80-432e-ba2e-e06925ff016d)\n\n\n![이미지](https://vungtau.blog/objects/uploads/2f784c79-0b27-430d-8427-514974d5db40)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-09 11:02:59.145582	2026-03-09 11:02:59.145582	f	2
29	2월 10일 붕따우	\n![video](https://vungtau.blog/objects/uploads/b41eed02-ce32-475d-a2b5-24ec1af96f06)\n\n\n	/objects/uploads/ffcfb971-b154-403a-b0e3-a0719e16e0dd	kakao_4725775455	붕따우 도깨비	2026-02-10 18:38:48.575431	2026-02-10 18:38:48.575431	f	3
22	붕따우 셀러 모임	https://m.blog.naver.com/vungtausaver/224174170809	\N	kakao_4725775455	붕따우 도깨비	2026-02-06 07:50:23.318115	2026-02-06 07:50:23.318115	f	1
50	베트남 붕따우 팔레이스 카지노 이벤트 바우처지급(100불)	Palace 카지노 \nhttps://vungtau.blog/guide?p=76\n\n\n붕따우 카지노 팔레이스에서 \n2월 26,27,28일 매일 오후8시에 오시면 \n바우처 100불씩 드려요~^^\n\n\n자세한 문의사항은 고객센터나 카톡 문의 부탁드려요\n카톡 ID : vungtau 	\N	kakao_4725775455	붕따우 도깨비	2026-02-26 02:19:32.226338	2026-02-26 05:12:47.973	f	6
51	붕따우 핫 포토존	![이미지](https://vungtau.blog/objects/uploads/ece2c731-2585-449a-a0b6-008380161f94)\n\n\n![이미지](https://vungtau.blog/objects/uploads/dbeb392c-20f2-4abd-9754-4a99f448166c)\n\n\n![이미지](https://vungtau.blog/objects/uploads/8deb24f5-ce7a-49e9-be89-136a24d55827)\n\n![이미지](/objects/uploads/4aa03427-bbdf-41c3-8232-901a5e68d143)\n\n![이미지](/objects/uploads/049ca5e6-75c9-420e-96e4-e257699ea9db)\n\n![이미지](/objects/uploads/d12768b4-28b1-4de0-a30a-2098c6b855f2)\n\n사람들이 줄을 서서 찍네요~\n	\N	kakao_4725775455	붕따우 도깨비	2026-03-03 06:36:11.239392	2026-03-04 13:08:47.274	f	13
34	원숭이 물림 사고 주의	![이미지](https://vungtau.blog/objects/uploads/d2505cb6-36b3-49f9-8e3b-feeed5f83d83)\n![이미지](https://vungtau.blog/objects/uploads/dc6e2878-47cf-4a14-bec8-15ce3c25d3c9)\n![이미지](https://vungtau.blog/objects/uploads/cd71e83d-7b8d-4bd3-af49-a76fbdbe6e7f)\n요즘 원숭이 물림사고가 자주 일어나고 있어요. 원숭이산 올라갈때 조심하세요~ㅠ\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-12 10:32:09.13552	2026-02-12 10:32:09.13552	f	3
49	오늘따라 유난히 붉은 붕따우 노을	![이미지](https://vungtau.blog/objects/uploads/2c796b9d-2539-4404-8d20-fe2797874162)\n\n\n![이미지](https://vungtau.blog/objects/uploads/03f5d80b-2ff5-482a-b490-ae418cb0e685)\n\n\n![이미지](https://vungtau.blog/objects/uploads/a4f43c04-f2a6-40b0-b291-de7597363536)\n\n	\N	kakao_4725775455	붕따우 도깨비	2026-02-24 13:00:13.657312	2026-02-24 13:00:13.657312	f	2
\.


--
-- Data for Name: push_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.push_subscriptions (id, endpoint, created_at, user_id, p256dh, auth) FROM stdin;
19	https://fcm.googleapis.com/fcm/send/fI7yVANDPlo:APA91bHax3U2g_TXYvO2hrlXvPhpLtjwB38AjVvhZIKAYltl5Ll4BjU0c--eNx2NaCnjJ97TvavOye8pTQjr4oGZLR5mhH3BN5BGdhXGuHjE5JlBM4fUHeA20xPUTH3Pj3hqPQ8m3ZPJ	2026-02-08 22:31:07.217549	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	BNRKkvjIUhz8X5Fre_Xhci4Lv9S9ugb3OkWL6ycMTDejidvyM3dhQzDXIxoMDecYNEp8gGgmeb2wJo8P__4lI_A	5gVa4xIt6AW8vDFsKELeIg
23	https://fcm.googleapis.com/fcm/send/dp72scJKyfk:APA91bFkcRACRwQjtjH26srYJOj9KdZLUaGbMEgzgylwLBdFTgvIpv1dglj4fBjagqthMInqw3u5ShYWfZd_Mvrn0MwR7HUG5B6doHba3hu56fFqILONANei12ez_BsSu7Hz-1PWoyEm	2026-02-20 05:07:45.295079	kakao_4725775455	BFZ6_CUd9KzMYJX1JJ_WgqcKoWdC0WBtl5QJ2sCER5t0ECg-iHBUOQzEhePnBpHEGElXvHRPmLDym7sh97wHiN4	9igO3Ur3M94KpweMxHKu4A
24	https://jmt17.google.com/fcm/send/eu2dSF_osoM:APA91bFhUl_QnuoGGNrCCKifvHej6WGGPMKsQ-3jCuQaXlXdNSqqDrCjAtXCapbfGAppcSZN3QHKZvABgp9py1E8N0BbUa-_ZpWL0egiO8HkmucKc1xH1nNyDrelU0oDHnI9bBOJg6iv	2026-02-23 08:21:02.970198	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	BJoCgQY0pZ1s8GE9W-fXxmmq7rc1AQzGAaE7CPTioujHWWLTnR4JtUDtYnpZQhp_dQJWVVGRFhKjR4Pf-gQdirU	_YGNqPN8imT0k1YQSwWXiw
25	https://fcm.googleapis.com/fcm/send/cncbYDtT3Xw:APA91bFPF7aFY--staGWrxUejv0FJ92dd02CbCTkOVttf7hNsC0mUOgQHsIt0OOWFdSDYO_keSnaxpWciRhQjnE1JsO4XLmXd6NzruL-5czuFdZ6x4-imvVzSPwgRNZcXseVbQ9j-ug4	2026-03-05 06:53:08.50148	google:105130107752673204690	BLs8lA_XD97jij6HzFNrcGurLpxe6Y0bR1P-7LH6M06b6qb-FpC_LCrtBMU43xwDZ1q-KjSXE0oVEUVIWGK36kg	DPykRbd6bJLQouD_Dy1bWA
26	https://fcm.googleapis.com/fcm/send/eJGZdbVvPmM:APA91bFdU9lL9Je6UbQoxkgXS20Yf3h4iI3-hGNd6cWA33eU7tXSNv71dh6rrxSbFwV5WKUXqtBTlxvGzrkNl_UkaMMdkGVa5Xi802NsfknKuMl4VEUkbNQNnhV7A6WIB_H8Rii2Fedz	2026-03-10 10:05:22.32978	f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	BIbb2TMMK0Nic-K03solwD4HTrcaFjdMrqCyKV_loL2KB_F5irgGgeZCCBrJe4ItsySTlXLUtwFNOgHOvlivkuw	07mRHJVKga9Eb-lyH3aFZQ
\.


--
-- Data for Name: quote_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quote_categories (id, name, description, image_url, price_per_unit, unit_label, is_active, sort_order, created_at, updated_at, images, options) FROM stdin;
1	낚시투어	붕따우 보트타고 관광하고 낚시도 하며, 식사(별도)도 즐길 수 있는 투어 코스입니다. 종류 선택시 상세설명 표시	/api/public-images/place_1770529797330_n0rxed.jpg	0	팀	t	0	2026-02-08 05:50:13.028735	2026-03-08 14:47:33.487	{/api/public-images/place_1770529797330_n0rxed.jpg,/api/public-images/place_1770529802399_48z4o.jpg,/api/public-images/place_1772981242010_aj18vo.jpg,/api/public-images/place_1772981243287_8gf8f.jpg,/api/public-images/place_1772981244075_mahjf.jpg,/api/public-images/place_1772981244899_bdeljo.jpg,/api/public-images/place_1772981245781_z5ibm.jpg,/api/public-images/place_1772981246755_or2r7j.jpg}	[{"name":"모터보트투어(4시간,최대 10인)","price":220,"description":"9시 미팅 구명조끼 착용 및 기타장비 채비\\n모터보트 탑승\\n약 50~60분간 붕따우 서쪽을 따라 관광\\n(조선소, 해안 경비대 선박, 해군 함정, 어업 순찰선을 둘러볼 수 있으며, 특히 해안 도시 서쪽의 걸프-강 항로를 따라 펼쳐진 국내 최대 규모의 현대적인 석유 및 가스 산업 단지의 탁 트인 경관을 감상할 수 있습니다.)\\n\\n9시 50분 굴양식장 방문\\n\\n10시 15분 카누체험\\n\\n12시 수상식당에 해산물 식사(식대 별도)\\n낚시가능(낚싯대 대여 15만동/1개)\\n\\n13시 30분 항구로 복귀"},{"name":"통통배 낚시(6시간,최대12인)","price":180,"description":"배내에서 식사가능.\\n간단한 조리기구 구비.\\n낚싯대 3개,미끼 제공 추가시(100k/1개)\\n간이화장실 있음.\\n\\n손님 준비사항\\n주류,물,기타음료,1회용 용기 및 젓가락,기타음식"},{"name":"통통배 낚시(10시간,최대12인)","price":250,"description":"배내에서 식사가능.\\n간단한 조리기구 구비.\\n낚싯대 3개,미끼 제공 추가시(100k/1개)\\n\\n손님 준비사항\\n주류,물,기타음료,1회용 용기 및 젓가락,기타음식"}]
\.


--
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quotes (id, customer_name, total_price, breakdown, created_at, user_id, deposit_paid, check_in_date, check_out_date, memo, deposit_amount, memo_images, eco_picks, assigned_by, user_memo, assigned_users, people_count, eco_confirmed, completed, completed_at, eco_confirmed_picks, eco_unavailable_profiles, vehicle_images) FROM stdin;
21	임지혜님	800	{"golf": {"price": 0, "description": ""}, "guide": {"price": 0, "description": ""}, "total": 800, "villa": {"price": 800, "rooms": 6, "checkIn": "2026-04-29", "details": ["4/29(수,평일): $300", "4/30(목,공휴일): $500"], "villaId": 21, "checkOut": "2026-05-01", "villaName": "6룸 풀빌라"}, "ecoGirl": {"price": 0, "details": [], "selections": [], "description": ""}, "vehicle": {"price": 0, "description": ""}, "fastTrack": {"price": 0, "description": ""}, "customCategories": []}	2026-03-10 08:46:45.825088	kakao_4725775455	t	2026-04-29	2026-05-01	19.5tr villa a3\n\n8tr coc\n\n11.5tr 체크인시\n\n	400	[]	{}	kakao_4725775455		["kakao_4725775455", "f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361", "kakao_4789723415", "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0"]	17	t	f	\N	{}	[]	[]
1	주원석	3040	{"golf": {"price": 1400, "description": "2026-03-14 / 쩌우득 [티업:11:00] / $120 x 4명 = $480 (캐디팁: 50만동/인) | 2026-03-15 / 파라다이스 [티업:11:00] / $100 x 4명 = $400 (캐디팁: 40만동/인) | 2026-03-16 / 호짬 [티업:08:06] / $130 x 4명 = $520 (캐디팁: 50만동/인)"}, "guide": {"price": 0, "description": ""}, "total": 3040, "villa": {"price": 720, "checkIn": "2026-03-14", "details": ["토요일: $470", "일요일(평일): $250"], "villaId": 21, "checkOut": "2026-03-16", "villaName": "6룸 풀빌라"}, "ecoGirl": {"price": 440, "details": ["2026-03-15: 12시간 x 2명 x $220 = $440"], "selections": [{"date": "2026-03-15", "count": 2, "hours": "12"}], "description": "1일"}, "vehicle": {"price": 480, "description": "2026-03-14: 9인승 리무진 (픽드랍+시내) $240 | 2026-03-16: 9인승 리무진 (픽드랍+시내) $240"}, "fastTrack": {"price": 0, "description": ""}}	2026-01-26 20:22:12.480339	kakao_4763895380	t	2026-03-14	2026-03-16	카플\n\nJOO WONSEOK\nBYUN YONGHYUN\nLEE CHANGHYUN\nKANG YOHWAN\n14 쩌우득\n11시 확정\n2.7tr/4pax\n10.8tr 결제완료\n\n15일 파라다이스\n11:00시 확정\n2.6tr/4pax\n10.4tr\n\n16 호짬\n8시06분확정\n3.5tr/4pax\n14tr 결제완료\n\n14/3\nsaigon đi sân gôn châu Đức sau đó đi Vũng Tàu \n\n16/3\nVũng Tàu đi Hồ Tràm sau đó đi saigon \n\n6tr\n\na2 풀빌라\n16tr\n\n10tr 예약금 완료	1300	[]	{"2026-03-15": [{"first": 27, "third": 97, "second": 24}, {"first": 20, "third": 22, "second": 21}], "personNames": ["A", "B", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]}	kakao_4725775455		["kakao_4763895380"]	4	t	f	\N	{"2026-03-15": {"0": 27, "1": 20}}	[19, 40]	["/api/public-images/place_1773123034261_ea37r8j.jpg", "/api/public-images/place_1773123035132_0lymu.jpg"]
\.


--
-- Data for Name: real_estate_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.real_estate_categories (id, label_ko, label_en, label_zh, label_vi, label_ru, label_ja, color, gradient, icon, sort_order, is_active, created_at, updated_at) FROM stdin;
the_maris	아파트 분양	The maris					#64748b	from-gray-600 to-gray-700	Building	0	t	2026-02-26 07:23:28.92826	2026-02-26 18:08:26.211
the_song	아파트 임대	더솜 the song					#64748b	from-gray-600 to-gray-700	Building	1	t	2026-02-26 17:39:15.768201	2026-02-26 18:08:26.258
house_villa_rental	주택,빌라 임대	주택,빌라 임대					#64748b	from-gray-600 to-gray-700	Building	2	t	2026-02-26 18:01:47.488292	2026-02-26 18:08:26.301
commercial	상가 및 식당 임대	상가					#64748b	from-gray-600 to-gray-700	Building	3	t	2026-02-26 17:43:55.903413	2026-02-26 18:08:26.344
\.


--
-- Data for Name: real_estate_listings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.real_estate_listings (id, name, category, description, main_image, images, latitude, longitude, address, phone, website, opening_hours, price_range, tags, is_partner, discount_text, menu_images, is_active, sort_order, created_at, updated_at, website_label) FROM stdin;
11	Lapen center	the_maris	라펜 센터 아파트,\n\nDt: 75m2\n\n침실 2개, 욕실 2개\n\n도시 전망. 고층. 풀옵션 가구 완비.\n\n희망 판매가격 31억 5천만 VND	/api/public-images/place_1772278885337_vx234g.jpg	["/api/public-images/place_1772278885337_vx234g.jpg", "/api/public-images/place_1772278886996_clro2h.jpg", "/api/public-images/place_1772278888526_ey6uxm.jpg", "/api/public-images/place_1772278889488_0kn36.jpg", "/api/public-images/place_1772278890397_l6mgc.jpg"]	10.370030	107.084819						[]	f		[]	t	30	2026-02-28 11:42:28.252135	2026-02-28 11:42:34.444	
2	The maris 60m2	the_maris	60~101m2	/api/public-images/place_1772093124680_fuu8xm.jpg	["/api/public-images/place_1772090527974_4fys8e.jpg", "/api/public-images/place_1772090528953_oxfrey.jpg", "/api/public-images/place_1772090532117_s7dtfw.jpg", "/api/public-images/place_1772090532782_o9hfac.jpg", "/api/public-images/place_1772090533591_li4tr.jpg", "/api/public-images/place_1772090534613_9hjccbg.jpg", "/api/public-images/place_1772090536288_d5meb.jpg", "/api/public-images/place_1772090537000_qscjbg.jpg", "/api/public-images/place_1772090537813_ciikcd.jpg", "/api/public-images/place_1772090538618_nkm7e5.jpg", "/api/public-images/place_1772093121384_t8oev.jpg", "/api/public-images/place_1772093122385_ceo8w.jpg", "/api/public-images/place_1772093123310_6ei6q.jpg", "/api/public-images/place_1772093124680_fuu8xm.jpg", "/api/public-images/place_1772093126248_thlbzh.jpg"]					https://360.themaris.vn/#tongquan_banngay			[]	f		[]	t	20	2026-02-26 07:22:31.688663	2026-02-28 11:42:34.4	360도 보기
6	식당임대	commercial	15m x 25m\n\n월세 3천만동\n보증금 월세 2개월치\n\n현재 영업중인 베트남 식당	/api/public-images/place_1772128366426_fpufl.jpg	["/api/public-images/place_1772128366426_fpufl.jpg"]	10.350142	107.084968						[]	f		[]	t	0	2026-02-26 17:53:11.406436	2026-02-26 17:53:11.406436	
5	건물임대	commercial	3층건물 전체 임대\n7.5m x 22m\n월세 4,800만동\n보증금 월세 2달치\n\n임대 종류 : 스파, 미용실, 쇼룸, 전시 매장, 패션 매장, 사무실, 서비스 업종 등	/api/public-images/place_1772127869047_hwla62.jpg	["/api/public-images/place_1772127869047_hwla62.jpg"]	10.355712	107.078300						[]	f		[]	t	0	2026-02-26 17:46:19.107064	2026-02-26 17:53:27.567	
4	더솜 상가	commercial	더솜 아파트 1층 상가\n\n월세 2,800만동\n\n보증금 월세 2달치 5,600만동\n\n	/api/public-images/place_1772127754015_xizc6n.jpg	["/api/public-images/place_1772127754015_xizc6n.jpg", "/api/public-images/place_1772127754893_vcpdt.jpg", "/api/public-images/place_1772127755486_h58lye.jpg"]	10.349926	107.096415						[]	f		[]	f	30	2026-02-26 17:42:52.070051	2026-02-27 04:08:24.595	
10	Melody 아파트	the_song	멜로디 아파트 임대\n\n108m² - \n침실 3개 \n욕실 2개\n풀옵션\n→ 월 1천만 VND (장기 계약)	/api/public-images/place_1772129882563_ndyvdg.jpg	["/api/public-images/place_1772129882563_ndyvdg.jpg", "/api/public-images/place_1772129884048_cnbxog.jpg", "/api/public-images/place_1772129885548_ep1z2q.jpg", "/api/public-images/place_1772129886314_4hpxce.jpg", "/api/public-images/place_1772129887717_6gus6.jpg"]	10.337569	107.086075						[]	f		[]	t	80	2026-02-26 18:18:21.168135	2026-03-08 04:16:40.41	
7	Gold sea 방2개	the_song	방2 화장실2\n80m2\n고층\n월세 1천만동\n보증금 3천만동	/api/public-images/place_1772129014822_0kjpgb.jpg	["/api/public-images/place_1772129014822_0kjpgb.jpg", "/api/public-images/place_1772129018170_9n646p.jpg", "/api/public-images/place_1772129019736_xkcvq.jpg", "/api/public-images/place_1772129020614_kqv22l.jpg", "/api/public-images/place_1772129021575_tkc98r.jpg", "/api/public-images/place_1772129022529_tc2ed.jpg"]	10.334420	107.088068						[]	f		[]	t	20	2026-02-26 18:04:08.741875	2026-03-08 04:16:40.138	
1	The maris 49m2	the_maris	리조트 형식 49m2\n\nhttps://360.themaris.vn/#tongquan_banngay	/api/public-images/place_1772093095008_u5aib.jpg	["/api/public-images/place_1772090423611_kp5r9.jpg", "/api/public-images/place_1772090426808_gq91.jpg", "/api/public-images/place_1772090427851_52rtdt.jpg", "/api/public-images/place_1772090428621_inx24j.jpg", "/api/public-images/place_1772090429318_630ydr.jpg", "/api/public-images/place_1772090430039_9vlvu.jpg", "/api/public-images/place_1772093095008_u5aib.jpg", "/api/public-images/place_1772093096336_zxcekr.jpg", "/api/public-images/place_1772093097148_tschvc.jpg", "/api/public-images/place_1772093098020_e2ejd.jpg"]	10.378779	107.129958			https://360.themaris.vn/#tongquan_banngay			[]	f		[]	t	10	2026-02-26 07:20:40.834492	2026-02-28 11:42:34.356	360도 보기
12	3룸 풀빌라	house_villa_rental	3룸\n풀옵션ㆍ수영장\n월세 1,500만동	/api/public-images/place_1772627184547_lli21n.jpg	["/api/public-images/place_1772627184547_lli21n.jpg", "/api/public-images/place_1772627185500_m36yfp.jpg", "/api/public-images/place_1772627186051_y6is8d.jpg", "/api/public-images/place_1772627186668_pt89rg.jpg"]	10.335016	107.084674						[]	f		[]	t	20	2026-03-04 12:26:40.414687	2026-03-04 12:26:48.983	
9	미니 빌라 4룸	house_villa_rental	미니 빌라 임대\n\n총 2층\n침실 4개(1층에 1개 포함), 욕실 3개, \n차고 있음\n\n- 고급 가구\n\nDT 130m2\n\n- 가격: 월 2200만 VND.	/api/public-images/place_1772129692677_l8bpqhu.jpg	["/api/public-images/place_1772129692677_l8bpqhu.jpg", "/api/public-images/place_1772129694226_5dcod.jpg", "/api/public-images/place_1772129695884_odk165.jpg", "/api/public-images/place_1772129696919_evkath.jpg", "/api/public-images/place_1772129697650_qw0a5t.jpg"]	10.342575	107.079584						[]	f		[]	t	30	2026-02-26 18:15:18.258633	2026-03-04 12:26:49.027	
8	풀빌라 4룸	house_villa_rental	신축 건물, 총 3층, 면적 130m² (7x25)\n\n침실 4개, 욕실 4개, 거실 + 주방\n\n가구 완비, 에어컨 및 세탁기 포함.\n\n실내 수영장, 차고, 넓은 마당\n\n바다 전망 발코니가 있는 마스터 침실. \n임대료: 월 3,500만 VND\n보증금: 월세3달치	/api/public-images/place_1772129247692_pqvykq.jpg	["/api/public-images/place_1772129247692_pqvykq.jpg", "/api/public-images/place_1772129248712_bxoecg.jpg", "/api/public-images/place_1772129250203_7eljle.jpg", "/api/public-images/place_1772129251379_47zg5.jpg", "/api/public-images/place_1772129252292_plvsx3.jpg"]	10.353981	107.064863						[]	f		[]	t	10	2026-02-26 18:08:06.916593	2026-03-04 12:26:48.938	
3	The song 1rm	the_song	스튜디오식 아파트\n1달 8백만동\n관리비 1달 약 100만동\n루프탑 수영장, 헬스장, 사우나, 노래방, 탁구장,회의실\n	/api/public-images/place_1772127667540_b9l4kq.jpg	["/api/public-images/place_1772127662779_6ndyz.jpg", "/api/public-images/place_1772127664583_tfc1i8.jpg", "/api/public-images/place_1772127665800_cvx6aq.jpg", "/api/public-images/place_1772127666546_zibmhu.jpg", "/api/public-images/place_1772127667540_b9l4kq.jpg"]	10.349568	107.096220						[]	f		[]	t	90	2026-02-26 17:41:12.997776	2026-03-08 04:16:40.455	
18	Aria 아파트	the_song	아리아 붕따우 아파트 장기 임대\n침실 2개, 욕실 2개 아파트, 저층, 바다 전망\n면적: 90m², 새 가구 완비\n\n임대료: 월 1천만 VND\n\n해변 바로 옆, 도보 50m	/api/public-images/place_1772943365182_4p17w.jpg	["/api/public-images/place_1772943365182_4p17w.jpg", "/api/public-images/place_1772943367178_04xkol.jpg", "/api/public-images/place_1772943368790_7v7mz9.jpg", "/api/public-images/place_1772943370317_pys5qi.jpg", "/api/public-images/place_1772943371627_ny24k.jpg", "/api/public-images/place_1772943372709_yenv0s.jpg", "/api/public-images/place_1772943373836_4s1htf.jpg"]	10.375075	107.127547						[]	f		[]	t	40	2026-03-08 04:16:35.101619	2026-03-08 04:16:40.228	
17	OASKY 3룸	the_song	OASKY아파트 임대\n면적: 120m2\n침실 3개, \n침대 4개, \n추가 침대 1개, \n거실 1개, \n주방 1개, \n고층에 위치하여 아름다운 전망 제공.\n길 건너편에는 탐탕 타워 근처에 해변이 있습니다.\n임대료: 1,500만 VND	/api/public-images/place_1772891780484_hs2s99.jpg	["/api/public-images/place_1772891780484_hs2s99.jpg", "/api/public-images/place_1772891781106_a8g0hb.jpg", "/api/public-images/place_1772891781693_se026.jpg", "/api/public-images/place_1772891782269_e52af.jpg", "/api/public-images/place_1772891782834_9xmzmo.jpg"]	10.346289	107.095628						[]	f		[]	t	50	2026-03-07 13:56:44.534388	2026-03-08 04:16:40.274	
16	CSJ 1룸	the_song	CSJ 붕따우에 위치한 아파트 임대\n침실 1\n욕실 1개\n\n고층이라 탁 트인 전망을 즐길 수 있습니다.\n\n풀옵션\n\n장기 투숙객에게 적합\n\n월세 1,200만 VND	/api/public-images/place_1772891562153_1a1dz3.jpg	["/api/public-images/place_1772891562153_1a1dz3.jpg", "/api/public-images/place_1772891563011_y1b60f.jpg", "/api/public-images/place_1772891563525_2048jr.jpg", "/api/public-images/place_1772891564032_wnfw2c.jpg", "/api/public-images/place_1772891564754_66n5i.jpg", "/api/public-images/place_1772891565306_4fscxs.jpg"]	10.350961	107.099522						[]	f		[]	t	60	2026-03-07 13:52:52.887564	2026-03-08 04:16:40.319	
13	멜로디 아파트 1룸	the_song	멜로디 붕따우에 위치한 아파트 임대\n\n면적 59m2\n\n침실 1개와 욕실 1개\n\n풀옵션,고층\n\n가격은 월 650만 VND\n\n보증금 월세 2개월치	/api/public-images/place_1772628759128_4eqdqr.jpg	["/api/public-images/place_1772628758098_vkazfa.jpg", "/api/public-images/place_1772628759128_4eqdqr.jpg", "/api/public-images/place_1772628759960_phrpp.jpg", "/api/public-images/place_1772628760689_4vrhxi.jpg"]	10.337617	107.086027						[]	f		[]	t	70	2026-03-04 12:52:56.19718	2026-03-08 04:16:40.364	
14	골드씨 아파트 2룸	the_song	백비치 근처\n\n침실 2개\n화장실 2개\n풀옵션\n\n월세 1,000만동	/api/public-images/place_1772629209075_8wr9t9.jpg	["/api/public-images/place_1772629209075_8wr9t9.jpg", "/api/public-images/place_1772629209735_3fko2.jpg", "/api/public-images/place_1772629210539_emm2ws.jpg", "/api/public-images/place_1772629213428_bum9c.jpg", "/api/public-images/place_1772629214075_dhcnn.jpg", "/api/public-images/place_1772629214624_omxg8.jpg", "/api/public-images/place_1772629215224_gazs2d.jpg"]	10.334492	107.087588						[]	f		[]	t	10	2026-03-04 13:00:31.255969	2026-03-08 04:16:40.092	
15	Gateway 스튜디오	the_song	고층\n풀옵션\n월세 750만동\n	/api/public-images/place_1772649702950_pu4bfl.jpg	["/api/public-images/place_1772649702950_pu4bfl.jpg", "/api/public-images/place_1772649704050_8e69b.jpg"]	10.376052	107.111693						[]	f		[]	t	30	2026-03-04 18:41:53.916046	2026-03-08 04:16:40.183	
\.


--
-- Data for Name: saved_travel_plans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.saved_travel_plans (id, user_id, title, purpose, start_date, end_date, plan_data, created_at) FROM stdin;
1	google:105130107752673204690	붕따우 5일 남성 골프 & 밤문화 탐방	golf	2026-04-02	2026-04-06	{"days": [{"day": 1, "date": "2026-04-02", "theme": "붕따우 도착 및 휴식", "schedule": [{"lat": 10.8167, "lng": 106.6536, "note": "공항에서 붕따우까지 약 2~2.5시간 소요", "time": "18:00", "type": "transfer", "place": "떤선녓 국제공항", "placeVi": "Sân bay Quốc tế Tân Sơn Nhất", "activity": "호치민 떤선녓 국제공항 도착 및 붕따우 이동", "isPartner": false, "travelTime": "해당 없음", "discountText": "", "estimatedCost": 0}, {"lat": 10.353406, "lng": 107.09987, "note": "숙소 체크인", "time": "20:30", "type": "transfer", "place": "8룸 풀빌라", "placeVi": "8 Room Villa", "activity": "숙소 체크인 및 휴식", "isPartner": false, "travelTime": "20분", "discountText": "", "estimatedCost": 0}, {"lat": 10.340505, "lng": 107.078181, "note": "반콧, 반쎄오 전문. 넓은 공간에서 편안하게 식사 가능", "time": "21:30", "type": "restaurant", "place": "꼬바붕따우 2호점", "placeVi": "Cô Ba Restaurant 2", "activity": "가벼운 저녁 식사", "isPartner": false, "travelTime": "5분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 15}]}, {"day": 2, "date": "2026-04-03", "theme": "골프 라운딩 & 붕따우 야경", "schedule": [{"lat": 10.361374, "lng": 107.104397, "note": "도깨비 협력업체, 평일 $90, 주말 $110 (라운딩 비용)", "time": "08:00", "type": "golf", "place": "파라다이스 골프장", "placeVi": "Paradise Golf", "activity": "파라다이스 골프장 조식 및 라운딩", "isPartner": true, "travelTime": "20분", "discountText": "붕따우 도깨비 카톡으로 예약 시 할인", "estimatedCost": 110}, {"lat": 10.340767, "lng": 107.083885, "note": "베트남 대표 밥 요리인 껌땀 맛집", "time": "13:00", "type": "restaurant", "place": "로컬 식당 (껌땀)", "placeVi": "Quán Cơm Tấm Lọ Lem", "activity": "점심 식사", "isPartner": false, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 10}, {"lat": 10.347952, "lng": 107.078262, "note": "해변가 테라스에서 시원한 음료 즐기기", "time": "15:00", "type": "cafe", "place": "KATINAT 커피", "placeVi": "KATINAT Coffee", "activity": "시원한 카페에서 휴식", "isPartner": false, "travelTime": "10분", "discountText": "", "estimatedCost": 4}, {"lat": 10.334133, "lng": 107.077672, "note": "1910년 프랑스 식민지 시대 건설, 붕따우 전경 조망", "time": "17:00", "type": "attraction", "place": "붕따우 등대", "placeVi": "Hải Đăng Vũng Tàu", "activity": "붕따우 등대 방문 및 전망 감상", "isPartner": false, "travelTime": "20분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 2}, {"lat": 10.347139, "lng": 107.094755, "note": "야시장 분위기에서 신선한 해산물 즐기기", "time": "19:30", "type": "restaurant", "place": "해산물 야시장 로컬식당", "placeVi": "Hải Sản Cô Thy 2", "activity": "저녁 식사 (해산물)", "isPartner": false, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 20}, {"lat": 10.339938, "lng": 107.092457, "note": "라이브 음악과 함께 맥주 즐기기", "time": "21:30", "type": "nightlife", "place": "88 비어클럽", "placeVi": "88 Beer Club", "activity": "밤문화 즐기기", "isPartner": false, "travelTime": "5분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 20}]}, {"day": 3, "date": "2026-04-04", "theme": "붕따우 시내 관광 & 마사지", "schedule": [{"lat": 10.323611, "lng": 107.084181, "note": "811개 계단, 아름다운 해안 전경 감상 (복장 규정 준수)", "time": "09:00", "type": "attraction", "place": "붕따우 거대 예수상", "placeVi": "Tượng Chúa Kitô", "activity": "붕따우 거대 예수상 방문", "isPartner": false, "travelTime": "25분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 3}, {"lat": 10.347937, "lng": 107.079063, "note": "하노이 스타일 분짜 전문점", "time": "11:30", "type": "restaurant", "place": "분짜 하노이", "placeVi": "Bún Chả Hà Nội", "activity": "점심 식사 (분짜)", "isPartner": false, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 12}, {"lat": 10.350726, "lng": 107.068401, "note": "프랑스 총독의 여름 별장, 아름다운 정원과 바다 전망", "time": "13:30", "type": "attraction", "place": "화이트 펠리스(띠우 별장)", "placeVi": "Bạch Dinh (White Palace)", "activity": "화이트 펠리스(띠우 별장) 방문", "isPartner": false, "travelTime": "10분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 2}, {"lat": 10.352801, "lng": 107.087346, "note": "도깨비 협력업체, 1시간 코스", "time": "15:30", "type": "massage", "place": "Re.en 마사지", "placeVi": "Re.en Massage", "activity": "마사지 1시간", "isPartner": true, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 20}, {"lat": 10.353406, "lng": 107.09987, "note": "휴식", "time": "17:30", "type": "transfer", "place": "8룸 풀빌라", "placeVi": "8 Room Villa", "activity": "숙소 복귀 및 휴식", "isPartner": false, "travelTime": "10분", "discountText": "", "estimatedCost": 0}, {"lat": 10.329528, "lng": 107.08686, "note": "도깨비 협력식당, 예약 시 10% 할인", "time": "19:30", "type": "restaurant", "place": "이안 돌판 삼겹살", "placeVi": "I-AN", "activity": "저녁 식사 (한식)", "isPartner": true, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 10% 할인", "estimatedCost": 25}, {"lat": 10.347689, "lng": 107.075262, "note": "EDM 음악과 열정적인 분위기", "time": "21:30", "type": "nightlife", "place": "Revo 클럽", "placeVi": "Revo Club", "activity": "나이트클럽 또는 바 방문", "isPartner": false, "travelTime": "10분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 25}]}, {"day": 4, "date": "2026-04-05", "theme": "골프 라운딩 & 해변 휴식", "schedule": [{"lat": 10.612735, "lng": 107.180429, "note": "도깨비 협력업체, 평일 $80, 주말 $120 (라운딩 비용)", "time": "08:00", "type": "golf", "place": "쩌우득 골프장", "placeVi": "Chou Duc Golf", "activity": "쩌우득 골프장 조식 및 라운딩", "isPartner": true, "travelTime": "30분", "discountText": "붕따우 도깨비 카톡으로 예약 시 할인", "estimatedCost": 120}, {"lat": 10.35331, "lng": 107.064225, "note": "조개류 전문 해산물 식당", "time": "13:00", "type": "restaurant", "place": "해산물 식당", "placeVi": "Ốc Tự Nhiên 3", "activity": "점심 식사", "isPartner": false, "travelTime": "40분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 18}, {"lat": 10.342971, "lng": 107.095844, "note": "수영, 해양스포츠 및 해변 산책", "time": "15:00", "type": "beach", "place": "붕따우 백비치", "placeVi": "Bãi Sau", "activity": "붕따우 백비치에서 휴식", "isPartner": false, "travelTime": "15분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 0}, {"lat": 10.341439, "lng": 107.076212, "note": "신선한 해산물 구입 후 즉석 조리 가능", "time": "18:00", "type": "market", "place": "붕따우 해산물 시장", "placeVi": "Seafood Market", "activity": "붕따우 해산물 시장 구경 및 저녁 식사", "isPartner": false, "travelTime": "10분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 20}, {"lat": 10.349345, "lng": 107.074998, "note": "도깨비 협력업체, 외국인 전용 (여권 필수, 21세 이상)", "time": "20:30", "type": "casino", "place": "Monaco casino", "placeVi": "Monaco Casino", "activity": "카지노 체험", "isPartner": true, "travelTime": "5분", "discountText": "붕따우 도깨비 카톡으로 문의시 50불 바우처 지급", "estimatedCost": 100}]}, {"day": 5, "date": "2026-04-06", "theme": "마지막 쇼핑 및 출국", "schedule": [{"lat": 10.344948, "lng": 107.085542, "note": "현지 음식, 과일, 기념품 구입", "time": "09:00", "type": "market", "place": "붕따우 시장", "placeVi": "Chợ Vũng Tàu 1985", "activity": "붕따우 시장 방문 및 기념품 쇼핑", "isPartner": false, "travelTime": "10분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 15}, {"lat": 10.347728, "lng": 107.094875, "note": "추천 맛집, 진한 해산물 육수", "time": "11:00", "type": "restaurant", "place": "해산물 쌀국수", "placeVi": "Old Man Cali - Hủ tiểu Mực", "activity": "점심 식사", "isPartner": false, "travelTime": "10분", "discountText": "붕따우 도깨비 카톡으로 예약 시 5% 할인", "estimatedCost": 10}, {"lat": 10.353406, "lng": 107.09987, "note": "체크아웃", "time": "12:30", "type": "transfer", "place": "8룸 풀빌라", "placeVi": "8 Room Villa", "activity": "숙소에서 짐 정리 및 체크아웃", "isPartner": false, "travelTime": "5분", "discountText": "", "estimatedCost": 0}, {"lat": 10.346, "lng": 107.084, "note": "공항까지 약 2~2.5시간 소요", "time": "13:00", "type": "transfer", "place": "붕따우 시내", "placeVi": "Vũng Tàu City", "activity": "호치민 떤선녓 국제공항으로 이동", "isPartner": false, "travelTime": "10분", "discountText": "", "estimatedCost": 0}, {"lat": 10.8167, "lng": 106.6536, "note": "항공편 출발 2-3시간 전 도착 권장", "time": "15:30", "type": "transfer", "place": "떤선녓 국제공항", "placeVi": "Sân bay Quốc tế Tân Sơn Nhất", "activity": "호치민 떤선녓 국제공항 도착 및 출국 수속", "isPartner": false, "travelTime": "2시간 30분", "discountText": "", "estimatedCost": 0}]}], "tips": ["공항 이동 시 택시 또는 렌터카 서비스 이용 시 \\"붕따우 도깨비\\" 카톡 채널 문의하면 할인 혜택을 받을 수 있습니다.", "각 장소 예약 및 문의는 \\"붕따우 도깨비\\" 카톡 채널을 이용하면 편리하며, 할인 혜택도 받을 수 있습니다.", "붕따우의 건기 시즌은 날씨가 매우 좋지만, 낮에는 햇볕이 강할 수 있으니 자외선 차단제와 모자를 준비하세요.", "밤문화 업소 이용 시 여권 지참은 필수이며, 21세 이상만 출입 가능합니다. (카지노, 일부 클럽)", "베트남은 오토바이 통행량이 많으므로 길을 건널 때 항상 주의하고, 개인 소지품 관리에 신경 쓰세요."], "title": "붕따우 5일 남성 골프 & 밤문화 탐방", "summary": "붕따우에서 5일간 남성 친구 그룹과 함께 골프 라운딩, 맛집 탐방, 그리고 활기찬 밤문화를 즐기는 완벽한 일정입니다. 특히 협력업체 할인 혜택을 활용하여 가성비 높은 여행을 경험할 수 있습니다. 골프와 휴식을 균형 있게 즐기며 잊지 못할 추억을 만들어 보세요.", "weatherNote": "붕따우는 11월부터 4월까지 건기 시즌으로, 맑고 쾌적한 날씨 속에서 야외 활동과 해변을 만끽하기 좋습니다. 여행 기간 동안 쾌청한 날씨를 기대하며 즐거운 라운딩과 관광을 계획하세요.", "totalEstimatedCost": 950, "vehicleRecommendation": "이 일정은 총 7시간 이동이 필요합니다. 7인승 차량 예약을 추천드립니다."}	2026-03-05 07:51:54.231694
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (sid, sess, expire) FROM stdin;
0-J-EGeoaNeLauWD9zzsK4NVVwiRaWf2	{"cookie": {"path": "/", "secure": true, "expires": "2026-03-30T06:32:31.051Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": {"claims": {"sub": "kakao_4772362496", "email": "hny104@hanmail.net", "gender": "male", "last_name": "", "first_name": "케이밥&케이투어", "profile_image_url": null}, "provider": "kakao", "expires_at": 1772865150}}}	2026-03-30 06:32:32
ZuvCXUAqkfSpH-AwCs3-FqsgLmxQAJWT	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-01T13:33:57.779Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "kakaoState": "fe4beb1046072cc7254052f4e19dd861"}	2026-04-03 05:41:34
uSy4CWm4o1C6xWopadNc4zhDd2DST4MC	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-02T11:37:20.885Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": "kakao_4763895380"}}	2026-04-09 04:06:54
6N_X36f3Y68MiKPS1GcNn4s8IK6ho5ht	{"user": {"id": "570f6a44-c03d-4be3-8be5-24204b00e19e", "name": "붕따우4인방", "email": "kfckim@korea.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-08T06:06:49.719Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "570f6a44-c03d-4be3-8be5-24204b00e19e"}	2026-04-08 06:14:49
62xD24XFp-vMFWHr4qpdz6DCT7rua2q5	{"user": {"id": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0", "name": "d2271347", "email": "d2271347@gmail.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-02T11:47:30.958Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0"}	2026-04-02 12:18:04
k6Ngmcpu-aekMrNq050BtbXTqNzstJ6x	{"cookie": {"path": "/", "secure": true, "expires": "2026-03-30T06:32:32.464Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": {"claims": {"sub": "kakao_4772362496", "email": "hny104@hanmail.net", "gender": "male", "last_name": "", "first_name": "케이밥&케이투어", "profile_image_url": null}, "provider": "kakao", "expires_at": 1772865152}}}	2026-03-30 06:33:08
MXgurqRdpF8z6arWO6vjEtCvDwJ09zMM	{"cookie": {"path": "/", "secure": true, "expires": "2026-03-22T11:54:20.351Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "kakaoState": "ffad388148573c7403c69a2b5f5f2c87"}	2026-03-22 11:54:21
5d-fOMlaxIjt68h8CoLLLPfBE03dyWXH	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-08T03:14:55.406Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "kakaoState": "ff0b88ac197f52c29400b3fa3e67be86"}	2026-04-08 03:14:56
09itbK-qyCOE1BFOk4nErTgch2h00DTB	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-03T02:58:22.719Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": "kakao_4731861003"}}	2026-04-03 03:01:01
mmCw9DAXnwhfhsbRpmoCfkNi0k5fCMRs	{"user": {"id": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0", "name": "d2271347", "email": "d2271347@gmail.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-03-25T06:20:34.144Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0"}	2026-03-25 08:20:34
4oGvftjKSsvGV_1sX4UmECv3OyCZXnMX	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-08T06:09:57.002Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "kakaoState": "2a47e0eaec9d860013cccc3375278b73"}	2026-04-08 06:11:26
au-HKYGTP1E50RO5-Yl-zH4pm0plgugy	{"user": {"id": "f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361", "name": "임지혜", "email": "jihye3836@naver.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-09T10:05:12.506Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361"}	2026-04-09 11:19:41
IxoMMC2ctGIqH8U5mM33Te6qCdAA9L69	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-02T04:55:52.931Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": "kakao_4725775455"}}	2026-04-10 03:07:29
YdGvzu3Dh9YOsad13VHSroH6XuxTy8Oz	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-09T10:11:50.311Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": "kakao_4735869916"}}	2026-04-09 14:53:51
CGY2cdmd_6C9mUYdQR35sH_chYbu-K52	{"user": {"id": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0", "name": "d2271347", "email": "d2271347@gmail.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-02T11:53:15.769Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0"}	2026-04-09 11:19:41
1w1Vj8BEHn2Dor_6HzFRs6jEfZe6Mm7T	{"cookie": {"path": "/", "secure": true, "expires": "2026-04-04T06:52:14.305Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": "google:105130107752673204690"}}	2026-04-10 03:14:36
zEsUqJXnxPMV9jkJN2jNDwF1XhWqLEhU	{"user": {"id": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0", "name": "d2271347", "email": "d2271347@gmail.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-09T10:31:57.182Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "aa1e054d-f752-4e7c-b9bb-5a404a54f8a0"}	2026-04-10 09:04:20
hSaZ0dp0AiUnk6q7PU9Im4THYaoYtIo6	{"cookie": {"path": "/", "secure": true, "expires": "2026-03-31T05:29:22.750Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "passport": {"user": {"claims": {"sub": "kakao_4773928854", "email": "lswlsw73@gmail.com", "gender": "male", "last_name": "", "first_name": "이상우", "profile_image_url": null}, "provider": "kakao", "expires_at": 1772947762}}}	2026-03-31 05:34:35
469BryVtdrSqYUbDhtjhalkK6H2PZo1N	{"user": {"id": "f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361", "name": "임지혜", "email": "jihye3836@naver.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-09T10:04:06.127Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361"}	2026-04-09 12:56:53
tjlw5dBjD5fVomE1KUIUl4bCp2HiNAYV	{"user": {"id": "570f6a44-c03d-4be3-8be5-24204b00e19e", "name": "붕따우4인방", "email": "kfckim@korea.com", "profileImageUrl": null}, "cookie": {"path": "/", "secure": true, "expires": "2026-04-08T06:12:10.106Z", "httpOnly": true, "sameSite": "lax", "originalMaxAge": 2592000000}, "userId": "570f6a44-c03d-4be3-8be5-24204b00e19e"}	2026-04-08 15:41:31
\.


--
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_products (id, name, brand, price, quantity, description, image, images, benefits, ingredients, usage, caution, gradient, is_active, sort_order, created_at, updated_at) FROM stdin;
3	고커피	MAX HEALTH Go Coffee	40000	12포		/api/public-images/place_1771123900235_2h9198.png	{/api/public-images/place_1771123900235_2h9198.png}	{"에너지 증진","체중 감량","자연 성분"}	비유제품 크리머 분말, 인스턴트 커피, 녹색 영지 추출물 분말, 추출물, 말토덱스트린, 추출물 등	따뜻하게 마시기: 뜨거운 물 70ML에 커피 1~2포를 녹여 드세요. 시원하게 마시기: 뜨거운 물 70ML에 커피 2팩을 섞어준 후 얼음을 넣어 드세요.	하루에 2.5~3리터의 물을 마셔주세요. 음용중에는 각성제 섭취를 자제해 주세요.	from-gray-700 to-gray-900	t	2	2026-02-15 02:48:29.520116	2026-03-07 20:05:34.197
1	다이어트 커피	Pluscoffee Diet	45000	15개 (15일분)		/api/public-images/place_1771123840912_c30tfl.png	{/api/public-images/place_1771123840912_c30tfl.png}	{"체중 감량 지원","신진대사 촉진","자연 디톡스"}	녹차, 흰콩, L-카르니틴, DNF-10(효모 추출물), 인스턴트 커피, 코코아 분말, 코코넛 밀크 분말, 덱스트로스, 이눌린 섬유, 비유제품 크리머	아침식사 전 뜨거운물 50ML와 함께 1포를 물에 타서 섭취	임산부, 본 제품의 성분에 민감하거나 금기사항이 있는 사람은 사용하지 마십시오.	from-amber-500 to-orange-600	t	0	2026-02-15 02:48:29.520116	2026-03-07 20:05:29.875
2	고디톡스	Go Detox	38000	28알		/api/public-images/place_1771123885017_dcolun.png	{/api/public-images/place_1771123885017_dcolun.png}	{"자연 디톡스","체중 관리","피부 개선"}	복령 100mg, 연잎 100mg, 가르시니아 캄보지아 80mg, 은행 60mg, 사과식초 추출물 60mg, L-carnitine 40mg, Collagen 20mg	1일째 아침 공복에 1알, 2일째 아침 공복에 1알, 3일째부터 아침 공복에 2알씩	하루에 2.5~3리터의 물을 마셔주세요. 음용중에는 각성제 섭취를 자제해 주세요.	from-emerald-500 to-teal-600	t	1	2026-02-15 02:48:29.520116	2026-03-07 20:05:32.048
4	X3 디톡스	X3	38000	30개(15일분)	디톡스 20알 무료 증정\n유통기한 : 제조일로 부터 1년	/api/public-images/place_1772913741244_aocdg5.jpg	{/api/public-images/place_1772913741244_aocdg5.jpg,/api/public-images/place_1772913742194_g3mr8c.jpg,/api/public-images/place_1772913742942_hhgnhs.jpg,/api/public-images/place_1772913743641_6dfdi.jpg,/api/public-images/place_1772913744382_3h8ih.jpg}	{"체중조절,지방감소","허리, 허벅지 지방 감소","간 해독, 디톡스 작용","심장병, 콜레스테롤, 혈압 등 비만 병 예방"}		X3\n-아침 식사 30 분전 1 캡슐 섭취. \n-저녁식사 30 분 후 1 캡슐 섭취\n\n디톡스\n-취침 전 1알 섭취	주의 사항\n:\n-임산부, 심장병 환자 섭취 불가\n-신경 질환 (전정 장애, 기억 상실, 만성 두통, 뇌빈혈, 우울증, 뇌 손상 등), 당뇨병, 혈압, 간부전, 신부전 갑상선종, 암 환자\n-16 세 미만 또는 50 세 이상의 성인 섭취 금지	from-primary to-purple-600	t	3	2026-03-07 20:05:26.882479	2026-03-07 20:05:34.199
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.site_settings (id, key, value, updated_at) FROM stdin;
1	villa_price_note	가격은 방 오픈 갯수와 성수기(6,7,8,9월) 공휴일에 따라 상이 할 수 있습니다.\n※실 견적은 훨씬 저렴합니다.	2026-02-03 03:01:16.882
2	lowest_price_guarantee	최저가 보장! 어플가격이 더 싸다면 링크 보내주시면 더 저렴하게 부킹 해 드립니다.	2026-02-03 03:01:17.341
9	eco_price_12	220	2026-03-10 13:50:59.151
10	eco_price_22	380	2026-03-10 13:50:59.651
11	eco_description		2026-03-10 13:51:00.164
12	eco_image_url	/api/public-images/place_1771254452964_y1v3ee.jpg	2026-03-10 13:51:00.672
20	golf_paradise_weekday	90	2026-03-10 13:51:01.185
21	golf_paradise_weekend	110	2026-03-10 13:51:01.723
22	golf_paradise_tip	40만동	2026-03-10 13:51:02.191
23	golf_chouduc_weekday	90	2026-03-10 13:51:02.728
24	golf_chouduc_weekend	120	2026-03-10 13:51:03.359
25	golf_chouduc_tip	50만동	2026-03-10 13:51:03.835
26	golf_hocham_weekday	150	2026-03-10 13:51:04.355
27	golf_hocham_weekend	200	2026-03-10 13:51:04.876
28	golf_hocham_tip	50만동	2026-03-10 13:51:05.48
13	biz_enabled	false	2026-03-10 13:51:06.001
14	biz_name		2026-03-10 13:51:06.53
15	biz_number		2026-03-10 13:51:07.02
16	biz_owner	정기훈	2026-03-10 13:51:07.656
17	biz_address		2026-03-10 13:51:08.137
18	biz_phone		2026-03-10 13:51:08.652
19	biz_email		2026-03-10 13:51:09.158
29	tab_order	["calculator","planner","guide","board","shop","realestate","chat","expenses"]	2026-03-10 13:51:09.7
30	category_order	["eco","villa","vehicle","golf","custom-1","guide","fasttrack"]	2026-03-10 13:51:10.198
31	fake_visitor_range	{"min":1000,"max":1500}	2026-03-10 13:52:44.75
32	fake_member_range	{"min":5,"max":15}	2026-03-10 13:52:45.218
33	fake_member_count	924	2026-03-09 16:07:14.545885
34	fake_member_last_date	2026-03-11	2026-03-09 16:07:14.615406
3	hero_title	베트남 붕따우 도깨비	2026-03-10 13:50:56.093
4	hero_subtitle		2026-03-10 13:50:56.594
5	hero_description	베트남 붕따우 풀빌라,차량,골프,관광명소 소개,밤문화,실시간 견적,AI 일정생성,여행가계부,붕따우 소식,할인쿠폰,부동산,투자	2026-03-10 13:50:57.097
6	seo_title		2026-03-10 13:50:57.604
7	seo_description	베트남 붕따우 풀빌라,차량,골프,관광명소 소개,밤문화,실시간 견적,AI 일정생성,여행가계부,붕따우 소식,할인쿠폰,부동산,투자	2026-03-10 13:50:58.121
8	seo_keywords	베트남,붕따우,풀빌라,붕따우 풀빌라,베트남 풀빌라,붕따우 도깨비,밤문화,베트남 밤문화,붕따우 에코,베트남 골프,붕따우 골프장,붕따우 가라오케,붕따우 밤문화,쿠폰,베트남 카지노,붕따우 카지노,카지노 바우처,붕따우 임페리얼,부동산,투자	2026-03-10 13:50:58.614
\.


--
-- Data for Name: user_coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_coupons (id, user_id, coupon_id, is_used, used_at, issued_at) FROM stdin;
1	kakao_4731861003	1	f	\N	2026-02-03 10:47:46.107642
2	google:108651636810815709948	1	t	2026-02-03 17:39:56.375	2026-02-03 17:04:13.048763
5	kakao_4731861003	1	f	\N	2026-02-03 19:25:31.200046
3	google:108651636810815709948	1	t	2026-02-03 19:30:25.58	2026-02-03 18:00:11.977466
4	google:108651636810815709948	1	t	2026-02-03 19:30:27.467	2026-02-03 19:17:53.963406
6	google:108651636810815709948	1	t	2026-02-04 01:31:51.666	2026-02-03 19:31:02.659735
7	google:108651636810815709948	1	t	2026-02-04 01:31:53.949	2026-02-03 19:37:57.267041
8	google:108651636810815709948	1	f	\N	2026-02-04 01:34:02.036549
9	kakao_4725775455	1	t	2026-02-04 01:45:21.944	2026-02-04 01:35:22.683638
10	google:108651636810815709948	1	f	\N	2026-02-04 01:45:35.848005
11	google:108651636810815709948	1	f	\N	2026-02-04 04:27:29.19286
12	google:108651636810815709948	2	f	\N	2026-02-04 04:35:49.093333
13	google:108651636810815709948	3	f	\N	2026-02-04 05:19:24.87053
14	google:108455658112888249075	3	f	\N	2026-02-04 05:19:41.224867
15	google:108651636810815709948	3	f	\N	2026-02-04 05:38:12.540278
16	google:108651636810815709948	4	t	2026-02-04 06:07:30.951	2026-02-04 05:59:37.114366
17	google:108455658112888249075	4	f	\N	2026-02-04 08:26:02.505907
18	kakao_4725775455	4	t	2026-02-04 11:01:06.097	2026-02-04 08:26:08.894396
19	kakao_4725775455	4	t	2026-02-04 11:06:47.474	2026-02-04 11:01:31.776865
20	ea020e75-810c-478d-8d6f-18a77590b677	5	t	2026-02-04 11:11:24.815	2026-02-04 11:10:21.214512
21	ea020e75-810c-478d-8d6f-18a77590b677	5	t	2026-02-04 11:14:11.111	2026-02-04 11:12:51.594607
22	kakao_4729573414	5	f	\N	2026-02-04 11:15:00.347865
24	google:108455658112888249075	6	f	\N	2026-02-04 14:08:53.266304
25	ea020e75-810c-478d-8d6f-18a77590b677	6	f	\N	2026-02-05 03:25:03.68069
26	kakao_4734761654	6	t	2026-02-05 07:22:47.135	2026-02-05 03:30:55.239914
27	kakao_4734761654	6	t	2026-02-05 07:23:03.213	2026-02-05 07:13:07.511359
28	kakao_4734761654	6	t	2026-02-05 07:23:24.263	2026-02-05 07:19:58.398996
29	kakao_4734761654	6	t	2026-02-05 07:27:29.032	2026-02-05 07:27:00.217337
30	kakao_4735869916	6	f	\N	2026-02-05 14:38:05.701364
31	aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	6	f	\N	2026-02-06 09:05:12.827391
32	4c21e5a7-2196-4650-9b31-304870f4f330	6	f	\N	2026-02-07 07:01:41.478272
23	kakao_4725775455	6	t	2026-02-07 07:08:06.896	2026-02-04 14:03:59.884243
34	kakao_4725775455	7	t	2026-02-08 15:20:07.089	2026-02-08 14:52:59.510523
33	kakao_4725775455	7	t	2026-02-08 15:59:22.125	2026-02-08 13:17:53.219763
35	kakao_4729573414	7	f	\N	2026-02-08 17:39:17.381855
36	kakao_4741495121	6	f	\N	2026-02-09 03:48:41.300503
37	kakao_4741495121	7	f	\N	2026-02-09 03:48:41.353568
38	kakao_4745081898	6	f	\N	2026-02-11 04:47:22.637442
39	kakao_4745081898	7	f	\N	2026-02-11 04:47:22.693671
40	kakao_4725775455	8	f	\N	2026-02-11 05:30:33.793989
41	kakao_4725775455	9	f	\N	2026-02-11 06:00:30.633617
42	kakao_4745081898	7	f	\N	2026-02-11 10:24:16.744933
43	kakao_4725775455	12	f	\N	2026-02-14 12:48:16.418236
44	a0ba1066-13dd-458a-9bff-d533eb8ddd73	6	f	\N	2026-02-16 19:25:37.554646
45	a0ba1066-13dd-458a-9bff-d533eb8ddd73	7	f	\N	2026-02-16 19:25:37.606354
46	kakao_4731861003	6	f	\N	2026-02-17 02:24:28.199235
47	kakao_4731861003	7	f	\N	2026-02-17 02:24:28.25382
48	google:108455658112888249075	6	f	\N	2026-02-19 01:15:25.870871
49	google:108455658112888249075	7	f	\N	2026-02-19 01:15:25.918881
50	kakao_4763895380	6	f	\N	2026-02-23 05:59:01.083991
51	kakao_4763895380	7	f	\N	2026-02-23 05:59:01.130167
52	kakao_4772362496	6	f	\N	2026-02-28 06:32:30.741423
53	kakao_4772362496	7	f	\N	2026-02-28 06:32:30.796923
54	kakao_4773928854	6	f	\N	2026-03-01 05:29:22.298477
55	kakao_4773928854	7	f	\N	2026-03-01 05:29:22.49227
56	google:105130107752673204690	6	f	\N	2026-03-05 06:52:13.993999
57	google:105130107752673204690	7	f	\N	2026-03-05 06:52:14.047714
58	kakao_4725775455	13	f	\N	2026-03-05 08:48:15.968799
59	kakao_4725775455	14	f	\N	2026-03-05 08:49:55.072793
60	570f6a44-c03d-4be3-8be5-24204b00e19e	6	f	\N	2026-03-09 06:06:50.665972
61	570f6a44-c03d-4be3-8be5-24204b00e19e	7	f	\N	2026-03-09 06:06:50.725443
62	kakao_4789723415	6	f	\N	2026-03-10 10:02:23.256346
63	kakao_4789723415	7	f	\N	2026-03-10 10:02:23.304697
64	f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	6	f	\N	2026-03-10 10:04:06.282069
65	f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	7	f	\N	2026-03-10 10:04:06.329495
\.


--
-- Data for Name: user_locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_locations (id, nickname, latitude, longitude, place_name, place_category, message, expires_at, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, first_name, last_name, profile_image_url, created_at, updated_at, gender, nickname, birth_date, password, login_method, email_verified, email_verification_token, email_verification_expires, welcome_coupon_issued, is_admin, can_view_nightlife18, can_view_eco) FROM stdin;
kakao_4772362496	hny104@hanmail.net	케이밥&케이투어		\N	2026-02-28 06:32:30.636077	2026-02-28 06:32:32.239	male	케이밥&케이투어	\N	\N	kakao	t	\N	\N	t	f	t	f
kakao_4773928854	lswlsw73@gmail.com	이상우		\N	2026-03-01 05:29:22.20066	2026-03-01 05:29:22.20066	male	이상우	\N	\N	kakao	t	\N	\N	t	f	t	f
kakao_4725775455	vungtau1004@daum.net	도깨비(SaoViet)		\N	2026-01-31 03:22:00.039666	2026-03-03 04:55:52.694	\N	붕따우 도깨비	\N	\N	kakao	f	\N	\N	t	t	t	t
kakao_4763895380	jace00@naver.com	Joo		\N	2026-02-23 05:59:00.984701	2026-03-03 11:37:20.635	male	Joo	\N	\N	kakao	t	\N	\N	t	f	t	t
kakao_4731861003	soulcounter01@gmail.com	붕따우 도깨비		\N	2026-02-17 02:24:28.029173	2026-03-04 02:58:22.485	male	붕따우 도깨비	\N	\N	kakao	t	\N	\N	t	f	t	f
google:108455658112888249075	soulcounter486@gmail.com	trade	Vina	https://lh3.googleusercontent.com/a/ACg8ocJxChZ4-W1NWpPJzkrFh4pByYn0ygx0iSBDYZU0OUDwCd8YEg=s96-c	2026-02-19 01:15:25.770468	2026-02-19 01:15:25.770468	\N	\N	\N	\N	\N	f	\N	\N	t	f	f	f
google:105130107752673204690	hotramtour@gmail.com	Na	Seok Ho	https://lh3.googleusercontent.com/a/ACg8ocKZvvrJb_2p8OeePEi-8vpDDCjXgxHcJCePcrYe9M4ZVfC0Sw=s96-c	2026-03-05 06:52:13.894923	2026-03-05 06:52:13.894923	\N	\N	\N	\N	\N	f	\N	\N	t	f	f	f
kakao_4745081898	kyuphil9873@hanmail.net	정규필		\N	2026-02-11 04:47:22.534662	2026-02-11 04:47:30.917	male	정규필	\N	\N	kakao	t	\N	\N	t	f	f	f
570f6a44-c03d-4be3-8be5-24204b00e19e	kfckim@korea.com	\N	\N	\N	2026-03-09 06:03:24.298524	2026-03-09 08:12:51.116	male	붕따우4인방	\N	$2b$10$IkZtwupgMPYMZUuFML5W5.zWcSRyZUz.X54CCTwESCmwk39snA/SO	email	t	\N	\N	t	f	t	f
aa1e054d-f752-4e7c-b9bb-5a404a54f8a0	d2271347@gmail.com	\N	\N	\N	2026-02-05 07:04:50.110493	2026-03-09 09:41:48.229	male	d2271347	\N	$2b$10$iQEV8g/W12lByTwXDmuL8ehMEg7rJYTybTBQQKfRNdzVTa8h1530C	email	t	\N	\N	t	f	f	f
kakao_4729573414	erickimmm@gmail.com	카카오 사용자		\N	2026-02-02 06:19:36.468307	2026-02-17 02:18:45.197	\N	\N	\N	\N	\N	f	\N	\N	f	f	t	f
kakao_4789723415	jihye3836@nate.com	임쥐☆		\N	2026-03-10 10:02:23.157091	2026-03-10 10:02:23.157091	female	임쥐☆	\N	\N	kakao	t	\N	\N	t	f	f	f
f76c65ec-bc02-48d2-8ee4-eb3ffd3b3361	jihye3836@naver.com	\N	\N	\N	2026-03-10 10:03:45.943842	2026-03-10 10:03:45.943842	female	임지혜	\N	$2b$10$mzWN1jQoml1coLKyE8Dj5OrMoCk4sV0miPT/6yswz.FFUbYnUYekm	email	t	\N	\N	t	f	f	f
kakao_4735869916	nguyenngoctuyet1004@gmail.com	Snow99		\N	2026-02-05 14:38:05.596967	2026-03-10 10:11:50.081	female	\N	\N	\N	kakao	t	\N	\N	t	f	f	f
kakao_4741495121	oekcj55@naver.com	카카오 사용자		\N	2026-02-09 03:48:41.203403	2026-02-09 03:48:41.203403	male	카카오 사용자	\N	\N	kakao	t	\N	\N	t	f	f	f
\.


--
-- Data for Name: vehicle_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vehicle_types (id, key, name_ko, name_en, description_ko, description_en, city_price, oneway_price, hocham_oneway_price, phanthiet_oneway_price, roundtrip_price, city_pickup_drop_price, sort_order, is_active, created_at, city_label, oneway_label, hocham_oneway_label, phanthiet_oneway_label, roundtrip_label, city_pickup_drop_label, custom_routes, images) FROM stdin;
2	16_seater	16인승 밴	16-Seater Van	- 16인승 미니밴 차량(4~6인 추천, 최대 8인)|• 6인(골프백 6개 + 캐리어 6개)|• 9인(캐리어 9개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 16-Seater Minivan (Recommended for 4-6, max 8)|• 6 passengers (6 golf bags + 6 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges	130	130	130	180	250	190	2	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔붕따우(편도)	호치민 ↔호짬(편도)	호치민 ↔판티엣(편도)	호치민 ↔붕따우(왕복)	호치민 ↔붕따우(픽드랍+시내)	[]	["/api/public-images/place_1773123340601_7rh6m.jpg", "/api/public-images/place_1773123346263_06uzna.jpg"]
8	45_seater	45인승 버스	45-Seater Bus	- 45인승 대형 버스 차량(20인 이상 추천, 최대 40인)|• 20인(골프백 20개 + 캐리어 20개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 45-Seater Large Bus (Recommended for 20+, max 40)|• 20 passengers (20 golf bags + 20 suitcases)|• Driver included, no extra charges	280	290	290	394	550	410	8	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬(편도)	호치민 ↔ 판티엣(편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123564124_8ykw0n.jpg"]
6	16_lux_limo	16인승 럭셔리 리무진	16-Seater Luxury Limousine	- 16인승 미니밴 차량(10인 이상 추천, 최대 16인)|• 16인(골프백 16개 + 캐리어 16개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 16-Seater Minivan (Recommended for 10+, max 16)|• 16 passengers (16 golf bags + 16 suitcases)|• Driver included, no extra charges	280	280	280	381	530	400	6	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬(편도)	호치민 ↔ 판티엣 (편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123524693_8827ql.jpg", "/api/public-images/place_1773123528286_q23f6h.jpg", "/api/public-images/place_1773123530130_0i4sb.jpg"]
1	7_seater	7인승 SUV	7-Seater SUV	- 7인승 SUV 차량(2,3인 추천)|• 최대 4인+캐리어 4개|• 골프백 이용 시 최대 3인(골프백3개 + 캐리어 3개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 7-Seater SUV (Recommended for 2-3 people)|• Max 4 passengers + 4 suitcases|• With golf bags: max 3 passengers|• Pickup/drop-off at your requested location|• Driver included, no extra charges	100	80	80	130	150	120	1	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬 (편도)	호치민 ↔ 판티엣 (편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우(픽드랍+시내,편도)	[]	["/api/public-images/place_1773123289761_btdmca.jpg", "/api/public-images/place_1773123296830_tk86e9.jpg"]
4	9_lux_limo	9인승 럭셔리 리무진	9-Seater Luxury Limousine	- 9인승 럭셔리 리무진 차량(4~6인 추천, 최대 6인)|• VIP 인테리어, 편안한 좌석|• 4인(골프백 4개 + 캐리어 4개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 9-Seater Luxury Limo (Recommended for 4-6, max 6)|• VIP interior, comfortable seats|• Driver included, no extra charges	180	180	180	280	350	270	4	t	2026-02-24 19:12:45.528772	붕따우시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬 (편도)	호치민 ↔ 판티엣(편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123466145_1be0wj.jpg", "/api/public-images/place_1773123471487_lbze6.jpg"]
7	29_seater	29인승 버스	29-Seater Bus	- 29인승 미니밴 차량(10인 이상 추천, 최대 25인)|• 15인(골프백 15개 + 캐리어 15개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 29-Seater Bus (Recommended for 10+, max 25)|• 15 passengers (15 golf bags + 15 suitcases)|• Driver included, no extra charges	230	230	230	313	430	330	7	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬(편도)	호치민 ↔ 판티엣(편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123543067_f8u3z.jpg", "/api/public-images/place_1773123548340_ti89w.jpg"]
5	12_lux_limo	12인승 럭셔리 리무진	12-Seater Luxury Limousine	- 12인승 VIP리무진 밴 차량(6~8인 추천, 최대 8인)|• 6인(골프백 6개 + 캐리어 6개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 12-Seater VIP Limo Van (Recommended for 6-8, max 8)|• 6 passengers (6 golf bags + 6 suitcases)|• Driver included, no extra charges	250	250	250	340	480	350	5	t	2026-02-24 19:12:45.528772	붕따우 시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬 (편도)	호치민 ↔ 판티엣 (편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123493868_h61d8a.jpg", "/api/public-images/place_1773123498358_v9f40q.jpg", "/api/public-images/place_1773123505782_9yzzif.jpg", "/api/public-images/place_1773123510623_hfhgo.jpg"]
3	9_limo	9인승 일반 리무진	9-Seater Limousine	- 9인승 미니밴 차량(4~6인 추천, 최대 6인)|• 4인(골프백 4개 + 캐리어 4개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)	- 9-Seater Minivan (Recommended for 4-6, max 6)|• 4 passengers (4 golf bags + 4 suitcases)|• Driver included, no extra charges	160	150	150	210	290	220	3	t	2026-02-24 19:12:45.528772	붕따우시내	호치민 ↔ 붕따우 (편도)	호치민 ↔ 호짬 (편도)	호치민 ↔ 판티엣 (편도)	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우 (편도)픽드랍+시내	[]	["/api/public-images/place_1773123428326_jlk16.jpg", "/api/public-images/place_1773123438824_tfn789.jpg"]
9	travel	호치민 붕따우 투어	Tour	투어 상품\n여행일정\n\n○7시 호치민 호텔 픽업○\n붕따우 출발\n휴게소 들러서 간단한 식사 및 화장실\n\n○10시 붕따우 도착○\n관광지 관광(송빈성당,등대,예수상,화이트 펠리스, 전쟁박물관)\n\n○12~13시 점식식사○\n(반콧,해산물 쌀국수,베트남 가정식)\n\n○13시○\n백비치 산책 및 커피 타임\n\n○14시○\n관광지 관광(등대,예수상,화이트 펠리스, 전쟁박물관)\n\n○16시○\n커피타임 및 휴식(마싸지,이발소)\n\n○15시○\n호치민으로 출발~\n(호치민 시내 및 공항 드랍)\n\n※붕따우 투어\n(자유롭게 선택 가능)\n붕따우 예수상, 화아트 펠리스,\n전쟁박물관\n커피숍,식사​\n\n가고싶은 곳 선택해서 자유롭게 여행가능\n베트남 기사님이 케어\n한국이 안내원 필요하시면 따로 문의 주세요~^^\n\n※포함 사항\n기사님,호치민 픽업,드랍(기사팁 포함)\n10시간 렌트\n\n※불포함 사항\n관광지 입장료,식대,기타경비,가이드		130	250	280	220	0	0	9	t	2026-03-05 06:19:10.034029	7인승	9인승 리무진	9인승 VIP리무진	16인승 승합차	호치민 ↔ 붕따우 (왕복)	호치민 ↔ 붕따우(픽드랍+시내)	[]	[]
\.


--
-- Data for Name: villas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.villas (id, name, main_image, images, weekday_price, friday_price, weekend_price, latitude, longitude, address, notes, is_active, sort_order, created_at, updated_at, holiday_price, map_url, max_guests, bedrooms, amenities, is_best) FROM stdin;
2	10룸 풀빌라	/api/public-images/villa_1769856396388_p83m6y.jpg	["/api/public-images/villa_1769856396388_p83m6y.jpg", "/api/public-images/villa_1769856396729_ix7s8.jpg", "/api/public-images/villa_1769856396911_2vk3hm.jpg", "/api/public-images/villa_1769856397081_145sdh.jpg", "/api/public-images/villa_1769856397228_cym5tp.jpg", "/api/public-images/villa_1769856397433_2zbocg.jpg", "/api/public-images/villa_1769856397579_se8phg.jpg", "/api/public-images/villa_1769856397743_cl3ufu.jpg", "/api/public-images/villa_1769856397903_o1qac4.jpg", "/api/public-images/villa_1769856398059_b2tdo5.jpg", "/api/public-images/villa_1769856398227_aunesl.jpg", "/api/public-images/villa_1769856398416_ov21h.jpg", "/api/public-images/villa_1769856398585_h10enn.jpg", "/api/public-images/villa_1769856398777_gn5t6o.jpg", "/api/public-images/villa_1769856398961_vhl6md.jpg"]	400	430	540	10.336965	107.084465		거실 에어컨 없음	t	0	2026-01-31 10:47:56.540328	2026-01-31 17:27:46.709	580		25	10	["pool", "karaoke", "bbq", "downtown", "elevator"]	f
5	5룸 풀빌라	/api/public-images/villa_1769862263151_lwdt5.jpg	["/api/public-images/villa_1769862263151_lwdt5.jpg", "/api/public-images/villa_1769862263523_z5g3u.jpg", "/api/public-images/villa_1769862263728_xc75n9.jpg", "/api/public-images/villa_1769862263904_hdbmc.jpg", "/api/public-images/villa_1769862264076_a7qmwe.jpg", "/api/public-images/villa_1769862264233_nwvluc.jpg", "/api/public-images/villa_1769862264402_x8k47.jpg", "/api/public-images/villa_1769862264597_vh2p6h.jpg", "/api/public-images/villa_1769862264758_r0x3m.jpg", "/api/public-images/villa_1769862264964_ozfsdb.jpg", "/api/public-images/villa_1769862265190_4yiqw9.jpg", "/api/public-images/villa_1769862265359_lvjsu.jpg", "/api/public-images/villa_1769862265532_ww3x3a.jpg", "/api/public-images/villa_1769862265687_nj6msa.jpg", "/api/public-images/villa_1769862265846_3k035.jpg", "/api/public-images/villa_1769862266015_pu19jj.jpg", "/api/public-images/villa_1769862266185_d5qr1.jpg", "/api/public-images/villa_1769862266339_rl8oag.jpg", "/api/public-images/villa_1769862266485_5435ip.jpg", "/api/public-images/villa_1769862266647_g88xrs.jpg", "/api/public-images/villa_1769862266796_n5ccng.jpg", "/api/public-images/villa_1769862266994_99og1l.jpg", "/api/public-images/villa_1769862267154_5untg3j.jpg"]	500	530	800	10.374969	107.056340			t	0	2026-01-31 12:26:27.500925	2026-01-31 17:28:04.992	800		15	5	["pool", "portableSpeaker", "livingAC", "beach", "bbq"]	f
4	11룸 풀빌라	/api/public-images/villa_1769859616913_ugbzyp.jpg	["/api/public-images/villa_1769859616913_ugbzyp.jpg", "/api/public-images/villa_1769859617175_x5s0ad.jpg", "/api/public-images/villa_1769859617331_vo45pr.jpg", "/api/public-images/villa_1769859617479_8ysx2.jpg", "/api/public-images/villa_1769859617713_scgka6.jpg", "/api/public-images/villa_1769859617860_mlc4uj.jpg", "/api/public-images/villa_1769859618004_u3mad4.jpg", "/api/public-images/villa_1769859618159_7mygu.jpg", "/api/public-images/villa_1769859618413_bwn0ph.jpg", "/api/public-images/villa_1769859618568_s35pud.jpg"]	350	380	500	10.375854	107.126348		노래방,엘리베이터	t	-3	2026-01-31 11:41:12.700104	2026-02-06 09:28:47.082	550		30	11	["karaoke", "pool", "livingAC", "bbq", "outskirts", "elevator", "beach"]	t
1	8룸 풀빌라	/api/public-images/villa_1769849976375_qlusw.jpg	["/api/public-images/villa_1769849976375_qlusw.jpg", "/api/public-images/villa_1769849976696_lu6ib5.jpg", "/api/public-images/villa_1769849976860_u1ru8l.jpg", "/api/public-images/villa_1769849977011_xvt2ip.jpg", "/api/public-images/villa_1769849977170_d0enfb.jpg", "/api/public-images/villa_1769849977310_ijyoxk.jpg", "/api/public-images/villa_1769849977454_5otm83.jpg", "/api/public-images/villa_1769849977618_msjgsk.jpg", "/api/public-images/villa_1769849977761_kko9j.jpg"]	350	380	550	10.353706	107.099939		파라다이스 골프장 근처	t	-2	2026-01-31 09:01:37.363665	2026-01-31 17:40:56.868	580	https://maps.app.goo.gl/Ek7yCpcxFNqYDPM98	20	8	["pool", "bbq", "livingAC", "beach", "downtown", "portableSpeaker"]	f
7	6룸 풀빌라	/api/public-images/villa_1769877520317_ax35ss.jpg	["/api/public-images/villa_1769877520317_ax35ss.jpg", "/api/public-images/villa_1769877518402_4bah1k.jpg", "/api/public-images/villa_1769877518609_21k8g.jpg", "/api/public-images/villa_1769877518787_bdi76.jpg", "/api/public-images/villa_1769877518941_5wu0rf.jpg", "/api/public-images/villa_1769877519104_vstv5.jpg", "/api/public-images/villa_1769877519315_lzx00i.jpg", "/api/public-images/villa_1769877519479_z78lrj.jpg", "/api/public-images/villa_1769877519630_ac5qbg.jpg", "/api/public-images/villa_1769877519812_2ozm3o.jpg", "/api/public-images/villa_1769877519968_l18cw5.jpg", "/api/public-images/villa_1769877520143_ikfrmg.jpg"]	400	420	600	10.368044	107.062310		바닷가	t	0	2026-01-31 16:40:08.029392	2026-01-31 17:44:20.386	650		20	6	["pool", "portableSpeaker", "livingAC", "bbq", "beach", "karaoke"]	f
11	6룸 풀빌라(리조트)	/api/public-images/villa_1769878080944_xofkru.jpg	["/api/public-images/villa_1769878080944_xofkru.jpg", "/api/public-images/villa_1769878081144_dnyact.jpg", "/api/public-images/villa_1769878081314_3xmmr.jpg", "/api/public-images/villa_1769878081488_2vy6aw.jpg", "/api/public-images/villa_1769878081653_kv8pkd.jpg", "/api/public-images/villa_1769878081817_x4hy5g.jpg", "/api/public-images/villa_1769878082969_op7ma.jpg", "/api/public-images/villa_1769878083134_qw4duh.jpg", "/api/public-images/villa_1769878084049_eyftt.jpg"]	400	420	600	10.330725	107.082771			t	0	2026-01-31 16:49:13.439083	2026-01-31 17:29:57.805	650		20	6	["pool", "bbq", "livingAC", "portableSpeaker", "downtown"]	f
9	5룸 풀빌라	/api/public-images/villa_1769877747156_4xz80u.jpg	["/api/public-images/villa_1769877747156_4xz80u.jpg", "/api/public-images/villa_1769877747346_an6ook.jpg", "/api/public-images/villa_1769877747529_humy6.jpg", "/api/public-images/villa_1769877747668_ml51s7.jpg", "/api/public-images/villa_1769877747828_e7z1o.jpg", "/api/public-images/villa_1769877747973_5887d.jpg", "/api/public-images/villa_1769877748147_2b3h1l.jpg", "/api/public-images/villa_1769877748312_mynpc.jpg", "/api/public-images/villa_1769877748481_2btyzjc.jpg", "/api/public-images/villa_1769877748644_a7mplc.jpg", "/api/public-images/villa_1769877748841_fwf8b.jpg", "/api/public-images/villa_1769877749018_n52pgp.jpg", "/api/public-images/villa_1769877749177_s8n0ya.jpg", "/api/public-images/villa_1769877749357_oabpq.jpg", "/api/public-images/villa_1769877749511_0bo3ed.jpg", "/api/public-images/villa_1769877749709_kogktk.jpg", "/api/public-images/villa_1769877749869_po8aoq.jpg", "/api/public-images/villa_1769877750033_8gh51b.jpg", "/api/public-images/villa_1769877750223_bxodd.jpg", "/api/public-images/villa_1769877750375_rnxyt.jpg", "/api/public-images/villa_1769877750545_l93u9c.jpg"]	380	400	600	10.347980	107.074675		거실 에어컨 없음	t	0	2026-01-31 16:44:01.959101	2026-01-31 17:29:30.549	620		20	5	["pool", "karaoke", "bbq", "downtown"]	f
10	5룸 풀빌라	/api/public-images/villa_1769877963846_9zokb5.jpg	["/api/public-images/villa_1769877963846_9zokb5.jpg", "/api/public-images/villa_1769877964069_5z060q.jpg", "/api/public-images/villa_1769877964285_apn2kw.jpg", "/api/public-images/villa_1769877964450_xf4nq.jpg", "/api/public-images/villa_1769877964658_s72t24.jpg", "/api/public-images/villa_1769877964876_yj6ba.jpg", "/api/public-images/villa_1769877965062_1l7yz9.jpg", "/api/public-images/villa_1769877965228_olvepd.jpg", "/api/public-images/villa_1769877965393_7k9ppl.jpg", "/api/public-images/villa_1769877965582_59mqyy.jpg", "/api/public-images/villa_1769877965783_5si97f.jpg", "/api/public-images/villa_1769877965935_2k83u.jpg", "/api/public-images/villa_1769877966104_39dhpd.jpg", "/api/public-images/villa_1769877966300_t1ppum.jpg", "/api/public-images/villa_1769877966459_r0urm.jpg", "/api/public-images/villa_1769877966658_u73pvm.jpg", "/api/public-images/villa_1769877966801_3q9efn.jpg", "/api/public-images/villa_1769877966964_indcw.jpg", "/api/public-images/villa_1769877967154_ne53zr.jpg", "/api/public-images/villa_1769877967316_xeitgv.jpg", "/api/public-images/villa_1769877967590_b04jbs.jpg", "/api/public-images/villa_1769877967771_bwdyzd.jpg", "/api/public-images/villa_1769877967943_ke55ss.jpg", "/api/public-images/villa_1769877968095_6skkvw.jpg", "/api/public-images/villa_1769877968310_b8fpsa.jpg", "/api/public-images/villa_1769877968469_r16tn.jpg"]	350	380	550	10.374066	107.123546			t	0	2026-01-31 16:47:12.637608	2026-01-31 17:29:43.918	600		20	5	["pool", "livingAC", "portableSpeaker", "bbq", "beach", "outskirts"]	f
12	5룸 풀빌라	/api/public-images/villa_1769878207127_o6ym0o4.jpg	["/api/public-images/villa_1769878207127_o6ym0o4.jpg", "/api/public-images/villa_1769878207348_uy41e.jpg", "/api/public-images/villa_1769878207536_s9n1a.jpg", "/api/public-images/villa_1769878207717_6y1t2.jpg", "/api/public-images/villa_1769878207905_kmsmb5.jpg", "/api/public-images/villa_1769878208084_08g1eo.jpg", "/api/public-images/villa_1769878208270_rwtdzb.jpg", "/api/public-images/villa_1769878208442_7mv37.jpg", "/api/public-images/villa_1769878208629_ip9wps.jpg", "/api/public-images/villa_1769878208823_yyz8u.jpg", "/api/public-images/villa_1769878208993_4b8y0b.jpg", "/api/public-images/villa_1769878209167_hkfik.jpg", "/api/public-images/villa_1769878209354_x4l3z6.jpg", "/api/public-images/villa_1769878209604_h8gm97.jpg"]	300	350	450	10.365938	107.063171			t	1	2026-01-31 16:51:25.212792	2026-02-16 07:47:31.294	520		15	5	["pool", "portableSpeaker", "bbq", "livingAC", "beach"]	f
18	8룸 풀빌라	/api/public-images/villa_1769879120333_ezuu0m.jpg	["/api/public-images/villa_1769879120333_ezuu0m.jpg", "/api/public-images/villa_1769879120538_aylch.jpg", "/api/public-images/villa_1769879120705_2wf3b.jpg", "/api/public-images/villa_1769879120858_o0xnyj.jpg", "/api/public-images/villa_1769879121039_ujnl1.jpg", "/api/public-images/villa_1769879121184_9jmzpb.jpg", "/api/public-images/villa_1769879121327_bbm8tq.jpg", "/api/public-images/villa_1769879121485_hfy7a.jpg", "/api/public-images/villa_1769879121632_x7ec1f.jpg", "/api/public-images/villa_1769879121787_tnwp81.jpg", "/api/public-images/villa_1769879121944_shgoti.jpg", "/api/public-images/villa_1769879122113_l9smdv.jpg", "/api/public-images/villa_1769879122259_x2bqpk.jpg", "/api/public-images/villa_1769879122413_nnqyhj.jpg", "/api/public-images/villa_1769879122562_id0w74.jpg", "/api/public-images/villa_1769879122703_fzgx7.jpg", "/api/public-images/villa_1769879122863_jxj2w.jpg", "/api/public-images/villa_1769879123010_1sx5r.jpg", "/api/public-images/villa_1769879123163_8xk4fk.jpg", "/api/public-images/villa_1769879123339_qjj8z.jpg", "/api/public-images/villa_1769879123490_veyzz.jpg", "/api/public-images/villa_1769879123632_oj6u4.jpg", "/api/public-images/villa_1769879123814_whgu5.jpg", "/api/public-images/villa_1769879123972_xln8d.jpg", "/api/public-images/villa_1769879124140_zxbsmo.jpg", "/api/public-images/villa_1769879124335_7zuaol.jpg", "/api/public-images/villa_1769879124480_txmqfg.jpg", "/api/public-images/villa_1769879124683_hxf6b9.jpg", "/api/public-images/villa_1769879124843_vtuerb.jpg", "/api/public-images/villa_1769879125021_9xsqk.jpg", "/api/public-images/villa_1769879125209_qgbgla.jpg", "/api/public-images/villa_1769879125407_ya3ae5.jpg", "/api/public-images/villa_1769879125560_att5kl.jpg", "/api/public-images/villa_1769879125709_1pchw.jpg", "/api/public-images/villa_1769879125876_fb29di.jpg", "/api/public-images/villa_1769879126054_jpzh23.jpg", "/api/public-images/villa_1769879126225_tn4kq9.jpg"]	400	430	650				노래방,식기세척기,엘리베이터	t	0	2026-01-31 17:06:21.480766	2026-01-31 17:06:21.480766	680		25	8	[]	f
16	6룸 풀빌라	/api/public-images/villa_1769878893584_fkz3x.jpg	["/api/public-images/villa_1769878893584_fkz3x.jpg", "/api/public-images/villa_1769878893769_y8x18o.jpg", "/api/public-images/villa_1769878893936_bkz1zq.jpg", "/api/public-images/villa_1769878894120_lnzzdd.jpg", "/api/public-images/villa_1769878894287_cua6ch.jpg", "/api/public-images/villa_1769878894448_vb1ajb.jpg", "/api/public-images/villa_1769878894605_psqq7i.jpg", "/api/public-images/villa_1769878894758_z4zyk.jpg", "/api/public-images/villa_1769878894927_punz1.jpg", "/api/public-images/villa_1769878895074_3lsd44.jpg", "/api/public-images/villa_1769878895252_v7omrc.jpg", "/api/public-images/villa_1769878895439_rpv0y8.jpg", "/api/public-images/villa_1769878895605_cnea3p.jpg", "/api/public-images/villa_1769878895753_64l0ga.jpg", "/api/public-images/villa_1769878896000_lyso1.jpg", "/api/public-images/villa_1769878896155_xhkgzw.jpg", "/api/public-images/villa_1769878896342_z4wd8.jpg", "/api/public-images/villa_1769878896487_phcwwx.jpg", "/api/public-images/villa_1769878896637_thffyj.jpg"]	480	500	800	10.334802	107.074138		거실 에어컨 없음	t	0	2026-01-31 17:03:14.038803	2026-01-31 17:32:01.313	800		10	3	["pool", "bbq", "beach", "karaoke", "elevator"]	f
17	8룸 풀빌라	/api/public-images/villa_1769879036115_jvq8n2.jpg	["/api/public-images/villa_1769879036115_jvq8n2.jpg", "/api/public-images/villa_1769879036291_dkyt6k.jpg", "/api/public-images/villa_1769879036463_gyqnul.jpg", "/api/public-images/villa_1769879036656_dpetw.jpg", "/api/public-images/villa_1769879036830_snjakm.jpg", "/api/public-images/villa_1769879036961_ny9zzk.jpg", "/api/public-images/villa_1769879037126_z95sif.jpg", "/api/public-images/villa_1769879037404_v0np2l.jpg", "/api/public-images/villa_1769879037564_258l5i.jpg", "/api/public-images/villa_1769879037830_5zyy2q.jpg", "/api/public-images/villa_1769879037983_fj0im.jpg", "/api/public-images/villa_1769879038141_a9onqu.jpg", "/api/public-images/villa_1769879038703_pidxk.jpg", "/api/public-images/villa_1769879038860_nwl6oq.jpg"]	350	380	500	10.352636	107.097191			t	0	2026-01-31 17:04:42.328415	2026-01-31 17:32:22.759	550		10	3	["pool", "portableSpeaker", "bbq", "livingAC", "downtown"]	f
14	5룸 풀빌라	/api/public-images/villa_1769878495665_17xq2r.jpg	["/api/public-images/villa_1769878495665_17xq2r.jpg", "/api/public-images/villa_1769878495927_j62reo.jpg", "/api/public-images/villa_1769878496141_roohsi.jpg", "/api/public-images/villa_1769878496322_wle3we.jpg", "/api/public-images/villa_1769878496494_tign8l.jpg", "/api/public-images/villa_1769878496731_eshw3f.jpg", "/api/public-images/villa_1769878496922_tgpc6i.jpg", "/api/public-images/villa_1769878497097_wncrla.jpg", "/api/public-images/villa_1769878497260_xh5ty.jpg", "/api/public-images/villa_1769878497437_0shnl.jpg", "/api/public-images/villa_1769878497612_zpavpm.jpg", "/api/public-images/villa_1769878497779_1sr6wy.jpg", "/api/public-images/villa_1769878499485_fau14l.jpg", "/api/public-images/villa_1769878499662_9sf9q.jpg", "/api/public-images/villa_1769878499840_9j9rbg.jpg"]	380	400	750	10.354601	107.099215		거실 에어컨 없음	t	0	2026-01-31 16:55:57.442662	2026-02-06 08:33:36.443	800		15	5	["pool", "portableSpeaker", "beach", "outskirts", "bbq"]	f
6	8룸 풀빌라	/api/public-images/villa_1769877389917_lj1rhd.jpg	["/api/public-images/villa_1769877389917_lj1rhd.jpg", "/api/public-images/villa_1769877391714_xcdmz.jpg", "/api/public-images/villa_1769877390271_woq18r.jpg", "/api/public-images/villa_1769877390430_m5eh1.jpg", "/api/public-images/villa_1769877390581_rcy5e9.jpg", "/api/public-images/villa_1769877390740_deljhf.jpg", "/api/public-images/villa_1769877390948_lf0nu.jpg", "/api/public-images/villa_1769877391129_2mv1v7.jpg", "/api/public-images/villa_1769877391268_4bz6ih.jpg", "/api/public-images/villa_1769877391410_b9xk9e.jpg", "/api/public-images/villa_1769877391566_kwpn5g.jpg", "/api/public-images/villa_1769877391879_3w52db.jpg", "/api/public-images/villa_1769877392022_4o89x.jpg", "/api/public-images/villa_1769877392165_ad3r5.jpg", "/api/public-images/villa_1769877392339_vn4c9f.jpg", "/api/public-images/villa_1769877392508_3szozt.jpg", "/api/public-images/villa_1769877392648_hzkrz3.jpg", "/api/public-images/villa_1769877392837_d2ovu.jpg", "/api/public-images/villa_1769877392997_j6t0rnw.jpg", "/api/public-images/villa_1769877393132_r2voro.jpg", "/api/public-images/villa_1769877393276_so8tb.jpg", "/api/public-images/villa_1769877393416_dh1cq4.jpg", "/api/public-images/villa_1769877393573_w8wvqq.jpg", "/api/public-images/villa_1769877393733_r16d3j.jpg", "/api/public-images/villa_1769877393882_yf0fe.jpg", "/api/public-images/villa_1769877394022_ymc3us.jpg"]	350	380	550	10.373881	107.123940		노래방	t	0	2026-01-31 16:37:55.131681	2026-01-31 17:28:52.842	600		20	8	["karaoke", "pool", "bbq", "livingAC", "outskirts", "beach"]	f
8	5룸 풀빌라	/api/public-images/villa_1769877652255_yy6s3c.jpg	["/api/public-images/villa_1769877652255_yy6s3c.jpg", "/api/public-images/villa_1769877652485_cpps8q.jpg", "/api/public-images/villa_1769877652652_djc0vr.jpg", "/api/public-images/villa_1769877652836_wr80bb.jpg", "/api/public-images/villa_1769877652991_8euav7.jpg", "/api/public-images/villa_1769877653192_2mnzza.jpg", "/api/public-images/villa_1769877653351_rkngw6.jpg", "/api/public-images/villa_1769877653504_j5wwyg.jpg", "/api/public-images/villa_1769877653687_8d0win.jpg", "/api/public-images/villa_1769877653864_66353.jpg", "/api/public-images/villa_1769877654038_1oc48.jpg", "/api/public-images/villa_1769877654221_hc9e7.jpg", "/api/public-images/villa_1769877654556_iukqqe.jpg", "/api/public-images/villa_1769877654713_41j7am.jpg", "/api/public-images/villa_1769877654888_j21s8l.jpg", "/api/public-images/villa_1769877655085_cxfjkt.jpg", "/api/public-images/villa_1769877655314_mmn9rq.jpg", "/api/public-images/villa_1769877655504_weodkh.jpg", "/api/public-images/villa_1769877655706_g9xq6j.jpg", "/api/public-images/villa_1769877655884_r1fpx.jpg", "/api/public-images/villa_1769877656143_9xwtzm.jpg"]	350	380	480	10.353928	107.100020			t	0	2026-01-31 16:41:37.721249	2026-01-31 17:29:14.065	520		10	3	["pool", "portableSpeaker", "livingAC", "bbq", "downtown"]	f
13	25룸 호텔	/api/public-images/villa_1769878336914_m97s8n.jpg	["/api/public-images/villa_1769878336914_m97s8n.jpg", "/api/public-images/villa_1769878337098_ehz3ha.jpg", "/api/public-images/villa_1769878337289_572d2n.jpg", "/api/public-images/villa_1769878337474_bet3qk.jpg", "/api/public-images/villa_1769878337632_2ute3d.jpg", "/api/public-images/villa_1769878337784_iycjmr.jpg", "/api/public-images/villa_1769878337933_wqfwm.jpg", "/api/public-images/villa_1769878338075_42w3p.jpg", "/api/public-images/villa_1769878338223_b6fo7t.jpg", "/api/public-images/villa_1769878338389_hsw3q.jpg", "/api/public-images/villa_1769878338540_9oz7k.jpg", "/api/public-images/villa_1769878338695_94wgc.jpg", "/api/public-images/villa_1769878338839_jmqpwp.jpg", "/api/public-images/villa_1769878338986_f74g3r.jpg", "/api/public-images/villa_1769878339135_3h0n4j.jpg", "/api/public-images/villa_1769878339287_kkz5ib.jpg", "/api/public-images/villa_1769878339444_q47elq.jpg", "/api/public-images/villa_1769878339667_dlcitr.jpg", "/api/public-images/villa_1769878339812_qjcr6e.jpg", "/api/public-images/villa_1769878339972_vgs2i.jpg", "/api/public-images/villa_1769878340114_oeweg.jpg", "/api/public-images/villa_1769878340285_8aan3a.jpg", "/api/public-images/villa_1769878340472_pxv40c.jpg", "/api/public-images/villa_1769878340650_gmkzu.jpg"]	670	720	1050	10.375433	107.126493		호텔 전체 렌트\n루프탑 수영장, 노래방,사우나(이용료 별도),\n헬스장,	t	0	2026-01-31 16:54:13.50554	2026-01-31 17:30:29.353	1200		50	25	["pool", "bbq", "beach", "outskirts", "livingAC", "elevator", "karaoke"]	f
3	8룸 풀빌라	/api/public-images/villa_1769859523928_yuo2t.jpg	["/api/public-images/villa_1769859523928_yuo2t.jpg", "/api/public-images/villa_1769859524235_q0iy5.jpg", "/api/public-images/villa_1769859524401_7xsnlw.jpg", "/api/public-images/villa_1769859524547_83n286.jpg", "/api/public-images/villa_1769859524712_1nhluu.jpg", "/api/public-images/villa_1769859524906_67r2f4.jpg", "/api/public-images/villa_1769859525118_nor5bb.jpg", "/api/public-images/villa_1769859525277_8h6abc.jpg", "/api/public-images/villa_1769859525434_ras51.jpg", "/api/public-images/villa_1769859525582_jkab2s.jpg", "/api/public-images/villa_1769859525773_bwlwrw.jpg", "/api/public-images/villa_1769859525925_bzk4lnd.jpg", "/api/public-images/villa_1769859526077_wkl8wf.jpg", "/api/public-images/villa_1769859526333_hko47.jpg", "/api/public-images/villa_1769859526458_nsujc.jpg"]	350	380	600	10.350332	107.095412			t	-1	2026-01-31 11:39:30.742547	2026-01-31 17:40:48.276	650		20	8	["pool", "portableSpeaker", "livingAC", "downtown", "bbq"]	f
26	7룸 풀빌라	/api/public-images/villa_1770366652337_rwh3s.jpg	["/api/public-images/villa_1770366652337_rwh3s.jpg", "/api/public-images/villa_1770366652671_2ada7.jpg", "/api/public-images/villa_1770366652896_jcpnea.jpg", "/api/public-images/villa_1770366653077_ywon0o.jpg", "/api/public-images/villa_1770366653233_oepja.jpg", "/api/public-images/villa_1770366653458_g829dp.jpg", "/api/public-images/villa_1770366653643_c38mb.jpg", "/api/public-images/villa_1770366653807_gxmmdn.jpg", "/api/public-images/villa_1770366653963_jjl3fc.jpg", "/api/public-images/villa_1770366654111_xo6qcx.jpg", "/api/public-images/villa_1770366654259_bs538.jpg", "/api/public-images/villa_1770366654430_g2e8n9.jpg", "/api/public-images/villa_1770366654609_vqiqj.jpg", "/api/public-images/villa_1770366654776_urd1gq.jpg", "/api/public-images/villa_1770366654949_t0nuo.jpg", "https://storage.googleapis.com//objects/uploads/90838178-2e5d-48f0-b6e7-b1405e30f1d9"]	310	350	540	10.352614	107.097131		거실에어컨 X	t	0	2026-02-06 08:32:03.570746	2026-02-06 09:30:19.157	580		30	7	["pool", "karaoke", "bbq", "downtown", "elevator"]	f
15	11룸 풀빌라	/api/public-images/villa_1769878601510_17tssq.jpg	["/api/public-images/villa_1769878601510_17tssq.jpg", "/api/public-images/villa_1769878601869_ao1pjt.jpg", "/api/public-images/villa_1769878602096_akyqyd.jpg", "/api/public-images/villa_1769878602272_cahxlu.jpg", "/api/public-images/villa_1769878602518_5une50y.jpg", "/api/public-images/villa_1769878602804_ndkb6.jpg", "/api/public-images/villa_1769878603011_ped01d.jpg", "/api/public-images/villa_1769878603179_00hxgr.jpg", "/api/public-images/villa_1769878603341_9w16484.jpg", "/api/public-images/villa_1769878603532_34mdsj.jpg", "/api/public-images/villa_1769878603745_ccr35s.jpg", "/api/public-images/villa_1769878603916_9peoi9.jpg", "/api/public-images/villa_1769878604120_9y8b3w8.jpg", "/api/public-images/villa_1769878604325_17lule.jpg", "/api/public-images/villa_1769878604510_9cey0x.jpg", "/api/public-images/villa_1769878604702_wv4eob.jpg", "/api/public-images/villa_1769878604871_y4uycx.jpg", "/api/public-images/villa_1769878605093_i6qi9.jpg", "/api/public-images/villa_1769878605274_t71rwa.jpg", "/api/public-images/villa_1769878605454_u18tbo.jpg", "/api/public-images/villa_1769878605615_lq1ego.jpg", "/api/public-images/villa_1769878605787_s2qto.jpg", "/api/public-images/villa_1769878605970_q1of9k.jpg", "/api/public-images/villa_1769878606161_1v3lk.jpg", "/api/public-images/villa_1769878606360_g8901.jpg", "/api/public-images/villa_1769878606579_uqtjmb.jpg", "/api/public-images/villa_1769878606817_9knst.jpg", "/api/public-images/villa_1769878607047_eyt28gd.jpg"]	350	380	500	10.374359	107.124507		쌍둥이 빌라로 22룸까지 가능,엘레베이터,\n노래방	t	0	2026-01-31 17:00:36.042773	2026-01-31 17:31:08.8	550		30	11	["pool", "karaoke", "bbq", "beach", "livingAC", "outskirts", "elevator"]	f
20	6룸 풀빌라	/api/public-images/villa_1769880851591_zb982e.jpg	["/api/public-images/villa_1769880851591_zb982e.jpg", "/api/public-images/villa_1769880851865_8bi7x.jpg", "/api/public-images/villa_1769880852046_95psqn.jpg", "/api/public-images/villa_1769880852237_3u5vuf.jpg", "/api/public-images/villa_1769880852410_cm9e0a.jpg", "/api/public-images/villa_1769880852583_or9snt.jpg", "/api/public-images/villa_1769880852756_17ofyh.jpg", "/api/public-images/villa_1769880852915_5cwclz.jpg", "/api/public-images/villa_1769880853077_7of7ac.jpg", "/api/public-images/villa_1769880853235_tchqhb.jpg", "/api/public-images/villa_1769880853391_f708t.jpg", "/api/public-images/villa_1769880853553_qyq91.jpg", "/api/public-images/villa_1769880853722_7d2wv.jpg", "/api/public-images/villa_1769880853867_j7wyea.jpg", "/api/public-images/villa_1769880854061_ebgfo.jpg", "/api/public-images/villa_1769880854456_l8rqoa.jpg", "/api/public-images/villa_1769880854888_t9swkn.jpg", "/api/public-images/villa_1769880855034_rv3app.jpg", "/api/public-images/villa_1769880855184_7uwyv9.jpg", "/api/public-images/villa_1769880855341_bq9f7.jpg", "/api/public-images/villa_1769880855507_wm3o1.jpg", "/api/public-images/villa_1769880855648_k3foej.jpg", "/api/public-images/villa_1769880855805_888j5b.jpg", "/api/public-images/villa_1769880856021_czwino.jpg", "/api/public-images/villa_1769880856174_zrerjv.jpg", "/api/public-images/villa_1769880856354_e1ks3p.jpg", "/api/public-images/villa_1769880856556_oh7a99.jpg", "/api/public-images/villa_1769880856707_d6xar6.jpg", "/api/public-images/villa_1769880856861_obtkro.jpg", "/api/public-images/villa_1769880857010_x0hhjo.jpg", "/api/public-images/villa_1769880857180_ywoy7e.jpg", "/api/public-images/villa_1769880857342_3zjjo9.jpg", "/api/public-images/villa_1769880857509_zg8khc.jpg", "/api/public-images/villa_1769880857664_bome3u.jpg", "/api/public-images/villa_1769880857844_20sv6mj.jpg"]	430	450	700	10.336329	107.082802			t	-1	2026-01-31 17:35:23.586491	2026-01-31 17:41:37.445	750		20	6	["pool", "bbq", "portableSpeaker", "downtown"]	f
19	7룸 풀빌라	/api/public-images/villa_1769879221574_lcclb6.jpg	["/api/public-images/villa_1769879221574_lcclb6.jpg", "/api/public-images/villa_1769879221798_2ian5r.jpg", "/api/public-images/villa_1769879221968_lcy9pn.jpg", "/api/public-images/villa_1769879222134_gb9q9q.jpg", "/api/public-images/villa_1769879222287_rw99t.jpg", "/api/public-images/villa_1769879222445_t0y10e.jpg", "/api/public-images/villa_1769879222608_a3doqq.jpg", "/api/public-images/villa_1769879222775_pf84qr.jpg", "/api/public-images/villa_1769879222948_74fhb5.jpg", "/api/public-images/villa_1769879223112_0n3xnj.jpg", "/api/public-images/villa_1769879223270_txogan.jpg", "/api/public-images/villa_1769879223427_8opuoo.jpg", "/api/public-images/villa_1769879223570_9xc0o8.jpg", "/api/public-images/villa_1769879223734_y3hq29.jpg", "/api/public-images/villa_1769879223874_lh46hd.jpg", "/api/public-images/villa_1769879224029_mskehq.jpg", "/api/public-images/villa_1769879224193_z4xpfh.jpg", "/api/public-images/villa_1769879224338_hbf5i.jpg", "/api/public-images/villa_1769879224492_4hqdmc.jpg", "/api/public-images/villa_1769879224647_xye815.jpg", "/api/public-images/villa_1769879224804_nompq.jpg", "/api/public-images/villa_1769879225004_5vqjvj.jpg", "/api/public-images/villa_1769879225204_7tiyni.jpg", "/api/public-images/villa_1769879225388_w73i2d.jpg"]	400	420	580	10.374801	107.124239			t	-2	2026-01-31 17:08:07.688964	2026-01-31 17:40:30.463	600		20	7	["pool", "portableSpeaker", "bbq", "livingAC", "beach", "outskirts"]	f
23	6룸 풀빌라	/api/public-images/villa_1769881103650_9rxmx.jpg	["/api/public-images/villa_1769881103650_9rxmx.jpg", "/api/public-images/villa_1769881103830_50xyvb.jpg", "/api/public-images/villa_1769881103997_xxg7s4.jpg", "/api/public-images/villa_1769881104146_vkh2eq.jpg", "/api/public-images/villa_1769881104281_0l5olsg.jpg", "/api/public-images/villa_1769881104422_4x8sts.jpg", "/api/public-images/villa_1769881104569_bk8g08.jpg", "/api/public-images/villa_1769881104719_b6cebp.jpg", "/api/public-images/villa_1769881104884_7oda13.jpg", "/api/public-images/villa_1769881105021_k4xpbq.jpg", "/api/public-images/villa_1769881105170_8s62u9.jpg", "/api/public-images/villa_1769881105355_c6nbul.jpg", "/api/public-images/villa_1769881105500_5lpeew.jpg", "/api/public-images/villa_1769881105665_7osjws.jpg", "/api/public-images/villa_1769881105845_x2gnre.jpg"]	380	400	600	10.326625	107.082141			t	-3	2026-01-31 17:39:59.578337	2026-02-16 07:48:35.005	630		20	6	["pool", "portableSpeaker", "bbq", "livingAC", "elevator", "beach"]	t
24	6룸 풀빌라	/api/public-images/villa_1769881825449_ai9fgr.jpg	["/api/public-images/villa_1769881825449_ai9fgr.jpg", "/api/public-images/villa_1769881825740_rdo6e.jpg", "/api/public-images/villa_1769881825927_iu65q.jpg", "/api/public-images/villa_1769881826081_85dqlb.jpg", "/api/public-images/villa_1769881826242_44c1m9.jpg", "/api/public-images/villa_1769881826379_jqqvkc.jpg", "/api/public-images/villa_1769881826536_7otfbe.jpg", "/api/public-images/villa_1769881826696_4rnwb.jpg", "/api/public-images/villa_1769881826841_by1us6.jpg", "/api/public-images/villa_1769881826984_w23k3.jpg", "/api/public-images/villa_1769881827147_ws14cj.jpg", "/api/public-images/villa_1769881827278_vruoxa.jpg", "/api/public-images/villa_1769881827433_uwxxg.jpg", "/api/public-images/villa_1769881827576_gr5jdo.jpg", "/api/public-images/villa_1769881827720_tyub8.jpg", "/api/public-images/villa_1769881827865_l4o53e.jpg", "/api/public-images/villa_1769881828006_4d19c.jpg", "/api/public-images/villa_1769881828142_707y.jpg", "/api/public-images/villa_1769881828330_7x7mum.jpg", "/api/public-images/villa_1769881828474_qf660s.jpg", "/api/public-images/villa_1769881828671_tei3zp.jpg", "/api/public-images/villa_1769881828812_760vi.jpg", "/api/public-images/villa_1769881828964_lb1zx.jpg", "/api/public-images/villa_1769881829099_cczze.jpg", "/api/public-images/villa_1769881829265_27b9sk.jpg", "/api/public-images/villa_1769881829409_fu99m.jpg", "/api/public-images/villa_1769881829554_4zzsd.jpg", "/api/public-images/villa_1769881829698_tsd5uf.jpg", "/api/public-images/villa_1769881829849_arq5ta.jpg"]	320	350	600	10.374696	107.125624			t	0	2026-01-31 17:51:59.220957	2026-01-31 17:51:59.220957	630		20	6	["pool", "portableSpeaker", "bbq", "beach", "outskirts"]	f
22	8룸 풀빌라	/api/public-images/villa_1769881012181_6c86e.jpg	["/api/public-images/villa_1769881012181_6c86e.jpg", "/api/public-images/villa_1769881012348_7wknyl.jpg", "/api/public-images/villa_1769881012517_i31fn9.jpg", "/api/public-images/villa_1769881012685_w19dbu.jpg", "/api/public-images/villa_1769881012941_ntcyno.jpg", "/api/public-images/villa_1769881013110_zmqypr.jpg", "/api/public-images/villa_1769881013270_xyeuguk.jpg", "/api/public-images/villa_1769881013432_jepllq.jpg", "/api/public-images/villa_1769881013604_b1lj1i.jpg", "/api/public-images/villa_1769881013747_kewlu9.jpg", "/api/public-images/villa_1769881013890_tpjjnv.jpg", "/api/public-images/villa_1769881014040_lrvctl.jpg", "/api/public-images/villa_1769881014191_wy3a5o.jpg", "/api/public-images/villa_1769881014334_6rj5f.jpg", "/api/public-images/villa_1769881014505_o61hmq.jpg", "/api/public-images/villa_1769881014667_350egh.jpg", "/api/public-images/villa_1769881014821_nd9jj6.jpg", "/api/public-images/villa_1769881015017_yfn32n.jpg", "/api/public-images/villa_1769881015201_1bxn2d.jpg", "/api/public-images/villa_1769881015351_c8hgu.jpg", "/api/public-images/villa_1769881015503_md5s5r.jpg", "/api/public-images/villa_1769881015653_yrvjt8.jpg", "/api/public-images/villa_1769881015797_e809.jpg", "/api/public-images/villa_1769881015939_tw6igs.jpg", "/api/public-images/villa_1769881016123_7mzc2s.jpg", "/api/public-images/villa_1769881016283_liyk3.jpg", "/api/public-images/villa_1769881016452_cpo6lb.jpg", "/api/public-images/villa_1769881016629_9i2n.jpg", "/api/public-images/villa_1769881016786_lxgqlg.jpg"]	380	400	580	10.353406	107.099870	B5 Mạc Thanh Đạm(đường Mạc Thanh Đạm)		t	-4	2026-01-31 17:37:51.424826	2026-03-05 04:53:52.444	600		30	8	["pool", "portableSpeaker", "bbq", "livingAC", "downtown"]	t
27	6룸 풀빌라	/api/public-images/villa_1770368293727_lf094.jpg	["/api/public-images/villa_1770368293727_lf094.jpg", "/api/public-images/villa_1770368293552_ldw7a7.jpg", "/api/public-images/villa_1770368293886_ixpwiq.jpg", "/api/public-images/villa_1770368294270_756bdi.jpg", "/api/public-images/villa_1770368294430_6z9fi.jpg", "/api/public-images/villa_1770368294605_8pl98k.jpg", "/api/public-images/villa_1770368294796_qkg5c9.jpg", "/api/public-images/villa_1770368294948_llxyub.jpg", "/api/public-images/villa_1770368295099_lt064g.jpg", "/api/public-images/villa_1770368295315_r8jgd.jpg", "/api/public-images/villa_1770368295481_cxoby.jpg", "/api/public-images/villa_1770368295629_4hv9wp.jpg", "/api/public-images/villa_1770368295806_lfqwke.jpg", "/api/public-images/villa_1770368295944_rcpoko.jpg", "/api/public-images/villa_1770368296138_ivvord.jpg", "/api/public-images/villa_1770368296355_46bgur.jpg", "/api/public-images/villa_1770368296524_bb5c0f.jpg"]	350	380	580	10.346513	107.092643			t	-1	2026-02-06 08:59:19.004782	2026-02-06 08:59:32.641	600		10	3	["pool", "bbq", "downtown", "portableSpeaker", "livingAC"]	f
25	9룸 풀빌라	/api/public-images/villa_1770088409092_c4jfn9.jpg	["/api/public-images/villa_1770088409092_c4jfn9.jpg", "/api/public-images/villa_1770088409389_dagmku.jpg", "/api/public-images/villa_1770088409558_6nur0p.jpg", "/api/public-images/villa_1770088409744_abf42c.jpg", "/api/public-images/villa_1770088410054_rj8e9s.jpg", "/api/public-images/villa_1770088410246_oxfa8h.jpg", "/api/public-images/villa_1770088410435_tf20en.jpg", "/api/public-images/villa_1770088410617_zpt6kt.jpg", "/api/public-images/villa_1770088410802_oodh9.jpg", "/api/public-images/villa_1770088410972_z28pzk.jpg", "/api/public-images/villa_1770088411153_baii8j.jpg", "/api/public-images/villa_1770088411406_dtd8od.jpg", "/api/public-images/villa_1770088411579_cwz41kuh.jpg", "/api/public-images/villa_1770088411852_dodgea.jpg", "/api/public-images/villa_1770088412003_i6tpv8.jpg", "/api/public-images/villa_1770088412146_z0bm3n.jpg", "/api/public-images/villa_1770088412318_sdaf4.jpg", "/api/public-images/villa_1770088412492_de7xze.jpg", "/api/public-images/villa_1770088412639_z0rgb.jpg", "/api/public-images/villa_1770088412825_yhb0d.jpg", "/api/public-images/villa_1770088412987_rfzyf8.jpg", "/api/public-images/villa_1770088413190_2so2t9.jpg", "/api/public-images/villa_1770088413360_7kc85.jpg", "/api/public-images/villa_1770088413514_j796l.jpg", "/api/public-images/villa_1770088413672_dfz76c.jpg", "/api/public-images/villa_1770088413878_p1m5gm.jpg", "/api/public-images/villa_1770088414035_30xmr.jpg", "/api/public-images/villa_1770088414180_320jf.jpg", "/api/public-images/villa_1770088414430_ed963e.jpg", "/api/public-images/villa_1770088414582_g5052q.jpg", "/api/public-images/villa_1770088414766_2cg5t.jpg"]	350	380	500	10.354061	107.063763			t	-3	2026-02-03 03:15:56.582873	2026-02-06 09:28:36.659	550		10	9	["pool", "bbq", "beach", "livingAC", "portableSpeaker", "elevator"]	t
28	2룸 풀빌라	/api/public-images/villa_1771228083523_6p0vi.jpg	["/api/public-images/villa_1771228083523_6p0vi.jpg", "/api/public-images/villa_1771228083764_gprhd.jpg", "/api/public-images/villa_1771228083910_clcqig.jpg", "/api/public-images/villa_1771228084107_jrz7vn.jpg", "/api/public-images/villa_1771228084290_ahea5.jpg", "/api/public-images/villa_1771228084461_5ed3hr.jpg", "/api/public-images/villa_1771228084626_mzpnyi.jpg", "/api/public-images/villa_1771228084801_g52yk.jpg", "/api/public-images/villa_1771228084941_wraua9o.jpg", "/api/public-images/villa_1771228085071_4i68kf.jpg"]	250	280	400	10.332883	107.082035			t	0	2026-02-16 07:47:25.085996	2026-02-16 07:48:11.273	420		10	2	["pool", "bbq", "downtown", "portableSpeaker"]	f
29	3룸 풀빌라	/api/public-images/villa_1771564084361_bupjy8.jpg	["/api/public-images/villa_1771564084361_bupjy8.jpg", "/api/public-images/villa_1771564084148_p1ygi.jpg", "/api/public-images/villa_1771564084517_nuid5z.jpg", "/api/public-images/villa_1771564084663_yiue34.jpg", "/api/public-images/villa_1771564084819_5dva49.jpg", "/api/public-images/villa_1771564084999_wfdx4i.jpg", "/api/public-images/villa_1771564085159_mfq0rl.jpg", "/api/public-images/villa_1771564085304_w3r7pw.jpg", "/api/public-images/villa_1771564085451_pmk8j.jpg", "/api/public-images/villa_1771564085622_thnqou3.jpg", "/api/public-images/villa_1771564085775_m6p498.jpg", "/api/public-images/villa_1771564085931_ul734.jpg", "/api/public-images/villa_1771564086091_e2wg7l.jpg", "/api/public-images/villa_1771564086254_147ukh.jpg", "/api/public-images/villa_1771564086400_1h4hvb.jpg", "/api/public-images/villa_1771564086536_u8u9lg.jpg", "/api/public-images/villa_1771564086696_jzjvo8.jpg"]	300	350	480	10.369038	107.061220			t	0	2026-02-20 05:10:15.209068	2026-02-20 05:10:15.209068	500		8	3	["pool", "bbq", "beach", "livingAC"]	f
30	9룸 풀빌라	/objects/uploads/92e21921-e33c-414d-bf2c-47cadc6c4480	["/objects/uploads/92e21921-e33c-414d-bf2c-47cadc6c4480", "/objects/uploads/1268dda1-753f-4bd8-9359-94cd0675a030", "/objects/uploads/b0ca2b2e-d374-4192-872b-35ca8eb46278", "/objects/uploads/e3f37d70-f043-4bb5-bdbc-facac7680ff5", "/objects/uploads/74cf35aa-a98a-4c7b-9ea6-eae3f80054d1", "/objects/uploads/c28be731-3daf-4cb3-be25-e36c5f174d62", "/objects/uploads/ce4a9bf1-444d-4320-ae9c-ee8ccab05610", "/objects/uploads/5839c134-8b29-40ff-a9df-05f95261b422", "/objects/uploads/15dc2561-a7b9-4ffa-b4a2-d9827bb4d948", "/objects/uploads/b28975f1-629e-4939-99fc-b768b68d7d91", "/objects/uploads/b4d2f3b7-3b41-40a6-acc3-cf552f173bf6", "/objects/uploads/d9c9f61e-2403-4638-be20-b1cef29440e0", "/objects/uploads/f84e8998-feb9-4b3c-ab0c-9da6cf5c7e7d", "/objects/uploads/47558318-2868-434b-8adc-5cc6b908d9e7", "/objects/uploads/a74d70eb-9c77-4d5a-bfa1-57feb800e449"]	350	380	550	10.327136	107.082325			t	-3	2026-03-04 08:32:37.401576	2026-03-04 08:41:06.705	580		20	9	["pool", "bbq", "beach", "livingAC", "elevator", "karaoke"]	t
21	6룸 풀빌라	/api/public-images/villa_1769880962692_ti4len.jpg	["/api/public-images/villa_1769880962692_ti4len.jpg", "/api/public-images/villa_1769880962969_nyffse.jpg", "/api/public-images/villa_1769880963154_zb3bll.jpg", "/api/public-images/villa_1769880963315_c95wav.jpg", "/api/public-images/villa_1769880963509_zuhtsn.jpg", "/api/public-images/villa_1769880963666_jext2f.jpg", "/api/public-images/villa_1769880963832_g6fwjk.jpg", "/api/public-images/villa_1769880964044_lrl5lh.jpg", "/api/public-images/villa_1769880964195_hjxzif.jpg", "/api/public-images/villa_1769880964361_z37fda.jpg", "/api/public-images/villa_1769880964517_elfa8m.jpg", "/api/public-images/villa_1769880964705_z8gz4d.jpg", "/api/public-images/villa_1769880964869_jjr4h6.jpg", "/api/public-images/villa_1769880965034_xo9wcm.jpg", "/api/public-images/villa_1769880965198_vqevdp.jpg", "/api/public-images/villa_1769880965354_v5rjvd.jpg", "/api/public-images/villa_1769880965517_35aev5.jpg", "/api/public-images/villa_1769880965693_47ozda.jpg", "/api/public-images/villa_1769880965839_dhelv.jpg", "/api/public-images/villa_1769880966013_160ubc.jpg", "/api/public-images/villa_1769880966177_7qogj.jpg", "/api/public-images/villa_1769880966361_09j2on.jpg", "/api/public-images/villa_1769880966601_9vdzsb.jpg", "/api/public-images/villa_1769880966774_q5y4h9.jpg", "/api/public-images/villa_1769880966942_9qjkp9.jpg", "/api/public-images/villa_1769880967108_467faf.jpg", "/api/public-images/villa_1769880967310_8ed63.jpg", "/api/public-images/villa_1769880967524_6stpad.jpg", "/api/public-images/villa_1769880967677_lnwcj.jpg", "/api/public-images/villa_1769880967898_btuzf8.jpg", "/api/public-images/villa_1769880968087_teugy.jpg", "/api/public-images/villa_1769880968253_tkmxya.jpg", "/api/public-images/villa_1769880968437_1dkugb.jpg", "/api/public-images/villa_1769880968601_cv69ba.jpg", "/api/public-images/video_1773135202768_acfusm.mp4"]	350	380	500	10.353853	107.099283	A2 Mạc Thanh Đạm(đường Mạc Thanh Đạm)		t	-5	2026-01-31 17:36:24.32107	2026-03-10 09:33:30.034	550		10	6	["pool", "portableSpeaker", "bbq", "livingAC", "downtown"]	t
\.


--
-- Data for Name: visitor_count; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.visitor_count (id, count, last_reset_date, total_count, real_count, real_total_count) FROM stdin;
1	1303	2026-03-11	60345	9	1935
\.


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE SET; Schema: _system; Owner: -
--

SELECT pg_catalog.setval('_system.replit_database_migrations_v1_id_seq', 58, true);


--
-- Name: admin_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_messages_id_seq', 5, true);


--
-- Name: admin_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_notifications_id_seq', 113, true);


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 2, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversations_id_seq', 1, false);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupons_id_seq', 14, true);


--
-- Name: customer_chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_chat_messages_id_seq', 36, true);


--
-- Name: customer_chat_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_chat_rooms_id_seq', 4, true);


--
-- Name: eco_date_unavailability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.eco_date_unavailability_id_seq', 2, true);


--
-- Name: eco_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.eco_profiles_id_seq', 151, true);


--
-- Name: expense_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expense_groups_id_seq', 1, false);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expenses_id_seq', 1, false);


--
-- Name: instagram_synced_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.instagram_synced_posts_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.places_id_seq', 87, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 60, true);


--
-- Name: push_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.push_subscriptions_id_seq', 26, true);


--
-- Name: quote_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quote_categories_id_seq', 1, true);


--
-- Name: quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quotes_id_seq', 21, true);


--
-- Name: real_estate_listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.real_estate_listings_id_seq', 18, true);


--
-- Name: saved_travel_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.saved_travel_plans_id_seq', 1, true);


--
-- Name: shop_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shop_products_id_seq', 4, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 34, true);


--
-- Name: user_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_coupons_id_seq', 65, true);


--
-- Name: user_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_locations_id_seq', 6, true);


--
-- Name: vehicle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vehicle_types_id_seq', 9, true);


--
-- Name: villas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.villas_id_seq', 30, true);


--
-- Name: visitor_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visitor_count_id_seq', 1, false);


--
-- Name: replit_database_migrations_v1 replit_database_migrations_v1_pkey; Type: CONSTRAINT; Schema: _system; Owner: -
--

ALTER TABLE ONLY _system.replit_database_migrations_v1
    ADD CONSTRAINT replit_database_migrations_v1_pkey PRIMARY KEY (id);


--
-- Name: admin_messages admin_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_messages
    ADD CONSTRAINT admin_messages_pkey PRIMARY KEY (id);


--
-- Name: admin_notifications admin_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_notifications
    ADD CONSTRAINT admin_notifications_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: customer_chat_messages customer_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_chat_messages
    ADD CONSTRAINT customer_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: customer_chat_rooms customer_chat_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_chat_rooms
    ADD CONSTRAINT customer_chat_rooms_pkey PRIMARY KEY (id);


--
-- Name: eco_date_unavailability eco_date_unavailability_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eco_date_unavailability
    ADD CONSTRAINT eco_date_unavailability_pkey PRIMARY KEY (id);


--
-- Name: eco_profiles eco_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eco_profiles
    ADD CONSTRAINT eco_profiles_pkey PRIMARY KEY (id);


--
-- Name: expense_groups expense_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_groups
    ADD CONSTRAINT expense_groups_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: instagram_synced_posts instagram_synced_posts_instagram_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instagram_synced_posts
    ADD CONSTRAINT instagram_synced_posts_instagram_id_unique UNIQUE (instagram_id);


--
-- Name: instagram_synced_posts instagram_synced_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instagram_synced_posts
    ADD CONSTRAINT instagram_synced_posts_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: place_categories place_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.place_categories
    ADD CONSTRAINT place_categories_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: push_subscriptions push_subscriptions_endpoint_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.push_subscriptions
    ADD CONSTRAINT push_subscriptions_endpoint_unique UNIQUE (endpoint);


--
-- Name: push_subscriptions push_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.push_subscriptions
    ADD CONSTRAINT push_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: quote_categories quote_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_categories
    ADD CONSTRAINT quote_categories_pkey PRIMARY KEY (id);


--
-- Name: quotes quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pkey PRIMARY KEY (id);


--
-- Name: real_estate_categories real_estate_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.real_estate_categories
    ADD CONSTRAINT real_estate_categories_pkey PRIMARY KEY (id);


--
-- Name: real_estate_listings real_estate_listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.real_estate_listings
    ADD CONSTRAINT real_estate_listings_pkey PRIMARY KEY (id);


--
-- Name: saved_travel_plans saved_travel_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_travel_plans
    ADD CONSTRAINT saved_travel_plans_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);


--
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_key_unique UNIQUE (key);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: user_coupons user_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons
    ADD CONSTRAINT user_coupons_pkey PRIMARY KEY (id);


--
-- Name: user_locations user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_types vehicle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_types
    ADD CONSTRAINT vehicle_types_pkey PRIMARY KEY (id);


--
-- Name: villas villas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.villas
    ADD CONSTRAINT villas_pkey PRIMARY KEY (id);


--
-- Name: visitor_count visitor_count_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visitor_count
    ADD CONSTRAINT visitor_count_pkey PRIMARY KEY (id);


--
-- Name: idx_replit_database_migrations_v1_build_id; Type: INDEX; Schema: _system; Owner: -
--

CREATE UNIQUE INDEX idx_replit_database_migrations_v1_build_id ON _system.replit_database_migrations_v1 USING btree (build_id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_session_expire" ON public.sessions USING btree (expire);


--
-- Name: messages messages_conversation_id_conversations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_conversation_id_conversations_id_fk FOREIGN KEY (conversation_id) REFERENCES public.conversations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict Rdj17xHpRh2mUfJoEa5WyCe3qvltHDsG7ub2aLjFT5YCPfPlq3pcXA7Jedo6orj

