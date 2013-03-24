--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: add_stamp(); Type: FUNCTION; Schema: public; Owner: vaadbait
--

CREATE FUNCTION add_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

NEW.update_time := CURRENT_TIMESTAMP;

IF (NEW.create_time IS NULL ) THEN

NEW.create_time := CURRENT_TIMESTAMP;

END IF;

RETURN NEW;

END;

$$;


ALTER FUNCTION public.add_stamp() OWNER TO vaadbait;

--
-- Name: ads_add_stamp(); Type: FUNCTION; Schema: public; Owner: vaadbait
--

CREATE FUNCTION ads_add_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

  BEGIN

    NEW.update_time := CURRENT_TIMESTAMP;

    IF (NEW.creation_date IS NULL ) THEN

     NEW.creation_date := CURRENT_TIMESTAMP;

    END IF;

    RETURN NEW;

  END;

  $$;


ALTER FUNCTION public.ads_add_stamp() OWNER TO vaadbait;

--
-- Name: commens_add_stamp(); Type: FUNCTION; Schema: public; Owner: vaadbait
--

CREATE FUNCTION commens_add_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

  BEGIN

    IF (NEW.create_time IS NULL ) THEN

     NEW.create_time := CURRENT_TIMESTAMP;

    END IF;

    RETURN NEW;

  END;

  $$;


ALTER FUNCTION public.commens_add_stamp() OWNER TO vaadbait;

--
-- Name: comments_add_stamp(); Type: FUNCTION; Schema: public; Owner: vaadbait
--

CREATE FUNCTION comments_add_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF (NEW.create_time IS NULL ) THEN
     NEW.create_time := CURRENT_TIMESTAMP;
    END IF;
    RETURN NEW;
  END;
  $$;


ALTER FUNCTION public.comments_add_stamp() OWNER TO vaadbait;

--
-- Name: posts_add_stamp(); Type: FUNCTION; Schema: public; Owner: vaadbait
--

CREATE FUNCTION posts_add_stamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    NEW.update_time := CURRENT_TIMESTAMP;
    IF (NEW.create_time IS NULL ) THEN
     NEW.create_time := CURRENT_TIMESTAMP;
    END IF;
    RETURN NEW;
  END;
  $$;


ALTER FUNCTION public.posts_add_stamp() OWNER TO vaadbait;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    building_id integer NOT NULL,
    bank_id integer,
    branch character varying(5),
    account_num character varying(255),
    remarks text,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.accounts OWNER TO vaadbait;

--
-- Name: TABLE accounts; Type: COMMENT; Schema: public; Owner: vaadbait
--

COMMENT ON TABLE accounts IS 'Store the vaadbait bank accounts.
Must be account with id = 1 (and building_id) as Cash account (Cannot be deleted)
';


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO vaadbait;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: ad_cat_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE ad_cat_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_cat_codes_seq_id OWNER TO vaadbait;

--
-- Name: apartments; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE apartments (
    id integer NOT NULL,
    building_id integer NOT NULL,
    apptype_id integer DEFAULT 1 NOT NULL,
    apt_num integer DEFAULT 1 NOT NULL,
    floor integer DEFAULT 1 NOT NULL,
    debit numeric(8,2) DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.apartments OWNER TO vaadbait;

--
-- Name: apartments_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE apartments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apartments_id_seq OWNER TO vaadbait;

--
-- Name: apartments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE apartments_id_seq OWNED BY apartments.id;


--
-- Name: app_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE app_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_codes_seq_id OWNER TO vaadbait;

--
-- Name: apptypes; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE apptypes (
    id integer NOT NULL,
    building_id integer NOT NULL,
    type_name character varying(255) DEFAULT 'דירת מגורים'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.apptypes OWNER TO vaadbait;

--
-- Name: apptypes_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE apptypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apptypes_id_seq OWNER TO vaadbait;

--
-- Name: apptypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE apptypes_id_seq OWNED BY apptypes.id;


--
-- Name: bank_code_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE bank_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_code_id_seq OWNER TO vaadbait;

--
-- Name: bank_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE bank_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_codes_seq_id OWNER TO vaadbait;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE banks (
    id integer NOT NULL,
    bank_name character varying(30),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.banks OWNER TO vaadbait;

--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_id_seq OWNER TO vaadbait;

--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE banks_id_seq OWNED BY banks.id;


--
-- Name: buildings; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE buildings (
    id integer NOT NULL,
    site_id integer NOT NULL,
    active boolean DEFAULT true,
    street character varying(25) NOT NULL,
    street_num character varying(7) NOT NULL,
    host character varying(10) NOT NULL,
    zipcode character varying(10),
    max_app integer DEFAULT 30 NOT NULL,
    min_floor integer DEFAULT (-2) NOT NULL,
    max_floor integer DEFAULT 10 NOT NULL,
    sloggen character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.buildings OWNER TO vaadbait;

--
-- Name: buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE buildings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buildings_id_seq OWNER TO vaadbait;

--
-- Name: buildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE buildings_id_seq OWNED BY buildings.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    building_id integer NOT NULL,
    category_name character varying(20) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO vaadbait;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO vaadbait;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    city_name character varying(20) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO vaadbait;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO vaadbait;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: cnttypes; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE cnttypes (
    id integer NOT NULL,
    building_id integer NOT NULL,
    cnttype_name character varying(15) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cnttypes OWNER TO vaadbait;

--
-- Name: cnttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE cnttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cnttypes_id_seq OWNER TO vaadbait;

--
-- Name: cnttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE cnttypes_id_seq OWNED BY cnttypes.id;


--
-- Name: comment_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE comment_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_codes_seq_id OWNER TO vaadbait;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    building_id integer NOT NULL,
    subject_id integer,
    tenant_id integer,
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO vaadbait;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO vaadbait;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contact_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE contact_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_codes_id_seq OWNER TO vaadbait;

--
-- Name: contact_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE contact_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_codes_seq_id OWNER TO vaadbait;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    building_id integer NOT NULL,
    contact_name character varying(25) NOT NULL,
    phone character varying(15),
    phone2 character varying(15),
    city character varying(15),
    remarks character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cnttype_id integer
);


ALTER TABLE public.contacts OWNER TO vaadbait;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO vaadbait;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: contacttypes; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE contacttypes (
    id integer NOT NULL,
    building_id integer NOT NULL,
    contact_id integer,
    cnttype_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacttypes OWNER TO vaadbait;

--
-- Name: contacttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE contacttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacttypes_id_seq OWNER TO vaadbait;

--
-- Name: contacttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE contacttypes_id_seq OWNED BY contacttypes.id;


--
-- Name: forums; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE forums (
    id integer NOT NULL,
    building_id integer NOT NULL,
    tenant_id integer,
    forum_name character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.forums OWNER TO vaadbait;

--
-- Name: forums_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE forums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forums_id_seq OWNER TO vaadbait;

--
-- Name: forums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE forums_id_seq OWNED BY forums.id;


--
-- Name: maintenances; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE maintenances (
    id integer NOT NULL,
    building_id integer NOT NULL,
    apartment_id integer,
    start_at date,
    every integer,
    every_type integer,
    cost numeric,
    last_reminder date,
    next_reminder date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maintenances OWNER TO vaadbait;

--
-- Name: maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE maintenances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenances_id_seq OWNER TO vaadbait;

--
-- Name: maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE maintenances_id_seq OWNED BY maintenances.id;


--
-- Name: pay_codes_id_seqpay_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE pay_codes_id_seqpay_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_codes_id_seqpay_codes_id_seq OWNER TO vaadbait;

--
-- Name: pay_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE pay_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_codes_seq_id OWNER TO vaadbait;

--
-- Name: poll_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE poll_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poll_codes_seq_id OWNER TO vaadbait;

--
-- Name: post_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE post_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_codes_seq_id OWNER TO vaadbait;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    building_id integer NOT NULL,
    title character varying(255),
    forum_id integer NOT NULL,
    tenant_id integer,
    on_front boolean,
    sticky boolean,
    post_pic character varying(255),
    body text,
    tags character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id integer
);


ALTER TABLE public.posts OWNER TO vaadbait;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO vaadbait;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: pricelists; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE pricelists (
    id integer NOT NULL,
    building_id integer NOT NULL,
    apartment_id integer DEFAULT 1,
    start_at date,
    end_at date,
    amount numeric(7,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pricelists OWNER TO vaadbait;

--
-- Name: pricelists_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE pricelists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricelists_id_seq OWNER TO vaadbait;

--
-- Name: pricelists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE pricelists_id_seq OWNED BY pricelists.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    building_id integer NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(20) NOT NULL,
    description text,
    approx_cost numeric,
    actual_cost numeric,
    approx_start_date date,
    actual_start_date date,
    approx_end_date date,
    actual_end_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO vaadbait;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO vaadbait;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: sites; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE sites (
    id integer NOT NULL,
    city_id integer,
    site_name character varying(20) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sites OWNER TO vaadbait;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO vaadbait;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE subjects (
    id integer NOT NULL,
    building_id integer NOT NULL,
    forum_id integer,
    tenant_id integer,
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id integer
);


ALTER TABLE public.subjects OWNER TO vaadbait;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO vaadbait;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: task_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE task_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_codes_seq_id OWNER TO vaadbait;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    building_id integer NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    tenant_id integer DEFAULT 0 NOT NULL,
    title character varying(20) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    complete_date date,
    due_date date,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO vaadbait;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO vaadbait;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: tenants; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE tenants (
    id integer NOT NULL,
    building_id integer NOT NULL,
    apartment_id integer NOT NULL,
    surname character varying(15) NOT NULL,
    name character varying(15) NOT NULL,
    occupation character varying(30),
    birthday date,
    app_phone character varying(15),
    mobile character varying(15),
    receive_mails boolean DEFAULT false,
    is_active boolean DEFAULT false,
    is_owner boolean DEFAULT true,
    is_vaad boolean DEFAULT false,
    role character varying(30) DEFAULT 'tenant'::character varying,
    is_admin boolean DEFAULT false,
    email character varying(255) NOT NULL,
    crypted_password character varying(255) NOT NULL,
    password_salt character varying(255) NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tenants OWNER TO vaadbait;

--
-- Name: COLUMN tenants.role; Type: COMMENT; Schema: public; Owner: vaadbait
--

COMMENT ON COLUMN tenants.role IS 'valid values:
  admin
  sitevaad
  vaad
  tenant';


--
-- Name: tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenants_id_seq OWNER TO vaadbait;

--
-- Name: tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE tenants_id_seq OWNED BY tenants.id;


--
-- Name: ticket_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE ticket_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_codes_seq_id OWNER TO vaadbait;

--
-- Name: ticket_statuses; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE ticket_statuses (
    id integer NOT NULL,
    description text,
    opened_by integer,
    title character varying(50) NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    building_id integer NOT NULL
);


ALTER TABLE public.ticket_statuses OWNER TO vaadbait;

--
-- Name: ticket_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE ticket_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_statuses_id_seq OWNER TO vaadbait;

--
-- Name: ticket_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE ticket_statuses_id_seq OWNED BY ticket_statuses.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE tickets (
    id integer NOT NULL,
    building_id integer NOT NULL,
    tenant_id integer,
    title character varying(25) NOT NULL,
    status character varying(15),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ticket_status_id integer,
    opened_by integer
);


ALTER TABLE public.tickets OWNER TO vaadbait;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO vaadbait;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE TABLE transactions (
    id integer NOT NULL,
    building_id integer NOT NULL,
    project_id integer,
    category_id integer,
    account_id integer,
    apartment_id integer,
    amount numeric,
    bank_id integer,
    branch character varying(5),
    chk_no character varying(10),
    chk_date date,
    reference character varying(15),
    remarks character varying(255),
    from_month date,
    to_month date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.transactions OWNER TO vaadbait;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO vaadbait;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vaadbait
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: trn_cat_codes_seq_id; Type: SEQUENCE; Schema: public; Owner: vaadbait
--

CREATE SEQUENCE trn_cat_codes_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trn_cat_codes_seq_id OWNER TO vaadbait;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY apartments ALTER COLUMN id SET DEFAULT nextval('apartments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY apptypes ALTER COLUMN id SET DEFAULT nextval('apptypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY banks ALTER COLUMN id SET DEFAULT nextval('banks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY buildings ALTER COLUMN id SET DEFAULT nextval('buildings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY cnttypes ALTER COLUMN id SET DEFAULT nextval('cnttypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacttypes ALTER COLUMN id SET DEFAULT nextval('contacttypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY forums ALTER COLUMN id SET DEFAULT nextval('forums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY maintenances ALTER COLUMN id SET DEFAULT nextval('maintenances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY pricelists ALTER COLUMN id SET DEFAULT nextval('pricelists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tenants ALTER COLUMN id SET DEFAULT nextval('tenants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY ticket_statuses ALTER COLUMN id SET DEFAULT nextval('ticket_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY accounts (id, building_id, bank_id, branch, account_num, remarks, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('accounts_id_seq', 1, false);


--
-- Name: ad_cat_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('ad_cat_codes_seq_id', 2, true);


--
-- Data for Name: apartments; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY apartments (id, building_id, apptype_id, apt_num, floor, debit, created_at, updated_at) FROM stdin;
0	0	0	1	1	0.00	2013-03-24 17:53:01.264052	2013-03-24 17:53:01.264052
\.


--
-- Name: apartments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('apartments_id_seq', 1, true);


--
-- Name: app_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('app_codes_seq_id', 1, false);


--
-- Data for Name: apptypes; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY apptypes (id, building_id, type_name, created_at, updated_at) FROM stdin;
0	0	דירה פיקטיבית	2013-03-24 17:52:18.816375	2013-03-24 17:52:18.816375
\.


--
-- Name: apptypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('apptypes_id_seq', 1, false);


--
-- Name: bank_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('bank_code_id_seq', 1, false);


--
-- Name: bank_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('bank_codes_seq_id', 55, true);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY banks (id, bank_name, created_at, updated_at) FROM stdin;
0	מזומן	2012-08-08 06:51:25.605115	2012-08-08 06:51:25.605115
1	אשראי	2012-08-08 06:51:25.605115	2012-08-08 06:51:25.605115
26	יובנק בע"מ	2012-08-08 06:51:25.687987	2012-08-08 06:51:25.687987
46	בנק מסד בע"מ	2012-08-08 06:51:25.704638	2012-08-08 06:51:25.704638
31	בנק בינלאומי ראשון	2012-08-08 06:52:33.793995	2012-08-08 03:54:21.671149
4	בנק יהב לעובדי המדינה	2012-08-08 06:51:25.621282	2012-08-08 04:03:43.381628
10	בנק לאומי לישראל	2012-08-08 06:51:25.629592	2012-08-08 04:04:17.222989
11	בנק דיסקונט לישראל	2012-08-08 06:51:25.637932	2012-08-08 04:04:28.58472
12	בנק הפועלים	2012-08-08 06:51:25.646306	2012-08-08 04:04:36.505775
13	בנק אגוד לישראל	2012-08-08 06:51:25.654638	2012-08-08 04:05:11.747323
14	בנק אוצר החייל	2012-08-08 06:51:25.662967	2012-08-08 04:05:21.118781
17	בנק מרכנתיל דיסקונט 	2012-08-08 06:51:25.671298	2012-08-08 04:05:28.900255
20	בנק מזרחי טפחות	2012-08-08 06:51:25.679635	2012-08-08 04:05:36.988432
34	בנק ערבי ישראלי	2012-08-08 06:51:25.696581	2012-08-08 04:05:49.448266
52	בנק פועלי אגודת ישראל	2012-08-08 06:51:25.712957	2012-08-08 04:05:57.586331
54	בנק ירושלים	2012-08-08 06:51:25.721248	2012-08-08 04:06:06.386965
68	בנק דקסיה ישראל	2012-08-08 06:51:25.729671	2012-08-08 04:06:14.812736
\.


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('banks_id_seq', 1, false);


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY buildings (id, site_id, active, street, street_num, host, zipcode, max_app, min_floor, max_floor, sloggen, created_at, updated_at) FROM stdin;
0	0	t	רחוב פיקטיבי	0	vaadbait	\N	30	-2	10	\N	2013-03-24 17:49:46.177457	2013-03-24 17:49:46.177457
\.


--
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('buildings_id_seq', 10, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY categories (id, building_id, category_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY cities (id, city_name, description, created_at, updated_at) FROM stdin;
0	עיר פיקטיבית	עיר פיקטיבית	2013-03-24 17:46:12.323013	2013-03-24 17:46:12.323013
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('cities_id_seq', 4, true);


--
-- Data for Name: cnttypes; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY cnttypes (id, building_id, cnttype_name, created_at, updated_at) FROM stdin;
\.


--
-- Name: cnttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('cnttypes_id_seq', 1, false);


--
-- Name: comment_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('comment_codes_seq_id', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY comments (id, building_id, subject_id, tenant_id, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Name: contact_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('contact_codes_id_seq', 6, true);


--
-- Name: contact_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('contact_codes_seq_id', 2, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY contacts (id, building_id, contact_name, phone, phone2, city, remarks, created_at, updated_at, cnttype_id) FROM stdin;
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('contacts_id_seq', 1, false);


--
-- Data for Name: contacttypes; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY contacttypes (id, building_id, contact_id, cnttype_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: contacttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('contacttypes_id_seq', 1, false);


--
-- Data for Name: forums; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY forums (id, building_id, tenant_id, forum_name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: forums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('forums_id_seq', 4, true);


--
-- Data for Name: maintenances; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY maintenances (id, building_id, apartment_id, start_at, every, every_type, cost, last_reminder, next_reminder, created_at, updated_at) FROM stdin;
\.


--
-- Name: maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('maintenances_id_seq', 1, false);


--
-- Name: pay_codes_id_seqpay_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('pay_codes_id_seqpay_codes_id_seq', 1, false);


--
-- Name: pay_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('pay_codes_seq_id', 1, false);


--
-- Name: poll_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('poll_codes_seq_id', 1, false);


--
-- Name: post_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('post_codes_seq_id', 100, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY posts (id, building_id, title, forum_id, tenant_id, on_front, sticky, post_pic, body, tags, created_at, updated_at, author_id) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('posts_id_seq', 3, true);


--
-- Data for Name: pricelists; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY pricelists (id, building_id, apartment_id, start_at, end_at, amount, created_at, updated_at) FROM stdin;
\.


--
-- Name: pricelists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('pricelists_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY projects (id, building_id, category_id, title, description, approx_cost, actual_cost, approx_start_date, actual_start_date, approx_end_date, actual_end_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY sites (id, city_id, site_name, description, created_at, updated_at) FROM stdin;
0	0	אתר פיקטיבי	אתר פיקטיבי	2013-03-24 17:47:34.346401	2013-03-24 17:47:34.346401
\.


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('sites_id_seq', 2, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY subjects (id, building_id, forum_id, tenant_id, title, body, created_at, updated_at, author_id) FROM stdin;
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('subjects_id_seq', 1, false);


--
-- Name: task_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('task_codes_seq_id', 100, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY tasks (id, building_id, category_id, tenant_id, title, status, complete_date, due_date, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('tasks_id_seq', 1, false);


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY tenants (id, building_id, apartment_id, surname, name, occupation, birthday, app_phone, mobile, receive_mails, is_active, is_owner, is_vaad, role, is_admin, email, crypted_password, password_salt, reset_password_token, reset_password_sent_at, remember_created_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, created_at, updated_at) FROM stdin;
0	0	0	חיון	אלי	\N	\N	\N	\N	f	t	t	f	admin	t	elihayun@gmail.com	$2a$10$z418fiAvWiTkCETKlb4GoOIhLpT2LYBc.mZef/E/b2VcRXwnlvhP2		\N	\N	\N	\N	\N	\N	\N	2013-03-24 17:55:07.935286	2013-03-24 17:55:07.935286
\.


--
-- Name: tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('tenants_id_seq', 8, true);


--
-- Name: ticket_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('ticket_codes_seq_id', 100, true);


--
-- Data for Name: ticket_statuses; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY ticket_statuses (id, description, opened_by, title, updated_at, created_at, building_id) FROM stdin;
\.


--
-- Name: ticket_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('ticket_statuses_id_seq', 1, false);


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY tickets (id, building_id, tenant_id, title, status, description, created_at, updated_at, ticket_status_id, opened_by) FROM stdin;
\.


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('tickets_id_seq', 1, false);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: vaadbait
--

COPY transactions (id, building_id, project_id, category_id, account_id, apartment_id, amount, bank_id, branch, chk_no, chk_date, reference, remarks, from_month, to_month, created_at, updated_at) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Name: trn_cat_codes_seq_id; Type: SEQUENCE SET; Schema: public; Owner: vaadbait
--

SELECT pg_catalog.setval('trn_cat_codes_seq_id', 10, true);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id, building_id);


--
-- Name: apartments_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (id, building_id);


--
-- Name: apptypes_building_id_type_name_key; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY apptypes
    ADD CONSTRAINT apptypes_building_id_type_name_key UNIQUE (building_id, type_name);


--
-- Name: apptypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY apptypes
    ADD CONSTRAINT apptypes_pkey PRIMARY KEY (id, building_id);


--
-- Name: banks_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: buildings_host_key; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT buildings_host_key UNIQUE (host);


--
-- Name: buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id, building_id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cnttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY cnttypes
    ADD CONSTRAINT cnttypes_pkey PRIMARY KEY (id, building_id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id, building_id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id, building_id);


--
-- Name: contacttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY contacttypes
    ADD CONSTRAINT contacttypes_pkey PRIMARY KEY (id, building_id);


--
-- Name: forums_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY forums
    ADD CONSTRAINT forums_pkey PRIMARY KEY (id, building_id);


--
-- Name: maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY maintenances
    ADD CONSTRAINT maintenances_pkey PRIMARY KEY (id, building_id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id, building_id);


--
-- Name: pricelists_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY pricelists
    ADD CONSTRAINT pricelists_pkey PRIMARY KEY (id, building_id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id, building_id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id, building_id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id, building_id);


--
-- Name: tenants_email_key; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT tenants_email_key UNIQUE (email);


--
-- Name: tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id, building_id);


--
-- Name: ticket_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY ticket_statuses
    ADD CONSTRAINT ticket_statuses_pkey PRIMARY KEY (id);


--
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id, building_id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vaadbait; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id, building_id);


--
-- Name: index_ticket_statuses_building; Type: INDEX; Schema: public; Owner: vaadbait; Tablespace: 
--

CREATE INDEX index_ticket_statuses_building ON ticket_statuses USING btree (building_id);


--
-- Name: accounts_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: apartments_apptype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY apartments
    ADD CONSTRAINT apartments_apptype_id_fkey FOREIGN KEY (apptype_id, building_id) REFERENCES apptypes(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: apartments_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY apartments
    ADD CONSTRAINT apartments_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: apptypes_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY apptypes
    ADD CONSTRAINT apptypes_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: buildings_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT buildings_site_id_fkey FOREIGN KEY (site_id) REFERENCES sites(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: categories_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cnttypes_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY cnttypes
    ADD CONSTRAINT cnttypes_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_subject_id_fkey FOREIGN KEY (subject_id, building_id) REFERENCES subjects(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: contacts_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contacttypes_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacttypes
    ADD CONSTRAINT contacttypes_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contacttypes_cnttype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacttypes
    ADD CONSTRAINT contacttypes_cnttype_id_fkey FOREIGN KEY (cnttype_id, building_id) REFERENCES cnttypes(id, building_id);


--
-- Name: contacttypes_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY contacttypes
    ADD CONSTRAINT contacttypes_contact_id_fkey FOREIGN KEY (contact_id, building_id) REFERENCES contacts(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: forums_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY forums
    ADD CONSTRAINT forums_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: forums_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY forums
    ADD CONSTRAINT forums_tenant_id_fkey FOREIGN KEY (tenant_id, building_id) REFERENCES tenants(id, building_id);


--
-- Name: maintenances_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY maintenances
    ADD CONSTRAINT maintenances_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: posts_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: posts_forum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_forum_id_fkey FOREIGN KEY (forum_id, building_id) REFERENCES forums(id, building_id);


--
-- Name: pricelists_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY pricelists
    ADD CONSTRAINT pricelists_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_category_id_fkey FOREIGN KEY (category_id, building_id) REFERENCES categories(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sites_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: subjects_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: subjects_forum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_forum_id_fkey FOREIGN KEY (forum_id, building_id) REFERENCES forums(id, building_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tasks_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tasks_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_category_id_fkey FOREIGN KEY (category_id, building_id) REFERENCES categories(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tenants_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT tenants_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id, building_id) REFERENCES accounts(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transactions_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_building_id_fkey FOREIGN KEY (building_id) REFERENCES buildings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_category_id_fkey FOREIGN KEY (category_id, building_id) REFERENCES categories(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transactions_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vaadbait
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_project_id_fkey FOREIGN KEY (project_id, building_id) REFERENCES projects(id, building_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

