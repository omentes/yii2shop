--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: product_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_brand (
    id integer NOT NULL,
    image character varying(255)
);


ALTER TABLE public.product_brand OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_id_seq OWNER TO postgres;

--
-- Name: brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_id_seq OWNED BY public.product_brand.id;


--
-- Name: product_brand_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_brand_name (
    id integer NOT NULL,
    brand_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    meta_title character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_h1 character varying(255),
    content text,
    country character varying(255)
);


ALTER TABLE public.product_brand_name OWNER TO postgres;

--
-- Name: brand_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_name_id_seq OWNER TO postgres;

--
-- Name: brand_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_name_id_seq OWNED BY public.product_brand_name.id;


--
-- Name: product_category_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category_name (
    id integer NOT NULL,
    product_category_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    meta_title character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_h1 character varying(255),
    content text
);


ALTER TABLE public.product_category_name OWNER TO postgres;

--
-- Name: category_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_name_id_seq OWNER TO postgres;

--
-- Name: category_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_name_id_seq OWNED BY public.product_category_name.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(3) NOT NULL,
    value numeric(12,2) NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- Name: discount_logic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_logic (
    id integer NOT NULL,
    name character varying(255),
    operation character varying(255)
);


ALTER TABLE public.discount_logic OWNER TO postgres;

--
-- Name: TABLE discount_logic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.discount_logic IS 'для создание логики скидки. Например ''минус х грн'' или ''минус 20%''.';


--
-- Name: discount_logic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_logic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_logic_id_seq OWNER TO postgres;

--
-- Name: discount_logic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_logic_id_seq OWNED BY public.discount_logic.id;


--
-- Name: discount_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_plan (
    id integer NOT NULL,
    date_start timestamp without time zone NOT NULL,
    date_end timestamp without time zone NOT NULL,
    content text,
    discount_type_id integer
);


ALTER TABLE public.discount_plan OWNER TO postgres;

--
-- Name: TABLE discount_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.discount_plan IS 'создание акции для товаров';


--
-- Name: discount_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_plan_id_seq OWNER TO postgres;

--
-- Name: discount_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_plan_id_seq OWNED BY public.discount_plan.id;


--
-- Name: discount_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    discount_logic_type integer NOT NULL,
    how integer NOT NULL
);


ALTER TABLE public.discount_type OWNER TO postgres;

--
-- Name: TABLE discount_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.discount_type IS 'название типа, скидка цифрой и тип скидки (процент или минус)';


--
-- Name: discount_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_type_id_seq OWNER TO postgres;

--
-- Name: discount_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_type_id_seq OWNED BY public.discount_type.id;


--
-- Name: lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lang (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.lang OWNER TO postgres;

--
-- Name: lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lang_id_seq OWNER TO postgres;

--
-- Name: lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lang_id_seq OWNED BY public.lang.id;


--
-- Name: order_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_message (
    id integer NOT NULL,
    text text,
    from_user_id integer,
    to_user_id integer,
    order_history_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.order_message OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.order_message.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    order_status_id integer DEFAULT 1,
    user_id integer,
    amount numeric(12,2),
    description text,
    shipping_id integer,
    payment_id integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_history (
    id integer NOT NULL,
    order_id integer,
    created_at timestamp without time zone DEFAULT now(),
    previous_status_id integer,
    status_id integer,
    is_message boolean DEFAULT false
);


ALTER TABLE public.order_history OWNER TO postgres;

--
-- Name: order_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_history_id_seq OWNER TO postgres;

--
-- Name: order_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_history_id_seq OWNED BY public.order_history.id;


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    id integer NOT NULL
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- Name: order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_id_seq OWNER TO postgres;

--
-- Name: order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_id_seq OWNED BY public.order_status.id;


--
-- Name: order_status_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_name (
    id integer NOT NULL,
    order_status_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    content text
);


ALTER TABLE public.order_status_name OWNER TO postgres;

--
-- Name: order_status_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_name_id_seq OWNER TO postgres;

--
-- Name: order_status_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_name_id_seq OWNED BY public.order_status_name.id;


--
-- Name: order_to_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_to_product (
    price integer,
    qty integer,
    order_id integer,
    product_id integer
);


ALTER TABLE public.order_to_product OWNER TO postgres;

--
-- Name: order_to_shipping_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_to_shipping_option (
    id integer NOT NULL,
    order_id integer,
    shipping_option_id integer,
    value character varying(255)
);


ALTER TABLE public.order_to_shipping_option OWNER TO postgres;

--
-- Name: order_to_shipping_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_to_shipping_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_to_shipping_option_id_seq OWNER TO postgres;

--
-- Name: order_to_shipping_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_to_shipping_option_id_seq OWNED BY public.order_to_shipping_option.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: payment_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_name (
    id integer NOT NULL,
    payment_id integer,
    lang_id integer,
    name character varying(255)
);


ALTER TABLE public.payment_name OWNER TO postgres;

--
-- Name: payment_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_name_id_seq OWNER TO postgres;

--
-- Name: payment_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_name_id_seq OWNED BY public.payment_name.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    brand_id integer,
    image_src character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    product_status_id integer DEFAULT 1,
    quantity integer DEFAULT 0,
    sku character varying(255),
    vendor_code character varying(255),
    outstock_status_id integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: TABLE product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product IS 'таблица продуктов';


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id integer NOT NULL,
    image character varying(255),
    sorted integer DEFAULT 0
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_category_tree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category_tree (
    id integer NOT NULL,
    child_id integer,
    parent_id integer,
    level integer
);


ALTER TABLE public.product_category_tree OWNER TO postgres;

--
-- Name: product_category_tree_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_tree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_tree_id_seq OWNER TO postgres;

--
-- Name: product_category_tree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_tree_id_seq OWNED BY public.product_category_tree.id;


--
-- Name: product_to_discount_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_to_discount_plan (
    id integer NOT NULL,
    product_id integer,
    discount_plan_id integer
);


ALTER TABLE public.product_to_discount_plan OWNER TO postgres;

--
-- Name: TABLE product_to_discount_plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product_to_discount_plan IS 'товары, у которых добавлена акция';


--
-- Name: product_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_discount_id_seq OWNER TO postgres;

--
-- Name: product_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_discount_id_seq OWNED BY public.product_to_discount_plan.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_name (
    id integer NOT NULL,
    product_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    meta_title character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_h1 character varying(255),
    content text
);


ALTER TABLE public.product_name OWNER TO postgres;

--
-- Name: product_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_name_id_seq OWNER TO postgres;

--
-- Name: product_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_name_id_seq OWNED BY public.product_name.id;


--
-- Name: product_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option (
    id integer NOT NULL,
    option_group_id integer,
    value character varying(255) NOT NULL
);


ALTER TABLE public.product_option OWNER TO postgres;

--
-- Name: product_option_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_group (
    id integer NOT NULL
);


ALTER TABLE public.product_option_group OWNER TO postgres;

--
-- Name: product_option_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_group_id_seq OWNER TO postgres;

--
-- Name: product_option_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_group_id_seq OWNED BY public.product_option_group.id;


--
-- Name: product_option_group_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_group_name (
    id integer NOT NULL,
    group_id integer,
    lang_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.product_option_group_name OWNER TO postgres;

--
-- Name: product_option_group_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_group_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_group_name_id_seq OWNER TO postgres;

--
-- Name: product_option_group_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_group_name_id_seq OWNED BY public.product_option_group_name.id;


--
-- Name: product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_id_seq OWNER TO postgres;

--
-- Name: product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_id_seq OWNED BY public.product_option.id;


--
-- Name: product_option_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_name (
    id integer NOT NULL,
    lang_id integer NOT NULL,
    option_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.product_option_name OWNER TO postgres;

--
-- Name: product_option_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_option_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_name_id_seq OWNER TO postgres;

--
-- Name: product_option_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_option_name_id_seq OWNED BY public.product_option_name.id;


--
-- Name: product_outstock_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_outstock_status (
    id integer NOT NULL
);


ALTER TABLE public.product_outstock_status OWNER TO postgres;

--
-- Name: product_outstock_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_outstock_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_outstock_status_id_seq OWNER TO postgres;

--
-- Name: product_outstock_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_outstock_status_id_seq OWNED BY public.product_outstock_status.id;


--
-- Name: product_outstock_status_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_outstock_status_name (
    id integer NOT NULL,
    product_outstock_status_id integer,
    lang_id integer,
    name character varying(255)
);


ALTER TABLE public.product_outstock_status_name OWNER TO postgres;

--
-- Name: product_outstock_status_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_outstock_status_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_outstock_status_name_id_seq OWNER TO postgres;

--
-- Name: product_outstock_status_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_outstock_status_name_id_seq OWNED BY public.product_outstock_status_name.id;


--
-- Name: product_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_price (
    id integer NOT NULL,
    item_count integer,
    product_id integer,
    price numeric(12,2),
    currency_id integer
);


ALTER TABLE public.product_price OWNER TO postgres;

--
-- Name: TABLE product_price; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product_price IS 'таблица комплектаций';


--
-- Name: product_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_review (
    id integer NOT NULL,
    product_id integer,
    reviewer_name character varying(255),
    content text,
    rating integer DEFAULT 5
);


ALTER TABLE public.product_review OWNER TO postgres;

--
-- Name: product_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_review_id_seq OWNER TO postgres;

--
-- Name: product_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_review_id_seq OWNED BY public.product_review.id;


--
-- Name: product_set_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_set_id_seq OWNER TO postgres;

--
-- Name: product_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_set_id_seq OWNED BY public.product_price.id;


--
-- Name: product_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_status (
    id integer NOT NULL
);


ALTER TABLE public.product_status OWNER TO postgres;

--
-- Name: product_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_status_id_seq OWNER TO postgres;

--
-- Name: product_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_status_id_seq OWNED BY public.product_status.id;


--
-- Name: product_status_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_status_name (
    id integer NOT NULL,
    product_status_id integer,
    lang_id integer,
    name character varying(255)
);


ALTER TABLE public.product_status_name OWNER TO postgres;

--
-- Name: product_status_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_status_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_status_name_id_seq OWNER TO postgres;

--
-- Name: product_status_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_status_name_id_seq OWNED BY public.product_status_name.id;


--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag (
    id integer NOT NULL,
    image character varying(255) DEFAULT NULL::character varying,
    sorted integer DEFAULT 0,
    tag_type integer
);


ALTER TABLE public.product_tag OWNER TO postgres;

--
-- Name: product_tag_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag_name (
    id integer NOT NULL,
    tag_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    meta_title character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_h1 character varying(255),
    content text
);


ALTER TABLE public.product_tag_name OWNER TO postgres;

--
-- Name: product_tag_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tag_type (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.product_tag_type OWNER TO postgres;

--
-- Name: product_to_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_to_category (
    id integer NOT NULL,
    product_id integer,
    category_id integer
);


ALTER TABLE public.product_to_category OWNER TO postgres;

--
-- Name: product_to_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_to_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_to_category_id_seq OWNER TO postgres;

--
-- Name: product_to_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_to_category_id_seq OWNED BY public.product_to_category.id;


--
-- Name: product_to_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_to_option (
    id integer NOT NULL,
    product_id integer,
    option_id integer
);


ALTER TABLE public.product_to_option OWNER TO postgres;

--
-- Name: product_to_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_to_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_to_option_id_seq OWNER TO postgres;

--
-- Name: product_to_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_to_option_id_seq OWNED BY public.product_to_option.id;


--
-- Name: product_to_promocode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_to_promocode (
    id integer NOT NULL,
    product_id integer,
    promocode_id integer
);


ALTER TABLE public.product_to_promocode OWNER TO postgres;

--
-- Name: TABLE product_to_promocode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product_to_promocode IS 'товары, у которых есть промокод';


--
-- Name: product_to_promocode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_to_promocode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_to_promocode_id_seq OWNER TO postgres;

--
-- Name: product_to_promocode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_to_promocode_id_seq OWNED BY public.product_to_promocode.id;


--
-- Name: product_to_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_to_tag (
    id integer NOT NULL,
    product_id integer,
    tag_id integer
);


ALTER TABLE public.product_to_tag OWNER TO postgres;

--
-- Name: product_to_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_to_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_to_tag_id_seq OWNER TO postgres;

--
-- Name: product_to_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_to_tag_id_seq OWNED BY public.product_to_tag.id;


--
-- Name: promocode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promocode (
    id integer NOT NULL,
    promocode character varying(255),
    date_start timestamp without time zone NOT NULL,
    date_end timestamp without time zone NOT NULL,
    quantity integer,
    discount_type_id integer NOT NULL
);


ALTER TABLE public.promocode OWNER TO postgres;

--
-- Name: TABLE promocode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.promocode IS 'промокоды для скидок на товар';


--
-- Name: promocode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promocode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promocode_id_seq OWNER TO postgres;

--
-- Name: promocode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promocode_id_seq OWNED BY public.promocode.id;


--
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    id integer NOT NULL
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_id_seq OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_id_seq OWNED BY public.shipping.id;


--
-- Name: shipping_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_name (
    id integer NOT NULL,
    shipping_id integer,
    lang_id integer,
    name character varying(255)
);


ALTER TABLE public.shipping_name OWNER TO postgres;

--
-- Name: shipping_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_name_id_seq OWNER TO postgres;

--
-- Name: shipping_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_name_id_seq OWNED BY public.shipping_name.id;


--
-- Name: shipping_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option (
    id integer NOT NULL,
    shipping_id integer,
    shipping_option character varying(255)
);


ALTER TABLE public.shipping_option OWNER TO postgres;

--
-- Name: shipping_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_option_id_seq OWNER TO postgres;

--
-- Name: shipping_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_option_id_seq OWNED BY public.shipping_option.id;


--
-- Name: shipping_option_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_option_name (
    id integer NOT NULL,
    shipping_option_id integer,
    lang_id integer,
    name character varying(255)
);


ALTER TABLE public.shipping_option_name OWNER TO postgres;

--
-- Name: shipping_option_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_option_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_option_name_id_seq OWNER TO postgres;

--
-- Name: shipping_option_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_option_name_id_seq OWNED BY public.shipping_option_name.id;


--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.product_tag.id;


--
-- Name: tag_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_name_id_seq OWNER TO postgres;

--
-- Name: tag_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_name_id_seq OWNED BY public.product_tag_name.id;


--
-- Name: tag_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_type_id_seq OWNER TO postgres;

--
-- Name: tag_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_type_id_seq OWNED BY public.product_tag_type.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    phone character varying(20),
    email character varying(255),
    type_id integer,
    password_hash character varying(128),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    auth_key character varying(128),
    access_token character varying(128),
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    email_confirm_token character varying(255),
    password_reset_token character varying(255),
    status smallint DEFAULT 0,
    username character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_type_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_type_name (
    id integer NOT NULL,
    user_tape_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    lang_id integer,
    content text
);


ALTER TABLE public.user_type_name OWNER TO postgres;

--
-- Name: user_tape_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tape_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_tape_name_id_seq OWNER TO postgres;

--
-- Name: user_tape_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tape_name_id_seq OWNED BY public.user_type_name.id;


--
-- Name: user_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_type (
    id integer NOT NULL
);


ALTER TABLE public.user_type OWNER TO postgres;

--
-- Name: user_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_type_id_seq OWNER TO postgres;

--
-- Name: user_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_type_id_seq OWNED BY public.user_type.id;


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Name: discount_logic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_logic ALTER COLUMN id SET DEFAULT nextval('public.discount_logic_id_seq'::regclass);


--
-- Name: discount_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_plan ALTER COLUMN id SET DEFAULT nextval('public.discount_plan_id_seq'::regclass);


--
-- Name: discount_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_type ALTER COLUMN id SET DEFAULT nextval('public.discount_type_id_seq'::regclass);


--
-- Name: lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang ALTER COLUMN id SET DEFAULT nextval('public.lang_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: order_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history ALTER COLUMN id SET DEFAULT nextval('public.order_history_id_seq'::regclass);


--
-- Name: order_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- Name: order_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status ALTER COLUMN id SET DEFAULT nextval('public.order_status_id_seq'::regclass);


--
-- Name: order_status_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_name ALTER COLUMN id SET DEFAULT nextval('public.order_status_name_id_seq'::regclass);


--
-- Name: order_to_shipping_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_shipping_option ALTER COLUMN id SET DEFAULT nextval('public.order_to_shipping_option_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: payment_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_name ALTER COLUMN id SET DEFAULT nextval('public.payment_name_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand ALTER COLUMN id SET DEFAULT nextval('public.brand_id_seq'::regclass);


--
-- Name: product_brand_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand_name ALTER COLUMN id SET DEFAULT nextval('public.brand_name_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_category_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_name ALTER COLUMN id SET DEFAULT nextval('public.category_name_id_seq'::regclass);


--
-- Name: product_category_tree id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_tree ALTER COLUMN id SET DEFAULT nextval('public.product_category_tree_id_seq'::regclass);


--
-- Name: product_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_name ALTER COLUMN id SET DEFAULT nextval('public.product_name_id_seq'::regclass);


--
-- Name: product_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option ALTER COLUMN id SET DEFAULT nextval('public.product_option_id_seq'::regclass);


--
-- Name: product_option_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_id_seq'::regclass);


--
-- Name: product_option_group_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_name ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_name_id_seq'::regclass);


--
-- Name: product_option_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_name ALTER COLUMN id SET DEFAULT nextval('public.product_option_name_id_seq'::regclass);


--
-- Name: product_outstock_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status ALTER COLUMN id SET DEFAULT nextval('public.product_outstock_status_id_seq'::regclass);


--
-- Name: product_outstock_status_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status_name ALTER COLUMN id SET DEFAULT nextval('public.product_outstock_status_name_id_seq'::regclass);


--
-- Name: product_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price ALTER COLUMN id SET DEFAULT nextval('public.product_set_id_seq'::regclass);


--
-- Name: product_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review ALTER COLUMN id SET DEFAULT nextval('public.product_review_id_seq'::regclass);


--
-- Name: product_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status ALTER COLUMN id SET DEFAULT nextval('public.product_status_id_seq'::regclass);


--
-- Name: product_status_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status_name ALTER COLUMN id SET DEFAULT nextval('public.product_status_name_id_seq'::regclass);


--
-- Name: product_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: product_tag_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_name ALTER COLUMN id SET DEFAULT nextval('public.tag_name_id_seq'::regclass);


--
-- Name: product_tag_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_type ALTER COLUMN id SET DEFAULT nextval('public.tag_type_id_seq'::regclass);


--
-- Name: product_to_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_category ALTER COLUMN id SET DEFAULT nextval('public.product_to_category_id_seq'::regclass);


--
-- Name: product_to_discount_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_discount_plan ALTER COLUMN id SET DEFAULT nextval('public.product_discount_id_seq'::regclass);


--
-- Name: product_to_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_option ALTER COLUMN id SET DEFAULT nextval('public.product_to_option_id_seq'::regclass);


--
-- Name: product_to_promocode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_promocode ALTER COLUMN id SET DEFAULT nextval('public.product_to_promocode_id_seq'::regclass);


--
-- Name: product_to_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_tag ALTER COLUMN id SET DEFAULT nextval('public.product_to_tag_id_seq'::regclass);


--
-- Name: promocode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocode ALTER COLUMN id SET DEFAULT nextval('public.promocode_id_seq'::regclass);


--
-- Name: shipping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN id SET DEFAULT nextval('public.shipping_id_seq'::regclass);


--
-- Name: shipping_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_name ALTER COLUMN id SET DEFAULT nextval('public.shipping_name_id_seq'::regclass);


--
-- Name: shipping_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option ALTER COLUMN id SET DEFAULT nextval('public.shipping_option_id_seq'::regclass);


--
-- Name: shipping_option_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_name ALTER COLUMN id SET DEFAULT nextval('public.shipping_option_name_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type ALTER COLUMN id SET DEFAULT nextval('public.user_type_id_seq'::regclass);


--
-- Name: user_type_name id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type_name ALTER COLUMN id SET DEFAULT nextval('public.user_tape_name_id_seq'::regclass);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, name, code, value) FROM stdin;
\.


--
-- Data for Name: discount_logic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_logic (id, name, operation) FROM stdin;
\.


--
-- Data for Name: discount_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_plan (id, date_start, date_end, content, discount_type_id) FROM stdin;
\.


--
-- Data for Name: discount_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_type (id, name, discount_logic_type, how) FROM stdin;
\.


--
-- Data for Name: lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lang (id, name) FROM stdin;
1	en
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, created_at, order_status_id, user_id, amount, description, shipping_id, payment_id) FROM stdin;
\.


--
-- Data for Name: order_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_history (id, order_id, created_at, previous_status_id, status_id, is_message) FROM stdin;
\.


--
-- Data for Name: order_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_message (id, text, from_user_id, to_user_id, order_history_id, created_at) FROM stdin;
\.


--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status (id) FROM stdin;
1
\.


--
-- Data for Name: order_status_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_name (id, order_status_id, name, lang_id, content) FROM stdin;
\.


--
-- Data for Name: order_to_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_to_product (price, qty, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: order_to_shipping_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_to_shipping_option (id, order_id, shipping_option_id, value) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id) FROM stdin;
\.


--
-- Data for Name: payment_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_name (id, payment_id, lang_id, name) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, brand_id, image_src, created_at, product_status_id, quantity, sku, vendor_code, outstock_status_id) FROM stdin;
1	1		\N	\N	\N			\N
\.


--
-- Data for Name: product_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_brand (id, image) FROM stdin;
1	
\.


--
-- Data for Name: product_brand_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_brand_name (id, brand_id, name, lang_id, meta_title, meta_description, meta_keywords, meta_h1, content, country) FROM stdin;
1	1	first brand	1		\N	\N	\N	\N	\N
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (id, image, sorted) FROM stdin;
1	\N	0
\.


--
-- Data for Name: product_category_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category_name (id, product_category_id, name, lang_id, meta_title, meta_description, meta_keywords, meta_h1, content) FROM stdin;
\.


--
-- Data for Name: product_category_tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category_tree (id, child_id, parent_id, level) FROM stdin;
1	1	1	0
\.


--
-- Data for Name: product_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_name (id, product_id, name, lang_id, meta_title, meta_description, meta_keywords, meta_h1, content) FROM stdin;
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option (id, option_group_id, value) FROM stdin;
\.


--
-- Data for Name: product_option_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_group (id) FROM stdin;
\.


--
-- Data for Name: product_option_group_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_group_name (id, group_id, lang_id, content) FROM stdin;
\.


--
-- Data for Name: product_option_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_name (id, lang_id, option_id, content) FROM stdin;
\.


--
-- Data for Name: product_outstock_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_outstock_status (id) FROM stdin;
\.


--
-- Data for Name: product_outstock_status_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_outstock_status_name (id, product_outstock_status_id, lang_id, name) FROM stdin;
\.


--
-- Data for Name: product_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_price (id, item_count, product_id, price, currency_id) FROM stdin;
\.


--
-- Data for Name: product_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_review (id, product_id, reviewer_name, content, rating) FROM stdin;
\.


--
-- Data for Name: product_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_status (id) FROM stdin;
\.


--
-- Data for Name: product_status_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_status_name (id, product_status_id, lang_id, name) FROM stdin;
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tag (id, image, sorted, tag_type) FROM stdin;
\.


--
-- Data for Name: product_tag_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tag_name (id, tag_id, name, lang_id, meta_title, meta_description, meta_keywords, meta_h1, content) FROM stdin;
\.


--
-- Data for Name: product_tag_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tag_type (id, name) FROM stdin;
\.


--
-- Data for Name: product_to_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_to_category (id, product_id, category_id) FROM stdin;
\.


--
-- Data for Name: product_to_discount_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_to_discount_plan (id, product_id, discount_plan_id) FROM stdin;
\.


--
-- Data for Name: product_to_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_to_option (id, product_id, option_id) FROM stdin;
\.


--
-- Data for Name: product_to_promocode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_to_promocode (id, product_id, promocode_id) FROM stdin;
\.


--
-- Data for Name: product_to_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_to_tag (id, product_id, tag_id) FROM stdin;
\.


--
-- Data for Name: promocode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promocode (id, promocode, date_start, date_end, quantity, discount_type_id) FROM stdin;
\.


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping (id) FROM stdin;
\.


--
-- Data for Name: shipping_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_name (id, shipping_id, lang_id, name) FROM stdin;
\.


--
-- Data for Name: shipping_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option (id, shipping_id, shipping_option) FROM stdin;
\.


--
-- Data for Name: shipping_option_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_option_name (id, shipping_option_id, lang_id, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, phone, email, type_id, password_hash, created_at, auth_key, access_token, updated_at, email_confirm_token, password_reset_token, status, username) FROM stdin;
1	0500279300	setnemo@gmail.com	\N	$2y$13$rDhcgwBu6d8r9qrUC.69neSLhWE6QH1aeLrqybLQbaP2FJS/.E/Tm	2019-02-02 19:48:41.113			2019-02-02 19:48:53.628			1	admin
\.


--
-- Data for Name: user_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_type (id) FROM stdin;
\.


--
-- Data for Name: user_type_name; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_type_name (id, user_tape_id, name, lang_id, content) FROM stdin;
\.


--
-- Name: brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_id_seq', 1, false);


--
-- Name: brand_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_name_id_seq', 1, false);


--
-- Name: category_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_name_id_seq', 1, false);


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 1, false);


--
-- Name: discount_logic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_logic_id_seq', 1, false);


--
-- Name: discount_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_plan_id_seq', 1, false);


--
-- Name: discount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_type_id_seq', 1, false);


--
-- Name: lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lang_id_seq', 1, false);


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 1, false);


--
-- Name: order_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_history_id_seq', 1, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_id_seq', 1, false);


--
-- Name: order_status_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_name_id_seq', 1, false);


--
-- Name: order_to_shipping_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_to_shipping_option_id_seq', 1, false);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- Name: payment_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_name_id_seq', 1, false);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_id_seq', 1, true);


--
-- Name: product_category_tree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_tree_id_seq', 1, true);


--
-- Name: product_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_discount_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, true);


--
-- Name: product_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_name_id_seq', 1, false);


--
-- Name: product_option_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_group_id_seq', 1, false);


--
-- Name: product_option_group_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_group_name_id_seq', 1, false);


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_id_seq', 1, false);


--
-- Name: product_option_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_option_name_id_seq', 1, false);


--
-- Name: product_outstock_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_outstock_status_id_seq', 1, false);


--
-- Name: product_outstock_status_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_outstock_status_name_id_seq', 1, false);


--
-- Name: product_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_review_id_seq', 1, false);


--
-- Name: product_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_set_id_seq', 1, false);


--
-- Name: product_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_status_id_seq', 1, false);


--
-- Name: product_status_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_status_name_id_seq', 1, false);


--
-- Name: product_to_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_to_category_id_seq', 3, true);


--
-- Name: product_to_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_to_option_id_seq', 1, false);


--
-- Name: product_to_promocode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_to_promocode_id_seq', 1, false);


--
-- Name: product_to_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_to_tag_id_seq', 1, false);


--
-- Name: promocode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promocode_id_seq', 1, false);


--
-- Name: shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_id_seq', 1, false);


--
-- Name: shipping_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_name_id_seq', 1, false);


--
-- Name: shipping_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_option_id_seq', 1, false);


--
-- Name: shipping_option_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_option_name_id_seq', 1, false);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tag_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_name_id_seq', 1, false);


--
-- Name: tag_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_type_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: user_tape_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tape_name_id_seq', 1, false);


--
-- Name: user_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_type_id_seq', 1, false);


--
-- Name: product_brand_name brand_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand_name
    ADD CONSTRAINT brand_name_pkey PRIMARY KEY (id);


--
-- Name: product_brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: product_category_name category_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_name
    ADD CONSTRAINT category_name_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: discount_logic discount_logic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_logic
    ADD CONSTRAINT discount_logic_pkey PRIMARY KEY (id);


--
-- Name: discount_plan discount_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_plan
    ADD CONSTRAINT discount_plan_pkey PRIMARY KEY (id);


--
-- Name: discount_type discount_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_type
    ADD CONSTRAINT discount_type_pkey PRIMARY KEY (id);


--
-- Name: lang lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang
    ADD CONSTRAINT lang_pkey PRIMARY KEY (id);


--
-- Name: order_message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: order_history order_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_history_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_status_name order_status_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_name
    ADD CONSTRAINT order_status_name_pkey PRIMARY KEY (id);


--
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- Name: order_to_shipping_option order_to_shipping_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_shipping_option
    ADD CONSTRAINT order_to_shipping_option_pkey PRIMARY KEY (id);


--
-- Name: payment_name payment_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_name
    ADD CONSTRAINT payment_name_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_category_tree product_category_tree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_tree
    ADD CONSTRAINT product_category_tree_pkey PRIMARY KEY (id);


--
-- Name: product_to_discount_plan product_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_discount_plan
    ADD CONSTRAINT product_discount_pkey PRIMARY KEY (id);


--
-- Name: product_name product_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_name
    ADD CONSTRAINT product_name_pkey PRIMARY KEY (id);


--
-- Name: product_option_group_name product_option_group_name_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_name
    ADD CONSTRAINT product_option_group_name_pk PRIMARY KEY (id);


--
-- Name: product_option_group product_option_group_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group
    ADD CONSTRAINT product_option_group_pk PRIMARY KEY (id);


--
-- Name: product_option_name product_option_name_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_name
    ADD CONSTRAINT product_option_name_pk PRIMARY KEY (id);


--
-- Name: product_option product_option_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pk PRIMARY KEY (id);


--
-- Name: product_outstock_status_name product_outstock_status_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status_name
    ADD CONSTRAINT product_outstock_status_name_pkey PRIMARY KEY (id);


--
-- Name: product_outstock_status product_outstock_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status
    ADD CONSTRAINT product_outstock_status_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (id);


--
-- Name: product_price product_set_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_set_pkey PRIMARY KEY (id);


--
-- Name: product_status_name product_status_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status_name
    ADD CONSTRAINT product_status_name_pkey PRIMARY KEY (id);


--
-- Name: product_status product_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status
    ADD CONSTRAINT product_status_pkey PRIMARY KEY (id);


--
-- Name: product_to_category product_to_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_category
    ADD CONSTRAINT product_to_category_pkey PRIMARY KEY (id);


--
-- Name: product_to_category product_to_category_product_id_category_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_category
    ADD CONSTRAINT product_to_category_product_id_category_id_pk UNIQUE (product_id, category_id);


--
-- Name: product_to_option product_to_option_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_option
    ADD CONSTRAINT product_to_option_pk PRIMARY KEY (id);


--
-- Name: product_to_promocode product_to_promocode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_promocode
    ADD CONSTRAINT product_to_promocode_pkey PRIMARY KEY (id);


--
-- Name: product_to_tag product_to_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_tag
    ADD CONSTRAINT product_to_tag_pkey PRIMARY KEY (id);


--
-- Name: promocode promocode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocode
    ADD CONSTRAINT promocode_pkey PRIMARY KEY (id);


--
-- Name: shipping_name shipping_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_name
    ADD CONSTRAINT shipping_name_pkey PRIMARY KEY (id);


--
-- Name: shipping_option_name shipping_option_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_name
    ADD CONSTRAINT shipping_option_name_pkey PRIMARY KEY (id);


--
-- Name: shipping_option shipping_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_pkey PRIMARY KEY (id);


--
-- Name: shipping shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pkey PRIMARY KEY (id);


--
-- Name: product_tag_name tag_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_name
    ADD CONSTRAINT tag_name_pkey PRIMARY KEY (id);


--
-- Name: product_tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: product_tag_type tag_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_type
    ADD CONSTRAINT tag_type_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_type_name user_tape_name_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type_name
    ADD CONSTRAINT user_tape_name_pkey PRIMARY KEY (id);


--
-- Name: user_type user_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type
    ADD CONSTRAINT user_type_pkey PRIMARY KEY (id);


--
-- Name: currency_code_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX currency_code_uindex ON public.currency USING btree (code);


--
-- Name: currency_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX currency_name_uindex ON public.currency USING btree (name);


--
-- Name: product_option_group_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_option_group_id_uindex ON public.product_option_group USING btree (id);


--
-- Name: product_option_group_name_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_option_group_name_id_uindex ON public.product_option_group_name USING btree (id);


--
-- Name: product_option_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_option_id_uindex ON public.product_option USING btree (id);


--
-- Name: product_option_name_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_option_name_id_uindex ON public.product_option_name USING btree (id);


--
-- Name: product_to_discount_plan_product_id_discount_plan_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_to_discount_plan_product_id_discount_plan_id_uindex ON public.product_to_discount_plan USING btree (product_id, discount_plan_id);


--
-- Name: product_to_option_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_to_option_id_uindex ON public.product_to_option USING btree (id);


--
-- Name: tag_type_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tag_type_name_index ON public.product_tag_type USING btree (name);


--
-- Name: user_email_username_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_email_username_status_index ON public."user" USING btree (email, username, status);


--
-- Name: product_category_name category_name_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_name
    ADD CONSTRAINT category_name_product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.product_category(id);


--
-- Name: discount_plan discount_plan_discount_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_plan
    ADD CONSTRAINT discount_plan_discount_type_id_fk FOREIGN KEY (discount_type_id) REFERENCES public.discount_type(id);


--
-- Name: discount_type discount_type_discount_logic_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_type
    ADD CONSTRAINT discount_type_discount_logic_id_fk FOREIGN KEY (discount_logic_type) REFERENCES public.discount_logic(id);


--
-- Name: order_message message_order_history_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_message
    ADD CONSTRAINT message_order_history_id_fk FOREIGN KEY (order_history_id) REFERENCES public.order_history(id);


--
-- Name: order_message message_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_message
    ADD CONSTRAINT message_user_id_fk FOREIGN KEY (from_user_id) REFERENCES public."user"(id);


--
-- Name: order_message message_user_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_message
    ADD CONSTRAINT message_user_id_fk_2 FOREIGN KEY (to_user_id) REFERENCES public."user"(id);


--
-- Name: order_history order_history_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_history_order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: order_history order_history_order_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_history_order_status_id_fk FOREIGN KEY (previous_status_id) REFERENCES public.order_status(id);


--
-- Name: order_history order_history_order_status_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT order_history_order_status_id_fk_2 FOREIGN KEY (status_id) REFERENCES public.order_status(id);


--
-- Name: order order_order_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_status_id_fk FOREIGN KEY (order_status_id) REFERENCES public.order_status(id);


--
-- Name: order order_payment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_payment_id_fk FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: order_to_product order_product_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_product
    ADD CONSTRAINT order_product_order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: order_to_product order_product_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_product
    ADD CONSTRAINT order_product_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: order order_shipping_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_shipping_id_fk FOREIGN KEY (shipping_id) REFERENCES public.shipping(id);


--
-- Name: order_status_name order_status_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_name
    ADD CONSTRAINT order_status_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: order_status_name order_status_name_order_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_name
    ADD CONSTRAINT order_status_name_order_status_id_fk FOREIGN KEY (order_status_id) REFERENCES public.order_status(id);


--
-- Name: order_to_shipping_option order_to_shipping_option_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_shipping_option
    ADD CONSTRAINT order_to_shipping_option_order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: order_to_shipping_option order_to_shipping_option_shipping_option_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_to_shipping_option
    ADD CONSTRAINT order_to_shipping_option_shipping_option_id_fk FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: order order_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: payment_name payment_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_name
    ADD CONSTRAINT payment_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: payment_name payment_name_payment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_name
    ADD CONSTRAINT payment_name_payment_id_fk FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: product product_brand_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fk FOREIGN KEY (brand_id) REFERENCES public.product_brand(id);


--
-- Name: product_brand_name product_brand_name_brand_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand_name
    ADD CONSTRAINT product_brand_name_brand_id_fk FOREIGN KEY (brand_id) REFERENCES public.product_brand(id);


--
-- Name: product_brand_name product_brand_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_brand_name
    ADD CONSTRAINT product_brand_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_category_name product_category_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_name
    ADD CONSTRAINT product_category_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_category_tree product_category_tree_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_tree
    ADD CONSTRAINT product_category_tree_product_category_id_fk FOREIGN KEY (child_id) REFERENCES public.product_category(id);


--
-- Name: product_category_tree product_category_tree_product_category_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category_tree
    ADD CONSTRAINT product_category_tree_product_category_id_fk_2 FOREIGN KEY (parent_id) REFERENCES public.product_category(id);


--
-- Name: product_to_discount_plan product_discount_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_discount_plan
    ADD CONSTRAINT product_discount_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_name product_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_name
    ADD CONSTRAINT product_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_name product_name_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_name
    ADD CONSTRAINT product_name_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_option_group_name product_option_group_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_name
    ADD CONSTRAINT product_option_group_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_option_group_name product_option_group_name_product_option_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_group_name
    ADD CONSTRAINT product_option_group_name_product_option_group_id_fk FOREIGN KEY (group_id) REFERENCES public.product_option_group(id);


--
-- Name: product_option_name product_option_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_name
    ADD CONSTRAINT product_option_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_option_name product_option_name_product_option_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_name
    ADD CONSTRAINT product_option_name_product_option_id_fk FOREIGN KEY (option_id) REFERENCES public.product_option(id);


--
-- Name: product_option product_option_product_option_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_option_group_id_fk FOREIGN KEY (option_group_id) REFERENCES public.product_option_group(id);


--
-- Name: product_option product_option_product_option_group_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_option_group_id_fk_2 FOREIGN KEY (option_group_id) REFERENCES public.product_option_group(id);


--
-- Name: product_to_option product_option_to_product_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_option
    ADD CONSTRAINT product_option_to_product_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_outstock_status_name product_outstock_status_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status_name
    ADD CONSTRAINT product_outstock_status_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_outstock_status_name product_outstock_status_name_product_outstock_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_outstock_status_name
    ADD CONSTRAINT product_outstock_status_name_product_outstock_status_id_fk FOREIGN KEY (product_outstock_status_id) REFERENCES public.product_outstock_status(id);


--
-- Name: product_price product_price_currency_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_currency_id_fk FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: product product_product_outstock_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_outstock_status_id_fk FOREIGN KEY (outstock_status_id) REFERENCES public.product_outstock_status(id);


--
-- Name: product product_product_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_status_id_fk FOREIGN KEY (product_status_id) REFERENCES public.product_status(id);


--
-- Name: product_review product_review_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_price product_set_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_set_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_status_name product_status_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status_name
    ADD CONSTRAINT product_status_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_status_name product_status_name_product_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status_name
    ADD CONSTRAINT product_status_name_product_status_id_fk FOREIGN KEY (product_status_id) REFERENCES public.product_status(id);


--
-- Name: product_tag_name product_tag_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_name
    ADD CONSTRAINT product_tag_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: product_tag_name product_tag_name_tag_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag_name
    ADD CONSTRAINT product_tag_name_tag_id_fk FOREIGN KEY (tag_id) REFERENCES public.product_tag(id);


--
-- Name: product_tag product_tag_tag_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_tag_type_id_fk FOREIGN KEY (tag_type) REFERENCES public.product_tag_type(id);


--
-- Name: product_to_category product_to_category_product_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_category
    ADD CONSTRAINT product_to_category_product_category_id_fk FOREIGN KEY (category_id) REFERENCES public.product_category(id);


--
-- Name: product_to_category product_to_category_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_category
    ADD CONSTRAINT product_to_category_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_to_discount_plan product_to_discount_discount_plan_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_discount_plan
    ADD CONSTRAINT product_to_discount_discount_plan_id_fk FOREIGN KEY (discount_plan_id) REFERENCES public.discount_plan(id);


--
-- Name: product_to_option product_to_option_product_option_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_option
    ADD CONSTRAINT product_to_option_product_option_id_fk FOREIGN KEY (option_id) REFERENCES public.product_option(id);


--
-- Name: product_to_promocode product_to_promocode_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_promocode
    ADD CONSTRAINT product_to_promocode_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_to_promocode product_to_promocode_promocode_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_promocode
    ADD CONSTRAINT product_to_promocode_promocode_id_fk FOREIGN KEY (promocode_id) REFERENCES public.promocode(id);


--
-- Name: product_to_tag product_to_tag_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_tag
    ADD CONSTRAINT product_to_tag_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_to_tag product_to_tag_tag_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_to_tag
    ADD CONSTRAINT product_to_tag_tag_id_fk FOREIGN KEY (tag_id) REFERENCES public.product_tag(id);


--
-- Name: promocode promocode_discount_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promocode
    ADD CONSTRAINT promocode_discount_type_id_fk FOREIGN KEY (discount_type_id) REFERENCES public.discount_type(id);


--
-- Name: shipping_name shipping_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_name
    ADD CONSTRAINT shipping_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: shipping_name shipping_name_shipping_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_name
    ADD CONSTRAINT shipping_name_shipping_id_fk FOREIGN KEY (shipping_id) REFERENCES public.shipping(id);


--
-- Name: shipping_option_name shipping_option_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_name
    ADD CONSTRAINT shipping_option_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: shipping_option_name shipping_option_name_shipping_option_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option_name
    ADD CONSTRAINT shipping_option_name_shipping_option_id_fk FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: shipping_option shipping_options_shipping_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_options_shipping_id_fk FOREIGN KEY (shipping_id) REFERENCES public.shipping(id);


--
-- Name: user_type_name user_type_name_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type_name
    ADD CONSTRAINT user_type_name_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.lang(id);


--
-- Name: user_type_name user_type_name_user_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_type_name
    ADD CONSTRAINT user_type_name_user_type_id_fk FOREIGN KEY (user_tape_id) REFERENCES public.user_type(id);


--
-- Name: user user_user_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_type_id_fk FOREIGN KEY (type_id) REFERENCES public.user_type(id);


--
-- PostgreSQL database dump complete
--

