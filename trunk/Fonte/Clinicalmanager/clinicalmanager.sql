--
-- PostgreSQL database dump
--

-- Started on 2009-12-11 21:07:26

SET client_encoding = 'LATIN1';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 13657050)
-- Name: clinicalmanager; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA clinicalmanager;


SET search_path = clinicalmanager, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2231 (class 1259 OID 13657058)
-- Dependencies: 7
-- Name: convenio; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE convenio (
    idcon integer NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 2254 (class 1259 OID 14176922)
-- Dependencies: 2549 7
-- Name: fatura; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE fatura (
    codigo character varying,
    data_fechamento date,
    data_inicio date,
    data_fim date,
    tipo character(1),
    mes_ref integer,
    paga boolean,
    fechada boolean,
    idfat integer NOT NULL,
    CONSTRAINT tipo_fatura CHECK ((tipo = ANY (ARRAY['H'::bpchar, 'P'::bpchar])))
);


--
-- TOC entry 2232 (class 1259 OID 13657064)
-- Dependencies: 2542 7
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
-- TOC entry 2260 (class 1259 OID 29018550)
-- Dependencies: 7
-- Name: item_de_fatura; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE item_de_fatura (
    iditem integer NOT NULL,
    idfat integer NOT NULL,
    idint integer NOT NULL,
    valor double precision
);


--
-- TOC entry 2233 (class 1259 OID 13657068)
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
-- TOC entry 2256 (class 1259 OID 15321885)
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
-- TOC entry 2234 (class 1259 OID 13657074)
-- Dependencies: 7
-- Name: medico; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE medico (
    idmed integer NOT NULL,
    nome character varying(50)
);


--
-- TOC entry 2235 (class 1259 OID 13657077)
-- Dependencies: 7
-- Name: medico_internacao; Type: TABLE; Schema: clinicalmanager; Owner: -; Tablespace: 
--

CREATE TABLE medico_internacao (
    idint integer NOT NULL,
    idmec integer NOT NULL,
    responsavel boolean
);


--
-- TOC entry 2236 (class 1259 OID 13657080)
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
-- TOC entry 2241 (class 1259 OID 13657095)
-- Dependencies: 7 2231
-- Name: convenio_idcon_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE convenio_idcon_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 2241
-- Name: convenio_idcon_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE convenio_idcon_seq OWNED BY convenio.idcon;


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 2241
-- Name: convenio_idcon_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('convenio_idcon_seq', 2, true);


--
-- TOC entry 2255 (class 1259 OID 14530805)
-- Dependencies: 2254 7
-- Name: fatura_idfat_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE fatura_idfat_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 2255
-- Name: fatura_idfat_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE fatura_idfat_seq OWNED BY fatura.idfat;


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 2255
-- Name: fatura_idfat_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('fatura_idfat_seq', 4, true);


--
-- TOC entry 2242 (class 1259 OID 13657099)
-- Dependencies: 2232 7
-- Name: internacao_idint_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE internacao_idint_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 2242
-- Name: internacao_idint_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE internacao_idint_seq OWNED BY internacao.idint;


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 2242
-- Name: internacao_idint_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('internacao_idint_seq', 43, true);


--
-- TOC entry 2259 (class 1259 OID 29018548)
-- Dependencies: 2260 7
-- Name: item_de_fatura_iditem_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE item_de_fatura_iditem_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 2259
-- Name: item_de_fatura_iditem_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE item_de_fatura_iditem_seq OWNED BY item_de_fatura.iditem;


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 2259
-- Name: item_de_fatura_iditem_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('item_de_fatura_iditem_seq', 1, false);


--
-- TOC entry 2243 (class 1259 OID 13657101)
-- Dependencies: 7 2233
-- Name: local_idloc_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE local_idloc_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 2243
-- Name: local_idloc_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE local_idloc_seq OWNED BY local.idloc;


--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 2243
-- Name: local_idloc_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('local_idloc_seq', 15, true);


--
-- TOC entry 2244 (class 1259 OID 13657103)
-- Dependencies: 7 2234
-- Name: medico_idmed_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_idmed_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 2244
-- Name: medico_idmed_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_idmed_seq OWNED BY medico.idmed;


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 2244
-- Name: medico_idmed_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('medico_idmed_seq', 20, true);


--
-- TOC entry 2245 (class 1259 OID 13657105)
-- Dependencies: 2235 7
-- Name: medico_internacao_idint_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_internacao_idint_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 2245
-- Name: medico_internacao_idint_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_internacao_idint_seq OWNED BY medico_internacao.idint;


--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 2245
-- Name: medico_internacao_idint_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('medico_internacao_idint_seq', 1, false);


--
-- TOC entry 2246 (class 1259 OID 13657107)
-- Dependencies: 2235 7
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE medico_internacao_idmec_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 2246
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE medico_internacao_idmec_seq OWNED BY medico_internacao.idmec;


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 2246
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('medico_internacao_idmec_seq', 1, false);


--
-- TOC entry 2247 (class 1259 OID 13657109)
-- Dependencies: 2236 7
-- Name: paciente_idpac_seq; Type: SEQUENCE; Schema: clinicalmanager; Owner: -
--

CREATE SEQUENCE paciente_idpac_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 2247
-- Name: paciente_idpac_seq; Type: SEQUENCE OWNED BY; Schema: clinicalmanager; Owner: -
--

ALTER SEQUENCE paciente_idpac_seq OWNED BY paciente.idpac;


--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 2247
-- Name: paciente_idpac_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: -
--

SELECT pg_catalog.setval('paciente_idpac_seq', 64, true);


--
-- TOC entry 2540 (class 2604 OID 13657113)
-- Dependencies: 2241 2231
-- Name: idcon; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE convenio ALTER COLUMN idcon SET DEFAULT nextval('convenio_idcon_seq'::regclass);


--
-- TOC entry 2548 (class 2604 OID 14530807)
-- Dependencies: 2255 2254
-- Name: idfat; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE fatura ALTER COLUMN idfat SET DEFAULT nextval('fatura_idfat_seq'::regclass);


--
-- TOC entry 2541 (class 2604 OID 13657115)
-- Dependencies: 2242 2232
-- Name: idint; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE internacao ALTER COLUMN idint SET DEFAULT nextval('internacao_idint_seq'::regclass);


--
-- TOC entry 2550 (class 2604 OID 29018553)
-- Dependencies: 2260 2259 2260
-- Name: iditem; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE item_de_fatura ALTER COLUMN iditem SET DEFAULT nextval('item_de_fatura_iditem_seq'::regclass);


--
-- TOC entry 2543 (class 2604 OID 13657116)
-- Dependencies: 2243 2233
-- Name: idloc; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE local ALTER COLUMN idloc SET DEFAULT nextval('local_idloc_seq'::regclass);


--
-- TOC entry 2544 (class 2604 OID 13657117)
-- Dependencies: 2244 2234
-- Name: idmed; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico ALTER COLUMN idmed SET DEFAULT nextval('medico_idmed_seq'::regclass);


--
-- TOC entry 2545 (class 2604 OID 13657118)
-- Dependencies: 2245 2235
-- Name: idint; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico_internacao ALTER COLUMN idint SET DEFAULT nextval('medico_internacao_idint_seq'::regclass);


--
-- TOC entry 2546 (class 2604 OID 13657119)
-- Dependencies: 2246 2235
-- Name: idmec; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE medico_internacao ALTER COLUMN idmec SET DEFAULT nextval('medico_internacao_idmec_seq'::regclass);


--
-- TOC entry 2547 (class 2604 OID 13657120)
-- Dependencies: 2247 2236
-- Name: idpac; Type: DEFAULT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE paciente ALTER COLUMN idpac SET DEFAULT nextval('paciente_idpac_seq'::regclass);


--
-- TOC entry 2581 (class 0 OID 13657058)
-- Dependencies: 2231
-- Data for Name: convenio; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY convenio (idcon, descricao) FROM stdin;
1	Unimed Recife
2	GEAP
\.


--
-- TOC entry 2587 (class 0 OID 14176922)
-- Dependencies: 2254
-- Data for Name: fatura; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY fatura (codigo, data_fechamento, data_inicio, data_fim, tipo, mes_ref, paga, fechada, idfat) FROM stdin;
108.12	2008-12-30	2008-11-01	2008-11-30	H	11	\N	\N	3
REPASS.067	2008-12-11	2008-11-01	2008-11-30	H	3	\N	\N	2
\.


--
-- TOC entry 2582 (class 0 OID 13657064)
-- Dependencies: 2232
-- Data for Name: internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY internacao (idint, idpac, idcon, idfat, data_in, data_out, obs, vl_esperado_hn, vl_recebido_hn, vl_produtividade, idmed) FROM stdin;
43	63	1	\N	2009-12-08 00:00:00	2009-12-12 00:00:00	asdfafsa fsdf saf	125.44	\N	\N	19
40	10	1	\N	2009-11-04 00:00:00	2009-12-10 00:00:00		360	\N	\N	1
42	59	1	\N	2009-11-05 00:00:00	2009-12-11 00:00:00		366	\N	\N	18
\.


--
-- TOC entry 2589 (class 0 OID 29018550)
-- Dependencies: 2260
-- Data for Name: item_de_fatura; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY item_de_fatura (iditem, idfat, idint, valor) FROM stdin;
\.


--
-- TOC entry 2583 (class 0 OID 13657068)
-- Dependencies: 2233
-- Data for Name: local; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY local (idloc, nome, gera_prd, andar) FROM stdin;
8	Apt. 503	t	5
9	Apt. 501	t	5
12	Apt. 505	t	5
13	Apt. 205	f	2
\.


--
-- TOC entry 2588 (class 0 OID 15321885)
-- Dependencies: 2256
-- Data for Name: local_internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) FROM stdin;
40	9	2009-11-04 00:00:00	2009-11-10 00:00:00	asdf
40	8	2009-11-10 00:00:00	2009-12-10 00:00:00	
42	8	-infinity	2009-12-11 00:00:00	
43	8	2009-12-09 00:00:00	2009-12-12 00:00:00	asdf sadf asdf saf gasf d bddv ad
\.


--
-- TOC entry 2584 (class 0 OID 13657074)
-- Dependencies: 2234
-- Data for Name: medico; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY medico (idmed, nome) FROM stdin;
1	Roberto Campelo
18	Antonio Roberto Leite Campelo
17	Emmanuel Cavalcanti Campelo Neto
19	Antonio Roberto Leite Campelo
20	Antonio Roberto Leite Campelo
\.


--
-- TOC entry 2585 (class 0 OID 13657077)
-- Dependencies: 2235
-- Data for Name: medico_internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY medico_internacao (idint, idmec, responsavel) FROM stdin;
\.


--
-- TOC entry 2586 (class 0 OID 13657080)
-- Dependencies: 2236
-- Data for Name: paciente; Type: TABLE DATA; Schema: clinicalmanager; Owner: -
--

COPY paciente (idpac, nome, cpf, codprontuario) FROM stdin;
21	Caio Antônio Batista	\N	82243
10	Alexandre Campelo	00822571406	1
59	José Rodrigues Ferreira da Silva	\N	23291
62	José Rodrigues da Silva	\N	134567
63	Renato Campelo de Barros	123456781	5474
64	José Edvaldo Pinto de Albuquerque	\N	53772
\.


--
-- TOC entry 2562 (class 2606 OID 15355474)
-- Dependencies: 2236 2236
-- Name: Codprontuario_unique; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT "Codprontuario_unique" UNIQUE (codprontuario);


--
-- TOC entry 2552 (class 2606 OID 13657123)
-- Dependencies: 2231 2231
-- Name: convenio_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (idcon);


--
-- TOC entry 2564 (class 2606 OID 13657125)
-- Dependencies: 2236 2236
-- Name: cpf_unique; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT cpf_unique UNIQUE (cpf);


--
-- TOC entry 2568 (class 2606 OID 14530820)
-- Dependencies: 2254 2254
-- Name: fatura_pk; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fatura
    ADD CONSTRAINT fatura_pk PRIMARY KEY (idfat);


--
-- TOC entry 2554 (class 2606 OID 13657129)
-- Dependencies: 2232 2232
-- Name: internacao_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_pkey PRIMARY KEY (idint);


--
-- TOC entry 2572 (class 2606 OID 29018555)
-- Dependencies: 2260 2260
-- Name: item_de_fatura_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY item_de_fatura
    ADD CONSTRAINT item_de_fatura_pkey PRIMARY KEY (iditem);


--
-- TOC entry 2570 (class 2606 OID 15321889)
-- Dependencies: 2256 2256 2256 2256
-- Name: local_internacao_pk; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local_internacao
    ADD CONSTRAINT local_internacao_pk PRIMARY KEY (idint, idloc, data_in_loc);


--
-- TOC entry 2556 (class 2606 OID 13657133)
-- Dependencies: 2233 2233
-- Name: local_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local
    ADD CONSTRAINT local_pkey PRIMARY KEY (idloc);


--
-- TOC entry 2560 (class 2606 OID 13657135)
-- Dependencies: 2235 2235 2235
-- Name: medico_internacao_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medico_internacao
    ADD CONSTRAINT medico_internacao_pkey PRIMARY KEY (idint, idmec);


--
-- TOC entry 2558 (class 2606 OID 13657137)
-- Dependencies: 2234 2234
-- Name: medico_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (idmed);


--
-- TOC entry 2566 (class 2606 OID 13657139)
-- Dependencies: 2236 2236
-- Name: paciente_pkey; Type: CONSTRAINT; Schema: clinicalmanager; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (idpac);


--
-- TOC entry 2573 (class 2606 OID 13657146)
-- Dependencies: 2234 2557 2232
-- Name: idmed_fk; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT idmed_fk FOREIGN KEY (idmed) REFERENCES medico(idmed);


--
-- TOC entry 2574 (class 2606 OID 13657151)
-- Dependencies: 2232 2231 2551
-- Name: internacao_idcon_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_idcon_fkey FOREIGN KEY (idcon) REFERENCES convenio(idcon);


--
-- TOC entry 2575 (class 2606 OID 13657161)
-- Dependencies: 2565 2236 2232
-- Name: internacao_idpac_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY internacao
    ADD CONSTRAINT internacao_idpac_fkey FOREIGN KEY (idpac) REFERENCES paciente(idpac);


--
-- TOC entry 2579 (class 2606 OID 29018556)
-- Dependencies: 2260 2254 2567
-- Name: item_de_fatura_idfat_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY item_de_fatura
    ADD CONSTRAINT item_de_fatura_idfat_fkey FOREIGN KEY (idfat) REFERENCES fatura(idfat);


--
-- TOC entry 2580 (class 2606 OID 29018561)
-- Dependencies: 2260 2232 2553
-- Name: item_de_fatura_idint_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY item_de_fatura
    ADD CONSTRAINT item_de_fatura_idint_fkey FOREIGN KEY (idint) REFERENCES internacao(idint);


--
-- TOC entry 2577 (class 2606 OID 15321890)
-- Dependencies: 2553 2256 2232
-- Name: local_internacao_idint_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY local_internacao
    ADD CONSTRAINT local_internacao_idint_fkey FOREIGN KEY (idint) REFERENCES internacao(idint) ON DELETE CASCADE;


--
-- TOC entry 2578 (class 2606 OID 15321895)
-- Dependencies: 2256 2555 2233
-- Name: local_internacao_idloc_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY local_internacao
    ADD CONSTRAINT local_internacao_idloc_fkey FOREIGN KEY (idloc) REFERENCES local(idloc) ON DELETE CASCADE;


--
-- TOC entry 2576 (class 2606 OID 13657171)
-- Dependencies: 2557 2235 2234
-- Name: medico_internacao_idmec_fkey; Type: FK CONSTRAINT; Schema: clinicalmanager; Owner: -
--

ALTER TABLE ONLY medico_internacao
    ADD CONSTRAINT medico_internacao_idmec_fkey FOREIGN KEY (idmec) REFERENCES medico(idmed);


-- Completed on 2009-12-11 21:07:53

--
-- PostgreSQL database dump complete
--

