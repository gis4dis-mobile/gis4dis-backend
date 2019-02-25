--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO rest;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO rest;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO rest;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO rest;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: api_category; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.api_category OWNER TO rest;

--
-- Name: api_category_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_category_id_seq OWNER TO rest;

--
-- Name: api_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_category_id_seq OWNED BY public.api_category.id;


--
-- Name: api_dictionary; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_dictionary (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    parameter_id integer NOT NULL,
    i18n_tag character varying(512) NOT NULL
);


ALTER TABLE public.api_dictionary OWNER TO rest;

--
-- Name: api_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_dictionary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_dictionary_id_seq OWNER TO rest;

--
-- Name: api_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_dictionary_id_seq OWNED BY public.api_dictionary.id;


--
-- Name: api_dictionarylocalization; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_dictionarylocalization (
    id integer NOT NULL,
    language character varying(3) NOT NULL,
    name character varying(255) NOT NULL,
    dictionary_id integer NOT NULL
);


ALTER TABLE public.api_dictionarylocalization OWNER TO rest;

--
-- Name: api_dictionarylocalization_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_dictionarylocalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_dictionarylocalization_id_seq OWNER TO rest;

--
-- Name: api_dictionarylocalization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_dictionarylocalization_id_seq OWNED BY public.api_dictionarylocalization.id;


--
-- Name: api_help; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_help (
    id integer NOT NULL,
    text text NOT NULL,
    phenomenon_id integer NOT NULL,
    i18n_tag character varying(512) NOT NULL
);


ALTER TABLE public.api_help OWNER TO rest;

--
-- Name: api_help_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_help_id_seq OWNER TO rest;

--
-- Name: api_help_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_help_id_seq OWNED BY public.api_help.id;


--
-- Name: api_helplocalization; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_helplocalization (
    id integer NOT NULL,
    language character varying(3) NOT NULL,
    text text NOT NULL,
    help_id integer NOT NULL
);


ALTER TABLE public.api_helplocalization OWNER TO rest;

--
-- Name: api_helplocalization_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_helplocalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_helplocalization_id_seq OWNER TO rest;

--
-- Name: api_helplocalization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_helplocalization_id_seq OWNED BY public.api_helplocalization.id;


--
-- Name: api_localization; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_localization (
    id integer NOT NULL,
    language character varying(3) NOT NULL,
    dictionary jsonb NOT NULL
);


ALTER TABLE public.api_localization OWNER TO rest;

--
-- Name: api_localization_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_localization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_localization_id_seq OWNER TO rest;

--
-- Name: api_localization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_localization_id_seq OWNED BY public.api_localization.id;


--
-- Name: api_metadataobservation; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_metadataobservation (
    id integer NOT NULL,
    send_date timestamp with time zone NOT NULL,
    note text,
    geometry public.geometry(Point,4326),
    observation_date timestamp with time zone,
    user_id integer
);


ALTER TABLE public.api_metadataobservation OWNER TO rest;

--
-- Name: api_metadataobservation_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_metadataobservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_metadataobservation_id_seq OWNER TO rest;

--
-- Name: api_metadataobservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_metadataobservation_id_seq OWNED BY public.api_metadataobservation.id;


--
-- Name: api_metadataobservation_values; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_metadataobservation_values (
    id integer NOT NULL,
    metadataobservation_id integer NOT NULL,
    phenomenonparametervalue_id integer NOT NULL
);


ALTER TABLE public.api_metadataobservation_values OWNER TO rest;

--
-- Name: api_metadataobservation_value_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_metadataobservation_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_metadataobservation_value_id_seq OWNER TO rest;

--
-- Name: api_metadataobservation_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_metadataobservation_value_id_seq OWNED BY public.api_metadataobservation_values.id;


--
-- Name: api_parameter; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_parameter (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    phenomenon_id integer NOT NULL,
    element character varying(255) NOT NULL,
    i18n_tag character varying(512) NOT NULL,
    mandatory boolean NOT NULL
);


ALTER TABLE public.api_parameter OWNER TO rest;

--
-- Name: api_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_parameter_id_seq OWNER TO rest;

--
-- Name: api_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_parameter_id_seq OWNED BY public.api_parameter.id;


--
-- Name: api_parameterlocalization; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_parameterlocalization (
    id integer NOT NULL,
    language character varying(3) NOT NULL,
    name character varying(255) NOT NULL,
    parameter_id integer NOT NULL
);


ALTER TABLE public.api_parameterlocalization OWNER TO rest;

--
-- Name: api_parameterlocalization_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_parameterlocalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_parameterlocalization_id_seq OWNER TO rest;

--
-- Name: api_parameterlocalization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_parameterlocalization_id_seq OWNED BY public.api_parameterlocalization.id;


--
-- Name: api_phenomenon; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_phenomenon (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer NOT NULL,
    i18n_tag character varying(512) NOT NULL
);


ALTER TABLE public.api_phenomenon OWNER TO rest;

--
-- Name: api_phenomenon_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_phenomenon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_phenomenon_id_seq OWNER TO rest;

--
-- Name: api_phenomenon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_phenomenon_id_seq OWNED BY public.api_phenomenon.id;


--
-- Name: api_phenomenonlocalization; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_phenomenonlocalization (
    id integer NOT NULL,
    language character varying(3) NOT NULL,
    name character varying(255) NOT NULL,
    phenomenon_id integer NOT NULL
);


ALTER TABLE public.api_phenomenonlocalization OWNER TO rest;

--
-- Name: api_phenomenonlocalization_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_phenomenonlocalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_phenomenonlocalization_id_seq OWNER TO rest;

--
-- Name: api_phenomenonlocalization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_phenomenonlocalization_id_seq OWNED BY public.api_phenomenonlocalization.id;


--
-- Name: api_phenomenonparametervalue; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_phenomenonparametervalue (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    parameter_id integer NOT NULL,
    phenomenon_id integer NOT NULL
);


ALTER TABLE public.api_phenomenonparametervalue OWNER TO rest;

--
-- Name: api_phenomenonparametervalue_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_phenomenonparametervalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_phenomenonparametervalue_id_seq OWNER TO rest;

--
-- Name: api_phenomenonparametervalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_phenomenonparametervalue_id_seq OWNED BY public.api_phenomenonparametervalue.id;


--
-- Name: api_phenomenonphoto; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_phenomenonphoto (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    owner_id integer NOT NULL,
    parameter_id integer,
    observation_id integer
);


ALTER TABLE public.api_phenomenonphoto OWNER TO rest;

--
-- Name: api_phenomenonphoto_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_phenomenonphoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_phenomenonphoto_id_seq OWNER TO rest;

--
-- Name: api_phenomenonphoto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_phenomenonphoto_id_seq OWNED BY public.api_phenomenonphoto.id;


--
-- Name: api_userprofile; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_userprofile (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    age integer,
    education character varying(128),
    user_id integer NOT NULL,
    gender character varying(10),
    qualification character varying(128)
);


ALTER TABLE public.api_userprofile OWNER TO rest;

--
-- Name: api_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_userprofile_id_seq OWNER TO rest;

--
-- Name: api_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_userprofile_id_seq OWNED BY public.api_userprofile.id;


--
-- Name: api_version; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.api_version (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    version character varying(5) NOT NULL
);


ALTER TABLE public.api_version OWNER TO rest;

--
-- Name: api_version_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.api_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_version_id_seq OWNER TO rest;

--
-- Name: api_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.api_version_id_seq OWNED BY public.api_version.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO rest;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO rest;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO rest;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO rest;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO rest;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO rest;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO rest;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO rest;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO rest;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO rest;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO rest;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO rest;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO rest;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO rest;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO rest;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO rest;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO rest;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO rest;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO rest;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO rest;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO rest;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO rest;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO rest;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO rest;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO rest;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO rest;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO rest;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO rest;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: rest
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO rest;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: rest
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO rest;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rest
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: api_category id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_category ALTER COLUMN id SET DEFAULT nextval('public.api_category_id_seq'::regclass);


--
-- Name: api_dictionary id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionary ALTER COLUMN id SET DEFAULT nextval('public.api_dictionary_id_seq'::regclass);


--
-- Name: api_dictionarylocalization id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionarylocalization ALTER COLUMN id SET DEFAULT nextval('public.api_dictionarylocalization_id_seq'::regclass);


--
-- Name: api_help id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_help ALTER COLUMN id SET DEFAULT nextval('public.api_help_id_seq'::regclass);


--
-- Name: api_helplocalization id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_helplocalization ALTER COLUMN id SET DEFAULT nextval('public.api_helplocalization_id_seq'::regclass);


--
-- Name: api_localization id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_localization ALTER COLUMN id SET DEFAULT nextval('public.api_localization_id_seq'::regclass);


--
-- Name: api_metadataobservation id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation ALTER COLUMN id SET DEFAULT nextval('public.api_metadataobservation_id_seq'::regclass);


--
-- Name: api_metadataobservation_values id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation_values ALTER COLUMN id SET DEFAULT nextval('public.api_metadataobservation_value_id_seq'::regclass);


--
-- Name: api_parameter id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameter ALTER COLUMN id SET DEFAULT nextval('public.api_parameter_id_seq'::regclass);


--
-- Name: api_parameterlocalization id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameterlocalization ALTER COLUMN id SET DEFAULT nextval('public.api_parameterlocalization_id_seq'::regclass);


--
-- Name: api_phenomenon id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenon ALTER COLUMN id SET DEFAULT nextval('public.api_phenomenon_id_seq'::regclass);


--
-- Name: api_phenomenonlocalization id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonlocalization ALTER COLUMN id SET DEFAULT nextval('public.api_phenomenonlocalization_id_seq'::regclass);


--
-- Name: api_phenomenonparametervalue id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonparametervalue ALTER COLUMN id SET DEFAULT nextval('public.api_phenomenonparametervalue_id_seq'::regclass);


--
-- Name: api_phenomenonphoto id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonphoto ALTER COLUMN id SET DEFAULT nextval('public.api_phenomenonphoto_id_seq'::regclass);


--
-- Name: api_userprofile id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_userprofile ALTER COLUMN id SET DEFAULT nextval('public.api_userprofile_id_seq'::regclass);


--
-- Name: api_version id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_version ALTER COLUMN id SET DEFAULT nextval('public.api_version_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
92	461278@mail.muni.cz	t	t	82
91	460401@mail.muni.cz	t	t	81
95	simi.buckova@gmail.com	t	t	85
8	petrsilhak@hotmail.com	t	t	1
96	anetryglova@seznam.cz	t	t	86
97	zaneta.1996@seznam.cz	f	t	87
98	zacekjity@seznam.cz	t	t	88
94	461032@mail.muni.cz	t	t	84
100	rostislavhorava@gmail.com	t	t	90
99	eilonwynka@seznam.cz	t	t	89
101	gamesorl@seznam.cz	t	t	91
102	chovanec.d@seznam.cz	t	t	92
27	leitgeb@mail.muni.cz	f	t	30
107	jiapengxu18@163.com	t	t	94
18	leitgeb.simon@gmail.com	t	t	21
120	petrsilhak@gmail.com	t	t	98
121	zkyzkyex@gmail.com	t	t	99
88	kubicek@geogr.muni.cz	t	t	78
89	zstachon@gmail.com	t	t	79
90	t.staud@seznam.cz	t	t	80
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: api_category; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_category (id, name) FROM stdin;
1	Drought
2	Waterlogging China app
3	Microforms
\.


--
-- Data for Name: api_dictionary; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_dictionary (id, value, parameter_id, i18n_tag) FROM stdin;
16	Tafoni	31	g4d-di-tafoni
15	Žlábkové škrapy	31	g4d-di-zlabkove-skrapy
14	Voštiny	31	g4d-di-vostiny
13	Výklenek	31	g4d-di-vyklenek
12	Skalní mísa	31	g4d-di-skalni-misa
17	Balvany	32	g4d-di-balvany
18	Skalní hradby/izolované skály	32	g4d-di-skalni-hradby-izolovane-skaly
19	Viklany	32	g4d-di-viklany
20	Skalní hřiby	32	g4d-di-skalní-hriby
11	once a month	7	g4d-on-mon
10	once a week	7	g4d-on-wee
9	more often than once a week	7	g4d-mo-th-wee
5	rock outcrop or other extreme habitat	4	g4d-out-habi
4	solitaire in the landscape	4	g4d-soli-land
3	forest stand	4	g4d-for-land
2	coniferous	3	g4d-con
1	deciduous	3	g4d-dec
6	city or other type of development	4	g4d-cit-o-typ-dev
23	6-12cm	41	g4d-di-6-12cm
24	More than 12cm	41	g4d-di-more-than-12cm
25	Expedite	42	g4d-di-expedite
26	Congested	42	g4d-di-congested
27	Blocked	42	g4d-di-blocked
22	1-5 cm	41	g4d-di-1-5-cm
21	Less than 1 cm	41	g4d-di-less-than-1-cm
\.


--
-- Data for Name: api_dictionarylocalization; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_dictionarylocalization (id, language, name, dictionary_id) FROM stdin;
19	en	Skalní mísa	12
20	cs	Skalní mísa	12
21	en	Výklenek	13
22	cs	Výklenek	13
23	en	Voštiny	14
24	cs	Voštiny	14
25	en	Žlábkové škrapy	15
26	cs	Žlábkové škrapy	15
27	en	Tafoni	16
28	cs	Tafoni	16
29	en	Balvany	17
30	cs	Balvany	17
31	en	Skalní hradby/izolované skály	18
32	cs	Skalní hradby/izolované skály	18
33	en	Viklany	19
34	cs	Viklany	19
35	en	Skalní hřiby	20
36	cs	Skalní hřiby	20
2	cs	jehličnatý	2
1	cs	listnatý	1
3	cs	lesní stanoviště	3
4	cs	solitér v krajině	4
5	cs	skální výchoz a jiné extrémní stanoviště	5
6	cs	město nebo jiná zastavba	6
7	cs	častěji než jednou týdně	9
8	cs	jednou týdně	10
9	cs	jednou za měsíc	11
10	en	once a month	11
11	en	once a week	10
12	en	more often than once a week	9
13	en	rock outcrop or other extreme habitat	5
14	en	solitaire in the landscape	4
15	en	forest stand	3
16	en	coniferous	2
17	en	deciduous	1
18	en	city or other type of development	6
43	en	Less than 1 cm	21
44	en	1-5 cm	22
45	en	6-12 cm	23
46	en	More than 12 cm	24
47	en	Expedite	25
48	en	Congested	26
49	en	Blocked	27
50	cn	/·小于1cm	21
51	cn	1-5cm	22
52	cn	6-12cm	23
53	cn	大于12cm	24
54	cn	畅通	25
55	cn	缓行	26
56	cn	拥堵	27
\.


--
-- Data for Name: api_help; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_help (id, text, phenomenon_id, i18n_tag) FROM stdin;
3	<p>Help</p>	3	g4d-sand-micro-help
4	<p>Help</p>	4	g4d-he-4
1	<p>Although trees are equipped with water scarcity mechanisms, tree responses usually depend on many factors including, for example, soil type, tree density, age, or tree health.</p>\r\n\r\n<h6><strong>Key signs:</strong></h6>\r\n\r\n<ul>\r\n\t<li>Withering\r\n\t<ul>\r\n\t\t<li>Withering of leaves appears as sign of shorter dryness in the day and overnight can disappear. In the case of prolonged drought, leaf wrinkling is permanent.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Change leaf color\r\n\t<ul>\r\n\t\t<li>Resulting in brown or yellow leaves or the drying ends whole leaves or their parts</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/leaf_color.jpg" style="height:236px; width:200px" /></p>\r\n\r\n<ul>\r\n\t<li>Defoliation\r\n\t<ul>\r\n\t\t<li>Partial or complete loss of leaves</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Bark beetle attacks and other pest attacks\r\n\t<ul>\r\n\t\t<li>Not applicable to areas with bark beetle</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h6><strong>List of observed parameters: </strong></h6>\r\n\r\n<ul>\r\n\t<li>Tree height\r\n\t<ul>\r\n\t\t<li>at a height of 1.3 meters</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/diameter.png" style="height:214px; width:150px" /></p>\r\n\r\n<ul>\r\n\t<li>Trunk diameter\r\n\t<ul>\r\n\t\t<li>Measured at 1.3 m above the ground. For trees (or shrubs) where the branching below begins, the diameter is determined to the point of branching</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Type of tree</li>\r\n\t<li>Type of location</li>\r\n\t<li>Chemical treatment in the vicinity\r\n\t<ul>\r\n\t\t<li>Information about chemical treatment of field crops or other areas in the vicinity of the observed tree.</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<h6><strong>How to take a photo: </strong></h6>\r\n\r\n<ul>\r\n\t<li>Photos of the entire tree</li>\r\n\t<li>Photos about drought signs</li>\r\n</ul>	1	g4d-dry-veg-help
2	<p>The absence of mushrooms is a very good indicator of drought. Although absence is very difficult to record, the specified absence of mushrooms will be replicated by other users moving near your observation.</p>\r\n\r\n<p>If you visit regularly, it is likely that you are better able to evaluate the reasons for the absence of mushrooms. This fact is taken into account by the observation regularity parameter.</p>\r\n\r\n<p>The absence of mushrooms does not appear in a group of saprophytic mushrooms that usually parasite on wood. They also get water from the wood, which excludes them from using drought mapping. Such mushrooms often grow on tree trunks, but they can also occur on roots that are hidden beneath the ground. If you know that kind of mushroom is saprophytic. Do not map his absence.</p>\r\n\r\n<p>One of the typical representatives of parasitic mushroom is the genus Choroas.</p>\r\n\r\n<p><img alt="chorus plastvovy" src="/media/uploads/2018/03/06/choros_plastvovy.jpg" style="height:267px; width:400px" /></p>	2	g4d-abs-mush-help
5	<p>How to divide the waterlogging level</p>\r\n\r\n<p>The meteorological department found that most of the exhaust pipes of motor vehicles were about 13 cm away from the ground. Therefore, the impact of waterlogging on the road surface can be divided into the following levels, when the waterlogging:</p>\r\n\r\n<p>- Less than 1cm, No effect</p>\r\n\r\n<p>- 1cm - 5cm, Less affected</p>\r\n\r\n<p>- Between 6cm and 12 cm, Need to be careful</p>\r\n\r\n<p>- More than 12cm, Very dangerous</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>How to take a photo</p>\r\n\r\n<p>- When taking photos on the page of water data collection, you should pay attention to the comparison of water with other references to reflect the depth of water, such as the photos of vehicle wheels in water.</p>	5	g4d-he-5
6	<div>How to divide road capacity</div>\r\n\r\n<p>- Expedite, the waterlogging does not affect traffic at all, The speed of the car does not change.</p>\r\n\r\n<p>- Congested, the waterlogging affected the traffic a little, The speed of the car down.</p>\r\n\r\n<p>- Blocked, Motor vehicles are difficult to drive because of the waterlogging.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>How to take a photo</p>\r\n\r\n<p>- You can decide by yourself whether taking a photo or not on the page of traffic data collection.</p>	6	g4d-he-6
\.


--
-- Data for Name: api_helplocalization; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_helplocalization (id, language, text, help_id) FROM stdin;
6	en	<p>TestTest</p>	3
7	cs	<p>TestTest</p>	3
8	en	<p>Help</p>	4
9	cs	<p>Help</p>	4
1	cs	<p>Ačkoliv jsou stromy vybaveny různ&yacute;mi mechanismy pro překon&aacute;n&iacute; such&eacute;ho obdob&iacute;, obvykle reakce na sucho souvis&iacute; s mnoha dal&scaron;&iacute;mi faktory, např. (typ půdy, hustota porostu, věk a zdravotn&iacute; stav).</p>\r\n\r\n<h6><strong>Kl&iacute;čov&eacute; znaky:</strong></h6>\r\n\r\n<ul>\r\n\t<li>Vadnut&iacute;\r\n\t<ul>\r\n\t\t<li>Dočasn&eacute; vadnut&iacute; listů se projevu během dne, zat&iacute;mco v noci doch&aacute;z&iacute; narovn&aacute;n&iacute; tlaku v listech. Vadnut&iacute; del&scaron;&iacute; dobu představuje jednu ze z&aacute;kladn&iacute;ch znaků stresu způsoben&eacute;ho suchem.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Změna barvy listů\r\n\t<ul>\r\n\t\t<li>V&yacute;sledkem je zhnědnut&yacute; č&aacute;sti nebo cel&eacute;ho listu</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/leaf_color.jpg" style="height:236px; width:200px" /></p>\r\n\r\n<ul>\r\n\t<li>Opad&aacute;n&iacute; listů\r\n\t<ul>\r\n\t\t<li>Č&aacute;stečn&eacute; nebo kompletn&iacute; opad&aacute;n&iacute; listů</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Napaden&iacute; kůrovcem nebo jin&yacute;m &scaron;kůdcem\r\n\t<ul>\r\n\t\t<li>Nelze aplikovat na m&iacute;sta postižen&aacute; kůrovcem</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h6><strong>Seznam pozorovan&yacute;ch parametrů: </strong></h6>\r\n\r\n<ul>\r\n\t<li>V&yacute;&scaron;ka stromu\r\n\t<ul>\r\n\t\t<li>Ve v&yacute;&scaron;ce 1.3 metru nad zem&iacute;</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/diameter.png" style="height:214px; width:150px" /></p>\r\n\r\n<ul>\r\n\t<li>Průměr kmene\r\n\t<ul>\r\n\t\t<li>Měřen&yacute; ve v&yacute;&scaron;ce 1.3 metru nad zem&iacute;. Pokud se jedn&aacute; o kěře nebo jin&eacute; mal&eacute; stromy, tak se měř&iacute; v m&iacute;ste zač&aacute;tku větven&iacute;.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Druh stromu</li>\r\n\t<li>Druh lokality</li>\r\n\t<li>Chemick&eacute; o&scaron;etřen&iacute; v okol&iacute; stromu</li>\r\n</ul>\r\n\r\n<h6><strong>Jak vyfotit pozorovan&eacute; parametry: </strong></h6>\r\n\r\n<ul>\r\n\t<li>Fotka cel&eacute;ho stromu</li>\r\n\t<li>Fotka zn&aacute;mek sucha</li>\r\n</ul>	1
3	en	<p>Although trees are equipped with water scarcity mechanisms, tree responses usually depend on many factors including, for example, soil type, tree density, age, or tree health.</p>\r\n\r\n<h6><strong>Key signs:</strong></h6>\r\n\r\n<ul>\r\n\t<li>Withering\r\n\t<ul>\r\n\t\t<li>Withering of leaves appears as sign of shorter dryness in the day and overnight can disappear. In the case of prolonged drought, leaf wrinkling is permanent.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Change leaf color\r\n\t<ul>\r\n\t\t<li>Resulting in brown or yellow leaves or the drying ends whole leaves or their parts</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/leaf_color.jpg" /></p>\r\n\r\n<ul>\r\n\t<li>Defoliation\r\n\t<ul>\r\n\t\t<li>Partial or complete loss of leaves</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Bark beetle attacks and other pest attacks\r\n\t<ul>\r\n\t\t<li>Not applicable to areas with bark beetle</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h6><strong>List of observed parameters: </strong></h6>\r\n\r\n<ul>\r\n\t<li>Tree height\r\n\t<ul>\r\n\t\t<li>at a height of 1.3 meters</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<p><img alt="" src="/media/uploads/2018/03/06/diameter.png" /></p>\r\n\r\n<ul>\r\n\t<li>Trunk diameter\r\n\t<ul>\r\n\t\t<li>Measured at 1.3 m above the ground. For trees (or shrubs) where the branching below begins, the diameter is determined to the point of branching</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Type of tree</li>\r\n\t<li>Type of location</li>\r\n\t<li>Chemical treatment in the vicinity\r\n\t<ul>\r\n\t\t<li>Information about chemical treatment of field crops or other areas in the vicinity of the observed tree.</li>\r\n\t</ul>\r\n\t</li>\r\n</ul>\r\n\r\n<h6><strong>How to take a photo: </strong></h6>\r\n\r\n<ul>\r\n\t<li>Photos of the entire tree</li>\r\n\t<li>Photos about drought signs</li>\r\n</ul>	1
4	en	<p>The absence of mushrooms is a very good indicator of drought. Although absence is very difficult to record, the specified absence of mushrooms will be replicated by other users moving near your observation.</p>\r\n\r\n<p>If you visit regularly, it is likely that you are better able to evaluate the reasons for the absence of mushrooms. This fact is taken into account by the observation regularity parameter.</p>\r\n\r\n<p>The absence of mushrooms does not appear in a group of saprophytic mushrooms that usually parasite on wood. They also get water from the wood, which excludes them from using drought mapping. Such mushrooms often grow on tree trunks, but they can also occur on roots that are hidden beneath the ground. If you know that kind of mushroom is saprophytic. Do not map his absence.</p>\r\n\r\n<p>One of the typical representatives of parasitic mushroom is the genus Choroas.</p>\r\n\r\n<p><img alt="chorus plastvovy" src="/media/uploads/2018/03/06/choros_plastvovy.jpg" /></p>	2
5	cs	<p>Absence hub je velmi dobr&yacute;m indik&aacute;torem sucha. Vzhledem k tomu, že absenci hub je obt&iacute;žn&eacute; monitorovat, v&aacute;mi zaznamenan&aacute; absence hub bude ověřov&aacute;na dal&scaron;&iacute;mi uživateli, kteř&iacute; se budou pohybovat v bl&iacute;zkosti m&iacute;sta va&scaron;eho pozorov&aacute;n&iacute;.</p>\r\n\r\n<p>Pokud m&iacute;sto pozorov&aacute;n&iacute; nav&scaron;těvujete pravidelně a absenci hub sledujete dlouhodobě, tento fakt pros&iacute;m zaznamenejte parametrem pravidelnost pozorov&aacute;n&iacute;.</p>\r\n\r\n<p>Indik&aacute;torem sucha naopak nen&iacute; absence saprofytick&yacute;ch hub, kter&eacute; vět&scaron;inou rostou na dřevě, protože z něj&nbsp;z&iacute;sk&aacute;vaj&iacute;&nbsp;tak&eacute; vodu. Tyto houby se vyskytuj&iacute; na kmenech a kořenech stromů, kter&eacute; mohou b&yacute;t skryty pod zem&iacute;. Pokud zjist&iacute;te absenci saprofytick&yacute;ch hub, nezaznamen&aacute;vejte ji pros&iacute;m.</p>\r\n\r\n<p>Typick&yacute;mi představiteli saprofytick&yacute;ch hub jsou houby rodu Choro&scaron;.</p>\r\n\r\n<p><img alt="chorus plastvovy" src="/media/uploads/2018/03/06/choros_plastvovy.jpg" style="height:267px; width:400px" /></p>	2
11	en	<h2>How to divide road capacity</h2>\r\n\r\n<p>- Expedite, the waterlogging does not affect traffic at all, The speed of the car does not change.</p>\r\n\r\n<p>- Congested, the waterlogging affected the traffic a little, The speed of the car down.</p>\r\n\r\n<p>- Blocked, Motor vehicles are difficult to drive because of the waterlogging.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>How to take a photo</h2>\r\n\r\n<p>You can decide by yourself whether taking a photo or not on the page of traffic data collection.</p>	6
10	en	<h3>How to divide the waterlogging level</h3>\r\n\r\n<p>The meteorological department found that most of the exhaust pipes of motor vehicles were about 13 cm away from the ground. Therefore, the impact of waterlogging on the road surface can be divided into the following levels, when the waterlogging:</p>\r\n\r\n<p>- Less than 1cm, No effect</p>\r\n\r\n<p>- 1cm - 5cm, Less affected</p>\r\n\r\n<p>- Between 6cm and 12 cm, Need to be careful</p>\r\n\r\n<p>- More than 12cm, Very dangerous</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>How to take a photo</h3>\r\n\r\n<p>When taking photos on the page of water data collection, you should pay attention to the comparison of water with other references to reflect the depth of water, such as the photos of vehicle wheels in water.</p>	5
12	cn	<h3>如何划分积水等级</h3>\r\n\r\n<p>根据气象部门发现，大部分机动车的排气管距离地面约13厘米，所以积水对路面的影响可以分为以下几个等级</p>\r\n\r\n<p><strong>&middot;</strong>积水小于1cm，无影响。</p>\r\n\r\n<p><strong>&middot;</strong>积水在1-5cm，影响较小。</p>\r\n\r\n<p><strong>&middot;</strong>积水在6-12cm，需要小心。</p>\r\n\r\n<p><strong>&middot;</strong>积水大于12cm，很危险。</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3>如何拍摄照片</h3>\r\n\r\n<p>在积水数据采集的页面中拍摄照片时应该注意要有积水与其他参照物的对比来体现积水深度，比如机动车车轮在积水中的照片。</p>\r\n\r\n<p>&nbsp;</p>	5
13	cn	<h3>如何划分道路情况</h3>\r\n\r\n<p><strong>&middot;</strong>畅通，积水不影响交通，无需改变车速。</p>\r\n\r\n<p><strong>&middot;</strong>缓行，积水有一点影响交通，需要减速行驶。</p>\r\n\r\n<p><strong>&middot;</strong>拥堵，由于积水的影响，机动车难以行驶。</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3>如何拍摄照片</h3>\r\n\r\n<p>在交通数据采集页面您可以自行决定是否拍照。</p>	6
\.


--
-- Data for Name: api_localization; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_localization (id, language, dictionary) FROM stdin;
1	cs	{"g4d-okay": "OK", "g4d-close": "Zavřít", "g4d-email": "E-mail", "g4d-error": "Chyba", "g4d-login": "Přihlášení", "g4d-title": "GIS4DIS", "g4d-log-in": "Přihlásit se", "g4d-logout": "Odhlásit", "g4d-submit": "Odeslat", "g4d-account": "Účet", "g4d-sign-in": "Přihlášení", "g4d-optional": "nepovinné", "g4d-password": "Heslo", "g4d-register": "Registrovat", "g4d-settings": "Nastavení", "g4d-username": "Uživatelské jméno", "g4d-info-more": "Více", "g4d-nodetails": "Podrobnosti nejsou dostupné.", "g4d-loggedinas": "Přihlášen jako", "g4d-info-dayago": "před $1 {{PLURAL:$1|dnem|dny}}", "g4d-chooseoption": "Vyberte možnost", "g4d-info-hourago": "před $1 {{PLURAL:$1|hodinou|hodinami}}", "g4d-info-weekago": "před $1 {{PLURAL:$1|týdnem|týdny}}", "g4d-info-yearago": "před $1 {{PLURAL:$1|rokem|lety}}", "g4d-registration": "Registrace", "g4d-info-monthago": "před $1 {{PLURAL:$1|měsícem|měsíci}}", "g4d-resetpassword": "Obnovit heslo", "g4d-forgotpassword": "Zapomenuté heslo", "g4d-info-minuteago": "před $1 {{PLURAL:$1|minutou|minutami}}", "g4d-info-secondago": "před $1 {{PLURAL:$1|sekundou|sekundami}}", "g4d-confirmpassword": "Potvrzení hesla", "g4d-info-photocount": "$1 {{PLURAL:$1|dostupná fotografie|dostupných fotografií}}", "g4d-toast-photosent": "Fotografie odeslána.", "g4d-info-submitted-on": "přidáno $1, $2", "g4d-toast-notsignedin": "Nejste přihlášeni.", "g4d-toast-photofailed": "Odeslání fotografie bylo neúspěšné.", "g4d-toast-send-n-photos": "Odesílám $1 {{PLURAL:$1|fotografii|fotografie|fotografií}}.", "g4d-toast-sent-n-photos": "Odesláno $1 fotografií. Zbývá $2 fotografií.", "g4d-toast-sessionexpired": "Vaše přihlášení vypršelo.", "g4d-toast-loginsuccessful": "Přihlášení úspěšné.", "g4d-toast-observationsent": "Pozorování odesláno.", "g4d-toast-sent-all-photos": "Všechny zbývající fotografie ($1) odeslány.", "g4d-settings-send-n-photos": "Odeslat $1 {{PLURAL:$1|fotografii|fotografie|fotografií}}", "g4d-settings-use-crosshair": "Použij kříž k zaměření pozorování", "g4d-toast-datafailed-retry": "Odeslání dat bylo neúspěšné. Čekám na připojení.", "g4d-toast-logoutsuccessful": "Odhlášení úspěšné.", "g4d-toast-passresetsuccessful": "E-mail pro změnu hesla byl úspěšně odeslán.", "g4d-toast-sent-n-observations": "Odesláno $1 pozorování. Zbývá $2 pozorování.", "g4d-toast-sent-all-observations": "Všechna zbývající pozorování ($1) odeslána.", "g4d-toast-registrationsuccessful": "Registrace úspěšná.", "g4d-settings-sync-photos-manually": "Odesílat fotografie manuálně", "g4d-toast-observation-added-to-queue": "Pozorování přidáno do fronty. $1 pozorování ve frontě.", "g4d-toast-observation-photos-added-to-queue": "Pozorování a $1 {{PLURAL:$1|fotografie|fotografie|fotografií}} přidáno do fronty. $2 pozorování a $3 {{PLURAL:$3|fotografie|fotografie|fotografií}} ve frontě."}
2	en	{"g4d-okay": "Okay", "g4d-save": "Save", "g4d-close": "Close", "g4d-email": "E-mail", "g4d-error": "Error", "g4d-login": "Login", "g4d-title": "GIS4DIS", "g4d-log-in": "Log in", "g4d-logout": "Logout", "g4d-submit": "Submit", "g4d-account": "Account", "g4d-sign-in": "Sign in", "g4d-optional": "optional", "g4d-password": "Password", "g4d-prof-age": "Age", "g4d-register": "Register", "g4d-settings": "Settings", "g4d-username": "Username", "g4d-info-more": "More info", "g4d-nodetails": "No details available.", "g4d-loggedinas": "Logged in as", "g4d-info-dayago": "$1 {{PLURAL:$1|day|days}} ago", "g4d-toast-saved": "Saved", "g4d-chooseoption": "Choose an option", "g4d-info-hourago": "$1 {{PLURAL:$1|hour|hours}} ago", "g4d-info-weekago": "$1 {{PLURAL:$1|week|weeks}} ago", "g4d-info-yearago": "$1 {{PLURAL:$1|year|years}} ago", "g4d-registration": "Registration", "g4d-info-monthago": "$1 {{PLURAL:$1|month|months}} ago", "g4d-resetpassword": "Reset password", "g4d-forgotpassword": "Forgot password", "g4d-info-minuteago": "$1 {{PLURAL:$1|minute|minutes}} ago", "g4d-info-secondago": "$1 {{PLURAL:$1|second|seconds}} ago", "g4d-prof-last-name": "Last name", "g4d-confirmpassword": "Confirm password", "g4d-info-photocount": "$1 {{PLURAL:$1|photo|photos}} available", "g4d-prof-first-name": "First name", "g4d-toast-photosent": "Photo sent.", "g4d-info-submitted-on": "submitted on $1, $2", "g4d-prof-account-edit": "Profile", "g4d-toast-notsignedin": "You are not signed in.", "g4d-toast-photofailed": "Sending photo failed.", "g4d-toast-send-n-photos": "Sending $1 {{PLURAL:$1|photo|photos}}.", "g4d-toast-sent-n-photos": "Managed to send $1 photos. $2 remaining.", "g4d-toast-sessionexpired": "Your session expired.", "g4d-toast-loginsuccessful": "Login successful.", "g4d-toast-observationsent": "Observation sent.", "g4d-toast-sent-all-photos": "All remaining photos ($1) sent.", "g4d-settings-send-n-photos": "Send $1 {{PLURAL:$1|photo|photos}}", "g4d-settings-use-crosshair": "Use crosshair to locate observations", "g4d-toast-datafailed-retry": "Sending data failed. Retrying when online.", "g4d-toast-logoutsuccessful": "Logout successful.", "g4d-toast-passresetsuccessful": "Password reset e-mail has been sent.", "g4d-toast-sent-n-observations": "Managed to send $1 observations. $2 remaining.", "g4d-toast-sent-all-observations": "All remaining observations ($1) sent.", "g4d-toast-registrationsuccessful": "Registration successful.", "g4d-settings-sync-photos-manually": "Send photos manually", "g4d-toast-observation-added-to-queue": "Observation added to queue. $1 {{PLURAL:$1|observation|observations}} in queue.", "g4d-toast-observation-photos-added-to-queue": "Observation and $1 {{PLURAL:$1|photo|photos}} added to queue. $2 {{PLURAL:$2|observation|observations}} and $3 {{PLURAL:$3|photo|photos}} in queue."}
3	cn	{"g4d-okay": "OK", "g4d-save": "保存", "g4d-close": "关闭", "g4d-email": "E-mail", "g4d-error": "错误", "g4d-login": "登陆", "g4d-title": "GIS4DIS", "g4d-log-in": "登陆", "g4d-logout": "登出", "g4d-submit": "提交", "g4d-account": "账号", "g4d-sign-in": "登入", "g4d-optional": "可选的", "g4d-password": "密码", "g4d-prof-age": "年龄", "g4d-register": "注册", "g4d-settings": "设置", "g4d-username": "用户名", "g4d-info-more": "更多信息", "g4d-nodetails": "没有详细的信息。", "g4d-loggedinas": "登陆为：", "g4d-info-dayago": "$1 {{PLURAL:$1|天|天}}之前", "g4d-toast-saved": "已保存", "g4d-chooseoption": "选择一个选项", "g4d-info-hourago": "$1 {{PLURAL:$1|小时|小时}}之前", "g4d-info-weekago": "$1 {{PLURAL:$1|周|周}}之前", "g4d-info-yearago": "$1 {{PLURAL:$1|年|年}}之前", "g4d-registration": "注册", "g4d-info-monthago": "$1 {{PLURAL:$1|月|月}}之前", "g4d-resetpassword": "重置密码", "g4d-forgotpassword": "忘记密码", "g4d-info-minuteago": "$1 {{PLURAL:$1|分钟|分钟}}之前", "g4d-info-secondago": "$1 {{PLURAL:$1|秒|秒}}之前", "g4d-prof-last-name": "姓", "g4d-confirmpassword": "确认密码", "g4d-info-photocount": "$1 {{PLURAL:$1|照片|照片}} 可用的", "g4d-prof-first-name": "名", "g4d-toast-photosent": "发送照片。", "g4d-info-submitted-on": "提交为$1, $2", "g4d-prof-account-edit": "用户配置文件", "g4d-toast-notsignedin": "您还没有登录。", "g4d-toast-photofailed": "照片发送失败。", "g4d-toast-send-n-photos": "发送 $1 {{PLURAL:$1|照片|照片}}.", "g4d-toast-sent-n-photos": "尝试发送一些照片，剩余的保留。", "g4d-toast-sessionexpired": "您的会话已过期。", "g4d-toast-loginsuccessful": "登陆成功。", "g4d-toast-observationsent": "观测已发送。", "g4d-toast-sent-all-photos": "所有剩下的照片会被发送", "g4d-settings-send-n-photos": "发送 $1 {{PLURAL:$1|照片|照片}}", "g4d-settings-use-crosshair": "利用十字丝来定位观测", "g4d-toast-datafailed-retry": "数据发送失败，当有网络时将会重新尝试发送", "g4d-toast-logoutsuccessful": "注销成功。", "g4d-toast-passresetsuccessful": "密码重置邮件已发送。", "g4d-toast-sent-n-observations": "尝试发送一些观测，剩余的保留。", "g4d-toast-sent-all-observations": "($1)发送所有剩余对象。", "g4d-toast-registrationsuccessful": "注册成功。", "g4d-settings-sync-photos-manually": "手动发送照片", "g4d-toast-observation-added-to-queue": "将观测添加到队列里去 $1 {{PLURAL:$1|观测|观测}} 在队列中。", "g4d-toast-observation-photos-added-to-queue": "观测和 $1 {{PLURAL:$1|照片|照片}} 添加到队列中， $2 {{PLURAL:$2|观测|观测}} 和 $3 {{PLURAL:$3|照片|照片}} 在队列中。"}
\.


--
-- Data for Name: api_metadataobservation; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_metadataobservation (id, send_date, note, geometry, observation_date, user_id) FROM stdin;
14919	2018-05-22 15:47:17.88195+02	\N	0101000020E6100000BBEF181EFB8D2E40442EDDC94C8A4840	2018-05-22 15:46:25.478+02	90
14949	2018-05-23 11:26:25.285993+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14979	2018-05-23 13:01:33.788427+02	\N	0101000020E6100000EBEF5B6386802E405405FE4BAD8B4840	2018-05-23 11:26:19.638+02	85
15009	2018-05-23 19:24:02.730322+02	\N	0101000020E610000077F0B84D5D6A2E404B17073CD58B4840	2018-05-23 11:09:05.143+02	91
15039	2018-05-23 19:32:26.744801+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15069	2018-05-23 19:33:30.01656+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15099	2018-05-23 19:33:31.647591+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15129	2018-05-23 19:35:17.44192+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15159	2018-05-23 19:35:29.568594+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15189	2018-05-23 19:35:31.236849+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15219	2018-05-23 19:35:32.841367+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15249	2018-05-23 19:35:34.657108+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15279	2018-05-23 19:35:52.626071+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15309	2018-05-23 19:35:54.168107+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15339	2018-05-23 19:35:55.705836+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15369	2018-05-23 19:35:57.233466+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15399	2018-05-23 19:35:58.784853+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15429	2018-05-23 19:36:56.117359+02	\N	0101000020E61000005E6B4A0DC8712E40498BE9F81E8A4840	2018-05-23 14:48:12.073+02	91
15459	2018-05-24 17:38:55.226448+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:07:39.139+02	82
15511	2019-02-06 09:38:57.782863+01	\N	0101000020E61000000100006094913040958E827785AA4840	2019-02-06 09:38:51.425+01	98
12540	2018-05-16 14:24:29.268148+02	\N	0101000020E610000044D0E2D6EE983040F6227FD5369A4840	2018-05-16 14:22:34.252+02	78
12541	2018-05-16 14:26:18.22372+02	\N	0101000020E6100000CA051D63DD983040DECC4301369A4840	2018-05-16 14:25:24.888+02	78
12542	2018-05-16 15:54:33.151116+02		0101000020E61000003EDD51ADCF9830401E9CF463389A4840	2018-05-16 15:53:35+02	78
14920	2018-05-23 09:45:27.051789+02	\N	0101000020E6100000038706184C7E2E406982F2881B8C4840	2018-05-23 09:43:54.96+02	90
14950	2018-05-23 11:26:25.381767+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14980	2018-05-23 13:57:21.607005+02	\N	0101000020E6100000BD416AC999882E40D9F80269B58A4840	2018-05-23 13:56:27.348+02	90
15010	2018-05-23 19:24:04.270277+02	\N	0101000020E610000080E2B66C636A2E40C966FD1CD58B4840	2018-05-23 11:16:40.17+02	91
15040	2018-05-23 19:32:26.752767+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15070	2018-05-23 19:33:30.093628+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15100	2018-05-23 19:33:31.758461+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15130	2018-05-23 19:35:17.503652+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15160	2018-05-23 19:35:29.599303+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15190	2018-05-23 19:35:31.333651+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15220	2018-05-23 19:35:32.929026+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15250	2018-05-23 19:35:34.764363+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15280	2018-05-23 19:35:52.655834+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15310	2018-05-23 19:35:54.194357+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15340	2018-05-23 19:35:55.811043+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15370	2018-05-23 19:35:57.301441+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15400	2018-05-23 19:35:58.869659+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15430	2018-05-23 19:36:56.944946+02	\N	0101000020E610000012F758FAD0712E40A304FD851E8A4840	2018-05-23 14:52:23.588+02	91
15460	2018-05-24 17:38:55.44715+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:11:07.386+02	82
15482	2019-01-30 07:59:29.014801+01	\N	0101000020E610000001000000EC515C40735EA19158E53740	2019-01-30 07:57:58.728+01	99
15512	2019-02-06 09:39:05.621776+01	\N	0101000020E6100000010000C0AD903040BEB27B4D7CAA4840	2019-02-06 09:39:00.637+01	98
14921	2018-05-23 09:54:50.771122+02	\N	0101000020E6100000DB72897EC87E2E4020CABCFA1D8C4840	2018-05-23 09:53:16.172+02	90
14951	2018-05-23 11:28:06.684083+02	\N	0101000020E61000001DE4F56052802E4029F0A9F7AF8B4840	2018-05-23 11:26:52.166+02	90
14981	2018-05-23 14:10:43.23282+02	\N	0101000020E6100000A49E4F2ED79C2E40849D62D5208B4840	2018-05-23 14:08:11.407+02	90
15011	2018-05-23 19:24:09.071133+02	\N	0101000020E6100000E5805D4D9E6A2E40BF77407EDB8B4840	2018-05-23 11:23:59.636+02	91
15041	2018-05-23 19:32:26.777832+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15071	2018-05-23 19:33:30.151779+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15101	2018-05-23 19:33:31.770093+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15131	2018-05-23 19:35:17.593604+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15161	2018-05-23 19:35:29.685345+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15191	2018-05-23 19:35:31.361043+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15221	2018-05-23 19:35:32.948654+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15251	2018-05-23 19:35:34.786031+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15281	2018-05-23 19:35:52.727917+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15311	2018-05-23 19:35:54.222286+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15341	2018-05-23 19:35:55.797878+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15371	2018-05-23 19:35:57.365231+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15401	2018-05-23 19:35:58.870536+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15431	2018-05-23 19:36:57.190909+02	\N	0101000020E610000045EFF906CB712E40C1D5F0E31E8A4840	2018-05-23 14:57:24.658+02	91
15461	2018-05-24 17:38:55.6305+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:14:02.416+02	82
15483	2019-01-30 07:59:29.591291+01	\N	0101000020E6100000010000004C795C4048C3489E22283840	2019-01-30 07:59:21.961+01	99
15513	2019-02-06 09:39:18.296009+01	\N	0101000020E6100000010000C04B893040C921DA31D1A84840	2019-02-06 09:39:14.616+01	98
14922	2018-05-23 09:57:07.419012+02	\N	0101000020E610000026E4839ECD7E2E403820F8CE1E8C4840	2018-05-23 09:55:25.015+02	90
14952	2018-05-23 11:28:40.175725+02	\N	0101000020E6100000C2D77C01627F2E402DDB3D2FCB8B4840	2018-05-23 11:00:29.545+02	85
14982	2018-05-23 14:13:47.410029+02	\N	0101000020E61000003D1F408A27862E401E19AAFFA38A4840	2018-05-23 14:10:24.158+02	80
15012	2018-05-23 19:24:21.015528+02	\N	0101000020E610000051B351E79B6A2E400E21F829D88B4840	2018-05-23 11:29:44.534+02	91
15042	2018-05-23 19:32:26.872011+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15072	2018-05-23 19:33:30.174057+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15102	2018-05-23 19:33:31.815276+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15132	2018-05-23 19:35:17.634445+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15162	2018-05-23 19:35:29.733177+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15192	2018-05-23 19:35:31.368071+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15222	2018-05-23 19:35:32.969317+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15252	2018-05-23 19:35:34.807016+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15282	2018-05-23 19:35:52.758177+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15312	2018-05-23 19:35:54.313904+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15342	2018-05-23 19:35:55.798819+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15372	2018-05-23 19:35:57.414052+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15402	2018-05-23 19:35:58.951329+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15432	2018-05-23 19:36:57.519691+02	\N	0101000020E61000005CA90C88B5712E409D418D8C1F8A4840	2018-05-23 15:00:29.965+02	91
15462	2018-05-24 17:38:56.223384+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:26:35.927+02	82
15484	2019-02-06 09:04:41.993637+01	\N	0101000020E61000000100008034953040D7313897EA994840	2019-02-06 09:04:28.653+01	98
15514	2019-02-06 09:39:54.398333+01	\N	0101000020E6100000010000C0349130401C91F4D6D1A94840	2019-02-06 09:39:47.312+01	98
14923	2018-05-23 10:02:22.101348+02	\N	0101000020E6100000570FF340BF7E2E400E8DDDF41D8C4840	2018-05-23 09:59:20.981+02	90
14953	2018-05-23 11:39:28.858156+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14983	2018-05-23 14:19:20.890405+02	\N	0101000020E6100000CEF9CED4909D2E40F4FC69A33A8B4840	2018-05-23 13:02:08.973+02	85
15013	2018-05-23 19:24:28.351857+02	\N	0101000020E610000073E9A91FE5652E402F713F3B3B8A4840	2018-05-23 12:44:54.242+02	91
15043	2018-05-23 19:32:26.937137+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15073	2018-05-23 19:33:30.23462+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15103	2018-05-23 19:33:31.907952+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15133	2018-05-23 19:35:17.646769+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15163	2018-05-23 19:35:29.738103+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15193	2018-05-23 19:35:31.520154+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15223	2018-05-23 19:35:33.097154+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15253	2018-05-23 19:35:34.93357+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15283	2018-05-23 19:35:52.820094+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15313	2018-05-23 19:35:54.371055+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15343	2018-05-23 19:35:55.981335+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15373	2018-05-23 19:35:57.438284+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15403	2018-05-23 19:35:59.028516+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15433	2018-05-23 19:36:57.999887+02	\N	0101000020E610000042AF3F89CF712E40B5A338471D8A4840	2018-05-23 15:04:35.155+02	91
15463	2018-05-24 17:38:56.390329+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:28:34.929+02	82
15485	2019-02-06 09:06:28.332702+01	\N	0101000020E61000000100003048953040B2DAE8CEDC994840	2019-02-06 09:06:15.039+01	98
15515	2019-02-06 09:40:01.629453+01	\N	0101000020E610000001000060E09030406EC36103A4A94840	2019-02-06 09:39:56.251+01	98
14924	2018-05-23 10:16:03.680485+02	\N	0101000020E610000073ECEA9FF17E2E40FA2070C9168C4840	2018-05-23 10:13:58.783+02	90
14954	2018-05-23 11:39:29.566193+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14984	2018-05-23 14:20:21.170176+02	\N	0101000020E610000005700E3224862E4048F2A66CA28A4840	2018-05-23 14:16:43.257+02	90
15014	2018-05-23 19:24:31.568841+02	\N	0101000020E61000006ACCDA5CEB652E404EAAC7C7388A4840	2018-05-23 12:49:44.607+02	91
15044	2018-05-23 19:32:26.929575+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15074	2018-05-23 19:33:30.316627+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15104	2018-05-23 19:33:31.940282+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15134	2018-05-23 19:35:17.774989+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15164	2018-05-23 19:35:29.848999+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15194	2018-05-23 19:35:31.507447+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15224	2018-05-23 19:35:33.107247+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15254	2018-05-23 19:35:35.056256+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15284	2018-05-23 19:35:52.893931+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15314	2018-05-23 19:35:54.358458+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15344	2018-05-23 19:35:55.998394+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15374	2018-05-23 19:35:57.532201+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15404	2018-05-23 19:35:59.025503+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15434	2018-05-23 19:36:58.235643+02	\N	0101000020E6100000F530B43A39772E40203C7F7FEF8A4840	2018-05-23 16:07:18.736+02	91
15464	2018-05-24 17:38:56.559224+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:31:07.066+02	82
15486	2019-02-06 09:07:03.909541+01	\N	0101000020E6100000010000606C9B3040F6D034228E9A4840	2019-02-06 09:06:47.422+01	98
15516	2019-02-06 09:40:09.650199+01	\N	0101000020E610000001000020B69130402FE6F92BD9A94840	2019-02-06 09:40:04.318+01	98
14895	2018-05-22 10:27:13.327322+02	\N	0101000020E61000006779C3222B742E409DCB1EB2928C4840	2018-05-22 10:24:00.8+02	85
14925	2018-05-23 10:19:15.459755+02	\N	0101000020E61000004B091C64ED7E2E409B04CA01168C4840	2018-05-23 10:17:26.888+02	90
14955	2018-05-23 11:39:29.580514+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14985	2018-05-23 14:20:21.491487+02	\N	0101000020E610000005700E3224862E4048F2A66CA28A4840	2018-05-23 14:16:43.257+02	90
15015	2018-05-23 19:24:34.709665+02	\N	0101000020E61000007A7E07F5E3652E40A2C2C716388A4840	2018-05-23 12:53:31.764+02	91
15045	2018-05-23 19:32:27.029884+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15075	2018-05-23 19:33:30.302946+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15105	2018-05-23 19:33:31.987671+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15135	2018-05-23 19:35:17.770973+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15165	2018-05-23 19:35:29.878325+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15195	2018-05-23 19:35:31.507619+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15225	2018-05-23 19:35:33.45278+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15255	2018-05-23 19:35:35.058284+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15285	2018-05-23 19:35:52.918008+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15315	2018-05-23 19:35:54.462081+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15345	2018-05-23 19:35:56.019923+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15375	2018-05-23 19:35:57.545745+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15405	2018-05-23 19:35:59.087532+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15435	2018-05-23 19:36:58.585588+02	\N	0101000020E6100000DAE731CA33772E408BD8CCC6EF8A4840	2018-05-23 16:09:55.944+02	91
15465	2018-05-24 17:38:56.762669+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:45:40.665+02	82
15487	2019-02-06 09:07:21.558741+01	\N	0101000020E610000001000080B59B3040F639113F769A4840	2019-02-06 09:07:09.681+01	98
15517	2019-02-06 09:40:16.191835+01	\N	0101000020E610000001000020B691304092BE7458ABA94840	2019-02-06 09:40:11.655+01	98
14896	2018-05-22 10:27:13.443583+02	\N	0101000020E61000006779C3222B742E409DCB1EB2928C4840	2018-05-22 10:24:00.8+02	85
14926	2018-05-23 10:23:02.307559+02	\N	0101000020E6100000B086D569EE7E2E406C38769A168C4840	2018-05-23 10:20:19.338+02	90
14956	2018-05-23 11:39:29.594542+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14986	2018-05-23 14:20:32.382529+02	\N	0101000020E61000004012F6ED24862E401FC1E84DA08A4840	2018-05-23 14:19:34.162+02	85
15016	2018-05-23 19:24:39.530561+02	\N	0101000020E6100000E28222CCA3712E4026C79DD2C1894840	2018-05-23 14:16:54.627+02	91
15046	2018-05-23 19:32:27.082095+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15076	2018-05-23 19:33:30.403481+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15106	2018-05-23 19:33:32.056296+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15136	2018-05-23 19:35:17.800066+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15166	2018-05-23 19:35:29.933776+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15196	2018-05-23 19:35:31.668695+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15226	2018-05-23 19:35:33.457376+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15256	2018-05-23 19:35:35.312966+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15286	2018-05-23 19:35:52.95764+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15316	2018-05-23 19:35:54.535136+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15346	2018-05-23 19:35:56.10509+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15376	2018-05-23 19:35:57.586982+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15406	2018-05-23 19:35:59.156305+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15436	2018-05-23 19:37:01.472417+02	\N	0101000020E6100000FB18BD642D772E40021D9C3EF18A4840	2018-05-23 16:15:18.985+02	91
15466	2018-05-24 17:38:56.938051+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 13:02:49.919+02	82
15488	2019-02-06 09:08:29.948399+01	\N	0101000020E610000001000040509B30404C4993A84F9A4840	2019-02-06 09:07:56.154+01	98
15518	2019-02-06 09:40:23.598069+01	\N	0101000020E6100000010000206A923040AB8A85ADB2A94840	2019-02-06 09:40:18.685+01	98
14897	2018-05-22 10:30:18.051893+02	\N	0101000020E610000098FBE42840742E40B04D74A7858C4840	2018-05-22 10:25:56.049+02	90
14927	2018-05-23 10:26:09.139438+02	\N	0101000020E610000081C6F1E8EB7E2E40D7ACE930158C4840	2018-05-23 10:23:43.134+02	90
14957	2018-05-23 11:40:08.81091+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14987	2018-05-23 14:41:05.721482+02	\N	0101000020E61000003F1F2098B4832E40211930D5A28A4840	2018-05-23 14:39:01.28+02	80
15017	2018-05-23 19:24:52.589965+02	\N	0101000020E610000057389380E2712E40FCD3FCE71F8A4840	2018-05-23 14:38:03.897+02	91
15047	2018-05-23 19:33:28.810665+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15077	2018-05-23 19:33:30.47734+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15107	2018-05-23 19:33:32.097335+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15137	2018-05-23 19:35:17.933649+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15167	2018-05-23 19:35:30.025744+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15197	2018-05-23 19:35:31.666586+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15227	2018-05-23 19:35:33.480234+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15257	2018-05-23 19:35:35.309542+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15287	2018-05-23 19:35:53.048507+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15317	2018-05-23 19:35:54.557588+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15347	2018-05-23 19:35:56.161343+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15377	2018-05-23 19:35:57.670731+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15407	2018-05-23 19:35:59.203819+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15437	2018-05-23 19:37:01.740664+02	\N	0101000020E6100000D9F225AF29772E409C3D867DF18A4840	2018-05-23 16:19:17.133+02	91
15467	2018-05-24 17:38:57.119714+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 13:17:15.376+02	82
15489	2019-02-06 09:09:16.67848+01	\N	0101000020E610000001000040CAB73040A5E871AF6C9E4840	2019-02-06 09:09:07.166+01	98
15519	2019-02-06 09:40:31.318422+01	\N	0101000020E61000000100008056913040F8489A847DA94840	2019-02-06 09:40:26.134+01	98
14898	2018-05-22 10:34:43.756339+02	\N	0101000020E610000047EA984E46742E403F98CA91848C4840	2018-05-22 10:32:43.078+02	90
14928	2018-05-23 10:29:06.240756+02	\N	0101000020E61000001EF98381E77E2E407EA99F37158C4840	2018-05-23 10:27:15.424+02	90
14958	2018-05-23 11:40:08.95077+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14988	2018-05-23 14:44:10.791039+02	\N	0101000020E61000003F1F60E6BC832E402119F08BA48A4840	2018-05-23 14:42:22.248+02	80
15018	2018-05-23 19:25:30.88796+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15048	2018-05-23 19:33:28.821063+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15078	2018-05-23 19:33:30.471792+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15108	2018-05-23 19:33:32.139276+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15138	2018-05-23 19:35:17.949688+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15168	2018-05-23 19:35:30.047348+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15198	2018-05-23 19:35:31.687139+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15228	2018-05-23 19:35:33.599356+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15258	2018-05-23 19:35:42.115497+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15288	2018-05-23 19:35:53.068985+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15318	2018-05-23 19:35:54.612668+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15348	2018-05-23 19:35:56.183503+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15378	2018-05-23 19:35:57.69793+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15408	2018-05-23 19:35:59.259317+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15438	2018-05-23 19:37:01.997137+02	\N	0101000020E6100000289CDD5A26772E404987E2E9F08A4840	2018-05-23 16:24:25.662+02	91
15468	2018-05-24 17:38:57.28216+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 13:27:00.913+02	82
15490	2019-02-06 09:09:53.51889+01	\N	0101000020E6100000010000C0A8B330408AD9F2E9FB9E4840	2019-02-06 09:09:49.295+01	98
15520	2019-02-06 09:40:59.514151+01	\N	0101000020E6100000010000A05392304044FED42E8CA94840	2019-02-06 09:40:54.426+01	98
14899	2018-05-22 11:22:35.376159+02	\N	0101000020E6100000447E479E35712E408CDC2E8F908C4840	2018-05-22 11:15:38.4+02	90
14929	2018-05-23 10:30:39.766944+02	\N	0101000020E61000000AAAFC21EC7E2E40437D810F148C4840	2018-05-23 10:29:11.645+02	90
14959	2018-05-23 11:40:15.229529+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14989	2018-05-23 14:44:29.687912+02	\N	0101000020E6100000BCE58F0EB4832E40B3D6AB23A28A4840	2018-05-23 14:43:05.575+02	90
15019	2018-05-23 19:26:31.61236+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15049	2018-05-23 19:33:28.814075+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15079	2018-05-23 19:33:30.565301+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15109	2018-05-23 19:33:32.191829+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15139	2018-05-23 19:35:28.478743+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15169	2018-05-23 19:35:30.083361+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15199	2018-05-23 19:35:31.813554+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15229	2018-05-23 19:35:33.617005+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15259	2018-05-23 19:35:42.114443+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15289	2018-05-23 19:35:53.120898+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15319	2018-05-23 19:35:54.682+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15349	2018-05-23 19:35:56.273363+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15379	2018-05-23 19:35:57.76861+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15409	2018-05-23 19:35:59.269785+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15439	2018-05-24 11:03:40.480587+02	\N	0101000020E61000002B1F70EA52702E402319B64D938C4840	2018-05-24 11:02:42.834+02	80
15469	2018-05-24 17:38:57.462287+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 13:37:53.236+02	82
15491	2019-02-06 09:10:02.596785+01	\N	0101000020E61000000100004073B43040974590E5F09E4840	2019-02-06 09:09:57.929+01	98
15521	2019-02-06 09:41:09.718266+01	\N	0101000020E6100000010000006D9130408AFD3E0636A94840	2019-02-06 09:41:05.031+01	98
14900	2018-05-22 11:39:31.415633+02	\N	0101000020E61000000FE72B92C0702E40F62DCE739F8C4840	2018-05-22 11:36:07.022+02	90
14930	2018-05-23 10:37:17.885017+02	\N	0101000020E6100000E68B625EEC7E2E402B357BA0158C4840	2018-05-23 10:36:10+02	90
14960	2018-05-23 11:40:15.228254+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14990	2018-05-23 15:11:18.285821+02	\N	0101000020E610000063A538FD8F7E2E40D0DF3AB5E98A4840	2018-05-23 15:09:43.008+02	90
15020	2018-05-23 19:26:31.868698+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15050	2018-05-23 19:33:28.977896+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15080	2018-05-23 19:33:30.607231+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15110	2018-05-23 19:33:32.283213+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15140	2018-05-23 19:35:28.479797+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15170	2018-05-23 19:35:30.268341+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15200	2018-05-23 19:35:31.826353+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15230	2018-05-23 19:35:33.598406+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15260	2018-05-23 19:35:43.678713+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15290	2018-05-23 19:35:53.208203+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15320	2018-05-23 19:35:54.739259+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15350	2018-05-23 19:35:56.313203+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15380	2018-05-23 19:35:57.82517+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15410	2018-05-23 19:35:59.355468+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15440	2018-05-24 11:11:55.019019+02	\N	0101000020E61000002B1F10C7C6702E402319CCFB388C4840	2018-05-24 11:10:35.255+02	80
15470	2018-05-24 17:38:57.671044+02	\N	0101000020E610000047F47C1700802E40272C96C73F8F4840	2018-05-22 13:45:37.249+02	82
15492	2019-02-06 09:10:18.680752+01	\N	0101000020E6100000010000A0C7873040B1BE88C4489A4840	2019-02-06 09:10:14.959+01	98
15522	2019-02-06 09:41:27.683273+01	\N	0101000020E6100000010000800A9230401C91F4D6D1A94840	2019-02-06 09:41:22.19+01	98
14901	2018-05-22 11:44:52.493709+02	\N	0101000020E6100000D8463CD9CD702E4090341367A08C4840	2018-05-22 11:39:44.02+02	90
14931	2018-05-23 10:42:51.886964+02	\N	0101000020E6100000E013EB54F97E2E408BE7C7BA138C4840	2018-05-23 10:41:27.109+02	90
14961	2018-05-23 11:40:21.102128+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14991	2018-05-23 15:25:11.973634+02	\N	0101000020E610000044F23A87D77E2E4094E1D3F7758B4840	2018-05-23 15:24:33.924+02	90
15021	2018-05-23 19:27:15.6288+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15051	2018-05-23 19:33:28.967141+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15081	2018-05-23 19:33:30.625264+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15111	2018-05-23 19:35:14.271777+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15141	2018-05-23 19:35:28.503646+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15171	2018-05-23 19:35:30.315312+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15201	2018-05-23 19:35:31.825581+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15231	2018-05-23 19:35:33.743449+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15261	2018-05-23 19:35:43.678525+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15291	2018-05-23 19:35:53.212974+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15321	2018-05-23 19:35:54.771913+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15351	2018-05-23 19:35:56.344795+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15381	2018-05-23 19:35:57.828289+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15411	2018-05-23 19:35:59.415097+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15441	2018-05-24 11:20:07.561466+02	\N	0101000020E61000002C1F50855E712E402319FA5E118C4840	2018-05-24 11:18:56.581+02	80
15471	2018-05-24 17:38:57.838018+02	\N	0101000020E6100000697FB1080F802E40B6A4FED53E8F4840	2018-05-22 13:48:17.513+02	82
15493	2019-02-06 09:10:27.631151+01	\N	0101000020E6100000010000C00584304074E0AB2E8A984840	2019-02-06 09:10:23.991+01	98
14902	2018-05-22 11:48:58.687169+02	\N	0101000020E61000002FC214E5D2702E4002DC87179F8C4840	2018-05-22 11:47:16.655+02	90
14932	2018-05-23 10:44:46.207206+02	\N	0101000020E6100000229BF573547F2E40494BE5ED088C4840	2018-05-23 10:43:46.824+02	90
14962	2018-05-23 11:40:21.117265+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14992	2018-05-23 15:30:09.488617+02	\N	0101000020E61000000C70E6FCB97D2E407DBFE2BA738B4840	2018-05-23 15:29:19.289+02	90
15022	2018-05-23 19:31:36.595943+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15052	2018-05-23 19:33:29.00592+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15082	2018-05-23 19:33:30.756816+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15112	2018-05-23 19:35:14.27275+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15142	2018-05-23 19:35:28.654308+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15172	2018-05-23 19:35:30.333333+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15202	2018-05-23 19:35:31.968837+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15232	2018-05-23 19:35:33.780646+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15262	2018-05-23 19:35:43.709227+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15292	2018-05-23 19:35:53.275649+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15322	2018-05-23 19:35:54.819589+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15352	2018-05-23 19:35:56.424822+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15382	2018-05-23 19:35:57.924559+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15412	2018-05-23 19:35:59.430233+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15442	2018-05-24 11:24:18.553261+02	\N	0101000020E61000002C1F9055B7712E40231924E4078C4840	2018-05-24 11:23:32.542+02	80
15494	2019-02-06 09:10:41.655992+01	\N	0101000020E6100000010000E09F8D304065E24497A7984840	2019-02-06 09:10:37.74+01	98
14903	2018-05-22 12:23:13.962906+02	\N	0101000020E6100000BC197FEC3F702E402885D448A68C4840	2018-05-22 12:21:32.54+02	90
14933	2018-05-23 10:49:14.173449+02	\N	0101000020E6100000A6B47F9E5B8F2E40FBFC274F7F8B4840	2018-05-23 10:47:37.64+02	80
14963	2018-05-23 11:40:21.124962+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14993	2018-05-23 15:31:36.753931+02	\N	0101000020E61000002B0593D1B7832E408AA5ED04A08A4840	2018-05-23 14:30:50.907+02	85
15023	2018-05-23 19:31:36.602439+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15053	2018-05-23 19:33:29.107825+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15083	2018-05-23 19:33:30.751409+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15113	2018-05-23 19:35:14.577374+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15143	2018-05-23 19:35:28.648276+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15173	2018-05-23 19:35:30.422128+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15203	2018-05-23 19:35:31.987842+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15233	2018-05-23 19:35:33.789464+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15263	2018-05-23 19:35:43.824942+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15293	2018-05-23 19:35:53.354297+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15323	2018-05-23 19:35:54.878674+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15353	2018-05-23 19:35:56.466164+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15383	2018-05-23 19:35:57.987141+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15413	2018-05-23 19:35:59.49962+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15443	2018-05-24 11:33:08.466699+02	\N	0101000020E61000006B515557F4712E40A354675A078C4840	2018-05-24 11:31:42.863+02	88
15495	2019-02-06 09:34:21.430405+01	\N	0101000020E6100000010000403589304012039F398B9B4840	2019-02-06 09:34:16.609+01	98
14904	2018-05-22 12:37:24.848691+02	\N	0101000020E61000002A65636F73702E40B8B30AF6BA8C4840	2018-05-22 12:33:45.103+02	90
14934	2018-05-23 10:50:37.437557+02	\N	0101000020E61000008F835CF3F47F2E406D20B825CD8B4840	2018-05-23 10:50:12.195+02	85
14964	2018-05-23 11:40:21.706802+02	\N	0101000020E6100000221EE4501A812E40AC91B8228C8B4840	2018-05-23 11:35:36.372+02	90
14994	2018-05-23 15:31:38.253412+02	\N	0101000020E6100000FEA3CA8BA77D2E4073E60DE6658B4840	2018-05-23 15:29:30.082+02	85
15024	2018-05-23 19:31:55.091848+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15054	2018-05-23 19:33:29.158902+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15084	2018-05-23 19:33:30.775656+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15114	2018-05-23 19:35:14.581173+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15144	2018-05-23 19:35:28.682027+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15174	2018-05-23 19:35:30.46637+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15204	2018-05-23 19:35:31.98713+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15234	2018-05-23 19:35:33.861573+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15264	2018-05-23 19:35:43.837932+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15294	2018-05-23 19:35:53.375932+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15324	2018-05-23 19:35:54.925303+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15354	2018-05-23 19:35:56.538876+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15384	2018-05-23 19:35:57.968479+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15414	2018-05-23 19:35:59.585988+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15444	2018-05-24 11:35:26.314732+02	\N	0101000020E6100000FFE89B340D722E4007F7B990FD8B4840	2018-05-24 11:34:45.695+02	88
15496	2019-02-06 09:34:32.536485+01	\N	0101000020E610000001000040337C30400F69A2C8119E4840	2019-02-06 09:34:28.714+01	98
14905	2018-05-22 13:06:06.533434+02	\N	0101000020E61000009FF7109E1A752E401C188A856B8C4840	2018-05-22 13:02:59.386+02	90
14935	2018-05-23 10:54:47.685004+02	\N	0101000020E610000069C36169E07F2E40C84C58D1D58B4840	2018-05-23 10:52:31.953+02	85
14965	2018-05-23 11:45:42.905536+02	\N	0101000020E6100000F9F36DC152812E405CBDD419298B4840	2018-05-23 11:44:42.786+02	90
14995	2018-05-23 15:32:15.796082+02	\N	0101000020E610000017331D95F67D2E40ADA7565F5D8B4840	2018-05-23 15:30:24.87+02	88
15025	2018-05-23 19:31:55.110062+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15055	2018-05-23 19:33:29.177557+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15085	2018-05-23 19:33:30.92665+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15115	2018-05-23 19:35:14.58916+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15145	2018-05-23 19:35:28.804393+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15175	2018-05-23 19:35:30.507176+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15205	2018-05-23 19:35:32.106519+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15235	2018-05-23 19:35:33.958779+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15265	2018-05-23 19:35:43.860665+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15295	2018-05-23 19:35:53.431816+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15325	2018-05-23 19:35:54.97942+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15355	2018-05-23 19:35:56.590385+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15385	2018-05-23 19:35:58.082044+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15415	2018-05-23 19:35:59.568601+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15445	2018-05-24 11:42:35.672946+02	\N	0101000020E6100000DF82EF47886D2E400D8352AC9A8D4840	2018-05-24 11:41:28.866+02	80
15497	2019-02-06 09:34:43.831983+01	\N	0101000020E6100000010000C071723040AE2CC7989D9B4840	2019-02-06 09:34:37.404+01	98
14906	2018-05-22 13:36:22.998578+02	\N	0101000020E6100000712CDE7EAF7B2E40C744EFF9068C4840	2018-05-22 13:32:54.065+02	90
14936	2018-05-23 10:57:29.085172+02	\N	0101000020E61000003DA4CE92B67F2E40B97D456DD18B4840	2018-05-23 10:55:20.753+02	85
14966	2018-05-23 12:24:33.96312+02	\N	0101000020E6100000401F609774842E402219FA3F318B4840	2018-05-23 12:22:45.524+02	80
14996	2018-05-23 15:32:25.327824+02	\N	0101000020E610000017331D95F67D2E40ADA7565F5D8B4840	2018-05-23 15:30:24.87+02	88
15026	2018-05-23 19:31:55.115029+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15056	2018-05-23 19:33:29.240118+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15086	2018-05-23 19:33:30.918624+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15116	2018-05-23 19:35:14.745846+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15146	2018-05-23 19:35:28.878533+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15176	2018-05-23 19:35:30.580112+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15206	2018-05-23 19:35:32.150195+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15236	2018-05-23 19:35:33.967194+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15266	2018-05-23 19:35:44.002269+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15296	2018-05-23 19:35:53.487821+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15326	2018-05-23 19:35:55.003424+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15356	2018-05-23 19:35:56.591943+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15386	2018-05-23 19:35:58.141443+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15416	2018-05-23 19:35:59.655792+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15446	2018-05-24 12:00:22.783673+02	\N	0101000020E61000002D23F59ECA712E40A0FD4811198C4840	2018-05-24 11:58:29.978+02	88
15498	2019-02-06 09:35:27.783317+01	\N	0101000020E6100000010000808A7B3040A7B2B27DEDA14840	2019-02-06 09:35:23.736+01	98
14907	2018-05-22 13:40:23.146277+02	\N	0101000020E610000033BACD65B47B2E40F76C67A9068C4840	2018-05-22 13:37:57.917+02	90
14937	2018-05-23 10:58:35.744322+02	\N	0101000020E61000002F5A3629BB7F2E4097A8DE1AD88B4840	2018-05-23 10:57:26.707+02	85
14967	2018-05-23 12:27:42.040106+02	\N	0101000020E6100000401F00B37C842E402219A6AF338B4840	2018-05-23 12:26:08.084+02	80
14997	2018-05-23 15:33:35.545119+02	\N	0101000020E610000017331D95F67D2E40ADA7565F5D8B4840	2018-05-23 15:30:24.87+02	88
15027	2018-05-23 19:31:55.212226+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15057	2018-05-23 19:33:29.3314+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15087	2018-05-23 19:33:30.916746+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15117	2018-05-23 19:35:15.223053+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15147	2018-05-23 19:35:28.876411+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15177	2018-05-23 19:35:30.605648+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15207	2018-05-23 19:35:32.147325+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15237	2018-05-23 19:35:34.013563+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15267	2018-05-23 19:35:43.987048+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15297	2018-05-23 19:35:53.535163+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15327	2018-05-23 19:35:55.102778+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15357	2018-05-23 19:35:56.70528+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15387	2018-05-23 19:35:58.152689+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15417	2018-05-23 19:35:59.717012+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15447	2018-05-24 13:29:51.685628+02	\N	0101000020E6100000E31A9FC9FE792E408AAA04300A8D4840	2018-05-24 13:28:28.046+02	88
15499	2019-02-06 09:35:38.308569+01	\N	0101000020E610000001000040A79E30406A10C080F8A14840	2019-02-06 09:35:34.605+01	98
14908	2018-05-22 13:46:14.187002+02	\N	0101000020E610000007B13385CE7B2E40C7BAB88D068C4840	2018-05-22 13:41:50.405+02	90
14938	2018-05-23 11:01:14.766537+02	\N	0101000020E6100000CD8FBFB4A87F2E4071C0536DDC8B4840	2018-05-23 10:58:35.727+02	90
14968	2018-05-23 12:29:57.042722+02	\N	0101000020E6100000440C511D768E2E40181546676A8B4840	2018-05-23 12:28:52.901+02	80
14998	2018-05-23 15:40:27.737062+02	\N	0101000020E6100000CCEEC9C3427D2E407EDA4D95948B4840	2018-05-23 15:39:42.048+02	90
15028	2018-05-23 19:32:05.797162+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15058	2018-05-23 19:33:29.355486+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15088	2018-05-23 19:33:31.116428+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15118	2018-05-23 19:35:15.214167+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15148	2018-05-23 19:35:28.966978+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15178	2018-05-23 19:35:30.66988+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15208	2018-05-23 19:35:32.279102+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15238	2018-05-23 19:35:34.113189+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15268	2018-05-23 19:35:44.032032+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15298	2018-05-23 19:35:53.579204+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15328	2018-05-23 19:35:55.135539+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15358	2018-05-23 19:35:56.69493+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15388	2018-05-23 19:35:58.220715+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15418	2018-05-23 19:35:59.74691+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15448	2018-05-24 17:38:52.91045+02	\N	0101000020E6100000AFE53A32FB752E403C044477FF8F4840	2018-05-22 10:51:39.971+02	82
15500	2019-02-06 09:35:45.666059+01	\N	0101000020E610000001000040FBA430404423E6273FA34840	2019-02-06 09:35:41.944+01	98
14909	2018-05-22 13:48:25.287289+02	\N	0101000020E6100000D6D86F37D27B2E40D9AFE023078C4840	2018-05-22 13:46:42.762+02	90
14939	2018-05-23 11:03:30.861467+02	\N	0101000020E6100000EAE923F0877F2E40A1866F61DD8B4840	2018-05-23 11:01:44.762+02	90
14969	2018-05-23 12:31:28.788543+02	\N	0101000020E6100000EA814534706E2E4083FB010F0C834840	2018-05-23 10:24:59.061+02	78
14999	2018-05-23 15:54:52.219814+02	\N	0101000020E6100000878BDCD3D5792E40941D763AEB8B4840	2018-05-23 15:52:39.538+02	90
15029	2018-05-23 19:32:05.817348+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15059	2018-05-23 19:33:29.418618+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15089	2018-05-23 19:33:31.115379+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15119	2018-05-23 19:35:15.233894+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15149	2018-05-23 19:35:29.04175+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15179	2018-05-23 19:35:30.743564+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15209	2018-05-23 19:35:32.308341+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15239	2018-05-23 19:35:34.146064+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15269	2018-05-23 19:35:44.137951+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15299	2018-05-23 19:35:53.647655+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15329	2018-05-23 19:35:55.178342+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15359	2018-05-23 19:35:56.74561+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15389	2018-05-23 19:35:58.330479+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15419	2018-05-23 19:35:59.788187+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15449	2018-05-24 17:38:53.25518+02	\N	0101000020E61000002E0A16E2EC752E406C466172FE8F4840	2018-05-22 10:58:58.42+02	82
15501	2019-02-06 09:36:05.060409+01	\N	0101000020E6100000010000404AA130400D818588F69F4840	2019-02-06 09:35:54.897+01	98
14910	2018-05-22 14:27:22.630577+02	\N	0101000020E6100000146B0256588E2E407291D6732D8B4840	2018-05-22 14:24:13.638+02	90
14940	2018-05-23 11:15:26.442835+02	\N	0101000020E6100000B4136FAEAB7F2E40860FDBCCD78B4840	2018-05-23 11:13:48.729+02	90
14970	2018-05-23 12:49:43.008791+02	\N	0101000020E61000002577D84466862E407FAFD7AA138B4840	2018-05-23 12:47:41.469+02	90
15000	2018-05-23 15:58:42.387063+02	\N	0101000020E6100000351F9027DD792E4022199C3BED8B4840	2018-05-23 15:55:02.977+02	80
15030	2018-05-23 19:32:05.827862+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15060	2018-05-23 19:33:29.495786+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15090	2018-05-23 19:33:31.137556+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15120	2018-05-23 19:35:15.347536+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15150	2018-05-23 19:35:29.034238+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15180	2018-05-23 19:35:30.772901+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15210	2018-05-23 19:35:32.322907+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15240	2018-05-23 19:35:34.15114+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15270	2018-05-23 19:35:44.169839+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15300	2018-05-23 19:35:53.728601+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15330	2018-05-23 19:35:55.235402+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15360	2018-05-23 19:35:56.828374+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15390	2018-05-23 19:35:58.326515+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15420	2018-05-23 19:35:59.886682+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15450	2018-05-24 17:38:53.464605+02	\N	0101000020E61000004D68925852762E40222F10A90E904840	2018-05-22 11:10:33.126+02	82
15502	2019-02-06 09:36:54.164352+01	\N	0101000020E6100000010000C0A28C3040AFA5E9D037A34840	2019-02-06 09:36:48.374+01	98
14911	2018-05-22 14:45:58.231316+02	\N	0101000020E61000003C6FBE6C968E2E409EB29AAE278B4840	2018-05-22 14:31:08.98+02	90
14941	2018-05-23 11:17:50.136485+02	\N	0101000020E6100000C982D3CCA4872E401DD2037A3C8C4840	2018-05-23 11:16:38.499+02	90
14971	2018-05-23 12:52:08.314194+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15001	2018-05-23 16:02:59.4871+02	\N	0101000020E6100000351F9008DE792E40221914B9E88B4840	2018-05-23 16:01:13.444+02	80
15031	2018-05-23 19:32:05.944031+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15061	2018-05-23 19:33:29.537729+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15091	2018-05-23 19:33:31.264527+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15121	2018-05-23 19:35:17.053847+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15151	2018-05-23 19:35:29.095007+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15181	2018-05-23 19:35:30.839764+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15211	2018-05-23 19:35:32.400227+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15241	2018-05-23 19:35:34.283801+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15271	2018-05-23 19:35:44.226915+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15301	2018-05-23 19:35:53.733662+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15331	2018-05-23 19:35:55.293293+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15361	2018-05-23 19:35:56.85805+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15391	2018-05-23 19:35:58.383855+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15421	2018-05-23 19:35:59.888389+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15451	2018-05-24 17:38:53.657385+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:17:19.72+02	82
15503	2019-02-06 09:37:02.401729+01	\N	0101000020E610000001000000CD8B30408E41643681A34840	2019-02-06 09:36:57.277+01	98
14912	2018-05-22 14:48:43.96771+02	\N	0101000020E610000041898510468E2E401C66C3F5838A4840	2018-05-22 14:47:56.915+02	90
14942	2018-05-23 11:19:39.263424+02	\N	0101000020E6100000C584E2D8C47F2E404B87985CD68B4840	2018-05-23 11:18:03.645+02	90
14972	2018-05-23 12:53:01.230732+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15002	2018-05-23 16:20:39.455691+02	\N	0101000020E6100000F67AF7C77B792E40F3AA73B10E8C4840	2018-05-23 16:18:00.606+02	90
15032	2018-05-23 19:32:06.409265+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15062	2018-05-23 19:33:29.583771+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15092	2018-05-23 19:33:31.299093+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15122	2018-05-23 19:35:17.057101+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15152	2018-05-23 19:35:29.22487+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15182	2018-05-23 19:35:30.885098+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15212	2018-05-23 19:35:32.503427+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15242	2018-05-23 19:35:34.311913+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15272	2018-05-23 19:35:44.288032+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15302	2018-05-23 19:35:53.806125+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15332	2018-05-23 19:35:55.320828+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15362	2018-05-23 19:35:56.894699+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15392	2018-05-23 19:35:58.44464+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15422	2018-05-23 19:35:59.924898+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15452	2018-05-24 17:38:53.843006+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:19:19.213+02	82
15504	2019-02-06 09:37:10.613158+01	\N	0101000020E610000001000040F78A30405E9063D342A34840	2019-02-06 09:37:05.625+01	98
14913	2018-05-22 15:16:56.171017+02	\N	0101000020E610000030A182C30B8E2E40DBE5B6D8488A4840	2018-05-22 15:15:17.478+02	90
14943	2018-05-23 11:21:48.931188+02	\N	0101000020E6100000655CCC2AC77F2E40CE7F59EBD58B4840	2018-05-23 11:20:44.815+02	90
14973	2018-05-23 12:53:01.233346+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15003	2018-05-23 16:20:39.64424+02	\N	0101000020E6100000F67AF7C77B792E40F3AA73B10E8C4840	2018-05-23 16:18:00.606+02	90
15033	2018-05-23 19:32:06.434133+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15063	2018-05-23 19:33:29.653557+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15093	2018-05-23 19:33:31.324469+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15123	2018-05-23 19:35:17.080019+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15153	2018-05-23 19:35:29.224734+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15183	2018-05-23 19:35:30.916494+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15213	2018-05-23 19:35:32.537538+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15243	2018-05-23 19:35:34.324177+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15273	2018-05-23 19:35:44.307256+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15303	2018-05-23 19:35:53.880238+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15333	2018-05-23 19:35:55.433712+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15363	2018-05-23 19:35:56.996382+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15393	2018-05-23 19:35:58.494269+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15423	2018-05-23 19:36:00.039439+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15453	2018-05-24 17:38:54.04684+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:44:25.345+02	82
15505	2019-02-06 09:37:24.115386+01	\N	0101000020E6100000010000C0488C30403415E1A37CA24840	2019-02-06 09:37:18.805+01	98
14914	2018-05-22 15:19:56.239739+02	\N	0101000020E610000080CFB469118E2E40C9C27C1E488A4840	2018-05-22 15:18:13.417+02	90
14944	2018-05-23 11:24:25.101311+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14974	2018-05-23 12:54:18.347106+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15004	2018-05-23 17:21:05.57187+02	\N	0101000020E6100000361FD0AAFA7A2E402319769AFF8B4840	2018-05-23 17:18:18.956+02	80
15034	2018-05-23 19:32:06.444877+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15064	2018-05-23 19:33:29.706299+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15094	2018-05-23 19:33:31.440863+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15124	2018-05-23 19:35:17.246073+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15154	2018-05-23 19:35:29.260234+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15184	2018-05-23 19:35:31.026876+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15214	2018-05-23 19:35:32.592291+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15244	2018-05-23 19:35:34.455943+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15274	2018-05-23 19:35:44.395238+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15304	2018-05-23 19:35:53.898529+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15334	2018-05-23 19:35:55.46948+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15364	2018-05-23 19:35:56.992032+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15394	2018-05-23 19:35:58.572756+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15424	2018-05-23 19:36:00.048651+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15454	2018-05-24 17:38:54.21934+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:47:12.707+02	82
15506	2019-02-06 09:37:32.943899+01	\N	0101000020E6100000010000407B8E3040A399946AEEA24840	2019-02-06 09:37:27.026+01	98
14915	2018-05-22 15:24:30.002746+02	\N	0101000020E6100000CFE8FD350F8E2E4057491A92498A4840	2018-05-22 15:22:47.793+02	90
14945	2018-05-23 11:25:21.969058+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14975	2018-05-23 12:54:18.933329+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15005	2018-05-23 17:23:48.85443+02	\N	0101000020E610000093B7D99EFA762E4093EA74933C8C4840	2018-05-23 17:21:22.014+02	80
15035	2018-05-23 19:32:06.565412+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15065	2018-05-23 19:33:29.759072+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15095	2018-05-23 19:33:31.444832+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15125	2018-05-23 19:35:17.254426+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15155	2018-05-23 19:35:29.371252+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15185	2018-05-23 19:35:31.042257+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15215	2018-05-23 19:35:32.678942+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15245	2018-05-23 19:35:34.445441+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15275	2018-05-23 19:35:52.441028+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15305	2018-05-23 19:35:53.936785+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15335	2018-05-23 19:35:55.475851+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15365	2018-05-23 19:35:57.031118+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15395	2018-05-23 19:35:58.55808+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15425	2018-05-23 19:36:00.048716+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15455	2018-05-24 17:38:54.391136+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:52:00.423+02	82
15507	2019-02-06 09:37:43.026961+01	\N	0101000020E610000001000040408D304035DD687725A34840	2019-02-06 09:37:36.814+01	98
14916	2018-05-22 15:33:46.409274+02	\N	0101000020E610000082AED8BA2F8E2E40E2E5E95C518A4840	2018-05-22 15:30:48.849+02	90
14946	2018-05-23 11:25:24.045385+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14976	2018-05-23 12:54:18.946677+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15006	2018-05-23 17:29:06.5731+02	\N	0101000020E6100000361FE0F4727B2E4023190A1AFB8B4840	2018-05-23 17:27:29.383+02	80
15036	2018-05-23 19:32:06.971532+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15066	2018-05-23 19:33:29.800429+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15096	2018-05-23 19:33:31.501934+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15126	2018-05-23 19:35:17.253311+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15156	2018-05-23 19:35:29.41607+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15186	2018-05-23 19:35:31.085617+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15216	2018-05-23 19:35:32.694754+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15246	2018-05-23 19:35:34.48379+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15276	2018-05-23 19:35:52.452301+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15306	2018-05-23 19:35:54.01837+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15336	2018-05-23 19:35:55.588966+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15366	2018-05-23 19:35:57.099766+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15396	2018-05-23 19:35:58.629278+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15426	2018-05-23 19:36:00.175476+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15456	2018-05-24 17:38:54.610795+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:53:56.422+02	82
15508	2019-02-06 09:38:01.23997+01	\N	0101000020E61000000100000060AD3040B2825D642CA74840	2019-02-06 09:37:56.375+01	98
14917	2018-05-22 15:36:35.649924+02	\N	0101000020E61000009E3F129B348E2E409439F130488A4840	2018-05-22 15:34:23.916+02	90
14947	2018-05-23 11:26:25.271935+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14977	2018-05-23 12:54:18.967627+02	\N	0101000020E61000004FD42D967D862E40575FB8CE1A8B4840	2018-05-23 12:50:34.201+02	90
15007	2018-05-23 19:23:59.95369+02	\N	0101000020E6100000876C205D6C6A2E4009F42E83D68B4840	2018-05-23 10:57:50.621+02	91
15037	2018-05-23 19:32:07.002864+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15067	2018-05-23 19:33:29.921545+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15097	2018-05-23 19:33:31.596695+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15127	2018-05-23 19:35:17.374133+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15157	2018-05-23 19:35:29.431982+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15187	2018-05-23 19:35:31.167455+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15217	2018-05-23 19:35:32.756189+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15247	2018-05-23 19:35:34.607722+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15277	2018-05-23 19:35:52.484758+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15307	2018-05-23 19:35:54.052847+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15337	2018-05-23 19:35:55.625583+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15367	2018-05-23 19:35:57.150502+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15397	2018-05-23 19:35:58.721208+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15427	2018-05-23 19:36:00.186745+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15457	2018-05-24 17:38:54.831782+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 11:59:47.181+02	82
15509	2019-02-06 09:38:13.640858+01	\N	0101000020E610000001000040BC89304006713144C3A34840	2019-02-06 09:38:09.575+01	98
14918	2018-05-22 15:46:18.575978+02	\N	0101000020E6100000C7A64BB5058E2E40ACC3769C478A4840	2018-05-22 15:39:24.209+02	90
14948	2018-05-23 11:26:25.274217+02	\N	0101000020E6100000F652C25D07802E40BDE0D39CBC8B4840	2018-05-23 11:23:23.57+02	90
14978	2018-05-23 13:01:33.575503+02	\N	0101000020E6100000C2D77C01627F2E402DDB3D2FCB8B4840	2018-05-23 11:00:29.545+02	85
15008	2018-05-23 19:24:01.613262+02	\N	0101000020E6100000051E73F96A6A2E40CF577F3AD48B4840	2018-05-23 11:01:17.02+02	91
15038	2018-05-23 19:32:06.978287+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15068	2018-05-23 19:33:29.990093+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15098	2018-05-23 19:33:31.614985+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15128	2018-05-23 19:35:17.431147+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15158	2018-05-23 19:35:29.523517+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15188	2018-05-23 19:35:31.19137+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15218	2018-05-23 19:35:32.804442+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15248	2018-05-23 19:35:34.61994+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15278	2018-05-23 19:35:52.568424+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15308	2018-05-23 19:35:54.089571+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15338	2018-05-23 19:35:55.646571+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15368	2018-05-23 19:35:57.186358+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15398	2018-05-23 19:35:58.71875+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15428	2018-05-23 19:36:55.435702+02	\N	0101000020E610000013B2987DC3712E4091990B5C1E8A4840	2018-05-23 14:41:09.685+02	91
15458	2018-05-24 17:38:55.027628+02	\N	0101000020E6100000D49B51F355762E4064F08BA60E904840	2018-05-22 12:03:03.635+02	82
15510	2019-02-06 09:38:22.509312+01	\N	0101000020E610000001000080028B3040AAE7A85931A44840	2019-02-06 09:38:15.519+01	98
14856	2018-05-20 14:54:05.948262+02	\N	0101000020E6100000E13BD631537B2E40C59C56C0F38B4840	2018-05-20 14:52:27.601+02	78
14857	2018-05-20 15:32:16.048039+02	\N	0101000020E6100000B3C6EAA05C842E400A5E995C318B4840	2018-05-20 15:30:45.095+02	78
14858	2018-05-20 17:30:14.122622+02	\N	0101000020E6100000B3C6EAA05C842E400A5E995C318B4840	2018-05-20 15:30:45.095+02	78
\.


--
-- Data for Name: api_metadataobservation_values; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_metadataobservation_values (id, metadataobservation_id, phenomenonparametervalue_id) FROM stdin;
4987	14857	4983
4988	14857	4984
4989	14857	4985
4990	14857	4986
4991	14857	4987
5114	14899	5110
5115	14899	5111
5116	14899	5112
5117	14899	5113
5118	14899	5114
5213	14920	5209
5214	14920	5210
5215	14920	5211
5216	14920	5212
5362	14954	5358
5363	14954	5359
5364	14954	5360
5365	14954	5362
5367	14954	5363
5513	14988	5509
5514	14988	5510
5515	14988	5511
5516	14988	5512
5669	15022	5665
5670	15022	5666
5671	15022	5667
5674	15022	5669
5676	15022	5672
5839	15056	5835
5840	15056	5836
5841	15056	5837
5842	15056	5838
5843	15056	5839
6005	15089	6000
6007	15089	6003
6009	15089	6005
6011	15089	6007
6013	15089	6009
6179	15124	6175
6180	15124	6176
6182	15124	6177
6184	15124	6179
6185	15124	6182
6349	15158	6345
6350	15158	6346
6351	15158	6347
6352	15158	6348
6353	15158	6349
6516	15192	6513
6520	15192	6515
6521	15192	6517
6522	15192	6518
6523	15192	6519
6688	15226	6683
6690	15226	6687
6692	15226	6688
6693	15226	6690
6695	15226	6691
6859	15260	6855
6861	15260	6857
6862	15260	6859
6864	15260	6860
6866	15260	6862
7028	15294	7024
7030	15294	7026
7031	15294	7027
7032	15294	7028
7033	15294	7029
7199	15328	7195
7200	15328	7196
7201	15328	7197
7202	15328	7198
7203	15328	7199
7369	15362	7365
7370	15362	7366
7371	15362	7367
7372	15362	7368
7373	15362	7369
7539	15396	7535
7540	15396	7536
7541	15396	7537
7542	15396	7538
7543	15396	7539
7708	15430	7704
7709	15430	7705
7710	15430	7706
7711	15430	7707
7712	15430	7708
7868	15464	7864
7869	15464	7865
7870	15464	7866
7871	15464	7867
7872	15464	7868
8002	15515	7998
8003	15515	7999
4992	14858	4988
5217	14921	5213
5218	14921	5214
5219	14921	5215
5220	14921	5216
5221	14921	5217
5366	14955	5361
5368	14955	5364
5370	14955	5366
4993	14858	4989
4994	14858	4990
4995	14858	4991
4996	14858	4992
5119	14900	5115
5120	14900	5116
5121	14900	5117
5122	14900	5118
5123	14900	5119
5373	14955	5368
5375	14955	5371
5517	14989	5513
5518	14989	5514
5519	14989	5515
5520	14989	5516
5672	15023	5668
5673	15023	5670
5675	15023	5671
5677	15023	5673
5678	15023	5674
5844	15057	5840
5845	15057	5841
5846	15057	5842
5848	15057	5844
5849	15057	5846
6014	15091	6010
6015	15091	6011
6017	15091	6013
6019	15091	6015
6021	15091	6017
6181	15125	6178
6183	15125	6180
6186	15125	6181
6188	15125	6184
6190	15125	6185
6354	15159	6350
6355	15159	6351
6356	15159	6352
6357	15159	6353
6359	15159	6355
6524	15193	6520
6526	15193	6523
6529	15193	6525
6533	15193	6528
6537	15193	6532
6691	15227	6686
6694	15227	6689
6696	15227	6692
6697	15227	6693
6698	15227	6694
6860	15261	6856
6863	15261	6858
6865	15261	6861
6868	15261	6864
6869	15261	6866
7034	15295	7030
7035	15295	7031
7036	15295	7032
7037	15295	7033
7038	15295	7034
7204	15329	7200
7205	15329	7201
7206	15329	7202
7207	15329	7203
7208	15329	7204
7374	15363	7370
7375	15363	7371
7376	15363	7372
7377	15363	7373
7378	15363	7374
7544	15398	7540
7546	15398	7542
7548	15398	7544
7550	15398	7546
7552	15398	7548
7713	15431	7709
7714	15431	7710
7715	15431	7711
7716	15431	7712
7717	15431	7713
7873	15465	7869
7874	15465	7870
7875	15465	7871
7876	15465	7872
7877	15465	7873
7945	15482	7941
8004	15516	8000
8005	15516	8001
5222	14922	5218
5223	14922	5219
5224	14922	5220
5225	14922	5221
5226	14922	5222
5124	14901	5120
5125	14901	5121
5126	14901	5122
5127	14901	5123
5128	14901	5124
5369	14956	5365
5371	14956	5367
5372	14956	5369
5374	14956	5370
5376	14956	5372
5521	14990	5517
5522	14990	5518
5523	14990	5519
5524	14990	5520
5525	14990	5521
5679	15024	5675
5680	15024	5676
5681	15024	5677
5682	15024	5679
5685	15024	5681
5847	15058	5843
5850	15058	5845
5851	15058	5847
5852	15058	5848
5853	15058	5849
6016	15092	6012
6018	15092	6014
6020	15092	6016
6022	15092	6018
6024	15092	6020
6187	15126	6183
6189	15126	6186
6191	15126	6187
6192	15126	6188
6193	15126	6189
6358	15160	6354
6360	15160	6356
6361	15160	6357
6362	15160	6358
6363	15160	6359
6525	15194	6521
6528	15194	6524
6532	15194	6527
6534	15194	6530
6536	15194	6533
6699	15229	6695
6701	15229	6698
6705	15229	6700
6708	15229	6704
6711	15229	6707
6867	15262	6863
6870	15262	6865
6871	15262	6867
6872	15262	6868
6873	15262	6869
7039	15296	7035
7040	15296	7036
7041	15296	7037
7042	15296	7038
7043	15296	7039
7209	15330	7205
7210	15330	7206
7211	15330	7207
7212	15330	7208
7213	15330	7209
7379	15364	7375
7381	15364	7377
7383	15364	7379
7385	15364	7381
7387	15364	7383
7545	15397	7541
7547	15397	7543
7549	15397	7545
7551	15397	7547
7553	15397	7549
7718	15432	7714
7719	15432	7715
7720	15432	7716
7721	15432	7717
7722	15432	7718
7878	15466	7874
7879	15466	7875
7880	15466	7876
7881	15466	7877
7882	15466	7878
7946	15483	7942
8006	15517	8002
8007	15517	8003
5227	14923	5223
5228	14923	5224
5229	14923	5225
5230	14923	5226
5129	14902	5125
5130	14902	5126
5131	14902	5127
5132	14902	5128
5133	14902	5129
5377	14957	5373
5378	14957	5374
5379	14957	5375
5380	14957	5376
5381	14957	5377
5526	14991	5522
5527	14991	5523
5528	14991	5524
5529	14991	5525
5683	15025	5678
5686	15025	5682
5689	15025	5684
5691	15025	5687
5693	15025	5689
5854	15059	5850
5855	15059	5851
5856	15059	5852
5857	15059	5853
5858	15059	5854
6023	15093	6019
6025	15093	6021
6026	15093	6022
6027	15093	6023
6028	15093	6024
6194	15127	6190
6195	15127	6191
6196	15127	6192
6197	15127	6193
6198	15127	6194
6364	15161	6360
6365	15161	6361
6366	15161	6362
6367	15161	6363
6368	15161	6364
6527	15195	6522
6530	15195	6526
6531	15195	6529
6535	15195	6531
6538	15195	6534
6700	15228	6696
6703	15228	6699
6704	15228	6701
6707	15228	6703
6709	15228	6706
6874	15264	6870
6876	15264	6872
6878	15264	6874
6881	15264	6877
6884	15264	6879
7044	15297	7040
7045	15297	7041
7046	15297	7042
7047	15297	7043
7048	15297	7044
7214	15331	7210
7215	15331	7211
7217	15331	7212
7219	15331	7215
7221	15331	7217
7380	15365	7376
7382	15365	7378
7384	15365	7380
7386	15365	7382
7388	15365	7384
7554	15399	7550
7555	15399	7551
7556	15399	7552
7557	15399	7553
7558	15399	7554
7723	15433	7719
7724	15433	7720
7725	15433	7721
7726	15433	7722
7727	15433	7723
7883	15467	7879
7884	15467	7880
7885	15467	7881
7886	15467	7882
7887	15467	7883
7947	15484	7943
7948	15484	7944
7949	15484	7945
7950	15484	7946
8008	15518	8004
8009	15518	8005
5231	14924	5227
5232	14924	5228
5233	14924	5229
5234	14924	5230
5134	14903	5130
5135	14903	5131
5136	14903	5132
5137	14903	5133
5138	14903	5134
5235	14924	5231
5382	14958	5378
5383	14958	5379
5384	14958	5380
5385	14958	5381
5386	14958	5382
5530	14992	5526
5531	14992	5527
5532	14992	5528
5533	14992	5529
5684	15026	5680
5687	15026	5683
5688	15026	5685
5690	15026	5686
5692	15026	5688
5859	15060	5855
5860	15060	5856
5861	15060	5857
5862	15060	5858
5863	15060	5859
6029	15094	6025
6031	15094	6027
6033	15094	6029
6034	15094	6031
6037	15094	6032
6199	15128	6195
6200	15128	6197
6203	15128	6199
6205	15128	6201
6208	15128	6203
6369	15162	6365
6370	15162	6366
6371	15162	6367
6373	15162	6369
6375	15162	6371
6539	15197	6536
6541	15197	6537
6544	15197	6539
6548	15197	6543
6551	15197	6547
6702	15230	6697
6706	15230	6702
6710	15230	6705
6712	15230	6708
6713	15230	6709
6875	15263	6871
6877	15263	6873
6879	15263	6875
6882	15263	6878
6885	15263	6881
7049	15298	7045
7050	15298	7046
7051	15298	7047
7052	15298	7048
7053	15298	7049
7216	15332	7213
7218	15332	7214
7220	15332	7216
7222	15332	7218
7223	15332	7219
7389	15366	7385
7390	15366	7386
7391	15366	7387
7392	15366	7388
7393	15366	7389
7559	15400	7555
7560	15400	7556
7562	15400	7558
7564	15400	7559
7567	15400	7562
7728	15434	7724
7729	15434	7725
7730	15434	7726
7731	15434	7727
7732	15434	7728
7888	15468	7884
7889	15468	7885
7890	15468	7886
7891	15468	7887
7892	15468	7888
7951	15485	7947
7952	15485	7948
7953	15485	7949
7954	15485	7950
8010	15519	8006
8011	15519	8007
5236	14925	5232
5237	14925	5233
5238	14925	5234
5239	14925	5235
5139	14904	5135
5140	14904	5136
5141	14904	5137
5142	14904	5138
5240	14925	5236
5387	14959	5383
5389	14959	5385
5391	14959	5387
5393	14959	5389
5395	14959	5391
5534	14993	5530
5535	14993	5531
5536	14993	5532
5537	14993	5533
5694	15027	5690
5695	15027	5691
5696	15027	5692
5697	15027	5693
5698	15027	5694
5864	15061	5860
5865	15061	5861
5866	15061	5862
5867	15061	5863
5868	15061	5865
6030	15095	6026
6032	15095	6028
6035	15095	6030
6036	15095	6033
6038	15095	6034
6201	15129	6196
6202	15129	6198
6204	15129	6200
6206	15129	6202
6207	15129	6204
6372	15163	6368
6374	15163	6370
6376	15163	6372
6377	15163	6373
6378	15163	6374
6540	15196	6535
6542	15196	6538
6543	15196	6540
6546	15196	6542
6549	15196	6545
6714	15231	6710
6715	15231	6711
6716	15231	6712
6717	15231	6713
6718	15231	6714
6880	15265	6876
6883	15265	6880
6886	15265	6882
6887	15265	6883
6888	15265	6884
7054	15299	7050
7055	15299	7051
7056	15299	7052
7057	15299	7053
7058	15299	7054
7224	15333	7221
7226	15333	7222
7228	15333	7225
7232	15333	7227
7235	15333	7231
7394	15367	7390
7395	15367	7391
7396	15367	7392
7397	15367	7393
7398	15367	7394
7561	15401	7557
7563	15401	7560
7565	15401	7561
7566	15401	7563
7568	15401	7564
7733	15435	7729
7734	15435	7730
7735	15435	7731
7736	15435	7732
7737	15435	7733
7893	15469	7889
7894	15469	7890
7895	15469	7891
7896	15469	7892
7897	15469	7893
7955	15486	7951
7956	15486	7952
7957	15486	7953
7958	15486	7954
8012	15520	8008
5241	14926	5237
5242	14926	5238
5243	14926	5239
5244	14926	5240
5143	14905	5139
5144	14905	5140
5145	14905	5141
5146	14905	5142
5147	14905	5143
5245	14926	5241
5388	14960	5384
5390	14960	5386
5392	14960	5388
5394	14960	5390
5396	14960	5392
5538	14994	5534
5539	14994	5535
5540	14994	5536
5541	14994	5537
5699	15028	5695
5700	15028	5696
5702	15028	5698
5704	15028	5700
5707	15028	5703
5869	15062	5864
5870	15062	5866
5871	15062	5867
5872	15062	5868
5873	15062	5869
6039	15096	6035
6040	15096	6036
6041	15096	6037
6042	15096	6038
6043	15096	6039
6209	15130	6205
6210	15130	6206
6211	15130	6207
6212	15130	6208
6213	15130	6209
6379	15165	6375
6381	15165	6377
6383	15165	6379
6386	15165	6381
6388	15165	6384
6545	15198	6541
6547	15198	6544
6550	15198	6546
6552	15198	6548
6553	15198	6549
6719	15233	6716
6721	15233	6717
6724	15233	6719
6726	15233	6722
6728	15233	6724
6889	15267	6886
6891	15267	6887
6893	15267	6889
6895	15267	6891
6897	15267	6893
7059	15300	7055
7060	15300	7056
7061	15300	7057
7062	15300	7058
7064	15300	7060
7225	15334	7220
7227	15334	7223
7230	15334	7226
7233	15334	7229
7237	15334	7232
7399	15368	7395
7400	15368	7396
7401	15368	7397
7402	15368	7398
7403	15368	7399
7569	15402	7565
7570	15402	7566
7571	15402	7567
7572	15402	7568
7573	15402	7569
7738	15436	7734
7739	15436	7735
7740	15436	7736
7741	15436	7737
7742	15436	7738
7898	15470	7894
7899	15470	7895
7900	15470	7896
7901	15470	7897
7902	15470	7898
7959	15487	7955
7960	15487	7956
7961	15487	7957
7962	15487	7958
8013	15521	8009
5246	14927	5242
5247	14927	5243
5248	14927	5244
5249	14927	5245
5148	14906	5144
5149	14906	5145
5150	14906	5146
5151	14906	5147
5152	14906	5148
5250	14927	5246
5397	14961	5393
5398	14961	5394
5399	14961	5395
5401	14961	5397
5403	14961	5399
5542	14995	5538
5543	14995	5539
5544	14995	5540
5545	14995	5541
5701	15029	5697
5703	15029	5699
5705	15029	5701
5710	15029	5705
5712	15029	5708
5874	15063	5870
5875	15063	5871
5876	15063	5872
5877	15063	5873
5878	15063	5874
6044	15097	6040
6045	15097	6041
6046	15097	6042
6047	15097	6044
6048	15097	6045
6214	15131	6210
6215	15131	6211
6216	15131	6212
6217	15131	6213
6218	15131	6214
6380	15164	6376
6382	15164	6378
6384	15164	6380
6385	15164	6382
6387	15164	6383
6554	15200	6550
6555	15200	6552
6558	15200	6554
6562	15200	6557
6565	15200	6561
6720	15232	6715
6722	15232	6718
6723	15232	6720
6725	15232	6721
6727	15232	6723
6890	15266	6885
6892	15266	6888
6894	15266	6890
6896	15266	6892
6899	15266	6895
7063	15301	7059
7065	15301	7061
7066	15301	7062
7067	15301	7063
7068	15301	7064
7229	15335	7224
7231	15335	7228
7234	15335	7230
7236	15335	7233
7238	15335	7234
7404	15369	7400
7405	15369	7401
7406	15369	7402
7407	15369	7403
7408	15369	7404
7574	15403	7570
7575	15403	7571
7576	15403	7572
7577	15403	7573
7579	15403	7575
7743	15437	7739
7744	15437	7740
7745	15437	7741
7746	15437	7742
7747	15437	7743
7903	15471	7899
7904	15471	7900
7905	15471	7901
7906	15471	7902
7907	15471	7903
7963	15488	7959
7964	15488	7960
7965	15488	7961
7966	15488	7962
8014	15522	8010
5251	14928	5247
5252	14928	5248
5253	14928	5249
5153	14907	5149
5154	14907	5150
5155	14907	5151
5156	14907	5152
5157	14907	5153
5254	14928	5250
5255	14928	5251
5400	14962	5396
5402	14962	5398
5404	14962	5400
5406	14962	5402
5409	14962	5404
5546	14996	5542
5547	14996	5543
5548	14996	5544
5549	14996	5545
5706	15030	5702
5708	15030	5704
5709	15030	5706
5711	15030	5707
5713	15030	5709
5879	15064	5875
5880	15064	5876
5891	15064	5877
5892	15064	5888
5893	15064	5889
6049	15098	6043
6050	15098	6046
6052	15098	6048
6055	15098	6050
6057	15098	6053
6219	15132	6215
6221	15132	6217
6223	15132	6219
6225	15132	6221
6227	15132	6223
6389	15166	6385
6390	15166	6386
6391	15166	6387
6392	15166	6388
6393	15166	6389
6556	15199	6551
6560	15199	6556
6561	15199	6559
6564	15199	6560
6567	15199	6563
6729	15234	6725
6730	15234	6726
6731	15234	6727
6732	15234	6728
6733	15234	6729
6898	15268	6894
6900	15268	6896
6901	15268	6897
6902	15268	6898
6903	15268	6899
7069	15302	7065
7070	15302	7066
7071	15302	7067
7072	15302	7068
7073	15302	7069
7239	15336	7235
7240	15336	7236
7241	15336	7237
7242	15336	7238
7243	15336	7239
7409	15370	7405
7410	15370	7406
7411	15370	7407
7412	15370	7408
7413	15370	7409
7578	15404	7574
7580	15404	7576
7581	15404	7577
7582	15404	7578
7583	15404	7579
7748	15438	7744
7749	15438	7745
7750	15438	7746
7751	15438	7747
7752	15438	7748
7967	15489	7963
5256	14929	5252
5257	14929	5253
5258	14929	5254
5259	14929	5255
5158	14908	5154
5159	14908	5155
5160	14908	5156
5161	14908	5157
5162	14908	5158
5405	14963	5401
5407	14963	5403
5408	14963	5405
5410	14963	5406
5411	14963	5407
5550	14997	5546
5551	14997	5547
5552	14997	5548
5553	14997	5549
5714	15031	5710
5715	15031	5711
5716	15031	5712
5717	15031	5713
5718	15031	5714
5881	15065	5878
5882	15065	5879
5884	15065	5881
5886	15065	5883
5888	15065	5885
6051	15099	6047
6053	15099	6049
6054	15099	6051
6056	15099	6052
6058	15099	6054
6220	15133	6216
6222	15133	6218
6224	15133	6220
6226	15133	6222
6228	15133	6224
6394	15167	6390
6396	15167	6392
6399	15167	6395
6402	15167	6398
6405	15167	6401
6557	15201	6553
6559	15201	6555
6563	15201	6558
6566	15201	6562
6568	15201	6564
6734	15235	6730
6735	15235	6731
6736	15235	6732
6737	15235	6733
6739	15235	6735
6904	15269	6900
6905	15269	6901
6906	15269	6902
6907	15269	6903
6908	15269	6904
7074	15303	7070
7075	15303	7071
7076	15303	7072
7078	15303	7074
7079	15303	7076
7244	15337	7240
7245	15337	7241
7246	15337	7242
7248	15337	7244
7250	15337	7246
7414	15371	7410
7415	15371	7411
7416	15371	7412
7417	15371	7413
7418	15371	7414
7584	15405	7580
7585	15405	7581
7586	15405	7582
7587	15405	7583
7588	15405	7584
7753	15439	7749
7754	15439	7750
7755	15439	7751
7756	15439	7752
7968	15490	7964
5260	14930	5256
5261	14930	5257
5262	14930	5258
5263	14930	5259
5163	14909	5159
5164	14909	5160
5165	14909	5161
5166	14909	5162
5167	14909	5163
5264	14930	5260
5412	14964	5408
5413	14964	5409
5414	14964	5410
5415	14964	5411
5416	14964	5412
5554	14998	5550
5555	14998	5551
5556	14998	5552
5557	14998	5553
5719	15032	5715
5720	15032	5716
5721	15032	5717
5723	15032	5719
5724	15032	5720
5883	15066	5880
5885	15066	5882
5887	15066	5884
5889	15066	5886
5890	15066	5887
6059	15100	6055
6061	15100	6057
6063	15100	6059
6065	15100	6061
6067	15100	6064
6229	15134	6225
6230	15134	6226
6231	15134	6227
6232	15134	6229
6234	15134	6230
6395	15168	6391
6398	15168	6394
6401	15168	6397
6404	15168	6400
6407	15168	6403
6569	15202	6565
6571	15202	6567
6573	15202	6570
6576	15202	6572
6580	15202	6575
6738	15236	6734
6740	15236	6736
6741	15236	6737
6742	15236	6738
6743	15236	6740
6909	15270	6905
6910	15270	6906
6911	15270	6907
6912	15270	6908
6913	15270	6909
7077	15304	7073
7080	15304	7075
7081	15304	7077
7082	15304	7078
7083	15304	7079
7247	15338	7243
7249	15338	7245
7251	15338	7247
7252	15338	7248
7253	15338	7249
7419	15372	7415
7420	15372	7416
7421	15372	7417
7423	15372	7419
7425	15372	7421
7589	15406	7585
7590	15406	7586
7591	15406	7587
7592	15406	7588
7593	15406	7589
7757	15440	7753
7758	15440	7754
7759	15440	7755
7760	15440	7756
7969	15491	7965
5265	14931	5261
5266	14931	5262
5267	14931	5263
5268	14931	5264
5168	14910	5164
5169	14910	5165
5170	14910	5166
5171	14910	5167
5172	14910	5168
5417	14965	5413
5418	14965	5414
5419	14965	5415
5420	14965	5416
5558	14999	5554
5559	14999	5555
5560	14999	5556
5561	14999	5557
5722	15033	5718
5726	15033	5721
5728	15033	5724
5730	15033	5726
5732	15033	5728
5894	15067	5890
5895	15067	5891
5896	15067	5892
5897	15067	5893
5898	15067	5894
6060	15101	6056
6062	15101	6058
6064	15101	6060
6066	15101	6062
6068	15101	6063
6233	15135	6228
6235	15135	6231
6238	15135	6233
6239	15135	6236
6241	15135	6237
6397	15169	6393
6400	15169	6396
6403	15169	6399
6406	15169	6402
6408	15169	6404
6570	15204	6568
6574	15204	6569
6577	15204	6573
6578	15204	6576
6581	15204	6577
6744	15237	6739
6745	15237	6741
6746	15237	6742
6747	15237	6743
6748	15237	6744
6914	15271	6910
6915	15271	6911
6916	15271	6912
6917	15271	6913
6918	15271	6914
7084	15305	7080
7085	15305	7081
7086	15305	7082
7087	15305	7083
7088	15305	7084
7254	15339	7250
7255	15339	7251
7256	15339	7252
7257	15339	7253
7258	15339	7254
7422	15373	7418
7424	15373	7420
7426	15373	7422
7427	15373	7423
7428	15373	7424
7594	15407	7590
7595	15407	7591
7596	15407	7592
7597	15407	7593
7598	15407	7594
7761	15441	7757
7762	15441	7758
7763	15441	7759
7970	15492	7966
5269	14932	5265
5173	14911	5169
5174	14911	5170
5175	14911	5171
5176	14911	5172
5270	14932	5266
5271	14932	5267
5272	14932	5268
5421	14966	5417
5422	14966	5418
5423	14966	5419
5424	14966	5420
5562	15000	5558
5563	15000	5559
5564	15000	5560
5565	15000	5561
5566	15000	5562
5725	15034	5722
5727	15034	5723
5729	15034	5725
5731	15034	5727
5733	15034	5729
5899	15068	5895
5900	15068	5896
5901	15068	5897
5903	15068	5899
5905	15068	5901
6069	15102	6065
6070	15102	6066
6071	15102	6067
6072	15102	6068
6073	15102	6069
6236	15136	6232
6237	15136	6234
6240	15136	6235
6242	15136	6238
6243	15136	6239
6409	15170	6405
6410	15170	6406
6411	15170	6407
6412	15170	6408
6413	15170	6409
6572	15203	6566
6575	15203	6571
6579	15203	6574
6582	15203	6578
6583	15203	6579
6749	15238	6745
6750	15238	6746
6751	15238	6747
6752	15238	6748
6754	15238	6750
6919	15272	6915
6920	15272	6916
6922	15272	6918
6924	15272	6920
6926	15272	6922
7089	15306	7085
7090	15306	7086
7091	15306	7087
7093	15306	7089
7095	15306	7091
7259	15341	7256
7262	15341	7258
7265	15341	7261
7268	15341	7264
7272	15341	7267
7429	15374	7425
7430	15374	7426
7431	15374	7427
7432	15374	7428
7433	15374	7429
7599	15409	7595
7601	15409	7597
7603	15409	7599
7605	15409	7601
7606	15409	7602
7764	15442	7760
7765	15442	7761
7766	15442	7762
7767	15442	7763
7971	15493	7967
5273	14933	5269
5274	14933	5270
5275	14933	5271
5276	14933	5272
5177	14912	5173
5178	14912	5174
5179	14912	5175
5180	14912	5176
5425	14967	5421
5426	14967	5422
5427	14967	5423
5428	14967	5424
5567	15001	5563
5568	15001	5564
5569	15001	5565
5570	15001	5566
5571	15001	5567
5734	15035	5730
5735	15035	5731
5736	15035	5732
5737	15035	5733
5738	15035	5734
5902	15069	5898
5904	15069	5900
5906	15069	5902
5907	15069	5903
5908	15069	5904
6074	15103	6070
6075	15103	6071
6076	15103	6072
6077	15103	6073
6078	15103	6074
6244	15137	6240
6245	15137	6241
6246	15137	6242
6247	15137	6243
6248	15137	6244
6414	15171	6410
6416	15171	6412
6418	15171	6414
6420	15171	6416
6421	15171	6418
6584	15205	6580
6585	15205	6581
6586	15205	6582
6588	15205	6584
6591	15205	6587
6753	15239	6749
6755	15239	6751
6756	15239	6752
6757	15239	6753
6759	15239	6755
6921	15273	6917
6923	15273	6919
6925	15273	6921
6927	15273	6923
6928	15273	6924
7092	15307	7088
7094	15307	7090
7096	15307	7092
7097	15307	7093
7098	15307	7094
7260	15340	7255
7263	15340	7259
7266	15340	7262
7269	15340	7265
7271	15340	7268
7434	15375	7430
7435	15375	7431
7436	15375	7432
7437	15375	7433
7438	15375	7434
7600	15408	7596
7602	15408	7598
7604	15408	7600
7607	15408	7603
7608	15408	7604
7768	15443	7764
7769	15443	7765
7770	15443	7766
7771	15443	7767
7972	15494	7968
5277	14934	5273
5278	14934	5274
5279	14934	5275
5280	14934	5276
5181	14913	5177
5182	14913	5178
5183	14913	5179
5184	14913	5180
5185	14913	5181
5429	14968	5425
5430	14968	5426
5431	14968	5427
5432	14968	5428
5572	15002	5568
5573	15002	5569
5574	15002	5570
5575	15002	5571
5576	15002	5572
5739	15036	5735
5740	15036	5736
5741	15036	5737
5742	15036	5738
5743	15036	5739
5909	15070	5905
5910	15070	5906
5911	15070	5907
5912	15070	5908
5913	15070	5909
6079	15104	6075
6080	15104	6076
6081	15104	6077
6082	15104	6078
6083	15104	6079
6249	15138	6245
6250	15138	6246
6251	15138	6247
6252	15138	6248
6253	15138	6249
6415	15172	6411
6417	15172	6413
6419	15172	6415
6422	15172	6417
6423	15172	6419
6587	15206	6583
6589	15206	6585
6592	15206	6588
6593	15206	6590
6595	15206	6591
6758	15240	6754
6760	15240	6756
6761	15240	6757
6762	15240	6758
6763	15240	6759
6929	15274	6925
6930	15274	6926
6931	15274	6927
6932	15274	6928
6933	15274	6929
7099	15308	7095
7100	15308	7096
7101	15308	7097
7102	15308	7098
7103	15308	7099
7261	15342	7257
7264	15342	7260
7267	15342	7263
7270	15342	7266
7273	15342	7269
7439	15376	7435
7440	15376	7436
7441	15376	7437
7442	15376	7438
7443	15376	7439
7609	15410	7605
7610	15410	7606
7611	15410	7607
7612	15410	7608
7613	15410	7609
7772	15444	7768
7773	15444	7769
7774	15444	7770
7775	15444	7771
7973	15495	7969
5281	14935	5277
5282	14935	5278
5283	14935	5279
5284	14935	5280
5186	14914	5182
5187	14914	5183
5188	14914	5184
5189	14914	5185
5190	14914	5186
5433	14969	5429
5434	14969	5430
5435	14969	5431
5436	14969	5432
5437	14969	5433
5577	15003	5573
5578	15003	5574
5579	15003	5575
5580	15003	5576
5581	15003	5577
5744	15037	5740
5746	15037	5742
5748	15037	5744
5750	15037	5746
5753	15037	5748
5914	15071	5910
5915	15071	5911
5916	15071	5912
5918	15071	5914
5920	15071	5916
6084	15105	6080
6085	15105	6081
6086	15105	6082
6087	15105	6083
6088	15105	6084
6254	15139	6250
6255	15139	6251
6256	15139	6253
6258	15139	6254
6260	15139	6256
6424	15173	6420
6425	15173	6421
6426	15173	6422
6427	15173	6423
6428	15173	6424
6590	15207	6586
6594	15207	6589
6596	15207	6592
6597	15207	6593
6598	15207	6594
6764	15241	6760
6765	15241	6761
6766	15241	6762
6767	15241	6763
6768	15241	6765
6934	15275	6930
6935	15275	6931
6936	15275	6932
6937	15275	6933
6938	15275	6934
7104	15309	7100
7105	15309	7101
7106	15309	7102
7107	15309	7103
7109	15309	7105
7274	15343	7270
7276	15343	7271
7279	15343	7274
7281	15343	7277
7283	15343	7279
7444	15377	7440
7445	15377	7441
7446	15377	7442
7447	15377	7443
7450	15377	7446
7614	15411	7610
7615	15411	7611
7616	15411	7613
7618	15411	7614
7620	15411	7616
7776	15445	7772
7777	15445	7773
7778	15445	7774
7779	15445	7775
7780	15445	7776
7974	15496	7970
5285	14936	5281
5286	14936	5282
5287	14936	5283
5288	14936	5284
5191	14915	5187
5192	14915	5188
5193	14915	5189
5194	14915	5190
5195	14915	5191
5438	14970	5434
5439	14970	5435
5440	14970	5436
5441	14970	5437
5582	15004	5578
5583	15004	5579
5584	15004	5580
5585	15004	5581
5586	15004	5582
5745	15038	5741
5747	15038	5743
5749	15038	5745
5751	15038	5747
5752	15038	5749
5917	15072	5913
5919	15072	5915
5921	15072	5917
5922	15072	5918
5923	15072	5919
6089	15106	6085
6090	15106	6086
6091	15106	6087
6092	15106	6088
6093	15106	6089
6257	15140	6252
6261	15140	6257
6263	15140	6259
6265	15140	6261
6267	15140	6263
6429	15174	6425
6430	15174	6426
6431	15174	6427
6432	15174	6428
6433	15174	6429
6599	15208	6595
6600	15208	6596
6601	15208	6597
6602	15208	6598
6603	15208	6599
6769	15242	6764
6771	15242	6768
6774	15242	6770
6776	15242	6772
6778	15242	6774
6939	15277	6936
6942	15277	6937
6945	15277	6940
6946	15277	6943
6948	15277	6944
7108	15310	7104
7110	15310	7106
7111	15310	7107
7113	15310	7109
7115	15310	7111
7275	15344	7272
7277	15344	7273
7278	15344	7275
7280	15344	7276
7282	15344	7278
7448	15378	7444
7449	15378	7445
7451	15378	7447
7452	15378	7448
7453	15378	7449
7617	15412	7612
7619	15412	7615
7621	15412	7617
7622	15412	7618
7623	15412	7619
7781	15446	7777
7782	15446	7778
7783	15446	7779
7784	15446	7780
7785	15446	7781
7975	15497	7971
5196	14916	5192
5197	14916	5193
5198	14916	5194
5199	14916	5195
5200	14916	5196
5289	14937	5285
5290	14937	5286
5291	14937	5287
5292	14937	5288
5442	14971	5438
5443	14971	5439
5444	14971	5440
5445	14971	5441
5587	15005	5583
5588	15005	5584
5589	15005	5585
5590	15005	5586
5591	15005	5587
5754	15039	5750
5755	15039	5751
5756	15039	5752
5757	15039	5754
5759	15039	5755
5924	15073	5920
5925	15073	5921
5926	15073	5922
5927	15073	5923
5928	15073	5924
6094	15107	6090
6095	15107	6091
6096	15107	6092
6097	15107	6093
6098	15107	6094
6259	15141	6255
6262	15141	6258
6264	15141	6260
6266	15141	6262
6268	15141	6264
6434	15175	6430
6435	15175	6431
6436	15175	6432
6437	15175	6433
6438	15175	6434
6604	15209	6600
6605	15209	6601
6606	15209	6602
6608	15209	6604
6611	15209	6606
6770	15243	6766
6772	15243	6767
6773	15243	6769
6775	15243	6771
6777	15243	6773
6940	15276	6935
6941	15276	6938
6943	15276	6939
6944	15276	6941
6947	15276	6942
7112	15311	7108
7114	15311	7110
7116	15311	7112
7117	15311	7113
7118	15311	7114
7284	15345	7280
7285	15345	7281
7286	15345	7282
7287	15345	7283
7288	15345	7284
7454	15379	7450
7455	15379	7451
7456	15379	7452
7457	15379	7453
7458	15379	7454
7624	15413	7620
7625	15413	7621
7626	15413	7622
7627	15413	7623
7628	15413	7624
7786	15447	7782
7787	15447	7783
7788	15447	7784
7789	15447	7785
7976	15498	7972
5293	14938	5289
5201	14917	5197
5202	14917	5198
5203	14917	5199
5204	14917	5200
5205	14917	5201
5294	14938	5290
5295	14938	5291
5296	14938	5292
5297	14938	5293
5446	14972	5442
5448	14972	5444
5450	14972	5446
5452	14972	5448
5592	15006	5588
5593	15006	5589
5594	15006	5590
5595	15006	5591
5596	15006	5592
5758	15040	5753
5760	15040	5756
5762	15040	5758
5763	15040	5759
5766	15040	5762
5929	15074	5926
5931	15074	5927
5933	15074	5929
5935	15074	5931
5937	15074	5933
6099	15108	6095
6100	15108	6096
6101	15108	6097
6102	15108	6098
6103	15108	6099
6269	15142	6265
6270	15142	6267
6272	15142	6268
6274	15142	6270
6276	15142	6273
6439	15176	6435
6440	15176	6436
6441	15176	6437
6442	15176	6438
6443	15176	6440
6607	15210	6603
6609	15210	6605
6610	15210	6607
6612	15210	6608
6613	15210	6609
6779	15244	6775
6780	15244	6777
6782	15244	6778
6785	15244	6780
6790	15244	6785
6949	15278	6945
6950	15278	6946
6951	15278	6947
6952	15278	6948
6953	15278	6949
7119	15312	7115
7120	15312	7116
7121	15312	7117
7122	15312	7118
7123	15312	7119
7289	15346	7285
7290	15346	7286
7291	15346	7287
7292	15346	7288
7293	15346	7289
7459	15380	7455
7462	15380	7457
7464	15380	7460
7466	15380	7462
7468	15380	7464
7629	15415	7626
7631	15415	7627
7633	15415	7629
7634	15415	7630
7636	15415	7632
7790	15448	7786
7791	15448	7787
7792	15448	7788
7793	15448	7789
7794	15448	7790
7977	15499	7973
5298	14939	5294
5206	14918	5202
5207	14918	5203
5208	14918	5204
5299	14939	5295
5300	14939	5296
5301	14939	5297
5447	14973	5443
5449	14973	5445
5451	14973	5447
5453	14973	5449
5597	15007	5593
5598	15007	5594
5599	15007	5595
5600	15007	5596
5601	15007	5597
5761	15041	5757
5764	15041	5760
5765	15041	5761
5767	15041	5763
5768	15041	5764
5930	15075	5925
5932	15075	5928
5934	15075	5930
5936	15075	5932
5938	15075	5934
6104	15109	6100
6105	15109	6101
6106	15109	6102
6107	15109	6103
6108	15109	6104
6271	15143	6266
6273	15143	6269
6277	15143	6272
6279	15143	6275
6281	15143	6277
6444	15177	6439
6445	15177	6441
6446	15177	6442
6447	15177	6443
6448	15177	6444
6614	15211	6610
6615	15211	6611
6616	15211	6612
6617	15211	6613
6618	15211	6614
6781	15245	6776
6783	15245	6779
6784	15245	6781
6787	15245	6783
6789	15245	6786
6954	15279	6950
6955	15279	6951
6956	15279	6952
6957	15279	6953
6958	15279	6954
7124	15313	7120
7125	15313	7121
7126	15313	7122
7129	15313	7124
7132	15313	7127
7294	15347	7290
7295	15347	7291
7296	15347	7292
7298	15347	7294
7300	15347	7296
7460	15381	7456
7461	15381	7458
7463	15381	7459
7465	15381	7461
7467	15381	7463
7630	15414	7625
7632	15414	7628
7635	15414	7631
7637	15414	7633
7638	15414	7634
7795	15449	7791
7796	15449	7792
7797	15449	7793
7798	15449	7794
7799	15449	7795
7978	15500	7974
5302	14940	5298
5303	14940	5299
5304	14940	5300
5305	14940	5301
5209	14919	5205
5210	14919	5206
5211	14919	5207
5212	14919	5208
5306	14940	5302
5454	14974	5450
5455	14974	5451
5456	14974	5452
5457	14974	5453
5602	15008	5598
5603	15008	5599
5604	15008	5600
5605	15008	5601
5769	15042	5765
5770	15042	5766
5771	15042	5767
5772	15042	5768
5773	15042	5769
5939	15076	5935
5940	15076	5936
5941	15076	5937
5942	15076	5938
5943	15076	5939
6109	15110	6105
6110	15110	6106
6111	15110	6107
6112	15110	6108
6113	15110	6109
6275	15144	6271
6278	15144	6274
6280	15144	6276
6282	15144	6278
6283	15144	6279
6449	15178	6445
6450	15178	6446
6451	15178	6447
6452	15178	6448
6453	15178	6449
6619	15212	6615
6621	15212	6617
6623	15212	6619
6625	15212	6621
6626	15212	6623
6786	15246	6782
6788	15246	6784
6791	15246	6787
6792	15246	6788
6793	15246	6789
6959	15280	6955
6960	15280	6956
6961	15280	6957
6962	15280	6958
6963	15280	6959
7127	15314	7123
7128	15314	7125
7130	15314	7126
7131	15314	7128
7133	15314	7129
7297	15348	7293
7299	15348	7295
7301	15348	7297
7302	15348	7298
7303	15348	7299
7469	15382	7465
7470	15382	7466
7471	15382	7467
7472	15382	7468
7473	15382	7469
7639	15416	7635
7640	15416	7636
7641	15416	7637
7642	15416	7638
7643	15416	7639
7800	15450	7796
7801	15450	7797
7802	15450	7798
7803	15450	7799
7804	15450	7800
7979	15501	7975
7980	15501	7976
5307	14941	5303
5308	14941	5304
5309	14941	5305
5310	14941	5306
5311	14941	5307
5458	14975	5454
5459	14975	5455
5460	14975	5456
5461	14975	5458
5606	15009	5602
5607	15009	5603
5608	15009	5604
5609	15009	5605
5774	15043	5770
5775	15043	5771
5776	15043	5772
5778	15043	5774
5780	15043	5776
5944	15077	5940
5945	15077	5941
5947	15077	5943
5949	15077	5945
5951	15077	5947
6114	15112	6110
6116	15112	6112
6119	15112	6114
6121	15112	6117
6123	15112	6119
6284	15145	6280
6285	15145	6281
6286	15145	6282
6287	15145	6283
6288	15145	6284
6454	15179	6450
6455	15179	6451
6456	15179	6452
6457	15179	6453
6458	15179	6454
6620	15213	6616
6622	15213	6618
6624	15213	6620
6627	15213	6622
6628	15213	6624
6794	15247	6790
6796	15247	6792
6798	15247	6794
6799	15247	6796
6801	15247	6797
6964	15282	6961
6966	15282	6962
6967	15282	6964
6970	15282	6965
6972	15282	6968
7134	15315	7130
7135	15315	7131
7136	15315	7132
7137	15315	7133
7138	15315	7134
7304	15349	7300
7305	15349	7301
7306	15349	7302
7307	15349	7303
7308	15349	7304
7474	15383	7470
7477	15383	7473
7479	15383	7475
7481	15383	7477
7482	15383	7478
7644	15417	7640
7645	15417	7641
7646	15417	7642
7647	15417	7643
7649	15417	7644
7805	15451	7801
7806	15451	7802
7807	15451	7803
7808	15451	7804
7809	15451	7805
7981	15502	7977
7982	15502	7978
5312	14942	5308
5313	14942	5309
5314	14942	5310
5315	14942	5311
5316	14942	5312
5462	14976	5457
5464	14976	5460
5466	14976	5462
5468	14976	5464
5610	15010	5606
5611	15010	5607
5612	15010	5608
5613	15010	5609
5777	15044	5773
5779	15044	5775
5781	15044	5777
5782	15044	5778
5783	15044	5779
5946	15078	5942
5948	15078	5944
5950	15078	5946
5952	15078	5948
5953	15078	5949
6115	15111	6111
6117	15111	6113
6118	15111	6115
6120	15111	6116
6122	15111	6118
6289	15146	6285
6290	15146	6286
6292	15146	6288
6294	15146	6290
6296	15146	6292
6459	15180	6455
6460	15180	6456
6461	15180	6457
6462	15180	6458
6463	15180	6459
6629	15214	6625
6630	15214	6626
6631	15214	6627
6632	15214	6628
6633	15214	6629
6795	15248	6791
6797	15248	6793
6800	15248	6795
6802	15248	6798
6804	15248	6800
6965	15281	6960
6968	15281	6963
6969	15281	6966
6971	15281	6967
6973	15281	6969
7139	15316	7135
7140	15316	7136
7142	15316	7138
7143	15316	7140
7145	15316	7141
7309	15350	7305
7310	15350	7306
7311	15350	7307
7312	15350	7308
7313	15350	7309
7475	15384	7471
7476	15384	7472
7478	15384	7474
7480	15384	7476
7483	15384	7479
7648	15418	7645
7650	15418	7646
7651	15418	7647
7652	15418	7648
7653	15418	7649
7810	15452	7806
7811	15452	7807
7812	15452	7808
7813	15452	7809
7814	15452	7810
7983	15503	7979
7984	15503	7980
5317	14943	5313
5318	14943	5314
5319	14943	5315
5320	14943	5316
5463	14977	5459
5465	14977	5461
5467	14977	5463
5469	14977	5465
5614	15011	5610
5615	15011	5611
5616	15011	5612
5617	15011	5613
5618	15011	5614
5784	15045	5780
5785	15045	5781
5786	15045	5782
5787	15045	5783
5788	15045	5784
5954	15079	5950
5955	15079	5951
5956	15079	5952
5957	15079	5953
5958	15079	5954
6124	15113	6120
6125	15113	6121
6126	15113	6122
6129	15113	6124
6131	15113	6127
6291	15147	6287
6293	15147	6289
6295	15147	6291
6297	15147	6293
6298	15147	6294
6464	15181	6460
6465	15181	6461
6466	15181	6462
6467	15181	6463
6468	15181	6464
6634	15215	6630
6635	15215	6631
6636	15215	6632
6637	15215	6633
6638	15215	6634
6803	15249	6799
6805	15249	6801
6806	15249	6802
6807	15249	6803
6808	15249	6804
6974	15283	6970
6975	15283	6971
6976	15283	6972
6977	15283	6973
6978	15283	6974
7141	15317	7137
7144	15317	7139
7146	15317	7142
7147	15317	7143
7148	15317	7144
7314	15351	7310
7315	15351	7311
7316	15351	7312
7317	15351	7313
7318	15351	7314
7484	15385	7480
7485	15385	7481
7486	15385	7482
7487	15385	7483
7488	15385	7484
7654	15419	7650
7655	15419	7651
7656	15419	7652
7657	15419	7653
7658	15419	7654
7815	15453	7811
7816	15453	7812
7817	15453	7813
7818	15453	7814
7819	15453	7815
7985	15504	7981
5321	14944	5317
5322	14944	5318
5323	14944	5319
5324	14944	5320
5470	14978	5466
5471	14978	5467
5472	14978	5468
5473	14978	5469
5619	15012	5615
5620	15012	5616
5621	15012	5617
5622	15012	5618
5623	15012	5619
5789	15046	5785
5790	15046	5786
5791	15046	5787
5792	15046	5788
5793	15046	5789
5959	15080	5955
5960	15080	5956
5961	15080	5958
5963	15080	5959
5964	15080	5961
6127	15114	6123
6130	15114	6126
6133	15114	6129
6135	15114	6131
6136	15114	6133
6299	15148	6295
6300	15148	6296
6301	15148	6297
6302	15148	6298
6303	15148	6299
6469	15182	6465
6470	15182	6466
6472	15182	6468
6474	15182	6469
6476	15182	6472
6639	15216	6635
6640	15216	6636
6641	15216	6637
6642	15216	6638
6643	15216	6639
6809	15250	6805
6810	15250	6807
6812	15250	6808
6814	15250	6810
6816	15250	6812
6979	15284	6975
6980	15284	6976
6981	15284	6977
6982	15284	6978
6983	15284	6979
7149	15318	7145
7150	15318	7146
7151	15318	7147
7152	15318	7148
7153	15318	7149
7319	15352	7315
7320	15352	7316
7321	15352	7317
7322	15352	7318
7323	15352	7319
7489	15386	7485
7491	15386	7487
7493	15386	7489
7496	15386	7491
7498	15386	7494
7659	15421	7656
7662	15421	7657
7664	15421	7660
7666	15421	7662
7668	15421	7664
7820	15454	7816
7821	15454	7817
7822	15454	7818
7823	15454	7819
7824	15454	7820
7986	15505	7982
7987	15505	7983
5325	14945	5321
5326	14945	5322
5327	14945	5323
5328	14945	5324
5474	14979	5470
5475	14979	5471
5476	14979	5472
5477	14979	5473
5624	15013	5620
5625	15013	5621
5626	15013	5622
5627	15013	5623
5628	15013	5624
5794	15047	5790
5795	15047	5791
5796	15047	5792
5798	15047	5794
5802	15047	5798
5962	15081	5957
5965	15081	5960
5966	15081	5962
5967	15081	5963
5968	15081	5964
6128	15115	6125
6132	15115	6128
6134	15115	6130
6137	15115	6132
6138	15115	6134
6304	15150	6300
6306	15150	6302
6308	15150	6304
6310	15150	6306
6312	15150	6308
6471	15183	6467
6473	15183	6470
6475	15183	6471
6477	15183	6473
6478	15183	6474
6644	15217	6640
6645	15217	6641
6646	15217	6642
6647	15217	6643
6648	15217	6645
6811	15251	6806
6813	15251	6809
6815	15251	6811
6817	15251	6813
6819	15251	6815
6984	15285	6980
6985	15285	6981
6986	15285	6982
6987	15285	6983
6988	15285	6984
7154	15319	7150
7155	15319	7151
7156	15319	7152
7157	15319	7153
7158	15319	7154
7324	15353	7320
7325	15353	7321
7326	15353	7322
7327	15353	7323
7328	15353	7324
7490	15387	7486
7492	15387	7488
7494	15387	7490
7495	15387	7492
7497	15387	7493
7660	15420	7655
7661	15420	7658
7663	15420	7659
7665	15420	7661
7667	15420	7663
7825	15455	7821
7826	15455	7822
7827	15455	7823
7828	15455	7824
7829	15455	7825
7988	15506	7984
7989	15506	7985
5329	14946	5325
5330	14946	5326
5331	14946	5327
5332	14946	5328
5478	14980	5474
5479	14980	5475
5480	14980	5476
5481	14980	5477
5629	15014	5625
5630	15014	5626
5631	15014	5627
5632	15014	5628
5633	15014	5629
5797	15048	5793
5800	15048	5796
5803	15048	5799
5805	15048	5801
5807	15048	5803
5969	15082	5965
5971	15082	5967
5974	15082	5969
5977	15082	5973
5981	15082	5977
6139	15116	6135
6140	15116	6136
6141	15116	6137
6142	15116	6138
6143	15116	6139
6305	15149	6301
6307	15149	6303
6309	15149	6305
6311	15149	6307
6313	15149	6309
6479	15185	6475
6481	15185	6477
6483	15185	6479
6486	15185	6481
6488	15185	6484
6649	15218	6644
6650	15218	6646
6651	15218	6647
6652	15218	6648
6653	15218	6649
6818	15252	6814
6820	15252	6816
6821	15252	6817
6822	15252	6818
6823	15252	6819
6989	15286	6985
6990	15286	6986
6991	15286	6987
6992	15286	6988
6993	15286	6989
7159	15320	7155
7160	15320	7156
7161	15320	7157
7162	15320	7158
7163	15320	7159
7329	15354	7325
7330	15354	7326
7331	15354	7327
7332	15354	7328
7333	15354	7329
7499	15388	7495
7500	15388	7496
7501	15388	7497
7502	15388	7498
7503	15388	7499
7669	15422	7665
7670	15422	7666
7671	15422	7667
7672	15422	7668
7673	15422	7669
7830	15456	7826
7831	15456	7827
7832	15456	7828
7833	15456	7829
7834	15456	7830
7990	15507	7986
7991	15507	7987
5333	14947	5329
5334	14947	5331
5336	14947	5332
5337	14947	5334
5482	14981	5478
5483	14981	5479
5484	14981	5480
5485	14981	5481
5634	15015	5630
5635	15015	5631
5636	15015	5632
5637	15015	5633
5638	15015	5634
5799	15049	5795
5801	15049	5797
5804	15049	5800
5806	15049	5802
5808	15049	5804
5970	15083	5966
5972	15083	5968
5973	15083	5970
5976	15083	5972
5979	15083	5975
6144	15117	6140
6145	15117	6142
6147	15117	6143
6149	15117	6145
6152	15117	6147
6314	15151	6310
6315	15151	6311
6316	15151	6312
6317	15151	6313
6318	15151	6314
6480	15184	6476
6482	15184	6478
6484	15184	6480
6485	15184	6482
6487	15184	6483
6654	15219	6650
6655	15219	6651
6656	15219	6652
6657	15219	6653
6658	15219	6654
6824	15253	6820
6825	15253	6821
6826	15253	6822
6827	15253	6823
6828	15253	6824
6994	15287	6990
6995	15287	6991
6996	15287	6992
6997	15287	6993
6998	15287	6994
7164	15321	7160
7165	15321	7161
7166	15321	7162
7167	15321	7163
7168	15321	7164
7334	15355	7330
7335	15355	7331
7338	15355	7333
7340	15355	7335
7342	15355	7338
7504	15389	7500
7505	15389	7501
7506	15389	7502
7508	15389	7504
7509	15389	7505
7674	15423	7670
7675	15423	7671
7676	15423	7672
7677	15423	7673
7678	15423	7674
7835	15457	7831
7836	15457	7832
7837	15457	7833
7838	15457	7834
7839	15457	7835
7992	15508	7988
5335	14948	5330
5338	14948	5333
5340	14948	5336
5342	14948	5338
5486	14982	5482
5487	14982	5483
5488	14982	5484
5489	14982	5485
5490	14982	5486
5639	15016	5635
5640	15016	5636
5641	15016	5637
5642	15016	5638
5643	15016	5639
5809	15050	5805
5810	15050	5806
5811	15050	5807
5812	15050	5809
5813	15050	5810
5975	15084	5971
5978	15084	5974
5980	15084	5976
5982	15084	5978
5983	15084	5979
6146	15118	6141
6150	15118	6146
6153	15118	6149
6155	15118	6151
6157	15118	6153
6319	15152	6315
6321	15152	6317
6323	15152	6319
6325	15152	6321
6328	15152	6324
6489	15186	6485
6490	15186	6486
6491	15186	6487
6492	15186	6488
6493	15186	6489
6659	15220	6655
6661	15220	6657
6663	15220	6659
6665	15220	6661
6667	15220	6663
6829	15254	6825
6831	15254	6827
6833	15254	6829
6835	15254	6831
6837	15254	6833
6999	15288	6995
7000	15288	6996
7001	15288	6997
7002	15288	6998
7003	15288	6999
7169	15322	7165
7170	15322	7166
7171	15322	7167
7172	15322	7168
7173	15322	7169
7336	15356	7332
7337	15356	7334
7339	15356	7336
7341	15356	7337
7343	15356	7339
7507	15390	7503
7510	15390	7506
7511	15390	7507
7512	15390	7508
7513	15390	7509
7679	15424	7675
7682	15424	7677
7684	15424	7680
7686	15424	7682
7688	15424	7684
7840	15458	7836
7841	15458	7837
7842	15458	7838
7843	15458	7839
7993	15509	7989
5339	14949	5335
5341	14949	5337
5343	14949	5339
5344	14949	5340
5491	14983	5487
5492	14983	5488
5493	14983	5489
5494	14983	5490
5644	15017	5640
5645	15017	5641
5646	15017	5642
5647	15017	5643
5648	15017	5644
5814	15051	5808
5815	15051	5811
5816	15051	5812
5817	15051	5813
5819	15051	5815
5984	15085	5980
5985	15085	5981
5986	15085	5984
5989	15085	5985
5991	15085	5988
6148	15119	6144
6151	15119	6148
6154	15119	6150
6156	15119	6152
6158	15119	6154
6320	15153	6316
6322	15153	6318
6324	15153	6320
6326	15153	6322
6329	15153	6326
6494	15187	6490
6495	15187	6491
6496	15187	6492
6497	15187	6493
6498	15187	6494
6660	15221	6656
6662	15221	6658
6664	15221	6660
6666	15221	6662
6669	15221	6664
6830	15255	6826
6832	15255	6828
6834	15255	6830
6836	15255	6832
6838	15255	6834
7004	15289	7000
7005	15289	7001
7006	15289	7002
7007	15289	7003
7008	15289	7004
7174	15323	7170
7175	15323	7171
7176	15323	7172
7177	15323	7173
7178	15323	7174
7344	15357	7340
7346	15357	7342
7348	15357	7344
7350	15357	7346
7352	15357	7348
7514	15391	7510
7515	15391	7511
7516	15391	7512
7517	15391	7513
7518	15391	7514
7680	15425	7676
7681	15425	7678
7683	15425	7679
7685	15425	7681
7687	15425	7683
7844	15459	7840
7845	15459	7841
7846	15459	7842
7847	15459	7843
7848	15459	7844
7994	15510	7990
5102	14895	5098
5345	14950	5341
5346	14950	5342
5347	14950	5343
5348	14950	5344
5495	14984	5491
5496	14984	5492
5497	14984	5493
5498	14984	5494
5499	14984	5495
5649	15018	5645
5650	15018	5646
5651	15018	5647
5652	15018	5648
5653	15018	5649
5818	15052	5814
5820	15052	5816
5821	15052	5817
5822	15052	5818
5823	15052	5819
5987	15086	5983
5990	15086	5986
5993	15086	5989
5994	15086	5990
5996	15086	5992
6159	15120	6155
6160	15120	6156
6161	15120	6157
6162	15120	6158
6163	15120	6159
6327	15154	6323
6330	15154	6325
6331	15154	6327
6332	15154	6328
6333	15154	6329
6499	15188	6495
6500	15188	6496
6501	15188	6497
6502	15188	6498
6504	15188	6500
6668	15222	6665
6670	15222	6666
6671	15222	6667
6672	15222	6668
6673	15222	6669
6839	15256	6835
6841	15256	6837
6843	15256	6839
6845	15256	6841
6847	15256	6843
7009	15290	7005
7010	15290	7006
7011	15290	7007
7013	15290	7009
7016	15290	7011
7179	15324	7175
7180	15324	7176
7181	15324	7177
7182	15324	7178
7183	15324	7179
7345	15358	7341
7347	15358	7343
7349	15358	7345
7351	15358	7347
7353	15358	7349
7519	15392	7515
7520	15392	7516
7521	15392	7517
7522	15392	7518
7523	15392	7519
7689	15426	7685
7690	15426	7686
7691	15426	7687
7693	15426	7689
7695	15426	7691
7849	15460	7845
7850	15460	7846
7851	15460	7847
7852	15460	7848
7853	15460	7849
7995	15511	7991
7996	15511	7992
5103	14896	5099
5349	14951	5345
5350	14951	5346
5351	14951	5347
5352	14951	5348
5500	14985	5496
5501	14985	5497
5502	14985	5498
5503	14985	5499
5504	14985	5500
5654	15019	5650
5655	15019	5651
5656	15019	5652
5657	15019	5653
5658	15019	5654
5824	15053	5820
5825	15053	5821
5826	15053	5822
5827	15053	5823
5828	15053	5824
5988	15087	5982
5992	15087	5987
5995	15087	5991
5997	15087	5993
5998	15087	5994
6164	15121	6160
6165	15121	6161
6167	15121	6164
6171	15121	6167
6174	15121	6170
6334	15155	6330
6335	15155	6331
6336	15155	6332
6337	15155	6333
6339	15155	6335
6503	15189	6499
6505	15189	6501
6506	15189	6502
6507	15189	6503
6508	15189	6504
6674	15223	6670
6675	15223	6671
6676	15223	6672
6677	15223	6673
6678	15223	6675
6840	15257	6836
6842	15257	6838
6844	15257	6840
6846	15257	6842
6848	15257	6844
7012	15291	7008
7014	15291	7010
7015	15291	7012
7017	15291	7013
7018	15291	7014
7184	15326	7181
7185	15326	7182
7186	15326	7183
7188	15326	7184
7189	15326	7185
7354	15359	7350
7355	15359	7351
7356	15359	7352
7357	15359	7353
7358	15359	7354
7524	15393	7520
7525	15393	7521
7526	15393	7522
7527	15393	7523
7528	15393	7524
7692	15427	7688
7694	15427	7690
7696	15427	7692
7697	15427	7693
7698	15427	7694
7854	15461	7850
7855	15461	7851
7856	15461	7852
7857	15461	7853
7858	15461	7854
7997	15512	7993
7998	15512	7994
5104	14897	5100
5105	14897	5101
5106	14897	5102
5107	14897	5103
5108	14897	5104
5353	14952	5349
5354	14952	5350
5355	14952	5351
5356	14952	5352
5505	14986	5501
5506	14986	5502
5507	14986	5503
5508	14986	5504
5659	15020	5655
5660	15020	5656
5661	15020	5657
5662	15020	5658
5663	15020	5659
5829	15054	5825
5830	15054	5826
5831	15054	5828
5833	15054	5829
5835	15054	5831
5999	15088	5995
6000	15088	5996
6001	15088	5997
6002	15088	5998
6003	15088	5999
6166	15122	6162
6169	15122	6165
6172	15122	6168
6175	15122	6171
6177	15122	6173
6338	15156	6334
6340	15156	6336
6341	15156	6337
6342	15156	6338
6344	15156	6340
6509	15190	6505
6510	15190	6507
6512	15190	6508
6513	15190	6510
6515	15190	6511
6679	15224	6674
6680	15224	6676
6681	15224	6677
6682	15224	6678
6683	15224	6679
6849	15258	6845
6851	15258	6847
6853	15258	6849
6855	15258	6851
6857	15258	6853
7019	15292	7015
7020	15292	7016
7021	15292	7017
7022	15292	7018
7023	15292	7019
7187	15325	7180
7190	15325	7186
7191	15325	7187
7192	15325	7188
7193	15325	7189
7359	15360	7355
7360	15360	7356
7361	15360	7357
7363	15360	7359
7367	15360	7361
7529	15394	7525
7531	15394	7528
7534	15394	7529
7537	15394	7532
7538	15394	7534
7699	15428	7695
7700	15428	7696
7701	15428	7697
7702	15428	7698
7703	15428	7699
7859	15462	7855
7860	15462	7856
7861	15462	7857
7862	15462	7858
7999	15513	7995
5109	14898	5105
5110	14898	5106
5111	14898	5107
5112	14898	5108
5113	14898	5109
5357	14953	5353
5358	14953	5354
5359	14953	5355
5360	14953	5356
5361	14953	5357
5509	14987	5505
5510	14987	5506
5511	14987	5507
5512	14987	5508
5664	15021	5660
5665	15021	5661
5666	15021	5662
5667	15021	5663
5668	15021	5664
5832	15055	5827
5834	15055	5830
5836	15055	5832
5837	15055	5833
5838	15055	5834
6004	15090	6001
6006	15090	6002
6008	15090	6004
6010	15090	6006
6012	15090	6008
6168	15123	6163
6170	15123	6166
6173	15123	6169
6176	15123	6172
6178	15123	6174
6343	15157	6339
6345	15157	6341
6346	15157	6342
6347	15157	6343
6348	15157	6344
6511	15191	6506
6514	15191	6509
6517	15191	6512
6518	15191	6514
6519	15191	6516
6684	15225	6680
6685	15225	6681
6686	15225	6682
6687	15225	6684
6689	15225	6685
6850	15259	6846
6852	15259	6848
6854	15259	6850
6856	15259	6852
6858	15259	6854
7024	15293	7020
7025	15293	7021
7026	15293	7022
7027	15293	7023
7029	15293	7025
7194	15327	7190
7195	15327	7191
7196	15327	7192
7197	15327	7193
7198	15327	7194
7362	15361	7358
4982	14856	4978
4983	14856	4979
4984	14856	4980
4985	14856	4981
4986	14856	4982
7364	15361	7360
7365	15361	7362
7366	15361	7363
7368	15361	7364
7530	15395	7526
7532	15395	7527
7533	15395	7530
7535	15395	7531
7536	15395	7533
7704	15429	7700
7705	15429	7701
7706	15429	7702
7707	15429	7703
7863	15463	7859
7864	15463	7860
7865	15463	7861
7866	15463	7862
7867	15463	7863
8000	15514	7996
8001	15514	7997
\.


--
-- Data for Name: api_parameter; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_parameter (id, name, type, phenomenon_id, element, i18n_tag, mandatory) FROM stdin;
31	Type of microform	str	3	select	g4d-pa-type-of microfo	t
32	Type of mesoform	str	4	select	g4d-pa-type-of mesofo	t
33	Length	int	3	input	g4d-pa-length	f
34	Depth	int	3	input	g4d-pa-depth	f
35	Width	int	3	input	g4d-pa-widt	f
36	Description of microform	str	3	input	g4d-pa-description-of microfo	f
37	Length	int	4	input	g4d-pa-lengt	f
38	Height	int	4	input	g4d-pa-heig	f
39	Width	int	4	input	g4d-pa-width	f
40	Description of mesoform	str	4	input	g4d-pa-description-of mesofo	f
7	Regularity of observation	str	2	select	g4d-reg-obs	f
6	Type of mushroom	str	2	select	g4d-typ-mush	f
4	Type of location	str	1	select	g4d-typ-loc	f
3	Type of tree	str	1	select	g4d-typ-tr	f
41	Depth of waterlogging	str	5	select	g4d-pa-depth-of waterlogging	t
42	Road capacity	str	6	select	g4d-pa-road-capacity	t
2	Trunk diameter (cm)	float	1	input	g4d-pa-trunk-diameter (cm)	f
1	Tree height (cm)	float	1	input	g4d-pa-tree-height (cm)	f
\.


--
-- Data for Name: api_parameterlocalization; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_parameterlocalization (id, language, name, parameter_id) FROM stdin;
2	cs	Lokalita	4
3	cs	Druh stromu	3
4	cs	Průměr kmene	2
5	cs	Výška stromu	1
6	cs	Druh houby	6
7	cs	Pravidelnost pozorování	7
8	en	Regularity of observation	7
9	en	Type of mushroom	6
10	en	Type of location	4
11	en	Type of tree	3
40	en	Depth of waterlogging	41
41	en	Road capacity	42
43	cn	/积水深度	41
44	cn	/道路情况	42
13	en	Tree height (cm)	1
12	en	Trunk diameter (cm)	2
15	cs	Typ mikroformy	31
14	en	Type of microform	31
37	cs	Typ mezoformy	32
36	en	Type of mesoform	32
17	en	Width	35
18	en	Length	33
19	en	Depth	34
22	en	Description of microform	36
26	cs	Hloubka	34
25	cs	Délka	33
24	cs	Šířka	35
29	cs	Popis útvaru	36
39	cs	Popis útvaru	40
38	en	Description of mesoform	40
35	cs	Výška	38
34	en	Height	38
33	cs	Délka	37
32	en	Length	37
31	cs	Šířka	39
30	en	Width	39
\.


--
-- Data for Name: api_phenomenon; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_phenomenon (id, name, category_id, i18n_tag) FROM stdin;
1	Dry vegetation (trees)	1	g4d-dry-veg
2	Absence of mushrooms	1	g4d-abs-mush
5	Waterlogging	2	g4d-ph-waterlogging
6	Traffic	2	g4d-ph-traffic
4	Granite mesoforms	3	g4d-ph-granite-mesoforms
3	Granite microforms	3	g4d-ph-granite-microforms
\.


--
-- Data for Name: api_phenomenonlocalization; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_phenomenonlocalization (id, language, name, phenomenon_id) FROM stdin;
6	en	Granite microforms	3
7	cs	Žulové mikrotvary	3
8	en	Granite mesoforms	4
9	cs	Žulové mezotvary	4
2	cs	Suchá vegetace (stromy)	1
3	cs	Absence hub	2
4	en	Dry vegetation (trees)	1
5	en	Absence of mushrooms	2
10	en	Waterlogging	5
11	en	Traffic	6
12	cn	/积水收集	5
13	cn	/交通数据收集	6
\.


--
-- Data for Name: api_phenomenonparametervalue; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_phenomenonparametervalue (id, value, parameter_id, phenomenon_id) FROM stdin;
4983	Balvany	32	4
4984	10	37	4
4985	2	38	4
4986	8	39	4
4987	Ďáblova prdel	40	4
5120	Skalní mísa	31	3
5121	75	33	3
5122	12	34	3
5123	70	35	3
5124	Skalní mísa s dvěma odtokovými kanály	36	3
5285	Balvany	32	4
5286	2	37	4
5287	3	38	4
5288	3	39	4
5443	Balvany	32	4
5445	10 m	37	4
5447	2 m	38	4
5449	6 m	39	4
5602	19	33	3
5603	3	34	3
5604	13	35	3
5605	1;02	36	3
5780	Skalní mísa	31	3
5781	120	33	3
5782	17	34	3
5783	44	35	3
5784	3;8	36	3
5957	Skalní mísa	31	3
5960	120	33	3
5962	17	34	3
5963	44	35	3
5964	3;8	36	3
6140	Skalní mísa	31	3
6142	120	33	3
6143	17	34	3
6145	44	35	3
6147	3;8	36	3
6316	Skalní mísa	31	3
6318	120	33	3
6320	17	34	3
6322	44	35	3
6326	3;8	36	3
6499	Skalní mísa	31	3
6501	120	33	3
6502	17	34	3
6503	44	35	3
6504	3;8	36	3
6680	Skalní mísa	31	3
6681	120	33	3
6682	17	34	3
6684	44	35	3
6685	3;8	36	3
6856	Skalní mísa	31	3
6858	120	33	3
6861	17	34	3
6864	44	35	3
6866	3;8	36	3
7040	Skalní mísa	31	3
7041	120	33	3
7042	17	34	3
7043	44	35	3
7044	3;8	36	3
7220	Skalní mísa	31	3
7223	120	33	3
7226	17	34	3
7229	44	35	3
7232	3;8	36	3
7400	Skalní mísa	31	3
7401	120	33	3
7402	17	34	3
7403	44	35	3
7404	3;8	36	3
7580	Skalní mísa	31	3
7581	120	33	3
7582	17	34	3
7583	44	35	3
7584	3;8	36	3
7757	Skalní hradby/izolované skály	32	4
7758	11m	37	4
7759	9m	38	4
7904	city or other type of development	4	1
7905	deciduous	3	1
7906	30	2	1
7907	400	1	1
7924	city or other type of development	4	1
7925	coniferous	3	1
7926	20	2	1
7927	25	1	1
7940	More than 12cm	41	5
8002	forest stand	4	1
8003	deciduous	3	1
4988	Balvany	32	4
4989	10	37	4
4990	2	38	4
4991	8	39	4
4992	Ďáblova prdel	40	4
5125	Skalní mísa	31	3
5126	30	33	3
5127	8	34	3
5128	32	35	3
5129	Skalní mísa s odtokovým kanálem	36	3
5289	Skalní mísa	31	3
5290	161	33	3
5291	60	34	3
5292	90	35	3
5293	Rozsáhlá skalní mísa s vyvynutym odtokovým kanálem	36	3
5450	Balvany	32	4
5451	10 m	37	4
5452	2 m	38	4
5453	6 m	39	4
5606	150	33	3
5607	32	34	3
5608	100	35	3
5609	200	36	3
5785	Skalní mísa	31	3
5786	120	33	3
5787	17	34	3
5788	44	35	3
5789	3;8	36	3
5965	Skalní mísa	31	3
5967	120	33	3
5969	17	34	3
5973	44	35	3
5977	3;8	36	3
6141	Skalní mísa	31	3
6146	120	33	3
6149	17	34	3
6151	44	35	3
6153	3;8	36	3
6323	Skalní mísa	31	3
6325	120	33	3
6327	17	34	3
6328	44	35	3
6329	3;8	36	3
6505	Skalní mísa	31	3
6507	120	33	3
6508	17	34	3
6510	44	35	3
6511	3;8	36	3
6683	Skalní mísa	31	3
6687	120	33	3
6688	17	34	3
6690	44	35	3
6691	3;8	36	3
6863	Skalní mísa	31	3
6865	120	33	3
6867	17	34	3
6868	44	35	3
6869	3;8	36	3
7045	Skalní mísa	31	3
7046	120	33	3
7047	17	34	3
7048	44	35	3
7049	3;8	36	3
7221	Skalní mísa	31	3
7222	120	33	3
7225	17	34	3
7227	44	35	3
7231	3;8	36	3
7405	Skalní mísa	31	3
7406	120	33	3
7407	17	34	3
7408	44	35	3
7409	3;8	36	3
7585	Skalní mísa	31	3
7586	120	33	3
7587	17	34	3
7588	44	35	3
7589	3;8	36	3
7760	Balvany	32	4
7761	10m	37	4
7762	3m	38	4
7763	3m	39	4
7908	city or other type of development	4	1
7909	deciduous	3	1
7910	50	2	1
7911	350	1	1
7928	city or other type of development	4	1
7929	deciduous	3	1
7930	55	2	1
7931	25	1	1
7941	Congested	42	6
8004	forest stand	4	1
8005	deciduous	3	1
4993	Tafoni	31	3
4994	10	33	3
4995	10	34	3
4996	10	35	3
4997	G	36	3
5130	Skalní mísa	31	3
5131	26	33	3
5132	10	34	3
5133	35	35	3
5134	Skalní mísa s odtokovým kanálem	36	3
5294	76	33	3
5295	40	34	3
5296	51	35	3
5297	Skalní mísa s vyvynutym odtokovým kanálem	36	3
5454	Balvany	32	4
5455	10 m	37	4
5456	2 m	38	4
5458	6 m	39	4
5610	Balvany	32	4
5611	1050	37	4
5612	400	38	4
5613	300	39	4
5614	101	40	4
5790	Skalní mísa	31	3
5791	120	33	3
5792	17	34	3
5794	44	35	3
5798	3;8	36	3
5966	Skalní mísa	31	3
5968	120	33	3
5970	17	34	3
5972	44	35	3
5975	3;8	36	3
6144	Skalní mísa	31	3
6148	120	33	3
6150	17	34	3
6152	44	35	3
6154	3;8	36	3
6330	Skalní mísa	31	3
6331	120	33	3
6332	17	34	3
6333	44	35	3
6335	3;8	36	3
6506	Skalní mísa	31	3
6509	120	33	3
6512	17	34	3
6514	44	35	3
6516	3;8	36	3
6686	Skalní mísa	31	3
6689	120	33	3
6692	17	34	3
6693	44	35	3
6694	3;8	36	3
6870	Skalní mísa	31	3
6872	120	33	3
6874	17	34	3
6877	44	35	3
6879	3;8	36	3
7050	Skalní mísa	31	3
7051	120	33	3
7052	17	34	3
7053	44	35	3
7054	3;8	36	3
7224	Skalní mísa	31	3
7228	120	33	3
7230	17	34	3
7233	44	35	3
7234	3;8	36	3
7410	Skalní mísa	31	3
7411	120	33	3
7412	17	34	3
7413	44	35	3
7414	3;8	36	3
7590	Skalní mísa	31	3
7591	120	33	3
7592	17	34	3
7593	44	35	3
7594	3;8	36	3
7764	Skalní mísa	31	3
7765	75	33	3
7766	23	34	3
7767	44	35	3
7912	city or other type of development	4	1
7913	deciduous	3	1
7914	55	2	1
7915	355	1	1
7932	city or other type of development	4	1
7933	deciduous	3	1
7934	25	2	1
7935	25	1	1
7942	Congested	42	6
8006	forest stand	4	1
8007	deciduous	3	1
4998	Balvany	32	4
4999	42	37	4
5000	1	38	4
5001	1	39	4
5135	Skalní mísa	31	3
5136	40	33	3
5137	10	34	3
5138	30	35	3
5298	Skalní mísa	31	3
5299	79	33	3
5300	25	34	3
5301	64	35	3
5302	Iniciální mísa	36	3
5457	Balvany	32	4
5460	10 m	37	4
5462	2 m	38	4
5464	6 m	39	4
5615	Skalní mísa	31	3
5616	95	33	3
5617	20	34	3
5618	50	35	3
5619	4;3	36	3
5793	Skalní mísa	31	3
5796	120	33	3
5799	17	34	3
5801	44	35	3
5803	3;8	36	3
5971	Skalní mísa	31	3
5974	120	33	3
5976	17	34	3
5978	44	35	3
5979	3;8	36	3
6155	Skalní mísa	31	3
6156	120	33	3
6157	17	34	3
6158	44	35	3
6159	3;8	36	3
6334	Skalní mísa	31	3
6336	120	33	3
6337	17	34	3
6338	44	35	3
6340	3;8	36	3
6513	Skalní mísa	31	3
6515	120	33	3
6517	17	34	3
6518	44	35	3
6519	3;8	36	3
6695	Skalní mísa	31	3
6698	120	33	3
6700	17	34	3
6704	44	35	3
6707	3;8	36	3
6871	Skalní mísa	31	3
6873	120	33	3
6875	17	34	3
6878	44	35	3
6881	3;8	36	3
7055	Skalní mísa	31	3
7056	120	33	3
7057	17	34	3
7058	44	35	3
7060	3;8	36	3
7235	Skalní mísa	31	3
7236	120	33	3
7237	17	34	3
7238	44	35	3
7239	3;8	36	3
7415	Skalní mísa	31	3
7416	120	33	3
7417	17	34	3
7419	44	35	3
7421	3;8	36	3
7595	Skalní mísa	31	3
7597	120	33	3
7599	17	34	3
7601	44	35	3
7602	3;8	36	3
7768	Skalní mísa	31	3
7769	61	33	3
7770	7	34	3
7771	38	35	3
7916	rock outcrop or other extreme habitat	4	1
7917	coniferous	3	1
7918	10	2	1
7919	25	1	1
7936	city or other type of development	4	1
7937	coniferous	3	1
7938	20	2	1
7939	20	1	1
7943	city or other type of development	4	1
7944	deciduous	3	1
7945	50	2	1
7946	15	1	1
8008	forest stand	4	1
5002	Skalní hradby/izolované skály	32	4
5003	42	37	4
5004	1	38	4
5005	2	39	4
5139	Skalní mísa	31	3
5140	28	33	3
5141	8	34	3
5142	35	35	3
5143	Skalní mísa s odtokovým kanálem	36	3
5303	Skalní mísa	31	3
5304	60	33	3
5305	14	34	3
5306	32	35	3
5307	Skalní mísa s vyvynutym odtokovým kanálem	36	3
5459	Balvany	32	4
5461	10 m	37	4
5463	2 m	38	4
5465	6 m	39	4
5620	Skalní mísa	31	3
5621	28	33	3
5622	6	34	3
5623	25	35	3
5624	4;4	36	3
5795	Skalní mísa	31	3
5797	120	33	3
5800	17	34	3
5802	44	35	3
5804	3;8	36	3
5980	Skalní mísa	31	3
5981	120	33	3
5984	17	34	3
5985	44	35	3
5988	3;8	36	3
6160	Skalní mísa	31	3
6161	120	33	3
6164	17	34	3
6167	44	35	3
6170	3;8	36	3
6339	Skalní mísa	31	3
6341	120	33	3
6342	17	34	3
6343	44	35	3
6344	3;8	36	3
6520	Skalní mísa	31	3
6523	120	33	3
6525	17	34	3
6528	44	35	3
6532	3;8	36	3
6696	Skalní mísa	31	3
6699	120	33	3
6701	17	34	3
6703	44	35	3
6706	3;8	36	3
6876	Skalní mísa	31	3
6880	120	33	3
6882	17	34	3
6883	44	35	3
6884	3;8	36	3
7059	Skalní mísa	31	3
7061	120	33	3
7062	17	34	3
7063	44	35	3
7064	3;8	36	3
7240	Skalní mísa	31	3
7241	120	33	3
7242	17	34	3
7244	44	35	3
7246	3;8	36	3
7418	Skalní mísa	31	3
7420	120	33	3
7422	17	34	3
7423	44	35	3
7424	3;8	36	3
7596	Skalní mísa	31	3
7598	120	33	3
7600	17	34	3
7603	44	35	3
7604	3;8	36	3
7772	Balvany	32	4
7773	8m	37	4
7774	3,5	38	4
7775	5	39	4
7776	Chleba	40	4
7920	rock outcrop or other extreme habitat	4	1
7921	coniferous	3	1
7922	10	2	1
7923	10	1	1
7947	city or other type of development	4	1
7948	deciduous	3	1
7949	50	2	1
7950	15	1	1
8009	forest stand	4	1
5006	Žlábkové škrapy	31	3
5007	42	33	3
5008	1	34	3
5009	3	35	3
5144	Skalní mísa	31	3
5145	36	33	3
5146	10	34	3
5147	42	35	3
5148	Skalní mísa s odtokovým kanálem	36	3
5308	Skalní mísa	31	3
5309	83	33	3
5310	26	34	3
5311	48	35	3
5312	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5466	Skalní hradby/izolované skály	32	4
5467	4	37	4
5468	2.5	38	4
5469	3	39	4
5625	Skalní mísa	31	3
5626	17	33	3
5627	4	34	3
5628	12	35	3
5629	4;5	36	3
5805	Skalní mísa	31	3
5806	120	33	3
5807	17	34	3
5809	44	35	3
5810	3;8	36	3
5982	Skalní mísa	31	3
5987	120	33	3
5991	17	34	3
5993	44	35	3
5994	3;8	36	3
6162	Skalní mísa	31	3
6165	120	33	3
6168	17	34	3
6171	44	35	3
6173	3;8	36	3
6345	Skalní mísa	31	3
6346	120	33	3
6347	17	34	3
6348	44	35	3
6349	3;8	36	3
6521	Skalní mísa	31	3
6524	120	33	3
6527	17	34	3
6530	44	35	3
637	Tafoni	31	3
638	3	33	3
639	1	34	3
640	Balvany	32	4
641	Tafoni	31	3
642	Žlábkové škrapy	31	3
643	42	33	3
644	3	34	3
6533	3;8	36	3
6697	Skalní mísa	31	3
6702	120	33	3
6705	17	34	3
6708	44	35	3
6709	3;8	36	3
6885	Skalní mísa	31	3
6888	120	33	3
6890	17	34	3
6892	44	35	3
6895	3;8	36	3
7065	Skalní mísa	31	3
7066	120	33	3
7067	17	34	3
7068	44	35	3
7069	3;8	36	3
7243	Skalní mísa	31	3
7245	120	33	3
7247	17	34	3
7248	44	35	3
7249	3;8	36	3
7425	Skalní mísa	31	3
7426	120	33	3
7427	17	34	3
7428	44	35	3
7429	3;8	36	3
7605	Skalní mísa	31	3
7606	120	33	3
7607	17	34	3
7608	44	35	3
7609	3;8	36	3
7777	Balvany	32	4
7778	10	37	4
7779	5	38	4
7780	5	39	4
7781	uskupeni	40	4
7951	city or other type of development	4	1
7952	coniferous	3	1
7953	200	2	1
7954	25	1	1
8010	forest stand	4	1
5010	Skalní mísa	31	3
5011	42	33	3
5012	1	34	3
5013	4	35	3
5149	Skalní mísa	31	3
5150	101	33	3
5151	8	34	3
5152	100	35	3
5153	Mělká skalní mísa	36	3
5313	Skalní hradby/izolované skály	32	4
5314	1,5 m	37	4
5315	1 m	38	4
5316	3 m	39	4
5470	Skalní hradby/izolované skály	32	4
5471	7	37	4
5472	2	38	4
5473	4	39	4
5630	Skalní mísa	31	3
5631	11	33	3
5632	6	34	3
5633	8	35	3
5634	4;6	36	3
5808	Skalní mísa	31	3
5811	120	33	3
5812	17	34	3
5813	44	35	3
5815	3;8	36	3
5983	Skalní mísa	31	3
5986	120	33	3
5989	17	34	3
5990	44	35	3
5992	3;8	36	3
6163	Skalní mísa	31	3
6166	120	33	3
6169	17	34	3
6172	44	35	3
6174	3;8	36	3
6350	Skalní mísa	31	3
6351	120	33	3
6352	17	34	3
6353	44	35	3
6355	3;8	36	3
6522	Skalní mísa	31	3
6526	120	33	3
6529	17	34	3
6531	44	35	3
6534	3;8	36	3
6710	Skalní mísa	31	3
6711	120	33	3
6712	17	34	3
6713	44	35	3
6714	3;8	36	3
6886	Skalní mísa	31	3
6887	120	33	3
6889	17	34	3
6891	44	35	3
6893	3;8	36	3
7070	Skalní mísa	31	3
7071	120	33	3
7072	17	34	3
7074	44	35	3
7076	3;8	36	3
7250	Skalní mísa	31	3
7251	120	33	3
7252	17	34	3
7253	44	35	3
7254	3;8	36	3
7430	Skalní mísa	31	3
7431	120	33	3
7432	17	34	3
7433	44	35	3
7434	3;8	36	3
7610	Skalní mísa	31	3
7611	120	33	3
7613	17	34	3
7614	44	35	3
7616	3;8	36	3
7782	Skalní hřiby	32	4
7783	15	37	4
7784	5	38	4
7785	4	39	4
7955	city or other type of development	4	1
7956	deciduous	3	1
7957	150	2	1
7958	15	1	1
5014	Viklany	32	4
5015	42	37	4
5016	1	38	4
5017	5	39	4
5154	Skalní mísa	31	3
5155	46	33	3
5156	10	34	3
5157	51	35	3
5158	Skalní mísa s melkym odtokovým kanálem	36	3
5317	Balvany	32	4
5318	8 m	37	4
5319	3 m	38	4
5320	3 m	39	4
5474	Skalní hradby/izolované skály	32	4
5475	15 m	37	4
5476	5 m	38	4
5477	8 m	39	4
5635	Balvany	32	4
5636	450	37	4
5637	150	38	4
5638	300	39	4
5639	102	40	4
5814	Skalní mísa	31	3
5816	120	33	3
5817	17	34	3
5818	44	35	3
5819	3;8	36	3
5995	Skalní mísa	31	3
5996	120	33	3
5997	17	34	3
5998	44	35	3
5999	3;8	36	3
6175	Skalní mísa	31	3
6176	120	33	3
6177	17	34	3
6179	44	35	3
6182	3;8	36	3
6354	Skalní mísa	31	3
6356	120	33	3
6357	17	34	3
6358	44	35	3
6359	3;8	36	3
6535	Skalní mísa	31	3
6538	120	33	3
6540	17	34	3
6542	44	35	3
6545	3;8	36	3
6715	Skalní mísa	31	3
6718	120	33	3
6720	17	34	3
6721	44	35	3
6723	3;8	36	3
6894	Skalní mísa	31	3
6896	120	33	3
6897	17	34	3
6898	44	35	3
6899	3;8	36	3
7073	Skalní mísa	31	3
7075	120	33	3
7077	17	34	3
7078	44	35	3
7079	3;8	36	3
7255	Skalní mísa	31	3
7259	120	33	3
7262	17	34	3
7265	44	35	3
7268	3;8	36	3
7435	Skalní mísa	31	3
7436	120	33	3
7437	17	34	3
7438	44	35	3
7439	3;8	36	3
7612	Skalní mísa	31	3
7615	120	33	3
7617	17	34	3
7618	44	35	3
7619	3;8	36	3
7786	Skalní hradby/izolované skály	32	4
7787	3 m	37	4
7788	1,5 m	38	4
7789	2,5 m	39	4
7790	Vodicka01-22	40	4
7959	city or other type of development	4	1
7960	deciduous	3	1
7961	50	2	1
7962	10	1	1
5018	42	37	4
5019	1	38	4
5020	6	39	4
5159	Skalní mísa	31	3
5160	44	33	3
5161	5	34	3
5162	80	35	3
5163	Deformovaná skalní mísa	36	3
5321	Balvany	32	4
5322	8 m	37	4
5323	3 m	38	4
5324	3 m	39	4
5478	Skalní hradby/izolované skály	32	4
5479	6 m	37	4
5480	5 m	38	4
5481	4 m	39	4
5640	Skalní mísa	31	3
5641	97	33	3
5642	15	34	3
5643	80	35	3
5644	4;7	36	3
5820	Skalní mísa	31	3
5821	120	33	3
5822	17	34	3
5823	44	35	3
5824	3;8	36	3
6000	Skalní mísa	31	3
6003	120	33	3
6005	17	34	3
6007	44	35	3
6009	3;8	36	3
6178	Skalní mísa	31	3
6180	120	33	3
6181	17	34	3
6184	44	35	3
6185	3;8	36	3
6360	Skalní mísa	31	3
6361	120	33	3
6362	17	34	3
6363	44	35	3
6364	3;8	36	3
6536	Skalní mísa	31	3
6537	120	33	3
6539	17	34	3
6543	44	35	3
6547	3;8	36	3
6716	Skalní mísa	31	3
6717	120	33	3
6719	17	34	3
6722	44	35	3
6724	3;8	36	3
6900	Skalní mísa	31	3
6901	120	33	3
6902	17	34	3
6903	44	35	3
6904	3;8	36	3
7080	Skalní mísa	31	3
7081	120	33	3
7082	17	34	3
7083	44	35	3
7084	3;8	36	3
7256	Skalní mísa	31	3
7258	120	33	3
7261	17	34	3
7264	44	35	3
7267	3;8	36	3
7440	Skalní mísa	31	3
7441	120	33	3
7442	17	34	3
7443	44	35	3
7446	3;8	36	3
7620	Skalní mísa	31	3
7621	120	33	3
7622	17	34	3
7623	44	35	3
7624	3;8	36	3
7791	Skalní hradby/izolované skály	32	4
7792	2 m	37	4
7793	1,5 m	38	4
7794	2,5 m	39	4
7795	Vodicka02-22	40	4
7963	once a month	7	2
5021	Tafoni	31	3
5022	42	33	3
5023	1	34	3
5024	10	35	3
5164	Balvany	32	4
5165	8 m	37	4
5166	5 m	38	4
5167	5 m	39	4
5168	Skalní hradby	40	4
5325	Balvany	32	4
5326	8 m	37	4
5327	3 m	38	4
5328	3 m	39	4
5482	Skalní mísa	31	3
5483	71	33	3
5484	18	34	3
5485	50	35	3
5486	Iniciální mísa	36	3
5645	Skalní mísa	31	3
5646	120	33	3
5647	17	34	3
5648	44	35	3
5649	3;8	36	3
5825	Skalní mísa	31	3
5826	120	33	3
5828	17	34	3
5829	44	35	3
5831	3;8	36	3
6001	Skalní mísa	31	3
6002	120	33	3
6004	17	34	3
6006	44	35	3
6008	3;8	36	3
6183	Skalní mísa	31	3
6186	120	33	3
6187	17	34	3
6188	44	35	3
6189	3;8	36	3
6365	Skalní mísa	31	3
6366	120	33	3
6367	17	34	3
6369	44	35	3
6371	3;8	36	3
6541	Skalní mísa	31	3
6544	120	33	3
6546	17	34	3
6548	44	35	3
6549	3;8	36	3
6725	Skalní mísa	31	3
6726	120	33	3
6727	17	34	3
6728	44	35	3
6729	3;8	36	3
6905	Skalní mísa	31	3
6906	120	33	3
6907	17	34	3
6908	44	35	3
6909	3;8	36	3
7085	Skalní mísa	31	3
7086	120	33	3
7087	17	34	3
7089	44	35	3
7091	3;8	36	3
7257	Skalní mísa	31	3
7260	120	33	3
7263	17	34	3
7266	44	35	3
7269	3;8	36	3
7444	Skalní mísa	31	3
7445	120	33	3
7447	17	34	3
7448	44	35	3
7449	3;8	36	3
7625	Skalní mísa	31	3
7628	120	33	3
7631	17	34	3
7633	44	35	3
7634	3;8	36	3
7796	Žlábkové škrapy	31	3
7797	150 cm	33	3
7798	7 cm	34	3
7799	8 cm	35	3
7800	Vodicka03-22	36	3
7964	once a week	7	2
5025	Žlábkové škrapy	31	3
5026	42	33	3
5027	1	34	3
5028	11	35	3
5169	Balvany	32	4
5170	7 m	37	4
5171	5 m	38	4
5172	1,5 m	39	4
5329	Balvany	32	4
5331	8 m	37	4
5332	3 m	38	4
5334	3 m	39	4
5487	Skalní hradby/izolované skály	32	4
5488	4	37	4
5489	1.5	38	4
5490	2	39	4
5650	Skalní mísa	31	3
5651	120	33	3
5652	17	34	3
5653	44	35	3
5654	3;8	36	3
5827	Skalní mísa	31	3
5830	120	33	3
5832	17	34	3
5833	44	35	3
5834	3;8	36	3
6010	Skalní mísa	31	3
6011	120	33	3
6013	17	34	3
6015	44	35	3
6017	3;8	36	3
6190	Skalní mísa	31	3
6191	120	33	3
6192	17	34	3
6193	44	35	3
6194	3;8	36	3
6368	Skalní mísa	31	3
6370	120	33	3
6372	17	34	3
6373	44	35	3
6374	3;8	36	3
6550	Skalní mísa	31	3
6552	120	33	3
6554	17	34	3
6557	44	35	3
6561	3;8	36	3
6730	Skalní mísa	31	3
6731	120	33	3
6732	17	34	3
6733	44	35	3
6735	3;8	36	3
6910	Skalní mísa	31	3
6911	120	33	3
6912	17	34	3
6913	44	35	3
6914	3;8	36	3
7088	Skalní mísa	31	3
7090	120	33	3
7092	17	34	3
7093	44	35	3
7094	3;8	36	3
7270	Skalní mísa	31	3
7271	120	33	3
7274	17	34	3
7277	44	35	3
7279	3;8	36	3
7450	Skalní mísa	31	3
7451	120	33	3
7452	17	34	3
7453	44	35	3
7454	3;8	36	3
7626	Skalní mísa	31	3
7627	120	33	3
7629	17	34	3
7630	44	35	3
7632	3;8	36	3
7801	Skalní mísa	31	3
7802	72 cm	33	3
7803	9 cm	34	3
7804	16 cm	35	3
7805	Vodicka04-22	36	3
7965	once a week	7	2
5029	Žlábkové škrapy	31	3
5030	42	33	3
5031	1	34	3
5032	11	35	3
5173	Balvany	32	4
5174	7 m	37	4
5175	5 m	38	4
5176	1,5 m	39	4
5330	Balvany	32	4
5333	8 m	37	4
5336	3 m	38	4
5338	3 m	39	4
5491	Skalní mísa	31	3
5492	150	33	3
5493	20	34	3
5494	90	35	3
5495	Skalní mísa s dvěma odtokovými kanály	36	3
5655	Skalní mísa	31	3
5656	120	33	3
5657	17	34	3
5658	44	35	3
5659	3;8	36	3
5835	Skalní mísa	31	3
5836	120	33	3
5837	17	34	3
5838	44	35	3
5839	3;8	36	3
6012	Skalní mísa	31	3
6014	120	33	3
6016	17	34	3
6018	44	35	3
6020	3;8	36	3
6195	Skalní mísa	31	3
6197	120	33	3
6199	17	34	3
6201	44	35	3
6203	3;8	36	3
6375	Skalní mísa	31	3
6377	120	33	3
6379	17	34	3
6381	44	35	3
6384	3;8	36	3
6551	Skalní mísa	31	3
6556	120	33	3
6559	17	34	3
6560	44	35	3
6563	3;8	36	3
6734	Skalní mísa	31	3
6736	120	33	3
6737	17	34	3
6738	44	35	3
6740	3;8	36	3
6915	Skalní mísa	31	3
6916	120	33	3
6918	17	34	3
6920	44	35	3
6922	3;8	36	3
7095	Skalní mísa	31	3
7096	120	33	3
7097	17	34	3
7098	44	35	3
7099	3;8	36	3
7272	Skalní mísa	31	3
7273	120	33	3
7275	17	34	3
7276	44	35	3
7278	3;8	36	3
7455	Skalní mísa	31	3
7457	120	33	3
7460	17	34	3
7462	44	35	3
7464	3;8	36	3
7635	Skalní mísa	31	3
7636	120	33	3
7637	17	34	3
7638	44	35	3
7639	3;8	36	3
7806	Balvany	32	4
7807	2,1 m	37	4
7808	1,5 m	38	4
7809	2,5 m	39	4
7810	Vodicka05-22	40	4
7966	once a week	7	2
5033	Balvany	32	4
5177	Skalní mísa	31	3
5178	60	33	3
5179	14	34	3
5180	50	35	3
5181	Skalní mísa s odtokovým kanálem	36	3
5335	Balvany	32	4
5337	8 m	37	4
5339	3 m	38	4
5340	3 m	39	4
5496	Skalní mísa	31	3
5497	150	33	3
5498	20	34	3
5499	90	35	3
5500	Skalní mísa s dvěma odtokovými kanály	36	3
5660	Skalní mísa	31	3
5661	120	33	3
5662	17	34	3
5663	44	35	3
5664	3;8	36	3
5840	Skalní mísa	31	3
5841	120	33	3
5842	17	34	3
5844	44	35	3
5846	3;8	36	3
6019	Skalní mísa	31	3
6021	120	33	3
6022	17	34	3
6023	44	35	3
6024	3;8	36	3
6196	Skalní mísa	31	3
6198	120	33	3
6200	17	34	3
6202	44	35	3
6204	3;8	36	3
6376	Skalní mísa	31	3
6378	120	33	3
6380	17	34	3
6382	44	35	3
6383	3;8	36	3
6553	Skalní mísa	31	3
6555	120	33	3
6558	17	34	3
6562	44	35	3
6564	3;8	36	3
6739	Skalní mísa	31	3
6741	120	33	3
6742	17	34	3
6743	44	35	3
6744	3;8	36	3
6917	Skalní mísa	31	3
6919	120	33	3
6921	17	34	3
6923	44	35	3
6924	3;8	36	3
7100	Skalní mísa	31	3
7101	120	33	3
7102	17	34	3
7103	44	35	3
7105	3;8	36	3
7280	Skalní mísa	31	3
7281	120	33	3
7282	17	34	3
7283	44	35	3
7284	3;8	36	3
7456	Skalní mísa	31	3
7458	120	33	3
7459	17	34	3
7461	44	35	3
7463	3;8	36	3
7640	Skalní mísa	31	3
7641	120	33	3
7642	17	34	3
7643	44	35	3
7644	3;8	36	3
7811	Skalní mísa	31	3
7812	108 cm	33	3
7813	20 cm	34	3
7814	70 cm	35	3
7815	Vodicka06-22	36	3
7967	once a month	7	2
5034	Tafoni	31	3
5035	42	33	3
5036	2	34	3
5037	1	35	3
5182	Skalní mísa	31	3
5183	59	33	3
5184	17	34	3
5185	40	35	3
5186	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5341	Balvany	32	4
5342	8 m	37	4
5343	3 m	38	4
5344	3 m	39	4
5501	Skalní hradby/izolované skály	32	4
5502	2	37	4
5503	2	38	4
5504	3	39	4
5665	Skalní mísa	31	3
5666	120	33	3
5667	17	34	3
5669	44	35	3
5672	3;8	36	3
5843	Skalní mísa	31	3
5845	120	33	3
5847	17	34	3
5848	44	35	3
5849	3;8	36	3
6025	Skalní mísa	31	3
6027	120	33	3
6029	17	34	3
6031	44	35	3
6032	3;8	36	3
6205	Skalní mísa	31	3
6206	120	33	3
6207	17	34	3
6208	44	35	3
6209	3;8	36	3
6385	Skalní mísa	31	3
6386	120	33	3
6387	17	34	3
6388	44	35	3
6389	3;8	36	3
6565	Skalní mísa	31	3
6567	120	33	3
6570	17	34	3
6572	44	35	3
6575	3;8	36	3
6745	Skalní mísa	31	3
6746	120	33	3
6747	17	34	3
6748	44	35	3
6750	3;8	36	3
6925	Skalní mísa	31	3
6926	120	33	3
6927	17	34	3
6928	44	35	3
6929	3;8	36	3
7104	Skalní mísa	31	3
7106	120	33	3
7107	17	34	3
7109	44	35	3
7111	3;8	36	3
7285	Skalní mísa	31	3
7286	120	33	3
7287	17	34	3
7288	44	35	3
7289	3;8	36	3
7465	Skalní mísa	31	3
7466	120	33	3
7467	17	34	3
7468	44	35	3
7469	3;8	36	3
7645	Skalní mísa	31	3
7646	120	33	3
7647	17	34	3
7648	44	35	3
7649	3;8	36	3
7816	Skalní mísa	31	3
7817	80 cm	33	3
7818	27 cm	34	3
7819	40 cm	35	3
7820	Vodicka07-22	36	3
7968	once a month	7	2
5038	Tafoni	31	3
5039	42	33	3
5040	3	34	3
5041	1	35	3
5187	Skalní mísa	31	3
5188	28	33	3
5189	13	34	3
5190	42	35	3
5191	Skalní mísa s dvěma odtokovými kanály z	36	3
5345	Skalní hradby/izolované skály	32	4
5346	4 m	37	4
5347	2 m	38	4
5348	7 m	39	4
5505	Skalní mísa	31	3
5506	49	33	3
5507	21	34	3
5508	34	35	3
5668	Skalní mísa	31	3
5670	120	33	3
5671	17	34	3
5673	44	35	3
5674	3;8	36	3
5850	Skalní mísa	31	3
5851	120	33	3
5852	17	34	3
5853	44	35	3
5854	3;8	36	3
6026	Skalní mísa	31	3
6028	120	33	3
6030	17	34	3
6033	44	35	3
6034	3;8	36	3
6210	Skalní mísa	31	3
6211	120	33	3
6212	17	34	3
6213	44	35	3
6214	3;8	36	3
6390	Skalní mísa	31	3
6392	120	33	3
6395	17	34	3
6398	44	35	3
6401	3;8	36	3
6566	Skalní mísa	31	3
6571	120	33	3
6574	17	34	3
6578	44	35	3
6579	3;8	36	3
6749	Skalní mísa	31	3
6751	120	33	3
6752	17	34	3
6753	44	35	3
6755	3;8	36	3
6930	Skalní mísa	31	3
6931	120	33	3
6932	17	34	3
6933	44	35	3
6934	3;8	36	3
7108	Skalní mísa	31	3
7110	120	33	3
7112	17	34	3
7113	44	35	3
7114	3;8	36	3
7290	Skalní mísa	31	3
7291	120	33	3
7292	17	34	3
7294	44	35	3
7296	3;8	36	3
7470	Skalní mísa	31	3
7473	120	33	3
7475	17	34	3
7477	44	35	3
7478	3;8	36	3
7650	Skalní mísa	31	3
7651	120	33	3
7652	17	34	3
7653	44	35	3
7654	3;8	36	3
7821	Skalní mísa	31	3
7822	50 cm	33	3
7823	12 cm	34	3
7824	67 cm	35	3
7825	Vodicka08-22	36	3
7969	once a month	7	2
5042	Balvany	32	4
5043	42	37	4
5044	3	38	4
5045	2	39	4
5192	Skalní mísa	31	3
5193	63	33	3
5194	13	34	3
5195	65	35	3
5196	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5349	Skalní hradby/izolované skály	32	4
5350	4	37	4
5351	2.5	38	4
5352	3	39	4
5509	Skalní mísa	31	3
5510	84	33	3
5511	18	34	3
5512	66	35	3
5675	Skalní mísa	31	3
5676	120	33	3
5677	17	34	3
5679	44	35	3
5681	3;8	36	3
5855	Skalní mísa	31	3
5856	120	33	3
5857	17	34	3
5858	44	35	3
5859	3;8	36	3
6035	Skalní mísa	31	3
6036	120	33	3
6037	17	34	3
6038	44	35	3
6039	3;8	36	3
6215	Skalní mísa	31	3
6217	120	33	3
6219	17	34	3
6221	44	35	3
6223	3;8	36	3
6391	Skalní mísa	31	3
6394	120	33	3
6397	17	34	3
6400	44	35	3
6403	3;8	36	3
6568	Skalní mísa	31	3
6569	120	33	3
6573	17	34	3
6576	44	35	3
6577	3;8	36	3
6754	Skalní mísa	31	3
6756	120	33	3
6757	17	34	3
6758	44	35	3
6759	3;8	36	3
6935	Skalní mísa	31	3
6938	120	33	3
6939	17	34	3
6941	44	35	3
6942	3;8	36	3
7115	Skalní mísa	31	3
7116	120	33	3
7117	17	34	3
7118	44	35	3
7119	3;8	36	3
7293	Skalní mísa	31	3
7295	120	33	3
7297	17	34	3
7298	44	35	3
7299	3;8	36	3
7471	Skalní mísa	31	3
7472	120	33	3
7474	17	34	3
7476	44	35	3
7479	3;8	36	3
7655	Skalní mísa	31	3
7658	120	33	3
7659	17	34	3
7661	44	35	3
7663	3;8	36	3
7826	Skalní mísa	31	3
7827	75 cm	33	3
7828	23 cm	34	3
7829	52 cm	35	3
7830	Vodicka09-22	36	3
7970	once a week	7	2
5046	Žlábkové škrapy	31	3
5047	42	33	3
5048	3	34	3
5049	3	35	3
5197	Skalní mísa	31	3
5198	58	33	3
5199	15	34	3
5200	57	35	3
5201	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5353	Skalní mísa	31	3
5354	114	33	3
5355	12	34	3
5356	91	35	3
5357	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5513	Balvany	32	4
5514	5 m	37	4
5515	6 m	38	4
5516	5 m	39	4
5678	Skalní mísa	31	3
5682	120	33	3
5684	17	34	3
5687	44	35	3
5689	3;8	36	3
5860	Skalní mísa	31	3
5861	120	33	3
5862	17	34	3
5863	44	35	3
5865	3;8	36	3
6040	Skalní mísa	31	3
6041	120	33	3
6042	17	34	3
6044	44	35	3
6045	3;8	36	3
6216	Skalní mísa	31	3
6218	120	33	3
6220	17	34	3
6222	44	35	3
6224	3;8	36	3
6393	Skalní mísa	31	3
6396	120	33	3
6399	17	34	3
6402	44	35	3
6404	3;8	36	3
6580	Skalní mísa	31	3
6581	120	33	3
6582	17	34	3
6584	44	35	3
6587	3;8	36	3
6760	Skalní mísa	31	3
6761	120	33	3
6762	17	34	3
6763	44	35	3
6765	3;8	36	3
6936	Skalní mísa	31	3
6937	120	33	3
6940	17	34	3
6943	44	35	3
6944	3;8	36	3
7120	Skalní mísa	31	3
7121	120	33	3
7122	17	34	3
7124	44	35	3
7127	3;8	36	3
7300	Skalní mísa	31	3
7301	120	33	3
7302	17	34	3
7303	44	35	3
7304	3;8	36	3
7480	Skalní mísa	31	3
7481	120	33	3
7482	17	34	3
7483	44	35	3
7484	3;8	36	3
7656	Skalní mísa	31	3
7657	120	33	3
7660	17	34	3
7662	44	35	3
7664	3;8	36	3
7831	Skalní mísa	31	3
7832	60 cm	33	3
7833	33 cm	34	3
7834	46 cm	35	3
7835	Vodicka10-22	36	3
7971	once a week	7	2
5050	Viklany	32	4
5051	10	37	4
5052	10	38	4
5053	10	39	4
5054	Jddj	40	4
5202	10 m	37	4
5203	3 m	38	4
5204	5	39	4
5358	Skalní mísa	31	3
5359	114	33	3
5360	12	34	3
5362	91	35	3
5363	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5517	Skalní mísa	31	3
5518	76	33	3
5519	13	34	3
5520	55	35	3
5521	Skalní mísa s vyvinutým odtokovým kanálem	36	3
5680	Skalní mísa	31	3
5683	120	33	3
5685	17	34	3
5686	44	35	3
5688	3;8	36	3
5864	Skalní mísa	31	3
5866	120	33	3
5867	17	34	3
5868	44	35	3
5869	3;8	36	3
6043	Skalní mísa	31	3
6046	120	33	3
6048	17	34	3
6050	44	35	3
6053	3;8	36	3
6225	Skalní mísa	31	3
6226	120	33	3
6227	17	34	3
6229	44	35	3
6230	3;8	36	3
6405	Skalní mísa	31	3
6406	120	33	3
6407	17	34	3
6408	44	35	3
6409	3;8	36	3
6583	Skalní mísa	31	3
6585	120	33	3
6588	17	34	3
6590	44	35	3
6591	3;8	36	3
6764	Skalní mísa	31	3
6768	120	33	3
6770	17	34	3
6772	44	35	3
6774	3;8	36	3
6945	Skalní mísa	31	3
6946	120	33	3
6947	17	34	3
6948	44	35	3
6949	3;8	36	3
7123	Skalní mísa	31	3
7125	120	33	3
7126	17	34	3
7128	44	35	3
7129	3;8	36	3
7305	Skalní mísa	31	3
7306	120	33	3
7307	17	34	3
7308	44	35	3
7309	3;8	36	3
7485	Skalní mísa	31	3
7487	120	33	3
7489	17	34	3
7491	44	35	3
7494	3;8	36	3
7665	Skalní mísa	31	3
7666	120	33	3
7667	17	34	3
7668	44	35	3
7669	3;8	36	3
7836	78 cm	33	3
7837	20 cm	34	3
7838	63 cm	35	3
7839	Vodicka11-22	36	3
7972	once a month	7	2
5055	Balvany	32	4
5205	Tafoni	31	3
5206	1 m	33	3
5207	1 m	34	3
5208	2 m	35	3
5361	Skalní mísa	31	3
5364	114	33	3
5366	12	34	3
5368	91	35	3
5371	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5522	Balvany	32	4
5523	4 m	37	4
5524	2 m	38	4
5525	4 m	39	4
5690	Skalní mísa	31	3
5691	120	33	3
5692	17	34	3
5693	44	35	3
5694	3;8	36	3
5870	Skalní mísa	31	3
5871	120	33	3
5872	17	34	3
5873	44	35	3
5874	3;8	36	3
6047	Skalní mísa	31	3
6049	120	33	3
6051	17	34	3
6052	44	35	3
6054	3;8	36	3
6228	Skalní mísa	31	3
6231	120	33	3
6233	17	34	3
6236	44	35	3
6237	3;8	36	3
6410	Skalní mísa	31	3
6412	120	33	3
6414	17	34	3
6416	44	35	3
6418	3;8	36	3
6586	Skalní mísa	31	3
6589	120	33	3
6592	17	34	3
6593	44	35	3
6594	3;8	36	3
6766	Skalní mísa	31	3
6767	120	33	3
6769	17	34	3
6771	44	35	3
6773	3;8	36	3
6950	Skalní mísa	31	3
6951	120	33	3
6952	17	34	3
6953	44	35	3
6954	3;8	36	3
7130	Skalní mísa	31	3
7131	120	33	3
7132	17	34	3
7133	44	35	3
7134	3;8	36	3
7310	Skalní mísa	31	3
7311	120	33	3
7312	17	34	3
7313	44	35	3
7314	3;8	36	3
7486	Skalní mísa	31	3
7488	120	33	3
7490	17	34	3
7492	44	35	3
7493	3;8	36	3
7670	Skalní mísa	31	3
7671	120	33	3
7672	17	34	3
7673	44	35	3
7674	3;8	36	3
7840	Skalní mísa	31	3
7841	130 cm	33	3
7842	35 cm	34	3
7843	120 cm	35	3
7844	Vodicka12-22	36	3
7973	once a week	7	2
5056	Žlábkové škrapy	31	3
5209	Balvany	32	4
5210	6 m	37	4
5211	4 m	38	4
5212	5 m	39	4
5365	Skalní mísa	31	3
5367	114	33	3
5369	12	34	3
5370	91	35	3
5372	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5526	Balvany	32	4
5527	7 m	37	4
5528	5 m	38	4
5529	4 m	39	4
5695	Skalní mísa	31	3
5696	120	33	3
5698	17	34	3
5700	44	35	3
5703	3;8	36	3
5875	Skalní mísa	31	3
5876	120	33	3
5877	17	34	3
5888	44	35	3
5889	3;8	36	3
6055	Skalní mísa	31	3
6057	120	33	3
6059	17	34	3
6061	44	35	3
6064	3;8	36	3
6232	Skalní mísa	31	3
6234	120	33	3
6235	17	34	3
6238	44	35	3
6239	3;8	36	3
6411	Skalní mísa	31	3
6413	120	33	3
6415	17	34	3
6417	44	35	3
6419	3;8	36	3
6595	Skalní mísa	31	3
6596	120	33	3
6597	17	34	3
6598	44	35	3
6599	3;8	36	3
6775	Skalní mísa	31	3
6777	120	33	3
6778	17	34	3
6780	44	35	3
6785	3;8	36	3
6955	Skalní mísa	31	3
6956	120	33	3
6957	17	34	3
6958	44	35	3
6959	3;8	36	3
7135	Skalní mísa	31	3
7136	120	33	3
7138	17	34	3
7140	44	35	3
7141	3;8	36	3
7315	Skalní mísa	31	3
7316	120	33	3
7317	17	34	3
7318	44	35	3
7319	3;8	36	3
7495	Skalní mísa	31	3
7496	120	33	3
7497	17	34	3
7498	44	35	3
7499	3;8	36	3
7675	Skalní mísa	31	3
7677	120	33	3
7680	17	34	3
7682	44	35	3
7684	3;8	36	3
7845	Skalní mísa	31	3
7846	100 cm	33	3
7847	22 cm	34	3
7848	65 cm	35	3
7849	Vodicka13-22	36	3
7974	once a week	7	2
5057	Tafoni	31	3
5058	42	33	3
5059	4	34	3
5060	1	35	3
5213	Skalní mísa	31	3
5214	44	33	3
5215	20	34	3
5216	42	35	3
5217	Skalní mísa - senilní stadium	36	3
5373	Skalní mísa	31	3
5374	114	33	3
5375	12	34	3
5376	91	35	3
5377	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5530	Balvany	32	4
5531	3	37	4
5532	3	38	4
5533	2	39	4
5697	Skalní mísa	31	3
5699	120	33	3
5701	17	34	3
5705	44	35	3
5708	3;8	36	3
5878	Skalní mísa	31	3
5879	120	33	3
5881	17	34	3
5883	44	35	3
5885	3;8	36	3
6056	Skalní mísa	31	3
6058	120	33	3
6060	17	34	3
6062	44	35	3
6063	3;8	36	3
6240	Skalní mísa	31	3
6241	120	33	3
6242	17	34	3
6243	44	35	3
6244	3;8	36	3
6420	Skalní mísa	31	3
6421	120	33	3
6422	17	34	3
6423	44	35	3
6424	3;8	36	3
6600	Skalní mísa	31	3
6601	120	33	3
6602	17	34	3
6604	44	35	3
6606	3;8	36	3
6776	Skalní mísa	31	3
6779	120	33	3
6781	17	34	3
6783	44	35	3
6786	3;8	36	3
6960	Skalní mísa	31	3
6963	120	33	3
6966	17	34	3
6967	44	35	3
6969	3;8	36	3
7137	Skalní mísa	31	3
7139	120	33	3
7142	17	34	3
7143	44	35	3
7144	3;8	36	3
7320	Skalní mísa	31	3
7321	120	33	3
7322	17	34	3
7323	44	35	3
7324	3;8	36	3
7500	Skalní mísa	31	3
7501	120	33	3
7502	17	34	3
7504	44	35	3
7505	3;8	36	3
7676	Skalní mísa	31	3
7678	120	33	3
7679	17	34	3
7681	44	35	3
7683	3;8	36	3
7850	Skalní mísa	31	3
7851	55 cm	33	3
7852	16 cm	34	3
7853	50 cm	35	3
7854	Vodicka14-22	36	3
7975	solitaire in the landscape	4	1
7976	deciduous	3	1
5061	Skalní hradby/izolované skály	32	4
5062	42	37	4
5063	4	38	4
5064	2	39	4
5218	Skalní mísa	31	3
5219	35	33	3
5220	10	34	3
5221	40	35	3
5222	Skalní mísa - senilní stadium	36	3
5378	Skalní mísa	31	3
5379	114	33	3
5380	12	34	3
5381	91	35	3
5382	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5534	Skalní hradby/izolované skály	32	4
5535	6	37	4
5536	3	38	4
5537	3	39	4
5702	Skalní mísa	31	3
5704	120	33	3
5706	17	34	3
5707	44	35	3
5709	3;8	36	3
5880	Skalní mísa	31	3
5882	120	33	3
5884	17	34	3
5886	44	35	3
5887	3;8	36	3
6065	Skalní mísa	31	3
6066	120	33	3
6067	17	34	3
6068	44	35	3
6069	3;8	36	3
6245	Skalní mísa	31	3
6246	120	33	3
6247	17	34	3
6248	44	35	3
6249	3;8	36	3
6425	Skalní mísa	31	3
6426	120	33	3
6427	17	34	3
6428	44	35	3
6429	3;8	36	3
6603	Skalní mísa	31	3
6605	120	33	3
6607	17	34	3
6608	44	35	3
6609	3;8	36	3
6782	Skalní mísa	31	3
6784	120	33	3
6787	17	34	3
6788	44	35	3
6789	3;8	36	3
6961	Skalní mísa	31	3
6962	120	33	3
6964	17	34	3
6965	44	35	3
6968	3;8	36	3
7145	Skalní mísa	31	3
7146	120	33	3
7147	17	34	3
7148	44	35	3
7149	3;8	36	3
7325	Skalní mísa	31	3
7326	120	33	3
7327	17	34	3
7328	44	35	3
7329	3;8	36	3
7503	Skalní mísa	31	3
7506	120	33	3
7507	17	34	3
7508	44	35	3
7509	3;8	36	3
7685	Skalní mísa	31	3
7686	120	33	3
7687	17	34	3
7689	44	35	3
7691	3;8	36	3
7855	42 cm	33	3
7856	3 cm	34	3
7857	35 cm	35	3
7858	Vodicka15-22	36	3
7977	forest stand	4	1
7978	coniferous	3	1
5065	Tafoni	31	3
5066	42	33	3
5067	4	34	3
5068	3	35	3
5223	Skalní hřiby	32	4
5224	4,2 m	37	4
5225	6 m	38	4
5226	3 m	39	4
5383	Skalní mísa	31	3
5385	114	33	3
5387	12	34	3
5389	91	35	3
5391	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5538	Skalní hradby/izolované skály	32	4
5539	1,5 m	37	4
5540	1 m	38	4
5541	1 m	39	4
5710	Skalní mísa	31	3
5711	120	33	3
5712	17	34	3
5713	44	35	3
5714	3;8	36	3
5890	Skalní mísa	31	3
5891	120	33	3
5892	17	34	3
5893	44	35	3
5894	3;8	36	3
6070	Skalní mísa	31	3
6071	120	33	3
6072	17	34	3
6073	44	35	3
6074	3;8	36	3
6250	Skalní mísa	31	3
6251	120	33	3
6253	17	34	3
6254	44	35	3
6256	3;8	36	3
6430	Skalní mísa	31	3
6431	120	33	3
6432	17	34	3
6433	44	35	3
6434	3;8	36	3
6610	Skalní mísa	31	3
6611	120	33	3
6612	17	34	3
6613	44	35	3
6614	3;8	36	3
6790	Skalní mísa	31	3
6792	120	33	3
6794	17	34	3
6796	44	35	3
6797	3;8	36	3
6970	Skalní mísa	31	3
6971	120	33	3
6972	17	34	3
6973	44	35	3
6974	3;8	36	3
7150	Skalní mísa	31	3
7151	120	33	3
7152	17	34	3
7153	44	35	3
7154	3;8	36	3
7330	Skalní mísa	31	3
7331	120	33	3
7333	17	34	3
7335	44	35	3
7338	3;8	36	3
7510	Skalní mísa	31	3
7511	120	33	3
7512	17	34	3
7513	44	35	3
7514	3;8	36	3
7688	Skalní mísa	31	3
7690	120	33	3
7692	17	34	3
7693	44	35	3
7694	3;8	36	3
7859	Balvany	32	4
7860	4 m	37	4
7861	1 m	38	4
7862	3 m	39	4
7863	Vodicka16-22	40	4
7979	forest stand	4	1
7980	deciduous	3	1
5069	Skalní hradby/izolované skály	32	4
5070	42	37	4
5071	4	38	4
5072	4	39	4
5227	Skalní mísa	31	3
5228	60	33	3
5229	6	34	3
5230	62	35	3
5231	Iniciální mísa	36	3
5384	Skalní mísa	31	3
5386	114	33	3
5388	12	34	3
5390	91	35	3
5392	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5542	Skalní hradby/izolované skály	32	4
5543	1,5 m	37	4
5544	1 m	38	4
5545	1 m	39	4
5715	Skalní mísa	31	3
5716	120	33	3
5717	17	34	3
5719	44	35	3
5720	3;8	36	3
5895	Skalní mísa	31	3
5896	120	33	3
5897	17	34	3
5899	44	35	3
5901	3;8	36	3
6075	Skalní mísa	31	3
6076	120	33	3
6077	17	34	3
6078	44	35	3
6079	3;8	36	3
6252	Skalní mísa	31	3
6257	120	33	3
6259	17	34	3
6261	44	35	3
6263	3;8	36	3
6435	Skalní mísa	31	3
6436	120	33	3
6437	17	34	3
6438	44	35	3
6440	3;8	36	3
6615	Skalní mísa	31	3
6617	120	33	3
6619	17	34	3
6621	44	35	3
6623	3;8	36	3
6791	Skalní mísa	31	3
6793	120	33	3
6795	17	34	3
6798	44	35	3
6800	3;8	36	3
6975	Skalní mísa	31	3
6976	120	33	3
6977	17	34	3
6978	44	35	3
6979	3;8	36	3
7155	Skalní mísa	31	3
7156	120	33	3
7157	17	34	3
7158	44	35	3
7159	3;8	36	3
7332	Skalní mísa	31	3
7334	120	33	3
7336	17	34	3
7337	44	35	3
7339	3;8	36	3
7515	Skalní mísa	31	3
7516	120	33	3
7517	17	34	3
7518	44	35	3
7519	3;8	36	3
7695	Skalní mísa	31	3
7696	120	33	3
7697	17	34	3
7698	44	35	3
7699	3;8	36	3
7864	Balvany	32	4
7865	2,5 m	37	4
7866	1 m	38	4
7867	2,1 m	39	4
7868	Vodicka17-22	40	4
7981	once a week	7	2
5073	Skalní mísa	31	3
5074	42	33	3
5075	4	34	3
5076	5	35	3
5077	Pivoooo	36	3
5232	Skalní mísa	31	3
5233	106	33	3
5234	18	34	3
5235	150	35	3
5236	Iniciální mísa	36	3
5393	Skalní mísa	31	3
5394	114	33	3
5395	12	34	3
5397	91	35	3
5399	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5546	Skalní hradby/izolované skály	32	4
5547	1,5 m	37	4
5548	1 m	38	4
5549	1 m	39	4
5718	Skalní mísa	31	3
5721	120	33	3
5724	17	34	3
5726	44	35	3
5728	3;8	36	3
5898	Skalní mísa	31	3
5900	120	33	3
5902	17	34	3
5903	44	35	3
5904	3;8	36	3
6080	Skalní mísa	31	3
6081	120	33	3
6082	17	34	3
6083	44	35	3
6084	3;8	36	3
6255	Skalní mísa	31	3
6258	120	33	3
6260	17	34	3
6262	44	35	3
6264	3;8	36	3
6439	Skalní mísa	31	3
6441	120	33	3
6442	17	34	3
6443	44	35	3
6444	3;8	36	3
6616	Skalní mísa	31	3
6618	120	33	3
6620	17	34	3
6622	44	35	3
6624	3;8	36	3
6799	Skalní mísa	31	3
6801	120	33	3
6802	17	34	3
6803	44	35	3
6804	3;8	36	3
6980	Skalní mísa	31	3
6981	120	33	3
6982	17	34	3
6983	44	35	3
6984	3;8	36	3
7160	Skalní mísa	31	3
7161	120	33	3
7162	17	34	3
7163	44	35	3
7164	3;8	36	3
7340	Skalní mísa	31	3
7342	120	33	3
7344	17	34	3
7346	44	35	3
7348	3;8	36	3
7520	Skalní mísa	31	3
7521	120	33	3
7522	17	34	3
7523	44	35	3
7524	3;8	36	3
7700	32	33	3
7701	9	34	3
7702	26	35	3
7703	4;9	36	3
7869	Balvany	32	4
7870	4 m	37	4
7871	2 m	38	4
7872	2,5 m	39	4
7873	Vodicka18-22	40	4
7982	forest stand	4	1
7983	deciduous	3	1
5078	Tafoni	31	3
5079	42	33	3
5080	4	34	3
5081	5	35	3
5237	Skalní mísa	31	3
5238	60	33	3
5239	15	34	3
5240	72	35	3
5241	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5396	Skalní mísa	31	3
5398	114	33	3
5400	12	34	3
5402	91	35	3
5404	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5550	Balvany	32	4
5551	8 m	37	4
5552	5 m	38	4
5553	5 m	39	4
5722	Skalní mísa	31	3
5723	120	33	3
5725	17	34	3
5727	44	35	3
5729	3;8	36	3
5905	Skalní mísa	31	3
5906	120	33	3
5907	17	34	3
5908	44	35	3
5909	3;8	36	3
6085	Skalní mísa	31	3
6086	120	33	3
6087	17	34	3
6088	44	35	3
6089	3;8	36	3
6265	Skalní mísa	31	3
6267	120	33	3
6268	17	34	3
6270	44	35	3
6273	3;8	36	3
6445	Skalní mísa	31	3
6446	120	33	3
6447	17	34	3
6448	44	35	3
6449	3;8	36	3
6625	Skalní mísa	31	3
6626	120	33	3
6627	17	34	3
6628	44	35	3
6629	3;8	36	3
6805	Skalní mísa	31	3
6807	120	33	3
6808	17	34	3
6810	44	35	3
6812	3;8	36	3
6985	Skalní mísa	31	3
6986	120	33	3
6987	17	34	3
6988	44	35	3
6989	3;8	36	3
7165	Skalní mísa	31	3
7166	120	33	3
7167	17	34	3
7168	44	35	3
7169	3;8	36	3
7341	Skalní mísa	31	3
7343	120	33	3
7345	17	34	3
7347	44	35	3
7349	3;8	36	3
7525	Skalní mísa	31	3
7528	120	33	3
7529	17	34	3
7532	44	35	3
7534	3;8	36	3
7704	Skalní mísa	31	3
7705	15	33	3
7706	8	34	3
7707	15	35	3
7708	4;10	36	3
7874	Balvany	32	4
7875	2,6 m	37	4
7876	1,5 m	38	4
7877	3 m	39	4
7878	Vodicka19-22	40	4
7984	forest stand	4	1
7985	coniferous	3	1
5082	Balvany	32	4
5083	42	37	4
5084	4	38	4
5085	6	39	4
5242	Skalní mísa	31	3
5243	128	33	3
5244	20	34	3
5245	72	35	3
5246	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5401	Skalní mísa	31	3
5403	114	33	3
5405	12	34	3
5406	91	35	3
5407	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5554	Balvany	32	4
5555	3 m	37	4
5556	2 m	38	4
5557	3,5 m	39	4
5730	Skalní mísa	31	3
5731	120	33	3
5732	17	34	3
5733	44	35	3
5734	3;8	36	3
5910	Skalní mísa	31	3
5911	120	33	3
5912	17	34	3
5914	44	35	3
5916	3;8	36	3
6090	Skalní mísa	31	3
6091	120	33	3
6092	17	34	3
6093	44	35	3
6094	3;8	36	3
6266	Skalní mísa	31	3
6269	120	33	3
6272	17	34	3
6275	44	35	3
6277	3;8	36	3
6450	Skalní mísa	31	3
6451	120	33	3
6452	17	34	3
6453	44	35	3
6454	3;8	36	3
6630	Skalní mísa	31	3
6631	120	33	3
6632	17	34	3
6633	44	35	3
6634	3;8	36	3
6806	Skalní mísa	31	3
6809	120	33	3
6811	17	34	3
6813	44	35	3
6815	3;8	36	3
6990	Skalní mísa	31	3
6991	120	33	3
6992	17	34	3
6993	44	35	3
6994	3;8	36	3
7170	Skalní mísa	31	3
7171	120	33	3
7172	17	34	3
7173	44	35	3
7174	3;8	36	3
7350	Skalní mísa	31	3
7351	120	33	3
7352	17	34	3
7353	44	35	3
7354	3;8	36	3
7526	Skalní mísa	31	3
7527	120	33	3
7530	17	34	3
7531	44	35	3
7533	3;8	36	3
7709	Žlábkové škrapy	31	3
7710	76	33	3
7711	4	34	3
7712	42	35	3
7713	401	36	3
7879	Skalní hřiby	32	4
7880	2,3 m	37	4
7881	1,3 m	38	4
7882	1,4 m	39	4
7883	Vodicka19-22	40	4
7986	city or other type of development	4	1
7987	deciduous	3	1
5086	Balvany	32	4
5087	42	37	4
5088	4	38	4
5089	7	39	4
5247	Skalní mísa	31	3
5248	76	33	3
5249	5	34	3
5250	76	35	3
5251	Skalní mísa s vyvynutym odtokovým kanálem	36	3
5408	Skalní mísa	31	3
5409	114	33	3
5410	12	34	3
5411	91	35	3
5412	Skalní mísa s vyvýjejícím se odtokovým kanálem	36	3
5558	Skalní mísa	31	3
5559	91	33	3
5560	11	34	3
5561	46	35	3
5562	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5735	Skalní mísa	31	3
5736	120	33	3
5737	17	34	3
5738	44	35	3
5739	3;8	36	3
5913	Skalní mísa	31	3
5915	120	33	3
5917	17	34	3
5918	44	35	3
5919	3;8	36	3
6095	Skalní mísa	31	3
6096	120	33	3
6097	17	34	3
6098	44	35	3
6099	3;8	36	3
6271	Skalní mísa	31	3
6274	120	33	3
6276	17	34	3
6278	44	35	3
6279	3;8	36	3
6455	Skalní mísa	31	3
6456	120	33	3
6457	17	34	3
6458	44	35	3
6459	3;8	36	3
6635	Skalní mísa	31	3
6636	120	33	3
6637	17	34	3
6638	44	35	3
6639	3;8	36	3
6814	Skalní mísa	31	3
6816	120	33	3
6817	17	34	3
6818	44	35	3
6819	3;8	36	3
6995	Skalní mísa	31	3
6996	120	33	3
6997	17	34	3
6998	44	35	3
6999	3;8	36	3
7175	Skalní mísa	31	3
7176	120	33	3
7177	17	34	3
7178	44	35	3
7179	3;8	36	3
7355	Skalní mísa	31	3
7356	120	33	3
7357	17	34	3
7359	44	35	3
7361	3;8	36	3
7535	Skalní mísa	31	3
7536	120	33	3
7537	17	34	3
7538	44	35	3
7539	3;8	36	3
7714	Skalní mísa	31	3
7715	38	33	3
7716	3	34	3
7717	33	35	3
7718	3;11	36	3
7884	Žlábkové škrapy	31	3
7885	82 cm	33	3
7886	23 cm	34	3
7887	17 cm	35	3
7888	Vodicka21-22	36	3
7988	rock outcrop or other extreme habitat	4	1
5090	Voštiny	31	3
5091	42	33	3
5092	4	34	3
5093	8	35	3
5252	131	33	3
5253	9	34	3
5254	102	35	3
5255	Skalní mísa s vyvynutym odtokovým kanálem	36	3
5413	Balvany	32	4
5414	4 m	37	4
5415	1.5 m	38	4
5416	2 m	39	4
5563	Skalní mísa	31	3
5564	40	33	3
5565	6	34	3
5566	30	35	3
5567	Mísa s rozlehlým odtokovým kanálkem	36	3
5740	Skalní mísa	31	3
5742	120	33	3
5744	17	34	3
5746	44	35	3
5748	3;8	36	3
5920	Skalní mísa	31	3
5921	120	33	3
5922	17	34	3
5923	44	35	3
5924	3;8	36	3
6100	Skalní mísa	31	3
6101	120	33	3
6102	17	34	3
6103	44	35	3
6104	3;8	36	3
6280	Skalní mísa	31	3
6281	120	33	3
6282	17	34	3
6283	44	35	3
6284	3;8	36	3
6460	Skalní mísa	31	3
6461	120	33	3
6462	17	34	3
6463	44	35	3
6464	3;8	36	3
6640	Skalní mísa	31	3
6641	120	33	3
6642	17	34	3
6643	44	35	3
6645	3;8	36	3
6820	Skalní mísa	31	3
6821	120	33	3
6822	17	34	3
6823	44	35	3
6824	3;8	36	3
7000	Skalní mísa	31	3
7001	120	33	3
7002	17	34	3
7003	44	35	3
7004	3;8	36	3
7180	Skalní mísa	31	3
7186	120	33	3
7187	17	34	3
7188	44	35	3
7189	3;8	36	3
7358	Skalní mísa	31	3
7360	120	33	3
7362	17	34	3
7363	44	35	3
7364	3;8	36	3
7540	Skalní mísa	31	3
7542	120	33	3
7544	17	34	3
7546	44	35	3
7548	3;8	36	3
7719	Žlábkové škrapy	31	3
7720	103	33	3
7721	6	34	3
7722	80	35	3
7723	402	36	3
7889	Skalní mísa	31	3
7890	90 cm	33	3
7891	17 cm	34	3
7892	60 cm	35	3
7893	Vodicka22-22	36	3
7989	forest stand	4	1
5094	Balvany	32	4
5095	42	37	4
5096	4	38	4
5097	9	39	4
5256	Skalní mísa	31	3
5257	55	33	3
5258	13	34	3
5259	54	35	3
5260	Skalní mísa s vyvynutym odtokovým kanálem	36	3
5417	Skalní mísa	31	3
5418	80	33	3
5419	12	34	3
5420	54	35	3
5568	Skalní mísa	31	3
5569	105	33	3
5570	25	34	3
5571	70	35	3
5572	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5741	Skalní mísa	31	3
5743	120	33	3
5745	17	34	3
5747	44	35	3
5749	3;8	36	3
5925	Skalní mísa	31	3
5928	120	33	3
5930	17	34	3
5932	44	35	3
5934	3;8	36	3
6105	Skalní mísa	31	3
6106	120	33	3
6107	17	34	3
6108	44	35	3
6109	3;8	36	3
6285	Skalní mísa	31	3
6286	120	33	3
6288	17	34	3
6290	44	35	3
6292	3;8	36	3
6465	Skalní mísa	31	3
6466	120	33	3
6468	17	34	3
6469	44	35	3
6472	3;8	36	3
6644	Skalní mísa	31	3
6646	120	33	3
6647	17	34	3
6648	44	35	3
6649	3;8	36	3
6825	Skalní mísa	31	3
6827	120	33	3
6829	17	34	3
6831	44	35	3
6833	3;8	36	3
7005	Skalní mísa	31	3
7006	120	33	3
7007	17	34	3
7009	44	35	3
7011	3;8	36	3
7181	Skalní mísa	31	3
7182	120	33	3
7183	17	34	3
7184	44	35	3
7185	3;8	36	3
7365	Skalní mísa	31	3
7366	120	33	3
7367	17	34	3
7368	44	35	3
7369	3;8	36	3
7541	Skalní mísa	31	3
7543	120	33	3
7545	17	34	3
7547	44	35	3
7549	3;8	36	3
7724	Skalní mísa	31	3
7725	32	33	3
7726	2	34	3
7727	23	35	3
7728	1;13	36	3
7894	Skalní mísa	31	3
7895	50 cm	33	3
7896	6 cm	34	3
7897	40 cm	35	3
7898	Vodicka23-22	36	3
7990	forest stand	4	1
5098	Balvany	32	4
5261	Balvany	32	4
5262	5 m	37	4
5263	4 m	38	4
5264	3 m	39	4
5421	Skalní mísa	31	3
5422	66	33	3
5423	14	34	3
5424	47	35	3
5573	Skalní mísa	31	3
5574	105	33	3
5575	25	34	3
5576	70	35	3
5577	Skalní mísa s rozsáhlým odtokovým kanálem	36	3
5750	Skalní mísa	31	3
5751	120	33	3
5752	17	34	3
5754	44	35	3
5755	3;8	36	3
5926	Skalní mísa	31	3
5927	120	33	3
5929	17	34	3
5931	44	35	3
5933	3;8	36	3
6110	Skalní mísa	31	3
6112	120	33	3
6114	17	34	3
6117	44	35	3
6119	3;8	36	3
6287	Skalní mísa	31	3
6289	120	33	3
6291	17	34	3
6293	44	35	3
6294	3;8	36	3
6467	Skalní mísa	31	3
6470	120	33	3
6471	17	34	3
6473	44	35	3
6474	3;8	36	3
6650	Skalní mísa	31	3
6651	120	33	3
6652	17	34	3
6653	44	35	3
6654	3;8	36	3
6826	Skalní mísa	31	3
6828	120	33	3
6830	17	34	3
6832	44	35	3
6834	3;8	36	3
7008	Skalní mísa	31	3
7010	120	33	3
7012	17	34	3
7013	44	35	3
7014	3;8	36	3
7190	Skalní mísa	31	3
7191	120	33	3
7192	17	34	3
7193	44	35	3
7194	3;8	36	3
7370	Skalní mísa	31	3
7371	120	33	3
7372	17	34	3
7373	44	35	3
7374	3;8	36	3
7550	Skalní mísa	31	3
7551	120	33	3
7552	17	34	3
7553	44	35	3
7554	3;8	36	3
7729	Skalní mísa	31	3
7730	22	33	3
7731	6	34	3
7732	19	35	3
7733	3;14	36	3
7899	Skalní mísa	31	3
7900	50 cm	33	3
7901	14 cm	34	3
7902	36 cm	35	3
7903	Vodicka24-22	36	3
7991	solitaire in the landscape	4	1
7992	deciduous	3	1
5099	Balvany	32	4
5265	Balvany	32	4
5266	6 m	37	4
5267	5 m	38	4
5268	4 m	39	4
5425	Skalní mísa	31	3
5426	49	33	3
5427	20	34	3
5428	37	35	3
5578	Skalní mísa	31	3
5579	41	33	3
5580	10	34	3
5581	37	35	3
5582	Skalní mísa s vyvinutým odtokovým kanálem	36	3
5753	Skalní mísa	31	3
5756	120	33	3
5758	17	34	3
5759	44	35	3
5762	3;8	36	3
5935	Skalní mísa	31	3
5936	120	33	3
5937	17	34	3
5938	44	35	3
5939	3;8	36	3
6111	Skalní mísa	31	3
6113	120	33	3
6115	17	34	3
6116	44	35	3
6118	3;8	36	3
6295	Skalní mísa	31	3
6296	120	33	3
6297	17	34	3
6298	44	35	3
6299	3;8	36	3
6475	Skalní mísa	31	3
6477	120	33	3
6479	17	34	3
6481	44	35	3
6484	3;8	36	3
6655	Skalní mísa	31	3
6657	120	33	3
6659	17	34	3
6661	44	35	3
6663	3;8	36	3
6835	Skalní mísa	31	3
6837	120	33	3
6839	17	34	3
6841	44	35	3
6843	3;8	36	3
7015	Skalní mísa	31	3
7016	120	33	3
7017	17	34	3
7018	44	35	3
7019	3;8	36	3
7195	Skalní mísa	31	3
7196	120	33	3
7197	17	34	3
7198	44	35	3
7199	3;8	36	3
7375	Skalní mísa	31	3
7377	120	33	3
7379	17	34	3
7381	44	35	3
7383	3;8	36	3
7555	Skalní mísa	31	3
7556	120	33	3
7558	17	34	3
7559	44	35	3
7562	3;8	36	3
7734	Skalní mísa	31	3
7735	65	33	3
7736	5	34	3
7737	51	35	3
7738	4;16	36	3
7993	solitaire in the landscape	4	1
7994	deciduous	3	1
5100	Skalní mísa	31	3
5101	90	33	3
5102	20	34	3
5103	115	35	3
5104	Skalní mísa s odtokovým kanálem	36	3
5269	Balvany	32	4
5270	3,5 m	37	4
5271	2	38	4
5272	2	39	4
5429	Skalní mísa	31	3
5430	200	33	3
5431	112	34	3
5432	65	35	3
5433	Největší skalní mísa dle Věžník (1979). Patrné nové zahloubení, vyplněna vodou a detritem.	36	3
5583	Skalní mísa	31	3
5584	30	33	3
5585	2	34	3
5586	30	35	3
5587	Senilní	36	3
5757	Skalní mísa	31	3
5760	120	33	3
5761	17	34	3
5763	44	35	3
5764	3;8	36	3
5940	Skalní mísa	31	3
5941	120	33	3
5943	17	34	3
5945	44	35	3
5947	3;8	36	3
6120	Skalní mísa	31	3
6121	120	33	3
6122	17	34	3
6124	44	35	3
6127	3;8	36	3
6300	Skalní mísa	31	3
6302	120	33	3
6304	17	34	3
6306	44	35	3
6308	3;8	36	3
6476	Skalní mísa	31	3
6478	120	33	3
6480	17	34	3
6482	44	35	3
6483	3;8	36	3
6656	Skalní mísa	31	3
6658	120	33	3
6660	17	34	3
6662	44	35	3
6664	3;8	36	3
6836	Skalní mísa	31	3
6838	120	33	3
6840	17	34	3
6842	44	35	3
6844	3;8	36	3
7020	Skalní mísa	31	3
7021	120	33	3
7022	17	34	3
7023	44	35	3
7025	3;8	36	3
7200	Skalní mísa	31	3
7201	120	33	3
7202	17	34	3
7203	44	35	3
7204	3;8	36	3
7376	Skalní mísa	31	3
7378	120	33	3
7380	17	34	3
7382	44	35	3
7384	3;8	36	3
7557	Skalní mísa	31	3
7560	120	33	3
7561	17	34	3
7563	44	35	3
7564	3;8	36	3
7739	Skalní mísa	31	3
7740	46	33	3
7741	6	34	3
7742	45	35	3
7743	4;15	36	3
7995	solitaire in the landscape	4	1
5105	Skalní mísa	31	3
5106	90	33	3
5107	20	34	3
5108	115	35	3
5109	Skalní mísa s odtokovým kanálem	36	3
5273	Balvany	32	4
5274	3	37	4
5275	2.5	38	4
5276	2	39	4
5434	Balvany	32	4
5435	6 m	37	4
5436	4 m	38	4
5437	3 m	39	4
5588	Skalní mísa	31	3
5589	80	33	3
5590	12	34	3
5591	50	35	3
5592	Iniciální skalní mísa	36	3
5765	Skalní mísa	31	3
5766	120	33	3
5767	17	34	3
5768	44	35	3
5769	3;8	36	3
5942	Skalní mísa	31	3
5944	120	33	3
5946	17	34	3
5948	44	35	3
5949	3;8	36	3
6123	Skalní mísa	31	3
6126	120	33	3
6129	17	34	3
6131	44	35	3
6133	3;8	36	3
6301	Skalní mísa	31	3
6303	120	33	3
6305	17	34	3
6307	44	35	3
6309	3;8	36	3
6485	Skalní mísa	31	3
6486	120	33	3
6487	17	34	3
6488	44	35	3
6489	3;8	36	3
6665	Skalní mísa	31	3
6666	120	33	3
6667	17	34	3
6668	44	35	3
6669	3;8	36	3
6845	Skalní mísa	31	3
6847	120	33	3
6849	17	34	3
6851	44	35	3
6853	3;8	36	3
7024	Skalní mísa	31	3
7026	120	33	3
7027	17	34	3
7028	44	35	3
7029	3;8	36	3
7205	Skalní mísa	31	3
7206	120	33	3
7207	17	34	3
7208	44	35	3
7209	3;8	36	3
7385	Skalní mísa	31	3
7386	120	33	3
7387	17	34	3
7388	44	35	3
7389	3;8	36	3
7565	Skalní mísa	31	3
7566	120	33	3
7567	17	34	3
7568	44	35	3
7569	3;8	36	3
7744	Skalní mísa	31	3
7745	39	33	3
7746	4	34	3
7747	35	35	3
7748	4;17	36	3
7996	forest stand	4	1
7997	deciduous	3	1
5110	Skalní mísa	31	3
5111	50	33	3
5112	12	34	3
5113	47	35	3
5114	Skalní mísa s odtokovým kanálem	36	3
5277	Viklany	32	4
5278	8	37	4
5279	3	38	4
5280	3.5	39	4
5438	Balvany	32	4
5439	10 m	37	4
5440	2 m	38	4
5441	6 m	39	4
5593	Skalní mísa	31	3
5594	51	33	3
5595	7	34	3
5596	41	35	3
5597	4	36	3
5770	Skalní mísa	31	3
5771	120	33	3
5772	17	34	3
5774	44	35	3
5776	3;8	36	3
5950	Skalní mísa	31	3
5951	120	33	3
5952	17	34	3
5953	44	35	3
5954	3;8	36	3
6125	Skalní mísa	31	3
6128	120	33	3
6130	17	34	3
6132	44	35	3
6134	3;8	36	3
6310	Skalní mísa	31	3
6311	120	33	3
6312	17	34	3
6313	44	35	3
6314	3;8	36	3
6490	Skalní mísa	31	3
6491	120	33	3
6492	17	34	3
6493	44	35	3
6494	3;8	36	3
6670	Skalní mísa	31	3
6671	120	33	3
6672	17	34	3
6673	44	35	3
6675	3;8	36	3
6846	Skalní mísa	31	3
6848	120	33	3
6850	17	34	3
6852	44	35	3
6854	3;8	36	3
7030	Skalní mísa	31	3
7031	120	33	3
7032	17	34	3
7033	44	35	3
7034	3;8	36	3
7210	Skalní mísa	31	3
7211	120	33	3
7212	17	34	3
7215	44	35	3
7217	3;8	36	3
7390	Skalní mísa	31	3
7391	120	33	3
7392	17	34	3
7393	44	35	3
7394	3;8	36	3
7570	Skalní mísa	31	3
7571	120	33	3
7572	17	34	3
7573	44	35	3
7575	3;8	36	3
7749	Skalní hradby/izolované skály	32	4
7750	6m	37	4
7751	3m	38	4
7752	5m	39	4
7998	forest stand	4	1
7999	deciduous	3	1
5115	Skalní mísa	31	3
5116	90	33	3
5117	13	34	3
5118	67	35	3
5119	Skalní mísa s dvěma odtokovými kanály	36	3
5281	Viklany	32	4
5282	7	37	4
5283	2	38	4
5284	4	39	4
5442	Balvany	32	4
5444	10 m	37	4
5446	2 m	38	4
5448	6 m	39	4
5598	Balvany	32	4
5599	300	37	4
5600	200	38	4
5601	250	39	4
5773	Skalní mísa	31	3
5775	120	33	3
5777	17	34	3
5778	44	35	3
5779	3;8	36	3
5955	Skalní mísa	31	3
5956	120	33	3
5958	17	34	3
5959	44	35	3
5961	3;8	36	3
6135	Skalní mísa	31	3
6136	120	33	3
6137	17	34	3
6138	44	35	3
6139	3;8	36	3
6315	Skalní mísa	31	3
6317	120	33	3
6319	17	34	3
6321	44	35	3
6324	3;8	36	3
6495	Skalní mísa	31	3
6496	120	33	3
6497	17	34	3
6498	44	35	3
6500	3;8	36	3
6674	Skalní mísa	31	3
6676	120	33	3
6677	17	34	3
6678	44	35	3
6679	3;8	36	3
6855	Skalní mísa	31	3
6857	120	33	3
6859	17	34	3
6860	44	35	3
6862	3;8	36	3
7035	Skalní mísa	31	3
7036	120	33	3
7037	17	34	3
7038	44	35	3
7039	3;8	36	3
7213	Skalní mísa	31	3
7214	120	33	3
7216	17	34	3
7218	44	35	3
7219	3;8	36	3
7395	Skalní mísa	31	3
7396	120	33	3
7397	17	34	3
7398	44	35	3
7399	3;8	36	3
7574	Skalní mísa	31	3
7576	120	33	3
7577	17	34	3
7578	44	35	3
7579	3;8	36	3
7753	Skalní hradby/izolované skály	32	4
7754	2,5m	37	4
7755	1,2m	38	4
7756	1,5m	39	4
8000	forest stand	4	1
8001	coniferous	3	1
4978	Balvany	32	4
4979	10	37	4
4980	2	38	4
4981	8	39	4
4982	Hromada balvanů za chatou	40	4
\.


--
-- Data for Name: api_phenomenonphoto; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_phenomenonphoto (id, image, owner_id, parameter_id, observation_id) FROM stdin;
97	photos/10315f87-7ac.jpg	90	\N	14920
98	photos/c83df84d-e39.jpg	90	\N	14921
99	photos/317b2284-eb2.jpg	90	\N	14922
100	photos/a78c1a9e-2ff.jpg	90	\N	14923
101	photos/a8af637b-fc3.jpg	90	\N	14924
102	photos/7e22f71d-39b.jpg	90	\N	14925
103	photos/c108d376-9b6.jpg	90	\N	14926
104	photos/762bfef6-29f.jpg	90	\N	14927
105	photos/e589dc34-c62.jpg	90	\N	14928
106	photos/5cdb8ced-772.jpg	90	\N	14929
107	photos/1c5bb60a-fc9.jpg	90	\N	14930
108	photos/c00bf9ab-4a3.jpg	90	\N	14931
109	photos/68e29374-5c5.jpg	90	\N	14932
110	photos/90d68e26-1c8.jpg	90	\N	14938
111	photos/ba8c110d-81b.jpg	90	\N	14940
112	photos/59af863f-ba6.jpg	90	\N	14941
122	photos/756b847f-514.jpg	90	\N	14942
123	photos/169cb0f0-163.jpg	90	\N	14943
124	photos/0ff0348b-256.jpg	80	\N	14966
125	photos/3ed03d9c-147.jpg	80	\N	14967
126	photos/887372fe-b41.jpg	80	\N	14967
127	photos/677f1732-876.jpg	90	\N	14974
128	photos/c2e0f85e-ed0.jpg	90	\N	14990
129	photos/307114a8-77f.jpg	90	\N	14991
130	photos/1cdb4044-9d6.jpg	90	\N	14992
131	photos/b0f9cf42-59a.jpg	90	\N	14998
132	photos/11374d07-5ae.jpg	90	\N	14999
133	photos/116c73b2-a65.jpg	80	\N	15000
134	photos/9aa0a515-4b5.jpg	80	\N	15001
135	photos/7ac56808-0a0.jpg	80	\N	15439
136	photos/a873ac80-6f7.jpg	80	\N	15440
137	photos/8137ef50-6e5.jpg	80	\N	15441
138	photos/112e3a9a-d84.jpg	80	\N	15442
139	photos/c4fb8919-79f.jpg	80	\N	15445
140	photos/c3f1515b-7d8.jpg	91	\N	15007
141	photos/e3471f2d-712.jpg	91	\N	15008
142	photos/3ecfd328-3e4.jpg	91	\N	15009
143	photos/dfeb55a0-164.jpg	91	\N	15010
144	photos/2176ad15-f02.jpg	91	\N	15011
145	photos/07bc8c96-d65.jpg	91	\N	15012
146	photos/0cfa696f-ede.jpg	91	\N	15013
147	photos/ba01cc85-e2d.jpg	91	\N	15014
148	photos/59fca940-a6f.jpg	91	\N	15014
149	photos/22f3fafe-c57.jpg	91	\N	15015
150	photos/54eaecba-f3e.jpg	91	\N	15016
70	photos/d95e0893-120.jpg	90	\N	14897
71	photos/e59dee79-883.jpg	90	\N	14898
72	photos/c93aa552-17f.jpg	90	\N	14899
73	photos/f26ec19d-297.jpg	90	\N	14900
74	photos/8a00e190-2f9.jpg	90	\N	14901
75	photos/e5d03ba6-81e.jpg	90	\N	14902
76	photos/15b2f783-e7e.jpg	90	\N	14903
77	photos/56f68ee3-a65.jpg	90	\N	14904
78	photos/7c6ee300-b55.jpg	90	\N	14905
79	photos/ac35d0a1-3dd.jpg	90	\N	14906
80	photos/6b8e1e97-622.jpg	90	\N	14907
81	photos/957a0cd2-427.jpg	90	\N	14907
82	photos/5977161e-2f6.jpg	90	\N	14907
83	photos/426899e6-9da.jpg	90	\N	14908
84	photos/6786e8bd-1f3.jpg	90	\N	14908
85	photos/cb15fe06-cf0.jpg	90	\N	14908
86	photos/9f726b4f-2af.jpg	90	\N	14909
87	photos/a464ecf6-e94.jpg	90	\N	14910
88	photos/80768c6d-966.jpg	90	\N	14911
89	photos/888db4d8-a51.jpg	90	\N	14912
90	photos/1c9dd391-086.jpg	90	\N	14913
91	photos/aa13b2f5-11f.jpg	90	\N	14914
92	photos/3afb1703-f20.jpg	90	\N	14915
93	photos/a5e04b89-de7.jpg	90	\N	14916
94	photos/5f57f80b-564.jpg	90	\N	14917
95	photos/2431f51c-772.jpg	90	\N	14918
96	photos/2b20a61d-281.jpg	90	\N	14919
\.


--
-- Data for Name: api_userprofile; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_userprofile (id, first_name, last_name, age, education, user_id, gender, qualification) FROM stdin;
6	Petr	Kubicek	54	\N	78	\N	\N
8	Petr	Vodička	21	2	82	1	2
10	Jakub	Řehák	22	3	81	1	2
11	Simona 	Bučková 	21	2	85	2	2
12	Jitka	Zackova	20	2	88	2	2
7	Pan	Banán	13	1	21	2	3
13	David	Chovanec	22	2	92	\N	2
14	jiapeng	Xu	23	1	94	1	2
\.


--
-- Data for Name: api_version; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.api_version (id, name, version) FROM stdin;
2	localization	1.3
1	config	1.2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add user profile	7	add_userprofile
20	Can change user profile	7	change_userprofile
21	Can delete user profile	7	delete_userprofile
22	Can add help	8	add_help
23	Can change help	8	change_help
24	Can delete help	8	delete_help
25	Can add observation	9	add_observation
26	Can change observation	9	change_observation
27	Can delete observation	9	delete_observation
28	Can add drought	10	add_drought
29	Can change drought	10	change_drought
30	Can delete drought	10	delete_drought
31	Can add observation phenomenon	11	add_observationphenomenon
32	Can change observation phenomenon	11	change_observationphenomenon
33	Can delete observation phenomenon	11	delete_observationphenomenon
34	Can add help pictures	12	add_helppictures
35	Can change help pictures	12	change_helppictures
36	Can delete help pictures	12	delete_helppictures
37	Can add phenomenon	13	add_phenomenon
38	Can change phenomenon	13	change_phenomenon
39	Can delete phenomenon	13	delete_phenomenon
40	Can add Token	14	add_token
41	Can change Token	14	change_token
42	Can delete Token	14	delete_token
43	Can add site	15	add_site
44	Can change site	15	change_site
45	Can delete site	15	delete_site
46	Can add email address	16	add_emailaddress
47	Can change email address	16	change_emailaddress
48	Can delete email address	16	delete_emailaddress
49	Can add email confirmation	17	add_emailconfirmation
50	Can change email confirmation	17	change_emailconfirmation
51	Can delete email confirmation	17	delete_emailconfirmation
52	Can add social application	18	add_socialapp
53	Can change social application	18	change_socialapp
54	Can delete social application	18	delete_socialapp
55	Can add social account	19	add_socialaccount
56	Can change social account	19	change_socialaccount
57	Can delete social account	19	delete_socialaccount
58	Can add social application token	20	add_socialtoken
59	Can change social application token	20	change_socialtoken
60	Can delete social application token	20	delete_socialtoken
61	Can add dictionary	21	add_dictionary
62	Can change dictionary	21	change_dictionary
63	Can delete dictionary	21	delete_dictionary
64	Can add metadata observation	22	add_metadataobservation
65	Can change metadata observation	22	change_metadataobservation
66	Can delete metadata observation	22	delete_metadataobservation
67	Can add parameter	23	add_parameter
68	Can change parameter	23	change_parameter
69	Can delete parameter	23	delete_parameter
70	Can add category	24	add_category
71	Can change category	24	change_category
72	Can delete category	24	delete_category
73	Can add phenomenon parameter value	25	add_phenomenonparametervalue
74	Can change phenomenon parameter value	25	change_phenomenonparametervalue
75	Can delete phenomenon parameter value	25	delete_phenomenonparametervalue
76	Can add phenomenon photo	26	add_phenomenonphoto
77	Can change phenomenon photo	26	change_phenomenonphoto
78	Can delete phenomenon photo	26	delete_phenomenonphoto
79	Can add localization	27	add_localization
80	Can change localization	27	change_localization
81	Can delete localization	27	delete_localization
82	Can add phenomenon localization	28	add_phenomenonlocalization
83	Can change phenomenon localization	28	change_phenomenonlocalization
84	Can delete phenomenon localization	28	delete_phenomenonlocalization
85	Can add category localization	29	add_categorylocalization
86	Can change category localization	29	change_categorylocalization
87	Can delete category localization	29	delete_categorylocalization
88	Can add parameter localization	30	add_parameterlocalization
89	Can change parameter localization	30	change_parameterlocalization
90	Can delete parameter localization	30	delete_parameterlocalization
91	Can add dictionary localization	31	add_dictionarylocalization
92	Can change dictionary localization	31	change_dictionarylocalization
93	Can delete dictionary localization	31	delete_dictionarylocalization
94	Can add help localization	32	add_helplocalization
95	Can change help localization	32	change_helplocalization
96	Can delete help localization	32	delete_helplocalization
97	Can add version	33	add_version
98	Can change version	33	change_version
99	Can delete version	33	delete_version
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
99	pbkdf2_sha256$36000$ZPlq8QzlmOF4$Fqkr9PoouWD816tB5sVoJYrjOq/graVCVyPuVgvJHUU=	2019-01-30 07:59:11.568245+01	f	AndyZang			zkyzkyex@gmail.com	f	t	2019-01-30 07:48:14.437543+01
94	pbkdf2_sha256$36000$SnjYQlDDhofF$IM6wFAo71LQ4endy+qfOc77X5Zq2GMgE2Oes6noidKE=	2019-01-30 08:25:01.681565+01	f	august			jiapengxu18@163.com	f	t	2019-01-20 02:02:04.607263+01
98	!2VGiIf0R9KkEzUx6gyzvm29P2lBfoFNqbDtGbNRn	2019-02-06 09:02:20.86464+01	f	petr	Petr	Šilhák	petrsilhak@gmail.com	f	t	2019-01-29 21:53:28.188436+01
81	pbkdf2_sha256$36000$Wim3JESf62Y1$0RlUsQnv0szxbLdC7/68MtGF9zJHQCI2/tNbndttiFw=	2018-05-20 15:40:38.072932+02	f	Kuba			460401@mail.muni.cz	f	t	2018-05-20 11:33:19.287396+02
1	pbkdf2_sha256$36000$nPXs1dYExPXW$pZ5Ixq8Ce8zG/dg54s5wAu1pGqSkrDRRLJj1kG+jNNs=	2019-02-06 10:07:00.05953+01	t	zelda			petrsilhak@hotmail.com	t	t	2017-09-07 19:51:50.097946+02
92	pbkdf2_sha256$36000$FReq66qVG1xq$FOTWxc64cAj5hDk2WyIcy60PZXXLqrRM9ExA3BofiCo=	2018-05-22 19:16:56.122151+02	f	Dejvostroj			chovanec.d@seznam.cz	f	t	2018-05-22 19:07:43.752873+02
85	pbkdf2_sha256$36000$sseAo9U8uVtj$wU7nwpIFmHfSvScK2ORpNr+9vBPfnO/gDM4O3X7o5vk=	2018-05-20 19:27:51.278145+02	f	x461153			simi.buckova@gmail.com	f	t	2018-05-20 19:25:52.140938+02
86	pbkdf2_sha256$36000$3zT8JsMS3zFU$Vs0js/zENC4RNmTMtG++QvlVMeC+FxHnU7Kh5+A+j3I=	2018-05-20 19:50:58.862404+02	f	Anetaryglova			anetryglova@seznam.cz	f	t	2018-05-20 19:42:24.406732+02
87	!Wn3HwFLd6h6JMKYrXxKIUS118bokVH8KkFgtvyUf	2018-05-20 20:26:44.606832+02	f	zanet	Žanet	Rezková	zaneta.1996@seznam.cz	f	t	2018-05-20 20:26:44.499026+02
88	pbkdf2_sha256$36000$ug6fQx5TcLlU$0lSu3AQkxVOgVxTqjBM8QKCPHgF/09fQ6QPrzHsSWuI=	2018-05-20 21:57:42.049216+02	f	JitkaZackova			zacekjity@seznam.cz	f	t	2018-05-20 21:49:51.134984+02
21	pbkdf2_sha256$36000$g6KueB4ChFJ5$t09ffTL8hER8CAlzHewMbTuUy7bIPEBiXToU5POEnSI=	2018-05-23 17:25:32.117252+02	f	LeSimon			leitgeb.simon@gmail.com	f	t	2017-11-16 16:32:22.312889+01
91	pbkdf2_sha256$36000$6XLkrW54Qnwl$1Y+9TrpdinTS8IFpESIEhZUS//J9frZtbHnjqiICApc=	2018-05-24 19:36:47.14214+02	f	Persing			gamesorl@seznam.cz	f	t	2018-05-22 19:07:23.288156+02
84	pbkdf2_sha256$36000$EAlAwkFMsGs1$ARu6zFRJD1NXPtA8cn5z5gLMd7+e6gX7WYUkwIbbpco=	2018-05-20 22:16:10.530729+02	f	TomasGracias			461032@mail.muni.cz	f	t	2018-05-20 14:24:05.180711+02
79	pbkdf2_sha256$36000$fBNchrt0Udpk$1f/4di02FwadmhR29I/LaLRPU+wu5yIoTA/KI4IA+ts=	2018-05-17 14:59:53.918678+02	f	zstachon			zstachon@gmail.com	f	t	2018-05-17 14:53:51.027079+02
80	pbkdf2_sha256$36000$V1VnvE2vtlJa$Wzf2lDsuv36tX4HlPlyT+qFq312SbjZGC1cLJ3UJpBc=	2018-05-18 13:51:51.910913+02	f	t.staud			t.staud@seznam.cz	f	t	2018-05-18 13:46:51.37129+02
89	pbkdf2_sha256$36000$9tOLZtv4OZRr$jUX1ddFprYBvoizIWsPBgqjqT+IF8++/wn0KUDchdeA=	2018-05-25 09:53:23.145812+02	f	SimonaBockova			eilonwynka@seznam.cz	f	t	2018-05-21 11:17:20.918825+02
90	pbkdf2_sha256$36000$B8bSASce1JZe$2k6E5hICZLpkmp8xjY73/z9yGgipP1SpfEkOIUah6OA=	2018-05-25 09:59:15.187719+02	f	Horava			rostislavhorava@gmail.com	f	t	2018-05-22 09:40:16.96612+02
82	pbkdf2_sha256$36000$uZfr0Hv9uktd$JJ0QZ24poa+GFFpU53in8aj+EHHR0Zf7fVav1xbig14=	2018-05-25 12:38:54.370652+02	f	461278			461278@mail.muni.cz	f	t	2018-05-20 12:00:46.747106+02
78	pbkdf2_sha256$36000$32rzam9s1Fpp$NE4nDSFx9x0wJq/Zv6jV34pSdYLDlOi68eXRC73tP2Y=	2018-05-31 13:37:18.666066+02	f	kubicek			kubicek@geogr.muni.cz	f	t	2018-05-16 14:07:24.037772+02
30	pbkdf2_sha256$36000$RWlhwODmtfan$G0yUSvsdjH5QbVBKOQe1vcv5Fc33SHUJzG+JU2mjlt4=	2017-11-19 18:40:09.628399+01	f	leitgeb			leitgeb@mail.muni.cz	f	t	2017-11-19 17:44:08.203502+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f69af935715217c69ec45c19990648b5ad32c188	2017-11-16 16:12:20.013695+01	1
28df339d6b19c96e2a0d7640a945b6dffe71665e	2017-11-16 16:32:22.354036+01	21
a5e40d83b519a934f055a51aee111fd60885feb0	2018-05-16 14:07:24.103079+02	78
bc2e758ec315f7d34a346b713e6781884082bf7b	2018-05-17 14:53:51.073432+02	79
54e26dd47fdcf5a08360532ba7e4c12ab0ca7b46	2018-05-18 13:46:51.413614+02	80
5eedf9ecdf308b340e838ffeb4726036c3477d32	2018-05-20 11:33:19.393144+02	81
bb1e9894ad358f47e7935b77bd93a1010bdd6deb	2018-05-20 12:00:46.788969+02	82
16b41476926125ff58b13c6eecb7539b8019e3c7	2018-05-20 14:24:05.252244+02	84
ee6f468d874c36a251d01a579e35cf4391d8405d	2018-05-20 19:25:52.182607+02	85
ec6e22f558a84b71b02da3cf460e10dd9afa3db4	2017-11-19 17:44:08.29471+01	30
e8d5b6fc5b13fa214f540f4c4adc86609a56b0a9	2018-05-20 19:42:24.480457+02	86
7ce6139c7914f7b466732757ea0951dcfc8ce2c1	2018-05-20 20:26:44.601763+02	87
1252af58acdd47a6340faf96a9e58e01fb850624	2018-05-20 21:49:51.174561+02	88
20daa67492a30844b797d9457560f5a9e0ed0c5c	2018-05-21 11:17:20.959721+02	89
ff2d71a57eac1ae6ff7c343fad52b950d51fc61b	2018-05-22 09:40:17.031386+02	90
6de07d98bee0bee6b73253a36d277fade90a14df	2018-05-22 19:07:23.339663+02	91
8451ec2f5f2b7f3520792b52a3daad7ae0fada5d	2018-05-22 19:07:43.793229+02	92
a004aaa48cdc573e20fee2a4aa1a677bd293c7e2	2019-01-20 02:02:04.770211+01	94
edc42c6bc0c0913bc281dab6cc5317441ee713db	2019-01-29 21:53:28.495173+01	98
fd25e3cd35f2b303f1de9f85b4877fea3cf0279c	2019-01-30 07:48:14.482818+01	99
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-09-09 15:39:08.356837+02	1	http://zelda.sci.muni.cz	2	[{"changed": {"fields": ["domain", "name"]}}]	15	1
2	2017-09-09 15:39:17.21777+02	1	zelda.sci.muni.cz	2	[{"changed": {"fields": ["domain", "name"]}}]	15	1
3	2017-09-09 15:42:43.527019+02	1	facebook_login	1	[{"added": {}}]	18	1
4	2017-09-09 15:48:35.882449+02	2	bulva	3		2	1
5	2017-09-09 15:51:23.898914+02	3	bulva	3		2	1
6	2017-09-09 15:58:48.807899+02	4	petr	3		2	1
7	2017-09-09 16:36:03.56595+02	1	facebook_login	2	[{"changed": {"fields": ["client_id", "secret"]}}]	18	1
8	2017-09-09 16:37:02.940965+02	5	petr	3		2	1
9	2017-09-09 16:37:26.913061+02	1	facebook_login	2	[]	18	1
10	2017-09-09 16:42:31.924927+02	6	petr	3		2	1
11	2017-09-09 16:42:57.777298+02	1	facebook_login	2	[{"changed": {"fields": ["client_id", "secret"]}}]	18	1
12	2017-09-09 22:28:55.769297+02	7		3		2	1
13	2017-09-09 22:30:18.662123+02	8		3		2	1
14	2017-09-10 15:00:02.382557+02	2	google_login	1	[{"added": {}}]	18	1
15	2017-09-10 15:03:00.712419+02	9	bulva	3		2	1
16	2017-09-10 15:04:26.557204+02	10	petr	3		2	1
17	2017-09-10 15:07:05.508007+02	11	petr	3		2	1
18	2017-09-10 15:08:05.836874+02	8	petrsilhak@hotmail.com (zelda)	2	[{"changed": {"fields": ["verified", "primary"]}}]	16	1
19	2017-09-10 18:23:11.894296+02	12	petr	3		2	1
20	2017-09-10 18:29:15.558068+02	10	petrsilhak@gmail.com (bulva)	3		16	1
21	2017-09-10 18:29:46.053793+02	13	bulva	3		2	1
22	2017-09-10 18:34:15.870148+02	14	bulva	3		2	1
23	2017-09-10 19:04:25.304971+02	12	petrsilhak@gmail.com (bulva)	3		16	1
24	2017-09-10 19:04:47.748339+02	15	bulva	3		2	1
25	2017-10-11 10:09:55.874769+02	1	Category object	1	[{"added": {}}]	24	1
26	2017-10-11 10:17:18.181178+02	1	Phenomenon object	1	[{"added": {}}]	13	1
27	2017-10-11 10:17:52.222378+02	1	Parameter object	1	[{"added": {}}]	23	1
28	2017-10-11 10:18:14.951577+02	2	Parameter object	1	[{"added": {}}]	23	1
29	2017-10-11 10:18:24.877989+02	1	Parameter object	2	[{"changed": {"fields": ["type"]}}]	23	1
30	2017-10-11 10:18:57.746799+02	3	Parameter object	1	[{"added": {}}]	23	1
31	2017-10-11 10:19:10.542017+02	4	Parameter object	1	[{"added": {}}]	23	1
32	2017-10-11 10:19:39.385913+02	5	Parameter object	1	[{"added": {}}]	23	1
33	2017-10-11 10:23:19.642392+02	1	Suchá vegetace (stromy)	1	[{"added": {}}]	8	1
34	2017-10-11 10:23:47.587775+02	1	listnatý	1	[{"added": {}}]	21	1
35	2017-10-11 10:23:56.460832+02	2	jehličnatý	1	[{"added": {}}]	21	1
36	2017-10-11 10:24:08.615304+02	3	lesní porost	1	[{"added": {}}]	21	1
37	2017-10-11 10:24:20.531151+02	4	solitér v krajině	1	[{"added": {}}]	21	1
38	2017-10-11 10:24:30.911461+02	4	solitér v krajině	2	[{"changed": {"fields": ["parameter"]}}]	21	1
39	2017-10-11 10:24:49.258673+02	5	skalní východ nebo jiné extrémní stanoviště	1	[{"added": {}}]	21	1
40	2017-10-11 10:25:08.412577+02	6	město nebo jiný druh zástavby	1	[{"added": {}}]	21	1
41	2017-10-11 10:25:18.899721+02	7	Ano	1	[{"added": {}}]	21	1
42	2017-10-11 10:25:26.372548+02	8	Ne	1	[{"added": {}}]	21	1
43	2017-10-11 10:26:04.92217+02	18	bulva	3		2	1
44	2017-10-11 10:26:04.924263+02	16	olol	3		2	1
45	2017-10-11 10:26:04.92568+02	17	test	3		2	1
46	2017-10-11 11:05:20.232957+02	1	10	1	[{"added": {}}]	25	1
47	2017-10-11 11:05:30.864293+02	2	1.2	1	[{"added": {}}]	25	1
48	2017-10-11 11:05:44.013511+02	3	listnatý	1	[{"added": {}}]	25	1
49	2017-10-11 11:06:15.357751+02	1	MetadataObservation object	1	[{"added": {}}]	22	1
50	2017-10-11 11:14:13.177814+02	1	Suchá vegetace (stromy)	2	[{"changed": {"fields": ["description"]}}]	8	1
51	2017-10-11 11:14:23.669709+02	1	Suchá vegetace (stromy)	2	[]	8	1
52	2017-10-12 21:25:42.919846+02	1	Suchá vegetace (stromy)	2	[{"changed": {"fields": ["text"]}}]	8	1
53	2017-10-14 19:10:34.981236+02	1	Drought	2	[{"changed": {"fields": ["name"]}}]	24	1
54	2017-10-14 19:14:32.109894+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["name"]}}]	13	1
55	2017-10-14 19:14:51.879024+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["name"]}}]	8	1
56	2017-10-14 19:15:17.921245+02	4	Type of location	2	[{"changed": {"fields": ["name"]}}]	23	1
57	2017-10-14 19:15:27.84386+02	3	Type of tree	2	[{"changed": {"fields": ["name"]}}]	23	1
58	2017-10-14 19:18:40.195254+02	2	Trunk diameter	2	[{"changed": {"fields": ["name"]}}]	23	1
59	2017-10-14 19:18:59.800377+02	1	Tree height	2	[{"changed": {"fields": ["name"]}}]	23	1
60	2017-10-14 19:20:21.02629+02	1	deciduous	2	[{"changed": {"fields": ["value"]}}]	21	1
61	2017-10-14 19:20:40.534411+02	2	coniferous	2	[{"changed": {"fields": ["value"]}}]	21	1
62	2017-10-14 19:22:42.167704+02	3	forest stand	2	[{"changed": {"fields": ["value"]}}]	21	1
63	2017-10-14 19:23:03.395849+02	4	solitaire in the landscape	2	[{"changed": {"fields": ["value"]}}]	21	1
64	2017-10-14 19:24:09.501301+02	5	rock outcrop or other extreme habitat	2	[{"changed": {"fields": ["value"]}}]	21	1
65	2017-10-14 19:24:41.985781+02	6	city or other type of development	2	[{"changed": {"fields": ["value"]}}]	21	1
66	2017-10-14 20:22:53.304479+02	1	Suchá vegetace (stromy)	2	[{"changed": {"fields": ["name", "text"]}}]	8	1
67	2017-10-14 20:23:05.54563+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["name"]}}]	8	1
68	2017-10-14 20:25:02.371548+02	2	Absence of mushrooms	1	[{"added": {}}]	13	1
69	2017-10-14 20:25:32.401915+02	6	Type of mushroom	1	[{"added": {}}]	23	1
70	2017-10-14 20:26:05.101956+02	7	Regularity of observation	1	[{"added": {}}]	23	1
71	2017-10-14 20:29:18.106331+02	9	more often than once a week	1	[{"added": {}}]	21	1
72	2017-10-14 20:29:34.655393+02	10	once a week	1	[{"added": {}}]	21	1
73	2017-10-14 20:29:47.308586+02	11	once a month	1	[{"added": {}}]	21	1
74	2017-10-14 20:43:01.035168+02	2	Absence of mushrooms	1	[{"added": {}}]	8	1
75	2017-10-14 20:43:17.894666+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
76	2017-10-14 22:21:51.660015+02	2	Absence of mushrooms	2	[{"changed": {"fields": ["text"]}}]	8	1
77	2017-11-16 16:28:17.941454+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
78	2018-03-05 17:07:11.124429+01	35		3		2	1
79	2018-03-05 17:07:11.170463+01	23	asdasd	3		2	1
80	2018-03-05 17:07:11.172364+01	28	asdasd56	3		2	1
81	2018-03-05 17:07:11.174073+01	32	asdasd63	3		2	1
82	2018-03-05 17:07:11.175616+01	20	bulva	3		2	1
83	2018-03-05 17:07:11.177194+01	24	bulvas	3		2	1
84	2018-03-05 17:07:11.178714+01	25	eters	3		2	1
85	2018-03-05 17:07:11.180134+01	34	petr	3		2	1
86	2018-03-05 17:07:11.181426+01	26	petrs	3		2	1
87	2018-03-05 17:07:11.182753+01	27	petrsf	3		2	1
88	2018-03-05 17:07:11.18461+01	19	petrsilhak	3		2	1
89	2018-03-05 17:07:11.186076+01	22	petrsilhak11	3		2	1
90	2018-03-05 17:07:11.187807+01	29	petrsilhak38	3		2	1
91	2018-03-05 17:07:11.189139+01	31	test	3		2	1
92	2018-03-05 17:07:11.190419+01	33	test96	3		2	1
93	2018-03-05 17:11:59.532154+01	36	petrsilhak	3		2	1
94	2018-03-05 18:04:19.836229+01	37	petrsilhak	3		2	1
95	2018-03-06 17:50:48.9661+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
96	2018-03-06 20:50:44.795774+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
97	2018-03-06 20:57:49.181815+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
98	2018-03-06 20:58:19.021751+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
99	2018-03-06 20:59:40.762613+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
100	2018-03-06 21:02:28.126734+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
101	2018-03-06 21:08:37.080671+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
102	2018-03-06 21:09:12.400166+01	1	Dry vegetation (trees)	2	[]	8	1
103	2018-03-06 21:12:14.503429+01	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["text"]}}]	8	1
104	2018-03-31 16:23:47.115688+02	1	Localization object	1	[{"added": {}}]	27	1
105	2018-03-31 16:23:59.027395+02	2	Localization object	1	[{"added": {}}]	27	1
106	2018-03-31 16:33:15.940385+02	1	UserProfile object	1	[{"added": {}}]	7	1
107	2018-04-07 20:10:21.413794+02	5	PhenomenonPhoto object	2	[{"changed": {"fields": ["observation"]}}]	26	1
108	2018-04-07 20:10:25.723576+02	4	PhenomenonPhoto object	2	[{"changed": {"fields": ["observation"]}}]	26	1
109	2018-04-07 20:10:30.060134+02	3	PhenomenonPhoto object	2	[{"changed": {"fields": ["observation"]}}]	26	1
110	2018-04-07 20:11:46.294656+02	5	PhenomenonPhoto object	2	[{"changed": {"fields": ["image"]}}]	26	1
111	2018-04-07 21:06:32.487207+02	38	petrsilhak	3		2	1
112	2018-04-07 21:12:31.999413+02	39	petrsilhak	3		2	1
113	2018-04-07 21:14:35.734445+02	40	petrsilhak	3		2	1
114	2018-04-07 21:16:06.737213+02	41	petrsilhak	3		2	1
115	2018-04-07 21:22:43.527357+02	42	petrsilhak	3		2	1
116	2018-04-07 21:26:10.722862+02	43	petrsilhak	3		2	1
117	2018-04-07 21:55:08.699429+02	44	petrsilhak	3		2	1
118	2018-04-08 10:32:32.428594+02	45	petrsilhak	3		2	1
119	2018-04-08 11:01:36.287904+02	1	zelda.sci.muni.cz	2	[{"changed": {"fields": ["name"]}}]	15	1
120	2018-04-08 11:04:10.196773+02	46	petrsilhak	3		2	1
121	2018-04-08 11:59:19.673927+02	47	petrsilhak	2	[{"changed": {"fields": ["is_staff"]}}]	2	1
122	2018-04-08 23:30:24.927761+02	47	petrsilhak	3		2	1
123	2018-04-09 00:10:39.300505+02	2	Petr Šilhák	1	[{"added": {}}]	7	1
124	2018-04-09 00:11:27.170959+02	12467	Observation from 2018-04-08 02:32:34+02:00	2	[{"changed": {"fields": ["user"]}}]	22	1
125	2018-04-10 21:31:15.398001+02	1	Lokalita	1	[{"added": {}}]	30	1
126	2018-04-10 21:31:31.119735+02	2	Lokalita	1	[{"added": {}}]	30	1
127	2018-04-10 21:31:55.000329+02	1	Lokalita	3		30	1
128	2018-04-10 21:32:10.443288+02	3	Druh stromu	1	[{"added": {}}]	30	1
129	2018-04-10 21:32:24.587424+02	4	Průměr kmene	1	[{"added": {}}]	30	1
130	2018-04-10 21:32:35.475309+02	5	Výška stromu	1	[{"added": {}}]	30	1
131	2018-04-10 21:32:44.723407+02	6	Druh houby	1	[{"added": {}}]	30	1
132	2018-04-10 21:32:54.808361+02	7	Pravidelnost pozorování	1	[{"added": {}}]	30	1
133	2018-04-10 21:33:28.647253+02	1	jehličnatý	1	[{"added": {}}]	31	1
134	2018-04-10 21:33:38.398244+02	2	jehličnatý	1	[{"added": {}}]	31	1
135	2018-04-10 21:33:46.058622+02	1	listnatý	2	[{"changed": {"fields": ["name"]}}]	31	1
136	2018-04-10 21:33:57.481749+02	3	lesní stanoviště	1	[{"added": {}}]	31	1
137	2018-04-10 21:34:08.817728+02	4	solitér v krajině	1	[{"added": {}}]	31	1
138	2018-04-10 21:34:26.060997+02	5	skální výchoz a jiné extrémní stanoviště	1	[{"added": {}}]	31	1
139	2018-04-10 21:34:40.154789+02	6	město nebo jiná zastavba	1	[{"added": {}}]	31	1
140	2018-04-10 21:34:53.732901+02	7	častěji než jednou týdně	1	[{"added": {}}]	31	1
141	2018-04-10 21:35:01.865846+02	8	jednou týdně	1	[{"added": {}}]	31	1
142	2018-04-10 21:35:12.217296+02	9	jednou za měsíc	1	[{"added": {}}]	31	1
143	2018-04-10 22:31:47.793901+02	1	Suchá vegetace (stromy)	1	[{"added": {}}]	32	1
144	2018-04-10 22:35:32.550944+02	2	Suchá Vegetace (stromy)	1	[{"added": {}}]	32	1
145	2018-04-10 22:35:48.672409+02	2	Suchá Vegetace (stromy)	3		32	1
146	2018-04-12 10:03:03.039535+02	1	Suchá vegetace (stromy)	1	[{"added": {}}]	28	1
147	2018-04-12 10:03:16.371008+02	2	Suchá vegetace (stromy)	1	[{"added": {}}]	28	1
148	2018-04-12 10:04:05.161222+02	1	Suchá vegetace (stromy)	3		28	1
149	2018-04-12 10:04:16.874932+02	3	Absence hub	1	[{"added": {}}]	28	1
150	2018-04-12 10:04:49.390601+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["i18n_tag"]}}]	13	1
151	2018-04-12 10:04:58.109408+02	2	Absence of mushrooms	2	[{"changed": {"fields": ["i18n_tag"]}}]	13	1
152	2018-04-12 10:05:10.589024+02	7	Regularity of observation	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
153	2018-04-12 10:05:18.103021+02	6	Type of mushroom	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
154	2018-04-12 10:05:27.794656+02	4	Type of location	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
155	2018-04-12 10:05:35.111597+02	3	Type of tree	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
156	2018-04-12 10:05:44.272062+02	2	Trunk diameter	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
157	2018-04-12 10:05:52.742688+02	1	Tree height	2	[{"changed": {"fields": ["i18n_tag"]}}]	23	1
158	2018-04-12 10:08:22.639482+02	11	once a month	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
159	2018-04-12 10:08:30.149071+02	10	once a week	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
160	2018-04-12 10:08:49.211376+02	9	more often than once a week	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
161	2018-04-12 10:08:59.529491+02	6	city or other type of development	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
162	2018-04-12 10:09:09.000443+02	5	rock outcrop or other extreme habitat	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
163	2018-04-12 10:09:17.360735+02	4	solitaire in the landscape	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
164	2018-04-12 10:09:24.122482+02	3	forest stand	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
165	2018-04-12 10:09:35.440428+02	2	coniferous	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
166	2018-04-12 10:09:43.582051+02	1	deciduous	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
167	2018-04-12 10:10:43.849713+02	1	Dry vegetation (trees)	2	[{"changed": {"fields": ["i18n_tag"]}}]	8	1
168	2018-04-12 10:10:54.031773+02	2	Absence of mushrooms	2	[{"changed": {"fields": ["text", "i18n_tag"]}}]	8	1
169	2018-04-12 12:11:35.181937+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
170	2018-04-12 12:11:44.377496+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
171	2018-04-12 12:21:37.843824+02	6	city or other type of development	2	[{"changed": {"fields": ["i18n_tag"]}}]	21	1
172	2018-04-12 15:57:21.331581+02	49		3		2	1
173	2018-04-12 15:57:21.334271+02	48	petrsilhak	3		2	1
174	2018-04-12 17:34:49.167988+02	51		3		2	1
175	2018-04-12 17:34:49.170382+02	50	petr	3		2	1
176	2018-04-12 17:46:59.888782+02	52	petr	3		2	1
177	2018-04-12 17:48:50.623773+02	53	petr	3		2	1
178	2018-04-12 17:49:27.670136+02	54	petr	3		2	1
179	2018-04-12 20:29:20.672069+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
180	2018-04-12 20:29:36.509484+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
181	2018-04-12 21:06:05.341483+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
182	2018-04-12 21:06:16.044876+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
183	2018-04-12 21:15:10.837745+02	56		3		2	1
184	2018-04-12 21:15:10.840833+02	55	petr	3		2	1
185	2018-04-12 21:18:09.033647+02	59	petrsilhak	3		2	1
186	2018-04-12 21:18:46.734405+02	10	once a month	1	[{"added": {}}]	31	1
187	2018-04-12 21:19:00.35447+02	11	once a week	1	[{"added": {}}]	31	1
188	2018-04-12 21:19:14.511521+02	12	more often than once a week	1	[{"added": {}}]	31	1
189	2018-04-12 21:19:35.326666+02	13	rock outcrop or other extreme habitat	1	[{"added": {}}]	31	1
190	2018-04-12 21:19:48.707474+02	14	solitaire in the landscape	1	[{"added": {}}]	31	1
191	2018-04-12 21:20:00.480881+02	15	forest stand	1	[{"added": {}}]	31	1
192	2018-04-12 21:20:07.873451+02	16	coniferous	1	[{"added": {}}]	31	1
193	2018-04-12 21:21:05.953211+02	17	deciduous	1	[{"added": {}}]	31	1
194	2018-04-12 21:21:19.297614+02	18	city or other type of development	1	[{"added": {}}]	31	1
195	2018-04-12 21:22:15.403979+02	3	Dry vegetation (trees)	1	[{"added": {}}]	32	1
196	2018-04-12 21:23:30.966438+02	2	Absence of mushrooms	2	[{"changed": {"fields": ["text"]}}]	8	1
197	2018-04-12 21:23:47.7367+02	4	Absence of mushrooms	1	[{"added": {}}]	32	1
198	2018-04-12 21:38:13.534373+02	5	Absence of mushrooms	1	[{"added": {}}]	32	1
199	2018-04-12 21:38:27.0297+02	7	Pravidelnost pozorování	2	[]	30	1
200	2018-04-12 21:38:36.051925+02	8	Regularity of observation	1	[{"added": {}}]	30	1
201	2018-04-12 21:38:55.270907+02	9	Type of mushroom	1	[{"added": {}}]	30	1
202	2018-04-12 21:39:04.477057+02	10	Type of location	1	[{"added": {}}]	30	1
203	2018-04-12 21:39:05.690422+02	60	petr	3		2	1
204	2018-04-12 21:39:11.670382+02	11	Type of tree	1	[{"added": {}}]	30	1
205	2018-04-12 21:39:19.246553+02	12	Trunk diameter	1	[{"added": {}}]	30	1
206	2018-04-12 21:39:26.179811+02	13	Tree height	1	[{"added": {}}]	30	1
207	2018-04-12 21:39:51.892299+02	4	Dry vegetation (trees)	1	[{"added": {}}]	28	1
208	2018-04-12 21:39:59.02156+02	5	Absence of mushrooms	1	[{"added": {}}]	28	1
209	2018-04-12 21:40:54.756907+02	61	petrsilhak	3		2	1
210	2018-04-12 22:03:45.413092+02	62	petr	3		2	1
211	2018-04-12 22:05:41.555901+02	63	petrsilhak	3		2	1
212	2018-04-12 22:06:42.492567+02	64	petr	3		2	1
213	2018-04-12 22:54:20.412861+02	66		3		2	1
214	2018-04-12 22:54:20.423288+02	65	petr	3		2	1
215	2018-04-12 22:56:42.206903+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
216	2018-04-12 22:56:56.023221+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
217	2018-04-12 23:42:12.917126+02	9	photos/varianta_2_eU9hXkr.png	3		26	1
218	2018-04-13 00:16:35.313788+02	67	petr	3		2	1
219	2018-04-13 08:13:59.010143+02	68	petrsilhak	3		2	1
220	2018-04-13 10:30:08.117281+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
221	2018-04-13 10:30:21.154593+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
222	2018-05-01 20:57:53.472347+02	3	Sandstone microforms	1	[{"added": {}}]	13	1
223	2018-05-01 21:00:42.055492+02	8	Type of microform	1	[{"added": {}}]	23	1
224	2018-05-01 21:00:53.666517+02	3	Sandstone microforms	2	[{"changed": {"fields": ["i18n_tag"]}}]	13	1
225	2018-05-01 21:03:26.991536+02	6	Sandstone microforms	1	[{"added": {}}]	28	1
226	2018-05-01 21:03:43.477243+02	7	Pískovcové mikrotvary	1	[{"added": {}}]	28	1
227	2018-05-01 21:04:01.572898+02	14	Type of microform	1	[{"added": {}}]	30	1
228	2018-05-01 21:04:16.957773+02	15	Typ mikroformy	1	[{"added": {}}]	30	1
229	2018-05-01 21:05:41.687539+02	3	Sandstone microforms	1	[{"added": {}}]	8	1
230	2018-05-01 21:05:56.235595+02	6	Sandstone microforms	1	[{"added": {}}]	32	1
231	2018-05-01 21:06:06.318899+02	7	Sandstone microforms	1	[{"added": {}}]	32	1
232	2018-05-02 19:37:57.447029+02	9	Name of the rock	1	[{"added": {}}]	23	1
233	2018-05-02 19:38:44.043538+02	10	Length	1	[{"added": {}}]	23	1
234	2018-05-02 19:39:13.610858+02	11	Width	1	[{"added": {}}]	23	1
235	2018-05-02 19:39:19.969254+02	10	Length	2	[{"changed": {"fields": ["type"]}}]	23	1
236	2018-05-02 19:39:49.260154+02	12	Height	1	[{"added": {}}]	23	1
237	2018-05-02 19:40:50.437328+02	13	Absolute age	1	[{"added": {}}]	23	1
238	2018-05-02 19:41:33.368721+02	14	Stratigraphic age	1	[{"added": {}}]	23	1
239	2018-05-02 19:41:41.348285+02	13	Absolute age	2	[{"changed": {"fields": ["type"]}}]	23	1
240	2018-05-02 19:42:15.386888+02	15	Description of microform	1	[{"added": {}}]	23	1
241	2018-05-02 19:42:43.765388+02	16	Name of the rock	1	[{"added": {}}]	30	1
242	2018-05-02 19:42:57.979915+02	17	Width	1	[{"added": {}}]	30	1
243	2018-05-02 19:43:05.943551+02	18	Length	1	[{"added": {}}]	30	1
244	2018-05-02 19:43:13.710275+02	19	Height	1	[{"added": {}}]	30	1
245	2018-05-02 19:43:21.996858+02	20	Stratigraphic age	1	[{"added": {}}]	30	1
246	2018-05-02 19:43:29.606742+02	21	Absolute age	1	[{"added": {}}]	30	1
247	2018-05-02 19:43:36.94069+02	22	Description of microform	1	[{"added": {}}]	30	1
248	2018-05-02 19:43:48.936817+02	23	Název skály	1	[{"added": {}}]	30	1
249	2018-05-02 19:43:59.097412+02	24	Šířka	1	[{"added": {}}]	30	1
250	2018-05-02 19:44:10.16108+02	25	Délka	1	[{"added": {}}]	30	1
251	2018-05-02 19:44:18.53905+02	26	Výška	1	[{"added": {}}]	30	1
252	2018-05-02 19:44:34.835044+02	27	Stratigrafické stáří	1	[{"added": {}}]	30	1
253	2018-05-02 19:44:45.057394+02	28	Absolutní stáří	1	[{"added": {}}]	30	1
254	2018-05-02 19:45:03.224625+02	29	Popis útvaru	1	[{"added": {}}]	30	1
255	2018-05-05 12:50:46.777857+02	1	config	1	[{"added": {}}]	33	1
256	2018-05-05 12:50:59.630915+02	2	localization	1	[{"added": {}}]	33	1
257	2018-05-13 11:19:13.280355+02	70		3		2	1
258	2018-05-13 11:20:06.296179+02	72		3		2	1
259	2018-05-13 11:27:37.365997+02	3	Petr Šilhák	1	[{"added": {}}]	7	1
260	2018-05-13 12:43:10.56816+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
261	2018-05-13 12:44:32.091571+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
262	2018-05-13 12:50:37.401366+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
263	2018-05-14 06:06:08.152892+02	3	Granite microforms	2	[{"changed": {"fields": ["name", "i18n_tag"]}}]	13	1
264	2018-05-14 06:06:32.020913+02	4	Granite mezoforms	1	[{"added": {}}]	13	1
265	2018-05-14 06:07:27.513956+02	6	Granite microforms	2	[{"changed": {"fields": ["name"]}}]	28	1
266	2018-05-14 06:07:45.712066+02	7	Žulové mikrotvary	2	[{"changed": {"fields": ["name"]}}]	28	1
267	2018-05-14 06:08:38.058656+02	8	Granite mesoforms	1	[{"added": {}}]	28	1
268	2018-05-14 06:08:58.862293+02	9	Žulové mezotvary	1	[{"added": {}}]	28	1
269	2018-05-14 06:09:32.108272+02	4	Granite mesoforms	2	[{"changed": {"fields": ["name", "i18n_tag"]}}]	13	1
270	2018-05-14 06:10:27.391967+02	14	Stratigraphic age	3		23	1
271	2018-05-14 06:10:27.394604+02	13	Absolute age	3		23	1
272	2018-05-14 06:12:10.641463+02	12	Depth	2	[{"changed": {"fields": ["name", "i18n_tag"]}}]	23	1
273	2018-05-14 06:12:46.434557+02	19	Depth	2	[{"changed": {"fields": ["name"]}}]	30	1
274	2018-05-14 06:13:01.494418+02	26	Hloubka	2	[{"changed": {"fields": ["name"]}}]	30	1
275	2018-05-14 06:14:00.64393+02	8	Type of microform	2	[{"changed": {"fields": ["element"]}}]	23	1
276	2018-05-14 06:15:00.453418+02	12	Skalní mísa	1	[{"added": {}}]	21	1
277	2018-05-14 06:15:54.6326+02	13	Výklenek	1	[{"added": {}}]	21	1
278	2018-05-14 06:16:33.560034+02	14	Voštiny	1	[{"added": {}}]	21	1
279	2018-05-14 06:17:09.195554+02	15	Žlábkové škrapy	1	[{"added": {}}]	21	1
280	2018-05-14 06:17:45.031554+02	16	Tafoni	1	[{"added": {}}]	21	1
281	2018-05-14 06:21:31.332521+02	19	Skalní mísa	1	[{"added": {}}]	31	1
282	2018-05-14 06:22:07.765201+02	20	Skalní mísa	1	[{"added": {}}]	31	1
283	2018-05-14 06:22:49.470656+02	21	Výklenek	1	[{"added": {}}]	31	1
284	2018-05-14 06:23:25.77615+02	22	Výklenek	1	[{"added": {}}]	31	1
285	2018-05-14 06:23:41.267996+02	23	Voštiny	1	[{"added": {}}]	31	1
286	2018-05-14 06:24:14.689292+02	24	Voštiny	1	[{"added": {}}]	31	1
287	2018-05-14 06:24:50.257435+02	25	Žlábkové škrapy	1	[{"added": {}}]	31	1
288	2018-05-14 06:25:34.63286+02	26	Žlábkové škrapy	1	[{"added": {}}]	31	1
289	2018-05-14 06:26:00.754934+02	27	Tafoni	1	[{"added": {}}]	31	1
290	2018-05-14 06:26:20.136139+02	28	Tafoni	1	[{"added": {}}]	31	1
291	2018-05-14 06:28:40.930241+02	9	Name of the rock	3		23	1
292	2018-05-14 06:31:04.074366+02	16	Description of mesoform	1	[{"added": {}}]	23	1
293	2018-05-14 06:31:59.046066+02	17	Width	1	[{"added": {}}]	23	1
294	2018-05-14 06:32:30.879793+02	18	Length	1	[{"added": {}}]	23	1
295	2018-05-14 06:32:48.488801+02	19	Height	1	[{"added": {}}]	23	1
296	2018-05-14 06:33:13.901195+02	20	Type of mesoform	1	[{"added": {}}]	23	1
297	2018-05-14 06:34:23.251111+02	30	Width	1	[{"added": {}}]	30	1
298	2018-05-14 06:34:38.891647+02	30	Width	2	[]	30	1
299	2018-05-14 06:34:51.187814+02	31	Šířka	1	[{"added": {}}]	30	1
300	2018-05-14 06:35:03.347901+02	32	Length	1	[{"added": {}}]	30	1
301	2018-05-14 06:35:14.525678+02	33	Délka	1	[{"added": {}}]	30	1
302	2018-05-14 06:35:29.044847+02	34	Height	1	[{"added": {}}]	30	1
303	2018-05-14 06:35:52.223921+02	35	Výška	1	[{"added": {}}]	30	1
304	2018-05-14 06:36:02.572842+02	36	Type of mesoform	1	[{"added": {}}]	30	1
305	2018-05-14 06:36:18.72779+02	37	Typ mezoformy	1	[{"added": {}}]	30	1
306	2018-05-14 06:37:01.66053+02	38	Description of mesoform	1	[{"added": {}}]	30	1
307	2018-05-14 06:37:29.404179+02	39	Popis útvaru	1	[{"added": {}}]	30	1
308	2018-05-14 06:38:13.428711+02	17	Balvany	1	[{"added": {}}]	21	1
309	2018-05-14 06:38:54.289304+02	18	Skalní hradby/izolované skály	1	[{"added": {}}]	21	1
310	2018-05-14 06:39:18.60088+02	19	Viklany	1	[{"added": {}}]	21	1
311	2018-05-14 06:39:38.411303+02	20	Skalní hřiby	1	[{"added": {}}]	21	1
312	2018-05-14 06:40:19.17731+02	29	Balvany	1	[{"added": {}}]	31	1
313	2018-05-14 06:40:31.977536+02	30	Balvany	1	[{"added": {}}]	31	1
314	2018-05-14 06:40:57.52147+02	31	Skalní hradby/izolované skály	1	[{"added": {}}]	31	1
315	2018-05-14 06:41:05.599898+02	32	Skalní hradby/izolované skály	1	[{"added": {}}]	31	1
316	2018-05-14 06:41:17.367378+02	33	Viklany	1	[{"added": {}}]	31	1
317	2018-05-14 06:41:30.238392+02	34	Viklany	1	[{"added": {}}]	31	1
318	2018-05-14 06:41:45.31206+02	35	Skalní hřiby	1	[{"added": {}}]	31	1
319	2018-05-14 06:41:59.080999+02	36	Skalní hřiby	1	[{"added": {}}]	31	1
320	2018-05-14 06:46:34.602251+02	3	Granite microforms	2	[{"changed": {"fields": ["text"]}}]	8	1
321	2018-05-14 06:46:45.949207+02	4	Granite mesoforms	1	[{"added": {}}]	8	1
322	2018-05-14 06:47:46.711866+02	8	Granite mesoforms	1	[{"added": {}}]	32	1
323	2018-05-14 06:47:57.317263+02	9	Granite mesoforms	1	[{"added": {}}]	32	1
324	2018-05-14 06:56:17.698636+02	12539	Observation from 2018-05-14 04:49:09.192000+00:00	3		22	1
325	2018-05-14 06:57:03.459489+02	57	figsondates	3		2	1
326	2018-05-14 06:57:03.461491+02	69	petrsilhak	3		2	1
327	2018-05-14 06:57:03.463061+02	58	snol	3		2	1
328	2018-05-14 07:08:57.079797+02	73	petr	3		2	1
329	2018-05-16 10:24:25.205249+02	75		3		2	1
330	2018-05-16 10:24:25.208818+02	74	petrsilhak	3		2	1
331	2018-05-16 14:05:56.116101+02	76	1919	3		2	1
332	2018-05-16 21:52:24.588009+02	21	Description of mesoform	1	[{"added": {}}]	23	1
333	2018-05-16 21:53:03.73615+02	21	Description of mesoform	3		23	1
334	2018-05-16 21:54:05.957747+02	22	Width	1	[{"added": {}}]	23	1
335	2018-05-16 21:55:39.181415+02	23	Height	1	[{"added": {}}]	23	1
336	2018-05-16 21:56:20.527245+02	24	Length	1	[{"added": {}}]	23	1
337	2018-05-16 21:56:52.942238+02	25	Description of mesoform	1	[{"added": {}}]	23	1
338	2018-05-16 21:57:22.636377+02	39	Popis útvaru	2	[{"changed": {"fields": ["parameter"]}}]	30	1
339	2018-05-16 21:57:33.889463+02	38	Description of mesoform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
340	2018-05-16 21:57:41.937191+02	37	Typ mezoformy	2	[]	30	1
341	2018-05-16 21:57:49.18758+02	36	Type of mesoform	2	[]	30	1
342	2018-05-16 21:58:00.024527+02	37	Typ mezoformy	2	[]	30	1
343	2018-05-16 21:58:07.013519+02	35	Výška	2	[{"changed": {"fields": ["parameter"]}}]	30	1
344	2018-05-16 21:58:14.049401+02	34	Height	2	[{"changed": {"fields": ["parameter"]}}]	30	1
345	2018-05-16 21:58:20.503817+02	33	Délka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
346	2018-05-16 21:58:30.205875+02	32	Length	2	[{"changed": {"fields": ["parameter"]}}]	30	1
347	2018-05-16 21:58:37.188281+02	31	Šířka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
348	2018-05-16 21:58:42.967536+02	30	Width	2	[{"changed": {"fields": ["parameter"]}}]	30	1
349	2018-05-16 22:00:07.467849+02	19	Height	3		23	1
350	2018-05-16 22:00:07.470966+02	18	Length	3		23	1
351	2018-05-16 22:00:07.472826+02	17	Width	3		23	1
352	2018-05-16 22:00:07.474801+02	16	Description of mesoform	3		23	1
353	2018-05-16 22:02:26.272055+02	26	Type of microform	1	[{"added": {}}]	23	1
354	2018-05-16 22:03:13.967158+02	27	Width	1	[{"added": {}}]	23	1
355	2018-05-16 22:03:52.815446+02	28	Depth	1	[{"added": {}}]	23	1
356	2018-05-16 22:04:15.65637+02	29	Length	1	[{"added": {}}]	23	1
357	2018-05-16 22:05:20.34845+02	30	Description of microform	1	[{"added": {}}]	23	1
358	2018-05-16 22:06:32.105211+02	16	Tafoni	2	[{"changed": {"fields": ["parameter"]}}]	21	1
359	2018-05-16 22:06:37.69025+02	15	Žlábkové škrapy	2	[{"changed": {"fields": ["parameter"]}}]	21	1
360	2018-05-16 22:06:44.158833+02	14	Voštiny	2	[{"changed": {"fields": ["parameter"]}}]	21	1
361	2018-05-16 22:06:51.113444+02	13	Výklenek	2	[{"changed": {"fields": ["parameter"]}}]	21	1
362	2018-05-16 22:07:00.803349+02	12	Skalní mísa	2	[{"changed": {"fields": ["parameter"]}}]	21	1
363	2018-05-16 22:08:06.146661+02	29	Popis útvaru	2	[{"changed": {"fields": ["parameter"]}}]	30	1
364	2018-05-16 22:08:14.351852+02	26	Hloubka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
365	2018-05-16 22:08:26.291189+02	25	Délka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
366	2018-05-16 22:08:32.877211+02	24	Šířka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
367	2018-05-16 22:08:43.2839+02	22	Description of microform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
368	2018-05-16 22:08:49.530651+02	19	Depth	2	[{"changed": {"fields": ["parameter"]}}]	30	1
369	2018-05-16 22:08:56.292062+02	18	Length	2	[{"changed": {"fields": ["parameter"]}}]	30	1
370	2018-05-16 22:09:03.407324+02	17	Width	2	[{"changed": {"fields": ["parameter"]}}]	30	1
371	2018-05-16 22:09:12.170819+02	15	Typ mikroformy	2	[{"changed": {"fields": ["parameter"]}}]	30	1
372	2018-05-16 22:09:21.595349+02	14	Type of microform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
373	2018-05-16 22:10:05.784223+02	15	Description of microform	3		23	1
374	2018-05-16 22:10:05.787852+02	12	Depth	3		23	1
375	2018-05-16 22:10:05.789404+02	11	Width	3		23	1
376	2018-05-16 22:10:05.797375+02	10	Length	3		23	1
377	2018-05-16 22:10:05.799013+02	8	Type of microform	3		23	1
378	2018-05-18 18:07:13.325474+02	12549	Observation from 2018-05-18 16:06:13.840000+00:00	3		22	1
379	2018-05-18 19:58:50.836339+02	26	Type of microform	2	[{"changed": {"fields": ["mandatory"]}}]	23	1
380	2018-05-18 19:58:55.979458+02	20	Type of mesoform	2	[{"changed": {"fields": ["mandatory"]}}]	23	1
381	2018-05-19 18:38:12.026079+02	12561	Observation from 2018-05-19 16:12:49.991000+00:00	3		22	1
382	2018-05-19 18:38:12.070474+02	12560	Observation from 2018-05-19 15:49:07.611000+00:00	3		22	1
383	2018-05-19 18:38:12.071997+02	12559	Observation from 2018-05-19 15:46:48.499000+00:00	3		22	1
384	2018-05-19 18:38:12.073383+02	12558	Observation from 2018-05-19 15:44:00.298000+00:00	3		22	1
385	2018-05-19 18:38:12.074817+02	12557	Observation from 2018-05-19 15:41:59.876000+00:00	3		22	1
386	2018-05-19 18:38:12.076239+02	12556	Observation from 2018-05-19 15:37:57.028000+00:00	3		22	1
387	2018-05-19 18:38:12.077666+02	12555	Observation from 2018-05-19 15:23:39.914000+00:00	3		22	1
388	2018-05-19 18:38:12.078968+02	12554	Observation from 2018-05-19 14:57:42.895000+00:00	3		22	1
389	2018-05-19 18:38:12.080289+02	12553	Observation from 2018-05-19 14:55:19.209000+00:00	3		22	1
390	2018-05-19 18:38:12.08173+02	12552	Observation from 2018-05-19 14:49:29.765000+00:00	3		22	1
391	2018-05-19 18:38:12.083115+02	12551	Observation from 2018-05-19 14:45:20.449000+00:00	3		22	1
392	2018-05-19 18:38:12.084422+02	12550	Observation from 2018-05-19 14:35:28.002000+00:00	3		22	1
393	2018-05-19 18:39:16.598772+02	12548	Observation from 2018-05-18 11:17:31.234000+00:00	3		22	1
394	2018-05-19 18:39:36.720614+02	12547	Observation from 2018-05-17 20:51:31.189000+00:00	3		22	1
395	2018-05-19 18:39:36.722957+02	12546	Observation from 2018-05-17 13:18:00.205000+00:00	3		22	1
396	2018-05-19 18:43:52.584899+02	12542	Observation from 2018-05-16 15:53:35+02:00	2	[]	22	1
397	2018-05-19 18:53:36.314125+02	31	Type of microform	1	[{"added": {}}]	23	1
398	2018-05-19 18:54:10.705381+02	15	Typ mikroformy	2	[{"changed": {"fields": ["parameter"]}}]	30	1
399	2018-05-19 18:54:23.690238+02	14	Type of microform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
400	2018-05-19 18:54:54.165308+02	16	Tafoni	2	[{"changed": {"fields": ["parameter"]}}]	21	1
401	2018-05-19 18:55:01.115678+02	15	Žlábkové škrapy	2	[{"changed": {"fields": ["parameter"]}}]	21	1
402	2018-05-19 18:55:09.607943+02	14	Voštiny	2	[{"changed": {"fields": ["parameter"]}}]	21	1
403	2018-05-19 18:55:14.973818+02	13	Výklenek	2	[{"changed": {"fields": ["parameter"]}}]	21	1
404	2018-05-19 18:55:21.073603+02	12	Skalní mísa	2	[{"changed": {"fields": ["parameter"]}}]	21	1
405	2018-05-19 18:56:16.020339+02	26	Type of microform	3		23	1
406	2018-05-19 18:56:40.517101+02	32	Type of mesoform	1	[{"added": {}}]	23	1
407	2018-05-19 18:56:55.819752+02	37	Typ mezoformy	2	[{"changed": {"fields": ["parameter"]}}]	30	1
408	2018-05-19 18:57:01.915096+02	36	Type of mesoform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
409	2018-05-19 18:57:27.525276+02	17	Balvany	2	[{"changed": {"fields": ["parameter"]}}]	21	1
410	2018-05-19 18:57:44.157163+02	18	Skalní hradby/izolované skály	2	[{"changed": {"fields": ["parameter"]}}]	21	1
411	2018-05-19 18:57:54.278406+02	19	Viklany	2	[{"changed": {"fields": ["parameter"]}}]	21	1
412	2018-05-19 18:58:00.922072+02	20	Skalní hřiby	2	[{"changed": {"fields": ["parameter"]}}]	21	1
413	2018-05-19 18:58:30.679577+02	20	Type of mesoform	3		23	1
414	2018-05-19 19:11:42.103362+02	33	Length	1	[{"added": {}}]	23	1
415	2018-05-19 19:12:15.620516+02	34	Depth	1	[{"added": {}}]	23	1
416	2018-05-19 19:12:37.264701+02	35	Width	1	[{"added": {}}]	23	1
417	2018-05-19 19:13:07.973906+02	17	Width	2	[{"changed": {"fields": ["parameter"]}}]	30	1
418	2018-05-19 19:13:15.675991+02	18	Length	2	[{"changed": {"fields": ["parameter"]}}]	30	1
419	2018-05-19 19:13:23.801398+02	19	Depth	2	[{"changed": {"fields": ["parameter"]}}]	30	1
420	2018-05-19 19:14:05.238+02	36	Description of microform	1	[{"added": {}}]	23	1
421	2018-05-19 19:14:48.482975+02	22	Description of microform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
422	2018-05-19 19:15:12.128118+02	26	Hloubka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
423	2018-05-19 19:15:20.139053+02	25	Délka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
424	2018-05-19 19:15:27.363561+02	24	Šířka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
512	2019-01-27 12:43:47.61574+01	43	Note	3		23	1
425	2018-05-19 19:15:36.474841+02	29	Popis útvaru	2	[{"changed": {"fields": ["parameter"]}}]	30	1
426	2018-05-19 19:16:49.71402+02	30	Description of microform	3		23	1
427	2018-05-19 19:16:49.716275+02	29	Length	3		23	1
428	2018-05-19 19:16:49.717785+02	28	Depth	3		23	1
429	2018-05-19 19:16:49.719288+02	27	Width	3		23	1
430	2018-05-19 19:19:01.575664+02	37	Length	1	[{"added": {}}]	23	1
431	2018-05-19 19:19:37.456924+02	38	Height	1	[{"added": {}}]	23	1
432	2018-05-19 19:20:14.966451+02	39	Width	1	[{"added": {}}]	23	1
433	2018-05-19 19:20:54.814385+02	40	Description of mesoform	1	[{"added": {}}]	23	1
434	2018-05-19 19:21:42.226525+02	39	Popis útvaru	2	[{"changed": {"fields": ["parameter"]}}]	30	1
435	2018-05-19 19:21:46.678253+02	38	Description of mesoform	2	[{"changed": {"fields": ["parameter"]}}]	30	1
436	2018-05-19 19:21:58.835507+02	35	Výška	2	[{"changed": {"fields": ["parameter"]}}]	30	1
437	2018-05-19 19:22:05.03014+02	34	Height	2	[{"changed": {"fields": ["parameter"]}}]	30	1
438	2018-05-19 19:22:24.28711+02	33	Délka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
439	2018-05-19 19:22:33.447038+02	32	Length	2	[{"changed": {"fields": ["parameter"]}}]	30	1
440	2018-05-19 19:22:39.668767+02	31	Šířka	2	[{"changed": {"fields": ["parameter"]}}]	30	1
441	2018-05-19 19:22:45.292066+02	30	Width	2	[{"changed": {"fields": ["parameter"]}}]	30	1
442	2018-05-19 19:23:09.530321+02	25	Description of mesoform	3		23	1
443	2018-05-19 19:23:09.532529+02	24	Length	3		23	1
444	2018-05-19 19:23:09.533995+02	23	Height	3		23	1
445	2018-05-19 19:23:09.535404+02	22	Width	3		23	1
446	2018-05-19 23:04:38.044103+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
447	2018-05-19 23:04:50.430188+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
448	2018-05-20 13:59:06.207432+02	8	Petr Vodička	2	[{"changed": {"fields": ["gender"]}}]	7	1
449	2018-05-20 14:07:00.413079+02	77	petrsilhak	3		2	1
450	2018-05-20 15:06:38.411122+02	2	Absence of mushrooms	3		13	1
451	2018-05-20 15:06:38.413668+02	1	Dry vegetation (trees)	3		13	1
452	2018-05-20 17:22:38.478802+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
453	2018-05-20 17:23:03.003072+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
454	2018-05-20 17:32:40.008559+02	10	Jakub Řehák	2	[{"changed": {"fields": ["first_name", "last_name", "gender"]}}]	7	1
455	2018-05-20 17:54:59.074022+02	12466	Observation from 2018-04-07 16:58:38.302000+00:00	3		22	1
456	2018-05-20 17:54:59.076621+02	12465	Observation from 2018-04-07 11:55:46.734000+00:00	3		22	1
457	2018-05-20 18:00:36.701504+02	14859	Observation from 2018-05-20 15:59:15.552000+00:00	3		22	1
458	2018-05-20 18:27:54.110749+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
459	2018-05-20 18:32:49.185926+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
460	2018-05-21 00:04:45.590281+02	2	en	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
461	2018-05-21 00:06:56.766445+02	1	cs	2	[{"changed": {"fields": ["dictionary"]}}]	27	1
462	2018-05-25 10:16:01.942894+02	14874	Observation from 2018-05-20 20:25:30.371000+00:00	3		22	1
463	2019-01-27 09:08:31.144175+01	2	Waterlogging	1	[{"added": {}}]	24	1
464	2019-01-27 09:09:55.825875+01	5	Waterlogging	1	[{"added": {}}]	13	1
465	2019-01-27 09:10:27.974053+01	6	Traffic	1	[{"added": {}}]	13	1
466	2019-01-27 09:10:40.341196+01	2	Waterlogging China app	2	[{"changed": {"fields": ["name"]}}]	24	1
467	2019-01-27 09:12:55.070274+01	41	Depth of waterlogging	1	[{"added": {}}]	23	1
468	2019-01-27 09:13:28.854943+01	42	Road capacity	1	[{"added": {}}]	23	1
469	2019-01-27 09:14:22.353928+01	21	Less than 1cm	1	[{"added": {}}]	21	1
470	2019-01-27 09:14:37.756264+01	22	1-5cm	1	[{"added": {}}]	21	1
471	2019-01-27 09:14:53.247756+01	23	6-12cm	1	[{"added": {}}]	21	1
472	2019-01-27 09:15:09.719614+01	24	More than 12cm	1	[{"added": {}}]	21	1
473	2019-01-27 09:15:32.040754+01	25	Expedite	1	[{"added": {}}]	21	1
474	2019-01-27 09:15:42.374261+01	26	Congested	1	[{"added": {}}]	21	1
475	2019-01-27 09:15:55.610686+01	27	Blocked	1	[{"added": {}}]	21	1
476	2019-01-27 09:18:00.410707+01	5	Waterlogging	1	[{"added": {}}]	8	1
477	2019-01-27 09:18:54.450543+01	6	Traffic	1	[{"added": {}}]	8	1
478	2019-01-27 09:21:07.253543+01	10	Waterlogging	1	[{"added": {}}]	28	1
479	2019-01-27 09:21:16.463147+01	11	Traffic	1	[{"added": {}}]	28	1
480	2019-01-27 09:21:47.31447+01	40	Depth of waterlogging	1	[{"added": {}}]	30	1
481	2019-01-27 09:21:55.848539+01	41	Road capacity	1	[{"added": {}}]	30	1
482	2019-01-27 09:22:21.49085+01	37	Les than 1cm	1	[{"added": {}}]	31	1
483	2019-01-27 09:22:34.034452+01	38	6-12 cm	1	[{"added": {}}]	31	1
484	2019-01-27 09:22:43.892819+01	39	More than 12 cm	1	[{"added": {}}]	31	1
485	2019-01-27 09:22:51.81053+01	40	Expedite	1	[{"added": {}}]	31	1
486	2019-01-27 09:22:59.003944+01	41	Congested	1	[{"added": {}}]	31	1
487	2019-01-27 09:23:06.676214+01	42	Blocked	1	[{"added": {}}]	31	1
488	2019-01-27 09:23:35.371164+01	10	Waterlogging	1	[{"added": {}}]	32	1
489	2019-01-27 09:23:53.367742+01	11	Traffic	1	[{"added": {}}]	32	1
490	2019-01-27 09:24:37.986755+01	1	config	2	[{"changed": {"fields": ["version"]}}]	33	1
491	2019-01-27 09:24:46.837024+01	2	localization	2	[{"changed": {"fields": ["version"]}}]	33	1
492	2019-01-27 09:26:10.627903+01	22	1-5 cm	2	[{"changed": {"fields": ["value", "i18n_tag"]}}]	21	1
493	2019-01-27 09:26:59.660188+01	21	Less than 1 cm	2	[{"changed": {"fields": ["value", "i18n_tag"]}}]	21	1
494	2019-01-27 09:27:21.281487+01	37	Less than 1 cm	2	[{"changed": {"fields": ["name"]}}]	31	1
495	2019-01-27 09:27:48.096749+01	42	Blocked	3		31	1
496	2019-01-27 09:27:48.0996+01	41	Congested	3		31	1
497	2019-01-27 09:27:48.101139+01	40	Expedite	3		31	1
498	2019-01-27 09:27:48.10267+01	39	More than 12 cm	3		31	1
499	2019-01-27 09:27:48.104266+01	38	6-12 cm	3		31	1
500	2019-01-27 09:27:48.105836+01	37	Less than 1 cm	3		31	1
501	2019-01-27 09:28:10.300394+01	43	Less than 1 cm	1	[{"added": {}}]	31	1
502	2019-01-27 09:28:21.386125+01	44	1-5 cm	1	[{"added": {}}]	31	1
503	2019-01-27 09:28:30.531715+01	45	6-12 cm	1	[{"added": {}}]	31	1
504	2019-01-27 09:28:42.360529+01	46	More than 12 cm	1	[{"added": {}}]	31	1
505	2019-01-27 09:28:51.768076+01	47	Expedite	1	[{"added": {}}]	31	1
506	2019-01-27 09:28:58.347469+01	48	Congested	1	[{"added": {}}]	31	1
507	2019-01-27 09:29:06.157102+01	49	Blocked	1	[{"added": {}}]	31	1
508	2019-01-27 10:58:29.327912+01	42	Road capacity	2	[{"changed": {"fields": ["phenomenon"]}}]	23	1
509	2019-01-27 11:20:20.560765+01	43	Note	1	[{"added": {}}]	23	1
510	2019-01-27 11:20:39.813421+01	42	Note	1	[{"added": {}}]	30	1
511	2019-01-27 11:22:01.051378+01	42	Note	3		30	1
513	2019-01-27 12:44:06.723765+01	42	Road capacity	2	[{"changed": {"fields": ["phenomenon"]}}]	23	1
514	2019-01-27 12:45:45.782477+01	5	Waterlogging	2	[{"changed": {"fields": ["text"]}}]	8	1
515	2019-01-27 12:45:55.668277+01	10	Waterlogging	2	[{"changed": {"fields": ["text"]}}]	32	1
516	2019-01-28 17:11:52.807112+01	3	cn	1	[{"added": {}}]	27	1
517	2019-01-28 17:12:06.790441+01	2	localization	2	[{"changed": {"fields": ["version"]}}]	33	1
518	2019-01-29 18:34:52.411111+01	12	/积水收集	1	[{"added": {}}]	28	1
519	2019-01-29 18:35:08.415412+01	13	/交通数据收集	1	[{"added": {}}]	28	1
520	2019-01-29 18:36:12.896867+01	43	/积水深度	1	[{"added": {}}]	30	1
521	2019-01-29 18:36:32.037524+01	44	/道路情况	1	[{"added": {}}]	30	1
522	2019-01-29 18:37:15.405987+01	50	/·小于1cm	1	[{"added": {}}]	31	1
523	2019-01-29 18:37:28.832299+01	51	1-5cm	1	[{"added": {}}]	31	1
524	2019-01-29 18:37:38.62095+01	52	6-12cm	1	[{"added": {}}]	31	1
525	2019-01-29 18:37:50.606115+01	53	大于12cm	1	[{"added": {}}]	31	1
526	2019-01-29 18:38:03.579056+01	54	畅通	1	[{"added": {}}]	31	1
527	2019-01-29 18:38:12.548092+01	55	缓行	1	[{"added": {}}]	31	1
528	2019-01-29 18:38:21.554786+01	56	拥堵	1	[{"added": {}}]	31	1
529	2019-01-29 18:38:52.216624+01	5	Waterlogging	2	[]	8	1
530	2019-01-29 18:40:30.321895+01	12	Waterlogging	1	[{"added": {}}]	32	1
531	2019-01-29 18:41:08.828939+01	13	Traffic	1	[{"added": {}}]	32	1
532	2019-01-29 18:41:31.832732+01	2	localization	2	[{"changed": {"fields": ["version"]}}]	33	1
533	2019-01-29 18:41:44.129945+01	1	config	2	[{"changed": {"fields": ["version"]}}]	33	1
534	2019-01-29 20:04:45.949898+01	6	Traffic	2	[{"changed": {"fields": ["text"]}}]	8	1
535	2019-01-29 20:05:00.698318+01	5	Waterlogging	2	[{"changed": {"fields": ["text"]}}]	8	1
536	2019-01-29 20:06:41.2697+01	7	Waterlogging	1	[{"added": {}}]	8	1
537	2019-01-29 20:06:47.359266+01	6	Traffic	2	[{"changed": {"fields": ["text"]}}]	8	1
538	2019-01-29 20:06:51.700335+01	5	Waterlogging	2	[{"changed": {"fields": ["text"]}}]	8	1
539	2019-01-29 20:08:09.736265+01	7	Waterlogging	3		8	1
540	2019-01-29 20:28:42.689961+01	12	Waterlogging	2	[{"changed": {"fields": ["text"]}}]	32	1
541	2019-01-29 20:28:47.949023+01	13	Traffic	2	[{"changed": {"fields": ["text"]}}]	32	1
542	2019-01-29 21:53:07.696531+01	93		3		2	1
543	2019-01-29 21:53:07.699264+01	83	petrsilhak	3		2	1
544	2019-02-05 20:42:59.614819+01	3	Microforms	1	[{"added": {}}]	24	1
545	2019-02-05 20:43:13.182284+01	4	Granite mesoforms	2	[{"changed": {"fields": ["category"]}}]	13	1
546	2019-02-05 20:43:18.196563+01	3	Granite microforms	2	[{"changed": {"fields": ["category"]}}]	13	1
547	2019-02-06 10:07:12.855211+01	2	Trunk diameter (cm)	2	[{"changed": {"fields": ["name", "i18n_tag"]}}]	23	1
548	2019-02-06 10:07:20.915358+01	1	Tree height (cm)	2	[{"changed": {"fields": ["name", "i18n_tag"]}}]	23	1
549	2019-02-06 10:07:42.490779+01	13	Tree height (cm)	2	[{"changed": {"fields": ["name"]}}]	30	1
550	2019-02-06 10:07:51.542394+01	12	Trunk diameter (cm)	2	[{"changed": {"fields": ["name"]}}]	30	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	api	userprofile
8	api	help
9	api	observation
10	api	drought
11	api	observationphenomenon
12	api	helppictures
13	api	phenomenon
14	authtoken	token
15	sites	site
16	account	emailaddress
17	account	emailconfirmation
18	socialaccount	socialapp
19	socialaccount	socialaccount
20	socialaccount	socialtoken
21	api	dictionary
22	api	metadataobservation
23	api	parameter
24	api	category
25	api	phenomenonparametervalue
26	api	phenomenonphoto
27	api	localization
28	api	phenomenonlocalization
29	api	categorylocalization
30	api	parameterlocalization
31	api	dictionarylocalization
32	api	helplocalization
33	api	version
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-08-19 14:45:56.043804+02
2	auth	0001_initial	2017-08-19 14:45:56.123929+02
3	admin	0001_initial	2017-08-19 14:45:56.148279+02
4	admin	0002_logentry_remove_auto_add	2017-08-19 14:45:56.162741+02
5	contenttypes	0002_remove_content_type_name	2017-08-19 14:45:56.192892+02
6	auth	0002_alter_permission_name_max_length	2017-08-19 14:45:56.199758+02
7	auth	0003_alter_user_email_max_length	2017-08-19 14:45:56.211228+02
8	auth	0004_alter_user_username_opts	2017-08-19 14:45:56.220586+02
9	auth	0005_alter_user_last_login_null	2017-08-19 14:45:56.231088+02
10	auth	0006_require_contenttypes_0002	2017-08-19 14:45:56.232949+02
11	auth	0007_alter_validators_add_error_messages	2017-08-19 14:45:56.241812+02
12	auth	0008_alter_user_username_max_length	2017-08-19 14:45:56.255455+02
13	sessions	0001_initial	2017-08-19 14:45:56.269084+02
14	api	0001_initial	2017-09-09 15:31:19.867687+02
15	account	0001_initial	2017-09-09 15:38:40.278222+02
16	account	0002_email_max_length	2017-09-09 15:38:40.316974+02
17	authtoken	0001_initial	2017-09-09 15:38:40.33823+02
18	authtoken	0002_auto_20160226_1747	2017-09-09 15:38:40.422551+02
19	sites	0001_initial	2017-09-09 15:38:40.430873+02
20	sites	0002_alter_domain_unique	2017-09-09 15:38:40.440218+02
21	socialaccount	0001_initial	2017-09-09 15:38:40.527519+02
22	socialaccount	0002_token_max_lengths	2017-09-09 15:38:40.55825+02
23	socialaccount	0003_extra_data_default_dict	2017-09-09 15:38:40.569546+02
24	api	0002_auto_20171011_0720	2017-10-11 09:21:31.529614+02
25	api	0003_auto_20171011_1149	2017-10-11 13:49:42.605618+02
26	api	0004_auto_20171012_1327	2017-10-12 15:27:57.661876+02
27	api	0005_auto_20171012_1925	2017-10-12 21:25:31.120184+02
28	api	0006_auto_20171013_1800	2017-10-13 20:00:37.15287+02
29	api	0007_auto_20171014_1605	2017-10-14 18:05:55.726783+02
30	api	0008_auto_20171016_2223	2017-10-17 00:23:10.472314+02
31	api	0009_auto_20171017_1345	2017-10-17 15:45:18.918891+02
32	api	0010_auto_20180107_0000	2018-01-07 00:00:42.305759+01
33	api	0011_auto_20180306_1745	2018-03-06 17:45:48.049515+01
34	api	0012_auto_20180318_1111	2018-03-18 11:11:40.275243+01
35	api	0013_localization	2018-03-31 16:22:08.9332+02
36	api	0014_auto_20180407_1418	2018-04-07 14:18:27.032147+02
37	api	0015_auto_20180407_2009	2018-04-07 20:09:23.7885+02
38	api	0016_auto_20180408_1140	2018-04-08 11:40:21.595412+02
39	api	0017_auto_20180409_0009	2018-04-09 00:09:34.292796+02
40	api	0018_categorylocalization_dictionarylocalization_parameterlocalization_phenomenonlocalization	2018-04-10 21:29:13.711707+02
41	api	0019_helplocalization	2018-04-10 22:24:19.857188+02
42	api	0020_auto_20180412_1001	2018-04-12 10:01:42.095372+02
43	api	0021_auto_20180505_1248	2018-05-05 12:48:22.252922+02
44	api	0022_auto_20180513_1230	2018-05-13 12:30:53.934072+02
45	api	0023_auto_20180513_1331	2018-05-13 13:31:57.97544+02
46	api	0024_parameter_mandatory	2018-05-18 19:58:23.043619+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n1d94sy715w9lyxhmmamb98st02av5x2	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-24 18:34:34.46811+02
4ofh6q57f7me4ryy3h2xhera9pkd9ky2	NGM2YTA2YmE2Y2Q1NTJlMTA0YjEyY2ZjZTUzY2E4NWFiMjNhZDg3Yjp7Il9hdXRoX3VzZXJfaWQiOiIzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IngiLCJfYXV0aF91c2VyX2hhc2giOiIzYTliY2ExNWY0ZGViZTY4Y2E2MWEwMTc5ZmU0NTc2YjE3NTIzMDA2In0=	2018-02-27 12:15:42.794747+01
o9ieiu6x5josd4hfsx6p5jluux86gct5	NmZiZDIzZTQxY2JiY2U1Y2NhMTY5YmRhODBhYjExOThhOThmZDg5Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg0Mjk5M2FlZjIyNDI4NmZhODdhNTY1N2I4OWU5ZGY2MjU5MDk1MWQifQ==	2017-10-04 14:44:56.732217+02
y9gz5wat7t911s4r0fln81frcv65g65x	ZWNhMjU3MmU4NzQ2NTY0NzRjY2RjZTdkYWE4YTQ4YjczZjY4OWM3ZTp7Il9hdXRoX3VzZXJfaWQiOiIzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNhOWJjYTE1ZjRkZWJlNjhjYTYxYTAxNzlmZTQ1NzZiMTc1MjMwMDYifQ==	2018-02-27 13:04:13.435715+01
j62c9h0xx64inbff46qrom6k3kcyf70h	Y2VlZmQ0MTJiZTY3ZmUyYmFkNTdmYmM4ZGUyNzBmOTg2MjVlNzIyZTp7ImFjY291bnRfdXNlciI6ImkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGx9	2017-10-04 18:35:35.596773+02
b7ph2g7mx3vo5nfnh295h8jhweiq0sia	OTQ1YTZmMTk1YjZhNTRmOWUwNjIzNWM2YmVjOWIzOTYyZjg1OTc4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-02-28 17:43:40.297103+01
pexpvcdimsp2tsyf649wej8vk8tsid7d	OTQ1YTZmMTk1YjZhNTRmOWUwNjIzNWM2YmVjOWIzOTYyZjg1OTc4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-02-28 17:44:27.212668+01
wdfgg1et18bfh9zmpxsjaxk5lwqiuyoo	OTQ1YTZmMTk1YjZhNTRmOWUwNjIzNWM2YmVjOWIzOTYyZjg1OTc4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-02-28 21:16:12.898748+01
1ihoja4x5vzis3sfflci7iksoi4og6y0	OThjMTE1MGJmYjBkMmNhZDVkYTI3OWIzN2QyZWMzZDgxZTAxZjgyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2017-10-25 15:48:10.633428+02
r74i5ok9zyq6yeu6i7rqr55rdmbdds98	YWI0ZjdlYjEyZDVlNmQ3Mjc3NjQxOTJmMWM0OGQ4OTZjZmMxMWEwMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQ3NWU4M2Q3YmU4ZDI4YjlmY2ExNzU4OGQ4NzFlZTg3OTA3NDZmMjQiLCJfYXV0aF91c2VyX2lkIjoiMzUifQ==	2018-03-18 21:45:46.188556+01
80r1ungkknxp4iez25d75k9tghafnyq9	ODllM2FmMzQ5Y2QxNzk2MDAxMTA1Zjk2MjlhYzM1OWYyZDM0M2ZlMzp7ImFjY291bnRfdXNlciI6Im8iLCJfYXV0aF91c2VyX2lkIjoiMjQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjJiN2E1OWY4OTk5OTczODk1ZjI3NWVhMzJhODM5ODIxOWUzODg3In0=	2017-12-01 12:03:32.712865+01
ktyi900dyv7o4qw3kheyc6secir6vzrr	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-03-20 17:46:41.588813+01
7a669u6qtg6j88jzwyy54gkz0la5w1ng	MDBlZjYyODdlNjU0ZWNiZDQyYjY4MWE3ZDMwYTg1YmMzMWI5NjBjOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNiMDI2ZTUzMGVlMjA3ZGI0Yjc2ZmY5NTNhZjBhYTY2YWVkY2I0YzkifQ==	2018-03-21 14:58:33.765683+01
ay6akvxs7wi36sas9ajkgrxu2dpt0vge	ZmNmOTc1MzQ5YWQ1ZTJhNTI1MDRmMTQwMzRmMGViMTYxOGM4ZWRjYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNiMDI2ZTUzMGVlMjA3ZGI0Yjc2ZmY5NTNhZjBhYTY2YWVkY2I0YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzgifQ==	2018-04-06 15:43:20.930076+02
a5jp4hyna1iysjjbxfufubtktuksrf2u	OWZhZWZkNWYzNWQ0NDgyNzUzZTNjNTA5YThhMWU0N2UxYWJmNDc0Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-21 18:57:49.224452+02
l4pc2vrnx1ead8wdw83rqehhq7j6ltmp	Y2MwYjIyNjdmMmIyNGEwYjM0N2NmM2M4YmI1OWNlNzZiODNjMDY1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-09-23 22:30:12.273059+02
t6rf8ppyd6pkklt3p9iaejncodxndcou	YjA4MTI5YjE4ODE2MDc5MzE0MjIzZDAwNjI0NjI1NGRlNGNlMmRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImJmMTU5Nzc2MjE2MGFlNDcyMDczNTY4ZTkwYmZkYTgwOTM4NDc0NjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMjkifQ==	2017-12-01 13:55:26.766795+01
4jozagicf56yno54obgq3wx7nc6x37ut	NGM2YmMxNzUzNGU5ODBmODQ4ZWNjNDJmYzViNzkwYTU2ZGEwYzllNjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5UTNvS1R5dEhvUjI3NUJhcVZsTTFHWFRYVHhEZ3ZUMCJ9	2017-09-24 15:02:07.481902+02
uoe7qp4uxzczdwezy19joqw50t1tw74a	Y2YzMjk5ZDA3MmE0YzY0Zjk3NWUzMGEyZjg4YTgwYjQ5ZjMxM2IzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE0OTg3ZTA1NTJiNDcyM2IxZTc0NTA5ZDk3YWRmMDRlNGI5YzI0M2QiLCJhY2NvdW50X3VzZXIiOiJ3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMyIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=	2017-12-03 17:49:14.101982+01
h4s4h3pdtdci392r8oca1ih1i6tldbun	ZTMxYzU3NDdkYjZiMTMxZTk4OWRlYjFhYzUzZjNjY2FlMzU2NGMwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMjE4NDEwOTEzZWRlNzFiMjY2NmNiYjIxMDRlZmI0NWY2NjA2Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMzAifQ==	2017-12-03 18:40:09.631069+01
9pvpz9jrla3djadvmt0n211a816jtg4j	OTM0NTgyNDYyZDAwYzMyZGU0ZmI2ZmJlM2Y1M2NiNTdlYTVlM2U0ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiYWNjb3VudF91c2VyIjoiMWMifQ==	2018-04-22 23:30:38.099358+02
9p5ii82fwc8m0zn5wini3cdy8p58cj3m	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-24 13:47:20.547375+02
184jgz8hxqme1beiwtnopi6nd6rx1k4w	ZjU2MDE5NDI4NTdiOGJkNzYxOGZmMzYxYzFkNzFjN2E4MzViNDY4ZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-25 01:02:28.227693+02
4r3etht9snpo2ngnsqldkwbdvofkamqv	MTJiNjI3MTA4ZWJlYmE4YTcyODA4ZjViMWIwMTQ4ZjJiZjI4ZTgzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvRGdrYmo1TkN0UzBWM1RCaVF6ZjdIUll6eWtuQ3BwdCIsIl9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2018-04-22 02:46:07.145282+02
givwhiobe2sma57fpj2n3mbuuxcbqww3	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-26 10:02:18.437011+02
jxbsh2l6niru1n3hmyyfmnxwhbwt3zeg	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-26 15:09:42.599675+02
1bx9tzxvh8jfhsy8u9dzlf9q1mc44zmt	OTdmNGI1NDFhZDFlNTliN2UzNWFkN2Q5OTdmZDY0ZjE4MTNmMWIxNDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MifQ==	2018-04-26 15:57:36.584227+02
ct01dilev35ah1xrhsipl0mcvv569jlc	YWQ2OWQ1YThhY2QzNGJjNDQ1NmYyM2MzMTc2NWE4MGY1NTZjOGI1Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTAifQ==	2018-04-26 15:58:24.551147+02
pu86uo6mpbocazm8ss2u8889u5gdih4h	YWQ2OWQ1YThhY2QzNGJjNDQ1NmYyM2MzMTc2NWE4MGY1NTZjOGI1Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTAifQ==	2018-04-26 16:02:04.881792+02
i5vb4eb64cs7bnmldu6sxe2dqlnf3nya	YTYxODM0NDg1ODRlM2I2NDMxMTY4ZTBmMDM1N2EzZjM3OTAwMGE2YTp7InNvY2lhbGFjY291bnRfc29jaWFsbG9naW4iOnsidG9rZW4iOnsidG9rZW5fc2VjcmV0IjoiIiwiZXhwaXJlc19hdCI6bnVsbCwidG9rZW4iOiJFQUFjNEJ6eHlkRE1CQU41SjZFdDJpbXllTlExRlRDU0RYUTVSdm9ySDh6aHhrSTlQaDU4bHpsWGxpUUZqbUJaQmVMaldhSUdOMHJlOEpmcEVmRVU0OXAzUW4xSDQ4djZjWkJxbFl1NVZneG1ncENTWFFiTlpDWUNGaXJ6eEdJenB5Y1pBdG11bU5NWkNKazg1b2I2SzJneU9uZzhzS3ZxcFhHWXdDYzR1aTE4TGgwa1pBY0JZelJVbG1McXZFb0laQllaRCIsImFwcF9pZCI6MSwiYWNjb3VudF9pZCI6bnVsbCwiaWQiOm51bGx9LCJhY2NvdW50Ijp7InVzZXJfaWQiOm51bGwsInByb3ZpZGVyIjoiZmFjZWJvb2siLCJleHRyYV9kYXRhIjp7ImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20iLCJuYW1lIjoiUGV0ciBcdTAxNjBpbGhcdTAwZTFrIiwibGFzdF9uYW1lIjoiXHUwMTYwaWxoXHUwMGUxayIsImZpcnN0X25hbWUiOiJQZXRyIiwiaWQiOiIxMDIxMDI1NjczNDc1OTE2MSJ9LCJkYXRlX2pvaW5lZCI6bnVsbCwibGFzdF9sb2dpbiI6bnVsbCwidWlkIjoiMTAyMTAyNTY3MzQ3NTkxNjEiLCJpZCI6bnVsbH0sInN0YXRlIjp7fSwiZW1haWxfYWRkcmVzc2VzIjpbeyJ2ZXJpZmllZCI6ZmFsc2UsInVzZXJfaWQiOm51bGwsInByaW1hcnkiOnRydWUsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20iLCJpZCI6bnVsbH1dLCJ1c2VyIjp7InBhc3N3b3JkIjoiIWppbUVGZ0JpeDhNUWRyaTcwdmdQbnU3WEFIZHo4ZUowMzlGbUV6bFEiLCJpZCI6bnVsbCwiZGF0ZV9qb2luZWQiOiIyMDE4LTA0LTEyVDE1OjIwOjU1LjI3OVoiLCJ1c2VybmFtZSI6IiIsImZpcnN0X25hbWUiOiJQZXRyIiwiaXNfYWN0aXZlIjp0cnVlLCJlbWFpbCI6InBldHJzaWxoYWtAZ21haWwuY29tIiwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwibGFzdF9sb2dpbiI6bnVsbCwiaXNfc3RhZmYiOmZhbHNlLCJsYXN0X25hbWUiOiJcdTAxNjBpbGhcdTAwZTFrIn19LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYTRiNTYyMTlkNGFhMjhkZWE2OTAzOGQ4OTRiNzg2MmVkMGUyNWNmIiwiX2F1dGhfdXNlcl9pZCI6IjUxIn0=	2018-04-26 17:20:55.328712+02
yogvkl2yihoo7umsr4t0k484wvppddcs	M2UwMjhkOGNlMGQ2OTg5MWE3NTlmNjJmMmRjODdhMGZlNThhOWQ4Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJhY2NvdW50X3VzZXIiOiIxZyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI1MiJ9	2018-04-26 17:35:03.298009+02
tqah0veriuk4f5r3ccmm41dcysv1cjw4	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:37:28.797066+02
2uduli4k3wlo07tp3424jytyce52fia6	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:39:39.628372+02
5k2tuams5s0qvt64nq1hql7gp8e19yap	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:43:48.100244+02
hvk9p8mc5nriha8z0v34dy5hdw40jzxr	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-26 17:46:20.143482+02
0p3y79x18jfvwyta4vrjllbe4idgqexy	YjQxN2I2MmFiZTk1NmY3ZWNhMGQ5NTYwNjJjMTFlNDVkNTdjMjA2OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjAzOWQzNmFhOWRiYTg4ZGIxYWIyNDUwMmRjOTBiOWMzZTlkMTRkZTkiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiNTcifQ==	2018-04-26 19:05:46.216737+02
cmhzu2tll5hwpsz9rk19cw0hjby7w768	ZjI5YjIyYzJhOTU0NzliOWJjNThjNWU4OTA3NmU2YTQzMzY3NDEzYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3ZjM0Yjk4NWZkYzBlNTI5YzIxNzI4YTdlMjE3YjE4YmM3MzA5MTkiLCJfYXV0aF91c2VyX2lkIjoiNTgifQ==	2018-04-26 20:00:40.822024+02
bq6z7znfzmt89d2abtm3p0fql51v79tv	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 21:17:00.242832+02
xgip2y9xrnnojk2ebrekesenfrhop4d9	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 21:37:52.319815+02
i49cgclpnfjdk73vaqkddwsqexglye5p	NjUyOThiNjcwMTZmYjQ3NzliYTlmMDY5ZDE1OGJjNTZkODhmMjY2ODp7Il9hdXRoX3VzZXJfaWQiOiI2MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUyNjUwNDdmNDNiYzJlYmQwYjJhMjU4YTMyMmVhNGRiMjVhMGQ1YjAifQ==	2018-04-26 21:40:24.080369+02
mc5ho7wt5qmyrfuoy30pxewwo3p8w94e	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 22:02:53.648232+02
iy85r3nky8bdyit9ifijs2bp1uyn51we	ZjU2MDE5NDI4NTdiOGJkNzYxOGZmMzYxYzFkNzFjN2E4MzViNDY4ZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-25 01:25:52.937037+02
qj1qogg3rv23grst34ebka2xjjz8n58s	ZjU2MDE5NDI4NTdiOGJkNzYxOGZmMzYxYzFkNzFjN2E4MzViNDY4ZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-25 01:00:22.340823+02
vg4fln5wvx8e2ls3z8b1w0iayy75gdf6	MzI0Y2RjM2MxOTdmMzMyYzg3Y2UxN2I5ZmFkOTFlODNiYTkxNjdlZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMGRkMjg5ZGI0ZTM4NTVhNTk0OWY1MjY0NDNkNTA3NGZjMDA3YmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-04-26 14:44:25.05227+02
48lwzpxa7yqezmq7mtj9w4bpmw80qgqx	YjdhNmZiZDRkOGVmZDY5OWYxNTZhNGZkODc2ODhkNGNmYWM3ZTNhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhNjU2ZDlmMDM1YTNmNzA3NWMzMmE0MDU3ZTM1MTMxNzliNjhkZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNDkiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7InN0YXRlIjp7fSwiYWNjb3VudCI6eyJsYXN0X2xvZ2luIjpudWxsLCJleHRyYV9kYXRhIjp7ImZhbWlseV9uYW1lIjoiXHUwMTYwaWxoXHUwMGUxayIsImxpbmsiOiJodHRwczovL3BsdXMuZ29vZ2xlLmNvbS8xMTQwOTYyNDA3MzA0NjMwMTQ2MDIiLCJ2ZXJpZmllZF9lbWFpbCI6dHJ1ZSwiZW1haWwiOiJwZXRyc2lsaGFrQGdtYWlsLmNvbSIsImdpdmVuX25hbWUiOiJQZXRyIiwibG9jYWxlIjoiY3MiLCJnZW5kZXIiOiJtYWxlIiwibmFtZSI6IlBldHIgXHUwMTYwaWxoXHUwMGUxayIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vLVhkVUlxZE1rQ1dBL0FBQUFBQUFBQUFJL0FBQUFBQUFBQUFBLzQyNTJyc2NidjVNL3Bob3RvLmpwZyIsImlkIjoiMTE0MDk2MjQwNzMwNDYzMDE0NjAyIn0sImRhdGVfam9pbmVkIjpudWxsLCJ1c2VyX2lkIjpudWxsLCJwcm92aWRlciI6Imdvb2dsZSIsInVpZCI6IjExNDA5NjI0MDczMDQ2MzAxNDYwMiIsImlkIjpudWxsfSwiZW1haWxfYWRkcmVzc2VzIjpbeyJ2ZXJpZmllZCI6dHJ1ZSwidXNlcl9pZCI6bnVsbCwiaWQiOm51bGwsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20iLCJwcmltYXJ5Ijp0cnVlfV0sInRva2VuIjp7ImlkIjpudWxsLCJ0b2tlbl9zZWNyZXQiOiIiLCJ0b2tlbiI6InlhMjkuR2wyYkJRbWNnTk1oRjQzZ2duU3FOWUhaRW9iN3cwNlNuRXlHaDl3Mmxma0JlUGEtOGRwMjBKSzFYZVZLdUpxOVk2X3d5b2FTOEplY0xoZkNhQkh4SktpT3AwUjFsdzNYRnlUYTZqdF83ZTJ1cDMwWHd0bTF6dDNTOWM1ZkowZyIsImV4cGlyZXNfYXQiOm51bGwsImFwcF9pZCI6MiwiYWNjb3VudF9pZCI6bnVsbH0sInVzZXIiOnsidXNlcm5hbWUiOiIiLCJsYXN0X2xvZ2luIjpudWxsLCJmaXJzdF9uYW1lIjoiUGV0ciIsImlzX3N0YWZmIjpmYWxzZSwiZGF0ZV9qb2luZWQiOiIyMDE4LTA0LTEyVDEzOjQ3OjU1Ljg2NFoiLCJpc19hY3RpdmUiOnRydWUsImxhc3RfbmFtZSI6Ilx1MDE2MGlsaFx1MDBlMWsiLCJwYXNzd29yZCI6IiFYalZ1d0ZaYWpSS04zdGdBY0JXRVlwdGl2bkRRRFBSbHNFSWN0NFZ5IiwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwiZW1haWwiOiJwZXRyc2lsaGFrQGdtYWlsLmNvbSIsImlkIjpudWxsfX19	2018-04-26 15:47:55.933864+02
3tv81ywx51skngi2xpnt5ztqgd9qf9qs	YWQ2OWQ1YThhY2QzNGJjNDQ1NmYyM2MzMTc2NWE4MGY1NTZjOGI1Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTAifQ==	2018-04-26 15:58:16.23107+02
qjcx8zwodfznqg7pqws5recpk5z98jgg	YWQ2OWQ1YThhY2QzNGJjNDQ1NmYyM2MzMTc2NWE4MGY1NTZjOGI1Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTAifQ==	2018-04-26 15:59:22.736144+02
io7mtcogcgbuxkh7uy4m2fr2c352kk21	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 22:54:09.14858+02
0bnxn72e8u4k9402slfeowqa2kscpbva	YWQ2OWQ1YThhY2QzNGJjNDQ1NmYyM2MzMTc2NWE4MGY1NTZjOGI1Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjljZDk2ZjdmYmNhMWVkYTRhMWFhY2MyZDFhOTM1NjlkYTMwY2RhN2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNTAifQ==	2018-04-26 16:04:29.733833+02
aar1finu55s575179iihe8gzezgu00cw	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-26 17:34:30.86625+02
4cjox94jqybhxhkpuvyvihy8hothzr7g	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:36:46.515951+02
5bwu2vb0f7ma1osxmno9ntitmchbp2dl	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:38:16.63084+02
milp4itrwxmwd783ezpjjlxsmqmjdx0z	ZjA2NzQwZTRjZjc3NjVlNmFlNDM0MjY4NDZlNmYxMThhZTI1Y2ZkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRhYTZjNDJlYjE0ZGZmMjBkNTMzMWRkNDI1MmIxMGMwYjI5OGQ1YzAiLCJfYXV0aF91c2VyX2lkIjoiNTIifQ==	2018-04-26 17:43:12.688432+02
jwnj4sgjtwq3cmnmm383o20vm7goqh3s	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-26 17:47:19.836385+02
o692suhf5dl70s5ts6c83j0m0pyh3zhh	OGY5OGRkZWM3ZGU1Mjg3ZjkzZjZmOTY4YTM3MTY4MTBkOTQxNDY2Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImI1NWIyZWE4MjMzZGUzYjAxNjUxNzdiMmRjNDEzZTAxNTg4MTY4ZTEiLCJfYXV0aF91c2VyX2lkIjoiNTUifQ==	2018-04-26 17:49:47.749956+02
uo7pbc1yzyxjto4rg574c3lc20wo1c2x	OGFkYWYyMmZhYmM2MDdlM2RiZjk1NTQ5ZGNhMTMxYWU0MWQxZjM3MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJlYmI5YWZmMzI3OGRiZmNkN2FlNjVkNmJkYzY3ZTk2ZmYyMDg0MTAiLCJfYXV0aF91c2VyX2lkIjoiNTYifQ==	2018-04-26 18:10:00.203576+02
hkxnff4kfi2kk3mnpp2id8sh2zo0pn10	OGUwODkzYTIxM2ExMTliZjhkNmNjNjg1OGExNWQ4MzFlOGUyY2M1Zjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjF4In0=	2018-05-16 19:45:53.963471+02
7xvhguti6p0v4z6ifgyyifppjyc2pfxy	MjExMGEwZjk3NjdkZGJkZWMyNGVlODM3MTMwZjMzODc2ZmJmY2M3Zjp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImI1NWIyZWE4MjMzZGUzYjAxNjUxNzdiMmRjNDEzZTAxNTg4MTY4ZTEifQ==	2018-04-26 21:13:02.117206+02
3w62lp67d56jllmrnpiq4n51bgnlokru	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 21:22:53.757464+02
kkn5w4su80alr582qwgei25sfkncusp2	MThiNzExZjVjZmE1N2FkOGM5YTgwZmFiN2NhYzY2NmUzNTU5MGJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiZTJlNjBiNTcwMWIxYzBjMzljNDMwZjhjNTcxMmMyZjcyYjEyODQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-06 15:33:06.077732+02
5bncixkh1bp5xaehl0to9qwor4sx5xj5	MzAzNjVkZjcxYjgyMTJhNzBkODNmYWYxYmQ1NGIyMTg5NTFhNGEzOTp7Il9hdXRoX3VzZXJfaWQiOiI2MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVlNGVmNTBiN2FlOWEwYzE0Y2ZiZDYwZDUyNWRkZmJlYzc0MWFlNWIifQ==	2018-04-26 22:05:09.139943+02
o8wczaeua37fa9t079kmezzmkacu8ci7	ODcwZjBkMDUzMGEyNGRjZmFhNTRhYWQzNDZhNGM2YjFlN2IzMTM3NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-06-02 18:12:46.144246+02
wilsr7t86gphghxtvqbc4h6fkicu2cex	ZmIxNzdjOWJlMjI0YWY0Mjc2ZmRmZWE5YjA3MzhmYmEyZjk3NTFhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiNzI1ODhjODEwY2MzMzQ2YzE4NDU0MWRmYjI3NTE0ZTM4OWRmMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-05 19:41:01.397049+02
rudiaecdyvdrtys9ugngf1khyvoouxve	YzI4Y2Y4NjNmMTc0MmZjZDliNGY4NzAyYWE0YjgxNzYwZDMxNDU0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyYzUyMGY1NWE5N2Y3N2ZiZTU3NDQ5YmUwZWFkZWY1NmUzZTMwM2EiLCJfYXV0aF91c2VyX2lkIjoiNzQifQ==	2018-05-28 07:30:11.40888+02
ntqgclg3l102u5dhrvueqjp7gurvmubx	ZTBjYmY1ZjIzM2MzODY3NmE5YjAzOGNjYzIwNWUzMWJhODUxYTE4NDp7Il9hdXRoX3VzZXJfaWQiOiI2NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijk1MWUwYTNjODkyNTBlMzhkMWIyZDk5MmVkYzU2YTczYmRmZTJmMTMifQ==	2018-04-26 22:06:13.196561+02
fran7choweshwod67yx33wjt7q7xpxxk	NzEyNWM1ZDAxNGYyNzc4NjE2Nzg3N2Y4ZDRjOTY1ZGVkM2I2MTM0YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNzgifQ==	2018-06-02 18:19:01.433294+02
aiidlbzt5ie9qk0qph88vbjcxtggo23b	NTRlZmJmMDU0OTBhMzM5ZTM3NjA1Yjg1NWZhMGZkMGVlY2QyMGQxZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-06 17:25:32.123379+02
vivndwf5vnm3so9rfqc9xenichflgo6x	ZDNlNDBjYTMyNzk1ZjIzYzUyNDhhMzY2MDk1ZWM1NDI4YTg4ZWFkMjp7Il9hdXRoX3VzZXJfaWQiOiI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQyOTliMjg5MjdmOTRkMmZiNGVlNjNjNjAwNjQ0YTI1OGZlMGJiYmMifQ==	2018-04-26 22:13:21.999417+02
4sc8mh9xrns69f9exd2k2hjfilohwgmw	ODcwZjBkMDUzMGEyNGRjZmFhNTRhYWQzNDZhNGM2YjFlN2IzMTM3NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-06-02 18:48:57.87071+02
uak6yfvhx21nneyq84wm4raxz07yimb8	MThiNzExZjVjZmE1N2FkOGM5YTgwZmFiN2NhYzY2NmUzNTU5MGJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiZTJlNjBiNTcwMWIxYzBjMzljNDMwZjhjNTcxMmMyZjcyYjEyODQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-05 19:54:44.287232+02
zgzo7g4u6acegh63p1cbsgyvtdualr6e	ZDA3YmVlYjczZWQ2ZjJlZDNjNGExZjI0OGZlYWMwOTZiYTQ0ZTA2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg4NjdlNmIwYmE0ZGIxZDMyMjkzZTRmODgwOTQ2ZWNkYTgxOGI3NTQiLCJfYXV0aF91c2VyX2lkIjoiOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7InRva2VuIjp7ImlkIjpudWxsLCJ0b2tlbl9zZWNyZXQiOiIiLCJ0b2tlbiI6InlhMjkuR2wxZkJqNGx0QWY2Y2JyRG5VWC1JZzFhd1BuUHBuSkVVaDVMUEFYN3RJaFlJOEFNQnR5eE1jN3JCdzZKZl9nNUp6VmkxaGM1c2hoOEtCZGhwX3I1bzhBd2NaR3drNV94S19SMk9GcEJiYWJ5QU1fSWNkOG5mdXJjN1I1cV93VSIsImV4cGlyZXNfYXQiOm51bGwsImFjY291bnRfaWQiOm51bGwsImFwcF9pZCI6Mn0sInN0YXRlIjp7fSwiZW1haWxfYWRkcmVzc2VzIjpbeyJpZCI6bnVsbCwidmVyaWZpZWQiOnRydWUsInVzZXJfaWQiOm51bGwsInByaW1hcnkiOnRydWUsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20ifV0sInVzZXIiOnsiaWQiOm51bGwsImxhc3RfbG9naW4iOm51bGwsInBhc3N3b3JkIjoiITlqd0pQRE5TNWpjc1NXQVpHZDJzeld2U2VteENHclJHYWxjeFlvejciLCJ1c2VybmFtZSI6IiIsImlzX3N0YWZmIjpmYWxzZSwiaXNfc3VwZXJ1c2VyIjpmYWxzZSwibGFzdF9uYW1lIjoiXHUwMTYwaWxoXHUwMGUxayIsImlzX2FjdGl2ZSI6dHJ1ZSwiZGF0ZV9qb2luZWQiOiIyMDE4LTExLTI1VDE4OjQ0OjM4LjEwN1oiLCJmaXJzdF9uYW1lIjoiUGV0ciIsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20ifSwiYWNjb3VudCI6eyJpZCI6bnVsbCwibGFzdF9sb2dpbiI6bnVsbCwicHJvdmlkZXIiOiJnb29nbGUiLCJ1c2VyX2lkIjpudWxsLCJleHRyYV9kYXRhIjp7ImlkIjoiMTE0MDk2MjQwNzMwNDYzMDE0NjAyIiwibG9jYWxlIjoiY3MiLCJnaXZlbl9uYW1lIjoiUGV0ciIsIm5hbWUiOiJQZXRyIFx1MDE2MGlsaFx1MDBlMWsiLCJsaW5rIjoiaHR0cHM6Ly9wbHVzLmdvb2dsZS5jb20vMTE0MDk2MjQwNzMwNDYzMDE0NjAyIiwiZW1haWwiOiJwZXRyc2lsaGFrQGdtYWlsLmNvbSIsInBpY3R1cmUiOiJodHRwczovL2xoNS5nb29nbGV1c2VyY29udGVudC5jb20vLXdKRUVSMGEzMXdZL0FBQUFBQUFBQUFJL0FBQUFBQUFBQUFBL0FHRGd3LWc4Qm02YWE1b3F1c0JnTXNWMFhmemZITDlGeWcvbW8vcGhvdG8uanBnIiwidmVyaWZpZWRfZW1haWwiOnRydWUsImdlbmRlciI6Im1hbGUiLCJmYW1pbHlfbmFtZSI6Ilx1MDE2MGlsaFx1MDBlMWsifSwidWlkIjoiMTE0MDk2MjQwNzMwNDYzMDE0NjAyIiwiZGF0ZV9qb2luZWQiOm51bGx9fX0=	2018-12-09 19:44:39.430892+01
p8ti7u5vrx0toxspi2cgrydbva20nofp	N2JkOWJmNDkzYWJhNmQwNjU2ZDA3ZDA3MzliY2NlMTQ1Mzc1NjI0Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MyIsIl9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIifQ==	2019-01-10 07:30:09.13346+01
w98ya91u0e9ooxkne7tecobptqnmudsq	NzdhODYzMzVhNTA3OGY2M2U5ZTU1YTg2M2MwNzA0MzlkYjA2ZTVhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGRiYzU5NTZmNGJlMjIzMmQwZmMxYjg1YzhhZDA0ZTM0N2ZmN2YxIn0=	2018-04-26 22:53:04.334186+02
aeyz3ml3ujhq1vnzrmd3cjo2xlh32204	YzI4Y2Y4NjNmMTc0MmZjZDliNGY4NzAyYWE0YjgxNzYwZDMxNDU0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyYzUyMGY1NWE5N2Y3N2ZiZTU3NDQ5YmUwZWFkZWY1NmUzZTMwM2EiLCJfYXV0aF91c2VyX2lkIjoiNzQifQ==	2018-05-28 07:31:12.492648+02
rs3d89oybtqtfihovrgcmj4lqg6cionw	Nzc2OGE3NzNhMjI4MThlYjY1YjhkZDIxYzk5ZDBkNWJkM2U5OTZhMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzMzQxMjM0NjRjZjdiYzU2ODY1YmMyZmFmNjU2OTFiZDQ0NmQwYzkiLCJfYXV0aF91c2VyX2lkIjoiOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-07 19:36:47.148688+02
r4wqnn3zwmfqqhrsaqosg2522myt79k0	NzEyNWM1ZDAxNGYyNzc4NjE2Nzg3N2Y4ZDRjOTY1ZGVkM2I2MTM0YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNzgifQ==	2018-06-02 18:56:44.071927+02
i5iyq4r60iafsjlx5wbl0xki1a9uq1sy	N2JkOWJmNDkzYWJhNmQwNjU2ZDA3ZDA3MzliY2NlMTQ1Mzc1NjI0Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MyIsIl9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIifQ==	2019-01-10 07:46:10.896604+01
sxawjfw1wgcga49iskiuf29pf1vrapfe	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-07 13:39:23.591513+01
b7icfhly89efxjppzz3ff3kc7zfmiqng	ZDdjZTA4NjZmYzMxYTA3M2Q3YTAxMTJmNmJjMWZlY2JjYzNiNDAwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlMzMyY2RkODgyZmFhNjBiYzA5NmMxMmQ3OGJlOThmMjQyNjlmNDUiLCJfYXV0aF91c2VyX2lkIjoiODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-08 09:52:18.949912+02
yt8gki3jphem9rn1wtxf959lnlnf19jb	ZGU0YzUyZGNlZWMzZWJhOWQ3ODI1MDcxNWM3Yjg2YjVjYjI0NGJhZDp7Il9hdXRoX3VzZXJfaWQiOiI2NyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA5MDQxZDg4YzM0ODRmNDE0NGRiZjk1YjVlYjE5OTZhMjA0MjY0N2QifQ==	2018-04-26 23:13:37.45612+02
c8saxdjyefgowe8zgn8wipzf68lq2sv8	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-03 22:32:26.55159+02
wtnmsiqcxjqn9ar8sndb77znqupgvrhp	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-10 08:58:23.629398+01
ujrf7692acpxvblnu5p19zclfedrinct	NTRjZmVjM2QzMGM4NTgwOGYzZjJiNjkxM2ZhYTEyY2FjZDc2YjMxMDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkifQ==	2018-04-26 23:11:49.094256+02
w9wbrc6u67hx5a78vukj4i0povl93ho6	ZDdjZTA4NjZmYzMxYTA3M2Q3YTAxMTJmNmJjMWZlY2JjYzNiNDAwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlMzMyY2RkODgyZmFhNjBiYzA5NmMxMmQ3OGJlOThmMjQyNjlmNDUiLCJfYXV0aF91c2VyX2lkIjoiODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-08 09:53:23.154676+02
tlirfriwg6bq0ghkpredzf83fgz36jgr	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-02 22:48:04.698823+02
h7alfw7wf15pkp6vvnqpv7g21mwhnrnb	MThiNzExZjVjZmE1N2FkOGM5YTgwZmFiN2NhYzY2NmUzNTU5MGJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiZTJlNjBiNTcwMWIxYzBjMzljNDMwZjhjNTcxMmMyZjcyYjEyODQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-01-02 08:05:39.335375+01
1nkoa420auwhhiyynbf2vn2uqhgyjh6k	ZmU3ZGY0NWNmZTYyY2IxMjUxNjVmYzdlNmI4YTFhN2VmZDU4MzA2ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYmUyZTYwYjU3MDFiMWMwYzM5YzQzMGY4YzU3MTJjMmY3MmIxMjg0In0=	2019-02-04 17:23:46.737482+01
5ayefad6vnrzrmdkiebg2aqy5y0qomr0	NjIwYjU2ZWJmOWNlNjYyNGQxMDQ4MmNmNDI4ZDI5ODQyNjQ2MzBhYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkZDIyZWQ0ZDJkZDUyODJiNWNmMGIyYjllNGE3ZGU2Y2VjYzI1ZWQiLCJfYXV0aF91c2VyX2lkIjoiODIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-08 11:40:25.860016+02
2076g497i1obac0z3867cj7j87ogezg2	MThiNzExZjVjZmE1N2FkOGM5YTgwZmFiN2NhYzY2NmUzNTU5MGJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiZTJlNjBiNTcwMWIxYzBjMzljNDMwZjhjNTcxMmMyZjcyYjEyODQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-01-02 08:07:01.205772+01
770csyvr6aplo5xgjbxs60o371j5euws	ODcwZjBkMDUzMGEyNGRjZmFhNTRhYWQzNDZhNGM2YjFlN2IzMTM3NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-06-02 23:53:35.375476+02
cputy31zrkgncgj1yahz8itbvespeuvu	YWEyYTgzNWM4ZDhjMGI1ZjY5ZmQ4ZmQ2OWE0MTg1MzhkNjc4MzA3NTp7Il9hdXRoX3VzZXJfaWQiOiI5NCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhmMWYwYzA5ZWI4MzliZTU5YjU2MjgzYTViODhiYzNhMjczN2EzNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2019-02-10 10:03:14.122387+01
s1onafvvg726gfjqgbsy4npz3cf8rug0	NTRjZmVjM2QzMGM4NTgwOGYzZjJiNjkxM2ZhYTEyY2FjZDc2YjMxMDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkifQ==	2018-04-26 23:16:40.282551+02
iqt8xrl53i1c2lad1swtlthvcdpj751p	NjIwYjU2ZWJmOWNlNjYyNGQxMDQ4MmNmNDI4ZDI5ODQyNjQ2MzBhYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkZDIyZWQ0ZDJkZDUyODJiNWNmMGIyYjllNGE3ZGU2Y2VjYzI1ZWQiLCJfYXV0aF91c2VyX2lkIjoiODIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-08 12:38:54.379557+02
intzq25fv2akl0c8ka2sji09xw2zmsw7	MThiNzExZjVjZmE1N2FkOGM5YTgwZmFiN2NhYzY2NmUzNTU5MGJlMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJiZTJlNjBiNTcwMWIxYzBjMzljNDMwZjhjNTcxMmMyZjcyYjEyODQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-01-02 08:08:16.620344+01
yyy28edvznsdd6sxhmnnm7nzgovgk6xq	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-11 17:08:05.912951+01
y48glkvu8am7l1ws4ngtlqswv3l0hs9o	NTRjZmVjM2QzMGM4NTgwOGYzZjJiNjkxM2ZhYTEyY2FjZDc2YjMxMDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkifQ==	2018-04-26 23:20:33.331168+02
g5awrpsrc3gpz39v7fmp24d7avv2y5xv	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-29 16:37:11.931314+02
d5zv73318htm3mectegoiof44bdsapr8	MTc5NDYzZjFiZjkzNWJjMGQxMDhiNGQ0NjNjYjlkY2ZjNDM1MjY5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2lkIjoiNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-14 13:37:18.725514+02
3lps4kvk3eba5f5fzcf0a0b622ajy83p	ZDEwNzU2YjQ1YmNjYmZmZDUwZTIwZmQ0NmIwOWM4N2FjZDg4MThlZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJfYXV0aF91c2VyX2lkIjoiODMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2019-01-03 15:12:15.848072+01
ehtpqpb5t5s1lr6ar9u3ynd8uqqr0efp	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-11 17:09:05.872138+01
vlys2yogpidqdt6dm7lex765uc63g0u8	YTdiZjM5MjAzMTlmMmQ0NDRhMzE3OGM5YmYxNTE2ZDZmMDU5OTMyNzp7Il9hdXRoX3VzZXJfaWQiOiI4MiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjlkZDIyZWQ0ZDJkZDUyODJiNWNmMGIyYjllNGE3ZGU2Y2VjYzI1ZWQiLCJhY2NvdW50X3VzZXIiOiIyYSJ9	2018-06-03 12:04:57.041774+02
xczszy855rmhe5yfc027c3482mw4a42i	NTRjZmVjM2QzMGM4NTgwOGYzZjJiNjkxM2ZhYTEyY2FjZDc2YjMxMDp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkifQ==	2018-04-26 23:27:52.388844+02
q0ysh0u5o5ljimwqoc9xewrwxcryassc	MjNhYzRlN2U3YjQ4ZjExNjQ4MzIzMzg2Y2Q1OGQzYzliN2Q1ZGYwODp7Il9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxNmRmMzBmZjc5NWQ4NGZkYmIwYTg5M2YxY2RmMTA3ZmM5NWY0NjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-05-30 10:25:45.130756+02
snhapt7q0a9e67gx61294xqebd1xil3m	NzEyNWM1ZDAxNGYyNzc4NjE2Nzg3N2Y4ZDRjOTY1ZGVkM2I2MTM0YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNzgifQ==	2018-06-03 13:42:34.667693+02
b3lbuk2yp9zzmhqxwgj6nqdwgcncvcjk	OGJkZmMzNmFkNWRiZTJlMmNmYzIxZjA0YzNiZDk1YWZiNTE2MWE0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-04-27 00:09:39.852324+02
b9nfu9a4d4nqial8d2vpybk5vuhdwby6	ODJkYmFhZmNjZTdiZTBmNDJkNzgwMGE1ODYzZDhkZmU1NGFhNjZkYjp7ImFjY291bnRfdXNlciI6IjJyIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=	2019-02-13 07:48:14.669706+01
zqttdhmjxkej8ss7q3a91657gpu2xm4r	OWQyYTUxZWNmMjZmMjE0ZWRiYTFjOTA4NzlkNDczN2Q3OGNlNzM5NTp7Il9hdXRoX3VzZXJfaWQiOiI3NiIsImFjY291bnRfdXNlciI6IjI0IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk1MzkyNzliYWRlMDczZWIyODk4NjEwYTEzYzIxY2VhZjU3NjRmYSJ9	2018-05-30 14:01:32.650048+02
w0d8bb5ehrbhgsfuj5ezv9zv8jnot5ez	OGJkZmMzNmFkNWRiZTJlMmNmYzIxZjA0YzNiZDk1YWZiNTE2MWE0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-04-27 00:16:28.534469+02
1o8i4cwiqcs1glthxw5nmbga6oq4nl36	NTM1Y2U0YWFiZThlZDUzZjRhYzExY2I3ZjNiMjE5YWIxMWUxZWVlZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNlYTU4MWQ2MTI1MmI0NWZhZTZhMDI1NmYzY2FkMWE5MGFhYTk3MjkiLCJfYXV0aF91c2VyX2lkIjoiNjgifQ==	2018-04-27 00:18:04.091729+02
erikuhcjdk8gsd71xq616n8nxnu58msg	Y2U1NWUzM2EwOTcyYjRiYmMzYjFiM2RjNzNjODI2MjhhYjk5YjU1OTp7Il9hdXRoX3VzZXJfaWQiOiI3NiIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ5NTM5Mjc5YmFkZTA3M2ViMjg5ODYxMGExM2MyMWNlYWY1NzY0ZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-05-30 14:03:04.727164+02
nvnc9uz3b714vftti2rsezb89hm9p1dy	ZjIyOWI2Y2I5OTFiYmYxYmI0Y2MyMzhmZTYzOTRhZTVlNmZiMjg2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YmJiZWM3YzVkYTFlNGYyOGRiZGRiMjQ4NWNkMmZiNjIxNjI5ZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiOTkifQ==	2019-02-13 07:59:11.575144+01
fd6a1no9bkufi32n1m9ozonecagv47xr	MzZkZDVlMTAxM2E4NTY3M2U3OTQ1OTQyNmNmY2E0ZjU1M2RmZmI5Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3VzZXIiOiIyYiIsIl9hdXRoX3VzZXJfaWQiOiI4MyJ9	2018-06-03 14:08:54.845549+02
l82oz9ufk0avz3h5a8gky0ngmiu5tli7	OGJkZmMzNmFkNWRiZTJlMmNmYzIxZjA0YzNiZDk1YWZiNTE2MWE0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-04-27 00:19:36.718827+02
tjqpzlrzd2tn8drnl28qc03grymc9war	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-05-30 14:04:36.416127+02
pcm8qcl8ixbh25f99t1lty0doaadkcot	MDgyZTgyZWNiZThjYTM1MjcyZTlmNmRhYzkyNTgyZDM3YTBkM2QzNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhmMWYwYzA5ZWI4MzliZTU5YjU2MjgzYTViODhiYzNhMjczN2EzNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiOTQifQ==	2019-02-13 08:25:01.69376+01
gha7qzvsadpxemd9po23c8t9rqz1n1es	OGJkZmMzNmFkNWRiZTJlMmNmYzIxZjA0YzNiZDk1YWZiNTE2MWE0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEifQ==	2018-04-27 00:22:08.723279+02
cs3l27kp8qwagsvzu0e48czf4z2u3z02	YTBiMzBiOGI3M2M0MDllYjE3Zjg4ZTU5M2JlZGZkODg5YzA0YjM3ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiODMifQ==	2018-06-03 15:07:28.013614+02
h0xvtw01h3ya0x44z5pbfg4tgdhcbmde	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-27 08:13:32.018846+02
joug2r1089sqdmvjsr5f8ylvcqha9yaf	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-20 10:06:32.168317+01
nies99f3mizooshup8j96w5ayjwy95vr	NDc2YWIyYTE3MmIwNTg3ZGNjYmMyMWZlNDFhZTlmMzZkZDM4ZDBkYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ5YjdlZjM0YTM5NDAzYWY2OWMzMTFlZGIzOWFjZDgwYzhlNTJjYjciLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3VzZXIiOiIyOSIsIl9hdXRoX3VzZXJfaWQiOiI4MSJ9	2018-06-03 15:40:38.07956+02
xlhurn3a4ab6acnijyt12hchzmzzxa09	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-27 08:13:51.495178+02
nad3ymlu0kn3zxfa0hv1wvatxfjav3jw	OWE3MzNmY2Q4MzM4NjliNWNlOTdlZTRhZmMwODA4YTZiMGYxNWI1NDp7Il9hdXRoX3VzZXJfaWQiOiI3OCIsImFjY291bnRfdXNlciI6IjI2IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWY3NmNiMjRiZGUzZTRlODgzM2E5NjVkOGFiYjBkMTdlMDdlZWVlNiJ9	2018-05-30 14:10:03.687836+02
0yol2z8r4s22haqw9wc5mqph20bqzmse	NzIxMDc0NGE1Y2QxOWIxYzhhNTNjYzY1NGU1YmQ3M2MzMTFmYzIwMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJlMmU2MGI1NzAxYjFjMGMzOWM0MzBmOGM1NzEyYzJmNzJiMTI4NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-02-20 10:07:00.062237+01
7f9uiy0t3f407bg2vqz39oxgfx5rz4b7	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-27 10:50:23.619433+02
lx1pldq4nyom0tq3ac3ls8il7jh8u4hn	NmFjNzZkYmU5NDJmZTI5ODcwMDFmYzYyODg5NzQ3Zjc0ZDc1ZmI3ZDp7Il9hdXRoX3VzZXJfaWQiOiI3OCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-05-30 14:10:03.936419+02
yqnhoicjrpylbqxjv9vpgqwt5s2y8t4f	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-03 17:18:10.466638+02
lj3szhcxpsu3rin85d665e3v0ahhpaan	ZjNmZTg2MjllN2NkNzk1OGQ1MzU1OTA3ZmFlOTI0Zjc2MWQxODIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-27 10:51:10.22851+02
xs11mzhd4iwarg8ktb6uxkmklvutze9j	MjNhYzRlN2U3YjQ4ZjExNjQ4MzIzMzg2Y2Q1OGQzYzliN2Q1ZGYwODp7Il9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxNmRmMzBmZjc5NWQ4NGZkYmIwYTg5M2YxY2RmMTA3ZmM5NWY0NjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-05-30 22:11:34.861626+02
1659rupcj3p29fas8jv64dsaiqrltye2	YTBiMzBiOGI3M2M0MDllYjE3Zjg4ZTU5M2JlZGZkODg5YzA0YjM3ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiODMifQ==	2018-06-03 17:59:13.194552+02
0s6t9jgnigheuor97kvnx1k48detp15z	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-27 11:08:43.484972+02
q45d1sc8gq1pf3t9l2oesm1rhpkjs61g	MzM4Mjk1MTI5NGJiYjlkOWRlNjc1MDUxMjA3MjI5NWY0ZjRjYTkxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkZGJjNTk1NmY0YmUyMjMyZDBmYzFiODVjOGFkMDRlMzQ3ZmY3ZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-06-03 18:23:23.17739+02
xiwqks13zath0tvkcfwwi9fr7a0l4bsh	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-27 11:16:22.034297+02
mr8bw4ulkh2qcgwzgezej75auoihv6k6	ZmUyNDA2YTYwM2VlYzA0ODlhNzQwYTY4ZDkwMTlkNTA3YjM5ZTM2OTp7Il9hdXRoX3VzZXJfaWQiOiI3OSIsImFjY291bnRfdXNlciI6IjI3IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTViOWRhYTgyMDZiYmUzOTQ2MzUwYjA4ZTEyMGUyNWRkY2Y0ODc0NSJ9	2018-05-31 14:59:53.927026+02
nudeyq1o0wluvu2pk7czrdlxrl7xj82t	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-27 14:24:01.307845+02
6vjwjpdsksyffahjck2beki9egknl93p	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-05-31 22:51:09.846961+02
lmmzqq8qxixxnbg48yp2ni9g3sjomrzd	ZDBhZWM5NzhjYzgzYTNkOThmYTYxMTI1ZTUyZDBiZDYzNjRjZWRkZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1MDAwNGIzYzg4YTc2ODE4YWIxYTkxMWM0MGNiNGY1ZDA5NWFjYmIiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3VzZXIiOiIyZCIsIl9hdXRoX3VzZXJfaWQiOiI4NSJ9	2018-06-03 19:27:51.284387+02
1gg8ls89kplane5tz4papxh7mrvw0821	ZjkwODMyMzAwZmIyMDZhOTczNTdjNjlkNjIwYjc1ZjVkNDE5N2U0MTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-04-27 11:45:10.30963+02
xspmjk0sdm0d26si27mupsiimtw4jrc4	ODBmMzgxYjQyNWQ3YjRlODgwMzhhNWM5YzI4MWQ3MzM0ZjIwMmVhMDp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsImFjY291bnRfdXNlciI6IjI4IiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjdkYjFlZjkwOWEyODJkMjFlN2FiZWMyZWM0NmYxZGRjYmJjNzkwMyJ9	2018-06-01 13:51:51.916915+02
5r3uma3llor4ttzklzlmddd6bwsi4bg8	ZTk0ZDhlZTE5M2FmZTJiZGM4M2NmZWJmNjAyNjkxMDViNmM2MGY4YTp7ImFjY291bnRfdXNlciI6IjJlIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9oYXNoIjoiYTM1ZGJjY2I1ZWQwMWI5ZDI5NzUwM2MzMDA5YWVjYjNkYTNlMzI3OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4NiJ9	2018-06-03 19:50:58.867822+02
ufhoqepo70b25vnnx8vfh3knqx37dqgn	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-16 19:36:04.116778+02
ex8m51kchpeqlaktupkh6vk12lz5psk6	MjNhYzRlN2U3YjQ4ZjExNjQ4MzIzMzg2Y2Q1OGQzYzliN2Q1ZGYwODp7Il9hdXRoX3VzZXJfaWQiOiI3NyIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxNmRmMzBmZjc5NWQ4NGZkYmIwYTg5M2YxY2RmMTA3ZmM5NWY0NjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-01 18:05:23.046007+02
bckvmkdv31j9bd6dn8bsnu1ndqsi34h1	MzNlNDI2NjA3OWU4ZTRiM2ExZTAzOTU2MmE4NDljZTMzODhmZjdjYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImVjNTY0NmIyZWU3ZDhjNjYyYWJlYmVkYmIzNjBiMjkwMzNmNmI4ZjYiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJhY2NvdW50X3VzZXIiOiIyZiIsIl9hdXRoX3VzZXJfaWQiOiI4NyJ9	2018-06-03 20:26:44.611152+02
lptquc7oufb5i0rwkx6kj8sjrpim5zlp	YTkwYjRhY2I0MmRlMTFmMDU4MjMyOTVmOTY2ZTFlMWI1MGQ5MzMwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RkYmM1OTU2ZjRiZTIyMzJkMGZjMWI4NWM4YWQwNGUzNDdmZjdmMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-05-16 19:36:28.955098+02
8h5z4r6ha6ce7y2ypba57j5wg3jwpfxz	MTc5NDYzZjFiZjkzNWJjMGQxMDhiNGQ0NjNjYjlkY2ZjNDM1MjY5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzZjYjI0YmRlM2U0ZTg4MzNhOTY1ZDhhYmIwZDE3ZTA3ZWVlZTYiLCJfYXV0aF91c2VyX2lkIjoiNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-02 14:29:06.287464+02
lryh34qe7nne23vpcaae8pidufgzpnsa	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-16 19:48:45.408587+02
lxffh3ztsdqae8r0li771qmgubs1457t	OGVhM2QxNWJmMWRjZWZlYTY4YjQzZTg3NTE3NjZmMTM5NzNjOWRlMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkifQ==	2018-06-02 16:51:01.526922+02
wzjnk3t0djkl372grcmtkul4mp5ip9m9	MjZmODliZTIzMDI4ZTBhMTY1MGUwMmRhZjc1YzMzNzhhNDAxZjY5MDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjJnIiwiX2F1dGhfdXNlcl9pZCI6Ijg4IiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM5MjU1NGM4MGJkNzRiZjViMThiMjAzZTZjOTJiNzk0MDdjNDYxYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2018-06-03 21:57:42.058714+02
bvnsdp1thu5ym0b5qflpottwckj8sztu	ZDEwNzU2YjQ1YmNjYmZmZDUwZTIwZmQ0NmIwOWM4N2FjZDg4MThlZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJfYXV0aF91c2VyX2lkIjoiODMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-03 22:11:09.483514+02
iiafv21gq7qwq9r4t4vnab0qp17ufx7g	NTViZThhNzBlZTM3ODA0NGZiN2Q3NzUzMWNkZDkzNTI4YmU1ZDBiYjp7Il9hdXRoX3VzZXJfaWQiOiI2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUifQ==	2018-05-27 11:13:23.525126+02
hcvjkrnhxcsxisphjqf1ffe9cfpt23ff	Nzc5YzEzZWNmZDAzY2QzZmY2NDNkMjA1MmY0MmJlNDRmNDgwZWE4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgzZWFiZTQ3YmRhMDIzYjg3ODg5ZGUxMDk3NjczYzUzNDU3ZTA1MzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiODQiLCJhY2NvdW50X3VzZXIiOiIyYyIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGx9	2018-06-03 22:16:10.536187+02
u52qaeotq7tjosw436pbvskf3ikor60o	NTViZThhNzBlZTM3ODA0NGZiN2Q3NzUzMWNkZDkzNTI4YmU1ZDBiYjp7Il9hdXRoX3VzZXJfaWQiOiI2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUifQ==	2018-05-27 11:17:54.627828+02
797krc3hqxj5t3g7zuu3dxpeavqxrcpz	ZDEwNzU2YjQ1YmNjYmZmZDUwZTIwZmQ0NmIwOWM4N2FjZDg4MThlZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlMGRhNTY1YjFiNzUxODdmMjIzY2YzNzA3NzQzNjNjN2Y5N2M0NWIiLCJfYXV0aF91c2VyX2lkIjoiODMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-03 22:25:28.384344+02
w52871mb2n5btuhxubt6akapicqyymuf	ZDI1NTZjYmZmMzYyM2VjZTAzYTY0NDc2MjY4NmMwMmI0ZmYwOTY2Mzp7Il9hdXRoX3VzZXJfaWQiOiI3MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYyNWIwZDQ4YTdkYjdjMjc1ZDFmZjcyOGI2ZTNlZjE2OTE2OTUzZDUiLCJzb2NpYWxhY2NvdW50X3NvY2lhbGxvZ2luIjp7InVzZXIiOnsicGFzc3dvcmQiOiIhQ0RnNzJ2RnhrcjhmRnpGS0NxNTB4WWoxU0JDSDZBcTRJWEVjYTg5MiIsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20iLCJsYXN0X2xvZ2luIjpudWxsLCJpc19hY3RpdmUiOnRydWUsInVzZXJuYW1lIjoiIiwiaXNfc3RhZmYiOmZhbHNlLCJkYXRlX2pvaW5lZCI6IjIwMTgtMDUtMTNUMDk6MTk6MzkuNDg4WiIsImlzX3N1cGVydXNlciI6ZmFsc2UsImlkIjpudWxsLCJsYXN0X25hbWUiOiJcdTAxNjBpbGhcdTAwZTFrIiwiZmlyc3RfbmFtZSI6IlBldHIifSwiZW1haWxfYWRkcmVzc2VzIjpbeyJpZCI6bnVsbCwidXNlcl9pZCI6bnVsbCwidmVyaWZpZWQiOnRydWUsImVtYWlsIjoicGV0cnNpbGhha0BnbWFpbC5jb20iLCJwcmltYXJ5Ijp0cnVlfV0sImFjY291bnQiOnsicHJvdmlkZXIiOiJnb29nbGUiLCJ1aWQiOiIxMTQwOTYyNDA3MzA0NjMwMTQ2MDIiLCJpZCI6bnVsbCwibGFzdF9sb2dpbiI6bnVsbCwiZGF0ZV9qb2luZWQiOm51bGwsImV4dHJhX2RhdGEiOnsibmFtZSI6IlBldHIgXHUwMTYwaWxoXHUwMGUxayIsImxvY2FsZSI6ImNzIiwiaWQiOiIxMTQwOTYyNDA3MzA0NjMwMTQ2MDIiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1YZFVJcWRNa0NXQS9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBQS80MjUycnNjYnY1TS9waG90by5qcGciLCJsaW5rIjoiaHR0cHM6Ly9wbHVzLmdvb2dsZS5jb20vMTE0MDk2MjQwNzMwNDYzMDE0NjAyIiwidmVyaWZpZWRfZW1haWwiOnRydWUsImZhbWlseV9uYW1lIjoiXHUwMTYwaWxoXHUwMGUxayIsImdlbmRlciI6Im1hbGUiLCJlbWFpbCI6InBldHJzaWxoYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6IlBldHIifSwidXNlcl9pZCI6bnVsbH0sInN0YXRlIjp7fSwidG9rZW4iOnsidG9rZW5fc2VjcmV0IjoiIiwiaWQiOm51bGwsImV4cGlyZXNfYXQiOm51bGwsImFjY291bnRfaWQiOm51bGwsInRva2VuIjoieWEyOS5HbDI2QmFoeXUzSy16Ym5ydVN1UGNCeHM3V19xZHB3U3EzT3F5eG5JUUZVUzFSd1kzbG9US3BkbnZYSFhKN0tmWjBWWDJEMWhaU3NwTlFtS1ZMY29DQ1Zva2J6MXlUWERmNUV3NkZveDhDVjBLQndlV1ptbkRyTVZYSVVYNHl3IiwiYXBwX2lkIjoyfX19	2018-05-27 11:19:39.510615+02
t7cayge69yjecyv8veiztfpubzmbyiq2	NTViZThhNzBlZTM3ODA0NGZiN2Q3NzUzMWNkZDkzNTI4YmU1ZDBiYjp7Il9hdXRoX3VzZXJfaWQiOiI2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUifQ==	2018-05-27 11:20:24.197626+02
tep0pfb5omm44qa2fflihsorhff0hlhz	NTRlZmJmMDU0OTBhMzM5ZTM3NjA1Yjg1NWZhMGZkMGVlY2QyMGQxZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3NjdiMmQwZWM1ZjhmM2NjMTBmNWY1OWY4ZWUwNmJmYTgzYTAyZTkiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==	2018-06-03 23:50:17.727502+02
zpoxbctul24u5611botzfsu0ai2fny2x	NTViZThhNzBlZTM3ODA0NGZiN2Q3NzUzMWNkZDkzNTI4YmU1ZDBiYjp7Il9hdXRoX3VzZXJfaWQiOiI2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUifQ==	2018-05-27 11:21:08.964742+02
ozvw6vx6qqq2ugep0g1a3xnrqm6ag92b	NDkzNDVmZTU3ZjBjZTU3ZjMyOGU1Mjg5ZTdmYTgxNzNhNWJmNDQ4NTp7ImFjY291bnRfdXNlciI6IjJoIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbH0=	2018-06-04 11:17:21.208025+02
3yy29nnkg1qno7mhubrnbgsrz681h0rx	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 13:15:45.199152+02
dha8jt87fr8hkhsy1qpckifbrx4pp04f	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 13:16:45.619486+02
p11xts34vgqh6zx5lryf21f1eqs386c6	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 13:19:14.086421+02
wnb65e2goqq8nqylrz2oq5vfwkgzc1e5	YWEyMzhjZGYyNjAzMmY1NzljYWY4NzNlZTc0YWQyZjM3YzFmOGY5ODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjJpIiwiX2F1dGhfdXNlcl9pZCI6IjkwIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDAxMWJkYzBhOGJkNjc5MGIxNWM5Yjc1MzYzMjc2ZjJjOGNmMjk5YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCJ9	2018-06-08 09:59:15.193913+02
xi8j248nwkmf4m2jk8hd9na6bwrfrn5m	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 13:19:44.274197+02
1hrb5f1p6dn8hqzjk3rxb1r57ja5kk8k	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 18:09:52.546757+02
vwflilcs7d69xvicnoi7h2pikqrmf6yv	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-27 18:10:31.922215+02
aajht6x3pqhsmmq42icg6jl8hgx5xryr	NmNmN2JiOTBhNDVlZTJmNWQ5N2I3ZjJjNTAxODI0NjZlMzJkYTQ5MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzMzQxMjM0NjRjZjdiYzU2ODY1YmMyZmFmNjU2OTFiZDQ0NmQwYzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiOTEiLCJhY2NvdW50X3VzZXIiOiIyaiIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGx9	2018-06-05 19:10:19.017663+02
x3hmk7xhyfv6isosa0ozbxuehxe2h07x	ZTRkNGUyZTk3N2UwZDEyMGI2NjFhNmEzMDNkM2QwYzdmODE1NzY4MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIyMDc1OGU0MGJjNDRkOTI4ZmYwYmZhZWYwOTQ2YzA0OWI2M2IwZTUiLCJfYXV0aF91c2VyX2lkIjoiNjkifQ==	2018-05-28 06:49:06.08096+02
up6xkq1xt58yccs2woh9il8cmggewwxd	NWQ1MDEyYzg4OWExYTZlODlmYTdkMzBkMmUxOTgwMmYyMDliMzMzMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxNTQ2OTA1ODcwMzE1NjhjNDQ5YmU3MmQ0OGQ0MWNlYjM1Zjg5OTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiOTIiLCJhY2NvdW50X3VzZXIiOiIyayIsImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGx9	2018-06-05 19:16:56.127333+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.django_site (id, domain, name) FROM stdin;
1	zelda.sci.muni.cz	GIS4DIS
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
32	google	114096240730463014602	2019-02-06 09:02:20.791524+01	2019-01-29 21:53:28.216588+01	{"picture": "https://lh5.googleusercontent.com/-wJEER0a31wY/AAAAAAAAAAI/AAAAAAAAAAA/ACevoQP4WljSxgyksM70be4_OemVeDu7nw/mo/photo.jpg", "id": "114096240730463014602", "name": "Petr \\u0160ilh\\u00e1k", "verified_email": true, "gender": "male", "email": "petrsilhak@gmail.com", "given_name": "Petr", "link": "https://plus.google.com/114096240730463014602", "family_name": "\\u0160ilh\\u00e1k", "locale": "cs"}	98
30	facebook	1824996037521320	2018-05-20 20:26:44.5343+02	2018-05-20 20:26:44.534329+02	{"id": "1824996037521320", "email": "zaneta.1996@seznam.cz", "last_name": "Rezkov\\u00e1", "first_name": "\\u017danet", "name": "\\u017danet Rezkov\\u00e1"}	87
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	facebook	facebook_login	2031928567034931	a475bbb40f4bdbe17c89bf04d359d98a	
2	google	google_login	300501573251-5ov55qlssouh0pdiv9p5ajocgv1l4eg0.apps.googleusercontent.com	42x6Pd0Bam8S5wDiMJBMmQLF	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
32	ya29.Gl2oButA4xf4E80hyEr_tkNcgiCTpF_iV8XEmn19MVcWm2MwrC8LljmXObD3Kr0joE2iqx2ItFJlPxfE-56GngDxgzhYnNJ1cnjLOwMhzQHl7FLP_N0zXi_tp9GCCt0		\N	32	2
30	EAAc4BzxydDMBAGnU2bnHzYkCjJEjJcOMfjZB0iZBzyJBafQg31FzaaM6mpnbHVQEMRdHuxcm3LUR3eodU033aZAVDGab0bAXzR0NnhivNCbqrhSXZB9WZAMzZCsnVWq8cimWfEVweTh4ZAWSCc3lK8gqPcztqpBQzygxSpWrBNSfC16WtfRexess9XIJV2w1zymIcoEA2jvnAZDZD		\N	30	1
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: rest
--

COPY public.spatial_ref_sys  FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 121, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: api_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_category_id_seq', 3, true);


--
-- Name: api_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_dictionary_id_seq', 27, true);


--
-- Name: api_dictionarylocalization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_dictionarylocalization_id_seq', 56, true);


--
-- Name: api_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_help_id_seq', 7, true);


--
-- Name: api_helplocalization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_helplocalization_id_seq', 13, true);


--
-- Name: api_localization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_localization_id_seq', 3, true);


--
-- Name: api_metadataobservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_metadataobservation_id_seq', 15522, true);


--
-- Name: api_metadataobservation_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_metadataobservation_value_id_seq', 8014, true);


--
-- Name: api_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_parameter_id_seq', 43, true);


--
-- Name: api_parameterlocalization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_parameterlocalization_id_seq', 44, true);


--
-- Name: api_phenomenon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_phenomenon_id_seq', 6, true);


--
-- Name: api_phenomenonlocalization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_phenomenonlocalization_id_seq', 13, true);


--
-- Name: api_phenomenonparametervalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_phenomenonparametervalue_id_seq', 8010, true);


--
-- Name: api_phenomenonphoto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_phenomenonphoto_id_seq', 154, true);


--
-- Name: api_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_userprofile_id_seq', 14, true);


--
-- Name: api_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.api_version_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 99, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 99, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 550, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 33, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 32, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 2, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rest
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 32, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: api_category api_category_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_pkey PRIMARY KEY (id);


--
-- Name: api_dictionary api_dictionary_i18n_tag_b59800b6_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionary
    ADD CONSTRAINT api_dictionary_i18n_tag_b59800b6_uniq UNIQUE (i18n_tag);


--
-- Name: api_dictionary api_dictionary_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionary
    ADD CONSTRAINT api_dictionary_pkey PRIMARY KEY (id);


--
-- Name: api_dictionarylocalization api_dictionarylocalization_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionarylocalization
    ADD CONSTRAINT api_dictionarylocalization_pkey PRIMARY KEY (id);


--
-- Name: api_help api_help_i18n_tag_b5b4b063_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_help
    ADD CONSTRAINT api_help_i18n_tag_b5b4b063_uniq UNIQUE (i18n_tag);


--
-- Name: api_help api_help_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_help
    ADD CONSTRAINT api_help_pkey PRIMARY KEY (id);


--
-- Name: api_helplocalization api_helplocalization_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_helplocalization
    ADD CONSTRAINT api_helplocalization_pkey PRIMARY KEY (id);


--
-- Name: api_localization api_localization_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_localization
    ADD CONSTRAINT api_localization_pkey PRIMARY KEY (id);


--
-- Name: api_metadataobservation_values api_metadataobservation__metadataobservation_id_p_1937b449_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation_values
    ADD CONSTRAINT api_metadataobservation__metadataobservation_id_p_1937b449_uniq UNIQUE (metadataobservation_id, phenomenonparametervalue_id);


--
-- Name: api_metadataobservation api_metadataobservation_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation
    ADD CONSTRAINT api_metadataobservation_pkey PRIMARY KEY (id);


--
-- Name: api_metadataobservation_values api_metadataobservation_value_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation_values
    ADD CONSTRAINT api_metadataobservation_value_pkey PRIMARY KEY (id);


--
-- Name: api_parameter api_parameter_i18n_tag_c87087d7_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameter
    ADD CONSTRAINT api_parameter_i18n_tag_c87087d7_uniq UNIQUE (i18n_tag);


--
-- Name: api_parameter api_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameter
    ADD CONSTRAINT api_parameter_pkey PRIMARY KEY (id);


--
-- Name: api_parameterlocalization api_parameterlocalization_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameterlocalization
    ADD CONSTRAINT api_parameterlocalization_pkey PRIMARY KEY (id);


--
-- Name: api_phenomenon api_phenomenon_i18n_tag_82089e6d_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenon
    ADD CONSTRAINT api_phenomenon_i18n_tag_82089e6d_uniq UNIQUE (i18n_tag);


--
-- Name: api_phenomenon api_phenomenon_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenon
    ADD CONSTRAINT api_phenomenon_pkey PRIMARY KEY (id);


--
-- Name: api_phenomenonlocalization api_phenomenonlocalization_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonlocalization
    ADD CONSTRAINT api_phenomenonlocalization_pkey PRIMARY KEY (id);


--
-- Name: api_phenomenonparametervalue api_phenomenonparametervalue_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonparametervalue
    ADD CONSTRAINT api_phenomenonparametervalue_pkey PRIMARY KEY (id);


--
-- Name: api_phenomenonphoto api_phenomenonphoto_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonphoto
    ADD CONSTRAINT api_phenomenonphoto_pkey PRIMARY KEY (id);


--
-- Name: api_userprofile api_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_userprofile
    ADD CONSTRAINT api_userprofile_pkey PRIMARY KEY (id);


--
-- Name: api_userprofile api_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_userprofile
    ADD CONSTRAINT api_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: api_version api_version_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_version
    ADD CONSTRAINT api_version_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: api_dictionary_i18n_tag_b59800b6_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_dictionary_i18n_tag_b59800b6_like ON public.api_dictionary USING btree (i18n_tag varchar_pattern_ops);


--
-- Name: api_dictionary_parameter_id_ce8cd665; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_dictionary_parameter_id_ce8cd665 ON public.api_dictionary USING btree (parameter_id);


--
-- Name: api_dictionarylocalization_dictionary_id_0cee7bee; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_dictionarylocalization_dictionary_id_0cee7bee ON public.api_dictionarylocalization USING btree (dictionary_id);


--
-- Name: api_help_i18n_tag_b5b4b063_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_help_i18n_tag_b5b4b063_like ON public.api_help USING btree (i18n_tag varchar_pattern_ops);


--
-- Name: api_help_phenomenon_id_a9767b35; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_help_phenomenon_id_a9767b35 ON public.api_help USING btree (phenomenon_id);


--
-- Name: api_helplocalization_help_id_541f9f07; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_helplocalization_help_id_541f9f07 ON public.api_helplocalization USING btree (help_id);


--
-- Name: api_metadataobservation_geometry_id; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_metadataobservation_geometry_id ON public.api_metadataobservation USING gist (geometry);


--
-- Name: api_metadataobservation_user_id_f8677fb6; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_metadataobservation_user_id_f8677fb6 ON public.api_metadataobservation USING btree (user_id);


--
-- Name: api_metadataobservation_va_phenomenonparametervalue_i_2ab32055; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_metadataobservation_va_phenomenonparametervalue_i_2ab32055 ON public.api_metadataobservation_values USING btree (phenomenonparametervalue_id);


--
-- Name: api_metadataobservation_value_metadataobservation_id_c5973ce1; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_metadataobservation_value_metadataobservation_id_c5973ce1 ON public.api_metadataobservation_values USING btree (metadataobservation_id);


--
-- Name: api_parameter_i18n_tag_c87087d7_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_parameter_i18n_tag_c87087d7_like ON public.api_parameter USING btree (i18n_tag varchar_pattern_ops);


--
-- Name: api_parameter_phenomenon_id_7fb100b2; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_parameter_phenomenon_id_7fb100b2 ON public.api_parameter USING btree (phenomenon_id);


--
-- Name: api_parameterlocalization_parameter_id_c6615d0a; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_parameterlocalization_parameter_id_c6615d0a ON public.api_parameterlocalization USING btree (parameter_id);


--
-- Name: api_phenomenon_category_id_3a7e95dd; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenon_category_id_3a7e95dd ON public.api_phenomenon USING btree (category_id);


--
-- Name: api_phenomenon_i18n_tag_82089e6d_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenon_i18n_tag_82089e6d_like ON public.api_phenomenon USING btree (i18n_tag varchar_pattern_ops);


--
-- Name: api_phenomenonlocalization_phenomenon_id_3cc00715; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonlocalization_phenomenon_id_3cc00715 ON public.api_phenomenonlocalization USING btree (phenomenon_id);


--
-- Name: api_phenomenonparametervalue_parameter_id_5bdcdf51; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonparametervalue_parameter_id_5bdcdf51 ON public.api_phenomenonparametervalue USING btree (parameter_id);


--
-- Name: api_phenomenonparametervalue_phenomenon_id_98e1b248; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonparametervalue_phenomenon_id_98e1b248 ON public.api_phenomenonparametervalue USING btree (phenomenon_id);


--
-- Name: api_phenomenonphoto_observation_id_134f822e; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonphoto_observation_id_134f822e ON public.api_phenomenonphoto USING btree (observation_id);


--
-- Name: api_phenomenonphoto_owner_id_df705004; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonphoto_owner_id_df705004 ON public.api_phenomenonphoto USING btree (owner_id);


--
-- Name: api_phenomenonphoto_parameter_id_322492bf; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX api_phenomenonphoto_parameter_id_322492bf ON public.api_phenomenonphoto USING btree (parameter_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: rest
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_dictionary api_dictionary_parameter_id_ce8cd665_fk_api_parameter_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionary
    ADD CONSTRAINT api_dictionary_parameter_id_ce8cd665_fk_api_parameter_id FOREIGN KEY (parameter_id) REFERENCES public.api_parameter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_dictionarylocalization api_dictionarylocali_dictionary_id_0cee7bee_fk_api_dicti; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_dictionarylocalization
    ADD CONSTRAINT api_dictionarylocali_dictionary_id_0cee7bee_fk_api_dicti FOREIGN KEY (dictionary_id) REFERENCES public.api_dictionary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_help api_help_phenomenon_id_a9767b35_fk_api_phenomenon_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_help
    ADD CONSTRAINT api_help_phenomenon_id_a9767b35_fk_api_phenomenon_id FOREIGN KEY (phenomenon_id) REFERENCES public.api_phenomenon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_helplocalization api_helplocalization_help_id_541f9f07_fk_api_help_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_helplocalization
    ADD CONSTRAINT api_helplocalization_help_id_541f9f07_fk_api_help_id FOREIGN KEY (help_id) REFERENCES public.api_help(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_metadataobservation_values api_metadataobservat_metadataobservation__3ed25611_fk_api_metad; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation_values
    ADD CONSTRAINT api_metadataobservat_metadataobservation__3ed25611_fk_api_metad FOREIGN KEY (metadataobservation_id) REFERENCES public.api_metadataobservation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_metadataobservation_values api_metadataobservat_phenomenonparameterv_81f69e9a_fk_api_pheno; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation_values
    ADD CONSTRAINT api_metadataobservat_phenomenonparameterv_81f69e9a_fk_api_pheno FOREIGN KEY (phenomenonparametervalue_id) REFERENCES public.api_phenomenonparametervalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_metadataobservation api_metadataobservation_user_id_f8677fb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_metadataobservation
    ADD CONSTRAINT api_metadataobservation_user_id_f8677fb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_parameter api_parameter_phenomenon_id_7fb100b2_fk_api_phenomenon_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameter
    ADD CONSTRAINT api_parameter_phenomenon_id_7fb100b2_fk_api_phenomenon_id FOREIGN KEY (phenomenon_id) REFERENCES public.api_phenomenon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_parameterlocalization api_parameterlocaliz_parameter_id_c6615d0a_fk_api_param; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_parameterlocalization
    ADD CONSTRAINT api_parameterlocaliz_parameter_id_c6615d0a_fk_api_param FOREIGN KEY (parameter_id) REFERENCES public.api_parameter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenon api_phenomenon_category_id_3a7e95dd_fk_api_category_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenon
    ADD CONSTRAINT api_phenomenon_category_id_3a7e95dd_fk_api_category_id FOREIGN KEY (category_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonlocalization api_phenomenonlocali_phenomenon_id_3cc00715_fk_api_pheno; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonlocalization
    ADD CONSTRAINT api_phenomenonlocali_phenomenon_id_3cc00715_fk_api_pheno FOREIGN KEY (phenomenon_id) REFERENCES public.api_phenomenon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonparametervalue api_phenomenonparame_parameter_id_5bdcdf51_fk_api_param; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonparametervalue
    ADD CONSTRAINT api_phenomenonparame_parameter_id_5bdcdf51_fk_api_param FOREIGN KEY (parameter_id) REFERENCES public.api_parameter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonparametervalue api_phenomenonparame_phenomenon_id_98e1b248_fk_api_pheno; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonparametervalue
    ADD CONSTRAINT api_phenomenonparame_phenomenon_id_98e1b248_fk_api_pheno FOREIGN KEY (phenomenon_id) REFERENCES public.api_phenomenon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonphoto api_phenomenonphoto_observation_id_134f822e_fk_api_metad; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonphoto
    ADD CONSTRAINT api_phenomenonphoto_observation_id_134f822e_fk_api_metad FOREIGN KEY (observation_id) REFERENCES public.api_metadataobservation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonphoto api_phenomenonphoto_owner_id_df705004_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonphoto
    ADD CONSTRAINT api_phenomenonphoto_owner_id_df705004_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_phenomenonphoto api_phenomenonphoto_parameter_id_322492bf_fk_api_pheno; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_phenomenonphoto
    ADD CONSTRAINT api_phenomenonphoto_parameter_id_322492bf_fk_api_pheno FOREIGN KEY (parameter_id) REFERENCES public.api_phenomenonparametervalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_userprofile api_userprofile_user_id_5a1c1c92_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.api_userprofile
    ADD CONSTRAINT api_userprofile_user_id_5a1c1c92_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rest
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

