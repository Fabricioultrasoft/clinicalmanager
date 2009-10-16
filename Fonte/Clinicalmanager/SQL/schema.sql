--
-- PostgreSQL database dump
--

-- Started on 2009-10-15 21:36:21

SET client_encoding = 'WIN1252';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 17092)
-- Name: clinicalmanager; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA clinicalmanager;


SET search_path = clinicalmanager, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1505 (class 1259 OID 17121)
-- Dependencies: 7
-- Name: convenio; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE convenio (
    idcon integer NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 1501 (class 1259 OID 17105)
-- Dependencies: 7
-- Name: fatura; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE fatura (
    idfat integer NOT NULL,
    data_fechamento date,
    paga boolean,
    fechada boolean
);


--
-- TOC entry 1513 (class 1259 OID 17204)
-- Dependencies: 1795 7
-- Name: internacao; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE internacao (
    idint integer NOT NULL,
    idpac integer,
    idcon integer,
    idfat integer,
    data_in timestamp without time zone,
    data_out timestamp without time zone,
    obs character varying(255),
    vl_esperado_hn double precision,
    vl_recebido_hn double precision,
    vl_produtividade double precision,
    idmed integer,
    CONSTRAINT data_entrada CHECK ((data_in IS NOT NULL))
);


--
-- TOC entry 1503 (class 1259 OID 17113)
-- Dependencies: 7
-- Name: local; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE local (
    idloc integer NOT NULL,
    nome character varying(255),
    gera_prd boolean,
    andar integer
);


--
-- TOC entry 1508 (class 1259 OID 17153)
-- Dependencies: 7
-- Name: local_internacao; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE local_internacao (
    idint integer NOT NULL,
    idloc integer NOT NULL,
    data_in_loc timestamp without time zone NOT NULL,
    data_out_loc timestamp without time zone,
    obs_loc character varying(255)
);


--
-- TOC entry 1507 (class 1259 OID 17129)
-- Dependencies: 7
-- Name: medico; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE medico (
    idmed integer NOT NULL,
    nome character varying(50)
);


--
-- TOC entry 1511 (class 1259 OID 17172)
-- Dependencies: 7
-- Name: medico_internacao; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE medico_internacao (
    idint integer NOT NULL,
    idmec integer NOT NULL,
    responsavel boolean
);


--
-- TOC entry 1499 (class 1259 OID 17095)
-- Dependencies: 7
-- Name: paciente; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE paciente (
    idpac integer NOT NULL,
    nome character varying(100),
    cpf character varying(11),
    codprontuario integer
);


--
-- TOC entry 1520 (class 1259 OID 17398)
-- Dependencies: 7
-- Name: usuarios; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    login character varying NOT NULL,
    pass character varying NOT NULL,
    privilegio integer
);


--
-- TOC entry 1504 (class 1259 OID 17119)
-- Dependencies: 1505 7
-- Name: convenio_idcon_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE convenio_idcon_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1825 (class 0 OID 0)
-- Dependencies: 1504
-- Name: convenio_idcon_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE convenio_idcon_seq OWNED BY convenio.idcon;


--
-- TOC entry 1500 (class 1259 OID 17103)
-- Dependencies: 7 1501
-- Name: fatura_idfat_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE fatura_idfat_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1826 (class 0 OID 0)
-- Dependencies: 1500
-- Name: fatura_idfat_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE fatura_idfat_seq OWNED BY fatura.idfat;


--
-- TOC entry 1512 (class 1259 OID 17202)
-- Dependencies: 1513 7
-- Name: internacao_idint_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE internacao_idint_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1827 (class 0 OID 0)
-- Dependencies: 1512
-- Name: internacao_idint_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE internacao_idint_seq OWNED BY internacao.idint;


--
-- TOC entry 1502 (class 1259 OID 17111)
-- Dependencies: 1503 7
-- Name: local_idloc_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE local_idloc_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 1502
-- Name: local_idloc_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE local_idloc_seq OWNED BY local.idloc;


--
-- TOC entry 1506 (class 1259 OID 17127)
-- Dependencies: 1507 7
-- Name: medico_idmed_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_idmed_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1829 (class 0 OID 0)
-- Dependencies: 1506
-- Name: medico_idmed_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_idmed_seq OWNED BY medico.idmed;


--
-- TOC entry 1509 (class 1259 OID 17168)
-- Dependencies: 7 1511
-- Name: medico_internacao_idint_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_internacao_idint_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1830 (class 0 OID 0)
-- Dependencies: 1509
-- Name: medico_internacao_idint_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_internacao_idint_seq OWNED BY medico_internacao.idint;


--
-- TOC entry 1510 (class 1259 OID 17170)
-- Dependencies: 1511 7
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_internacao_idmec_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1831 (class 0 OID 0)
-- Dependencies: 1510
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_internacao_idmec_seq OWNED BY medico_internacao.idmec;


--
-- TOC entry 1498 (class 1259 OID 17093)
-- Dependencies: 1499 7
-- Name: paciente_idpac_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE paciente_idpac_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1832 (class 0 OID 0)
-- Dependencies: 1498
-- Name: paciente_idpac_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE paciente_idpac_seq OWNED BY paciente.idpac;


--
-- TOC entry 1519 (class 1259 OID 17396)
-- Dependencies: 1520 7
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1833 (class 0 OID 0)
-- Dependencies: 1519
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- TOC entry 1790 (class 2604 OID 17124)
-- Dependencies: 1505 1504 1505
-- Name: idcon; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE convenio ALTER COLUMN idcon SET DEFAULT nextval('convenio_idcon_seq'::regclass);


--
-- TOC entry 1788 (class 2604 OID 17108)
-- Dependencies: 1501 1500 1501
-- Name: idfat; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE fatura ALTER COLUMN idfat SET DEFAULT nextval('fatura_idfat_seq'::regclass);


--
-- TOC entry 1794 (class 2604 OID 17207)
-- Dependencies: 1512 1513 1513
-- Name: idint; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE internacao ALTER COLUMN idint SET DEFAULT nextval('internacao_idint_seq'::regclass);


--
-- TOC entry 1789 (class 2604 OID 17116)
-- Dependencies: 1503 1502 1503
-- Name: idloc; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE local ALTER COLUMN idloc SET DEFAULT nextval('local_idloc_seq'::regclass);


--
-- TOC entry 1791 (class 2604 OID 17132)
-- Dependencies: 1507 1506 1507
-- Name: idmed; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico ALTER COLUMN idmed SET DEFAULT nextval('medico_idmed_seq'::regclass);


--
-- TOC entry 1792 (class 2604 OID 17175)
-- Dependencies: 1509 1511 1511
-- Name: idint; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico_internacao ALTER COLUMN idint SET DEFAULT nextval('medico_internacao_idint_seq'::regclass);


--
-- TOC entry 1793 (class 2604 OID 17176)
-- Dependencies: 1510 1511 1511
-- Name: idmec; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico_internacao ALTER COLUMN idmec SET DEFAULT nextval('medico_internacao_idmec_seq'::regclass);


--
-- TOC entry 1787 (class 2604 OID 17098)
-- Dependencies: 1499 1498 1499
-- Name: idpac; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE paciente ALTER COLUMN idpac SET DEFAULT nextval('paciente_idpac_seq'::regclass);


--
-- TOC entry 1796 (class 2604 OID 17401)
-- Dependencies: 1519 1520 1520
-- Name: id; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- TOC entry 1806 (class 2606 OID 17126)
-- Dependencies: 1505 1505
-- Name: convenio_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (idcon);


--
-- TOC entry 1798 (class 2606 OID 17102)
-- Dependencies: 1499 1499
-- Name: cpf_unique; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT cpf_unique UNIQUE (cpf);


--
-- TOC entry 1802 (class 2606 OID 17110)
-- Dependencies: 1501 1501
-- Name: fatura_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fatura
    ADD CONSTRAINT fatura_pkey PRIMARY KEY (idfat);


--
-- TOC entry 1814 (class 2606 OID 17209)
-- Dependencies: 1513 1513
-- Name: internacao_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_pkey PRIMARY KEY (idint);


--
-- TOC entry 1810 (class 2606 OID 17372)
-- Dependencies: 1508 1508 1508 1508
-- Name: local_internacao_pk; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local_internacao
    ADD CONSTRAINT local_internacao_pk PRIMARY KEY (idint, idloc, data_in_loc);


--
-- TOC entry 1804 (class 2606 OID 17118)
-- Dependencies: 1503 1503
-- Name: local_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (idloc);


--
-- TOC entry 1812 (class 2606 OID 17178)
-- Dependencies: 1511 1511 1511
-- Name: medico_internacao_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medico_internacao
    ADD CONSTRAINT medico_internacao_pkey PRIMARY KEY (idint, idmec);


--
-- TOC entry 1808 (class 2606 OID 17134)
-- Dependencies: 1507 1507
-- Name: medico_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (idmed);


--
-- TOC entry 1800 (class 2606 OID 17100)
-- Dependencies: 1499 1499
-- Name: paciente_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (idpac);


--
-- TOC entry 1816 (class 2606 OID 17406)
-- Dependencies: 1520 1520
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 1822 (class 2606 OID 17373)
-- Dependencies: 1507 1807 1513
-- Name: idmed_fk; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT idmed_fk FOREIGN KEY (idmed) REFERENCES medico(idmed);


--
-- TOC entry 1820 (class 2606 OID 17215)
-- Dependencies: 1805 1513 1505
-- Name: internacao_idcon_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_idcon_fkey FOREIGN KEY (idcon) REFERENCES convenio(idcon);


--
-- TOC entry 1821 (class 2606 OID 17220)
-- Dependencies: 1501 1513 1801
-- Name: internacao_idfat_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_idfat_fkey FOREIGN KEY (idfat) REFERENCES fatura(idfat);


--
-- TOC entry 1819 (class 2606 OID 17210)
-- Dependencies: 1513 1499 1799
-- Name: internacao_idpac_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_idpac_fkey FOREIGN KEY (idpac) REFERENCES paciente(idpac);


--
-- TOC entry 1817 (class 2606 OID 17163)
-- Dependencies: 1503 1803 1508
-- Name: local_internacao_idloc_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY local_internacao
    ADD CONSTRAINT local_internacao_idloc_fkey FOREIGN KEY (idloc) REFERENCES local(idloc);


--
-- TOC entry 1818 (class 2606 OID 17184)
-- Dependencies: 1507 1807 1511
-- Name: medico_internacao_idmec_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY medico_internacao
    ADD CONSTRAINT medico_internacao_idmec_fkey FOREIGN KEY (idmec) REFERENCES medico(idmed);


-- Completed on 2009-10-15 21:36:21

--
-- PostgreSQL database dump complete
--

