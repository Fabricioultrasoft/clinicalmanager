--
-- PostgreSQL database dump
--

-- Started on 2010-02-03 21:15:32

SET client_encoding = 'WIN1252';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = clinicalmanager, pg_catalog;

--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 2241
-- Name: convenio_idcon_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('convenio_idcon_seq', 2, true);


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 2255
-- Name: fatura_idfat_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('fatura_idfat_seq', 6, true);


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 2242
-- Name: internacao_idint_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('internacao_idint_seq', 46, true);


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 2243
-- Name: local_idloc_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('local_idloc_seq', 16, true);


--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 2244
-- Name: medico_idmed_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('medico_idmed_seq', 25, true);


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 2245
-- Name: medico_internacao_idint_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('medico_internacao_idint_seq', 1, false);


--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 2246
-- Name: medico_internacao_idmec_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('medico_internacao_idmec_seq', 1, false);


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 2247
-- Name: paciente_idpac_seq; Type: SEQUENCE SET; Schema: clinicalmanager; Owner: realinstitutodopulma
--

SELECT pg_catalog.setval('paciente_idpac_seq', 67, true);


--
-- TOC entry 2580 (class 0 OID 13657058)
-- Dependencies: 2231
-- Data for Name: convenio; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE convenio DISABLE TRIGGER ALL;

INSERT INTO convenio (idcon, descricao) VALUES (1, 'Unimed Recife');
INSERT INTO convenio (idcon, descricao) VALUES (2, 'GEAP');


ALTER TABLE convenio ENABLE TRIGGER ALL;

--
-- TOC entry 2586 (class 0 OID 14176922)
-- Dependencies: 2254
-- Data for Name: fatura; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE fatura DISABLE TRIGGER ALL;

INSERT INTO fatura (codigo, data_fechamento, data_inicio, data_fim, tipo, mes_ref, paga, fechada, idfat) VALUES ('108.12', '2009-12-30', '2009-12-01', '2009-12-31', 'H', 12, NULL, NULL, 5);
INSERT INTO fatura (codigo, data_fechamento, data_inicio, data_fim, tipo, mes_ref, paga, fechada, idfat) VALUES ('REPASS.067', '2008-11-30', '2008-11-01', '2009-11-30', 'P', 11, NULL, NULL, 6);


ALTER TABLE fatura ENABLE TRIGGER ALL;

--
-- TOC entry 2581 (class 0 OID 13657064)
-- Dependencies: 2232
-- Data for Name: internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE internacao DISABLE TRIGGER ALL;

INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (43, 63, 1, '2009-12-08 00:00:00', '2009-12-12 00:00:00', 'asdfafsa fsdf saf', 125.44, 19, NULL);
INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (42, 59, 1, '2009-11-05 00:00:00', '2009-12-11 00:00:00', '', 366, 18, NULL);
INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (44, 10, 2, '2009-12-11 00:00:00', '2009-12-12 00:00:00', 'Testeee', 15, 18, NULL);
INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (40, 10, 1, '2009-11-04 00:00:00', '2009-12-10 00:00:00', '', 360, 1, NULL);
INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (46, 64, 1, '2009-12-26 00:00:00', NULL, 'Teste', NULL, 1, NULL);
INSERT INTO internacao (idint, idpac, idcon, data_in, data_out, obs, vl_esperado_hn, idmed, faturada) VALUES (45, 62, 1, '2009-12-11 00:00:00', '2009-12-14 00:00:00', 'asdfsafdsaf', 30, 1, NULL);


ALTER TABLE internacao ENABLE TRIGGER ALL;

--
-- TOC entry 2588 (class 0 OID 52669933)
-- Dependencies: 2259
-- Data for Name: item_de_fatura; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE item_de_fatura DISABLE TRIGGER ALL;



ALTER TABLE item_de_fatura ENABLE TRIGGER ALL;

--
-- TOC entry 2582 (class 0 OID 13657068)
-- Dependencies: 2233
-- Data for Name: local; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE local DISABLE TRIGGER ALL;

INSERT INTO local (idloc, nome, gera_prd, andar) VALUES (8, 'Apt. 503', true, 5);
INSERT INTO local (idloc, nome, gera_prd, andar) VALUES (9, 'Apt. 501', true, 5);
INSERT INTO local (idloc, nome, gera_prd, andar) VALUES (16, '', true, 5);
INSERT INTO local (idloc, nome, gera_prd, andar) VALUES (12, 'Apt. 505', true, 5);
INSERT INTO local (idloc, nome, gera_prd, andar) VALUES (13, 'Apt. 205', false, 2);


ALTER TABLE local ENABLE TRIGGER ALL;

--
-- TOC entry 2587 (class 0 OID 15321885)
-- Dependencies: 2256
-- Data for Name: local_internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE local_internacao DISABLE TRIGGER ALL;

INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (40, 9, '2009-11-04 00:00:00', '2009-11-10 00:00:00', 'asdf');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (40, 8, '2009-11-10 00:00:00', '2009-12-10 00:00:00', '');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (42, 8, '-infinity', '2009-12-11 00:00:00', '');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (43, 8, '2009-12-09 00:00:00', '2009-12-12 00:00:00', 'asdf sadf asdf saf gasf d bddv ad');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (44, 9, '2009-12-11 00:00:00', '2009-12-12 00:00:00', 'testeee');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (45, 8, '2009-12-11 00:00:00', '2009-12-12 00:00:00', 'fxghvj');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (45, 13, '2009-12-12 00:00:00', '2009-12-14 00:00:00', 'zxgfg');
INSERT INTO local_internacao (idint, idloc, data_in_loc, data_out_loc, obs_loc) VALUES (45, 13, '2009-12-14 00:00:00', '2009-12-14 00:00:00', '');


ALTER TABLE local_internacao ENABLE TRIGGER ALL;

--
-- TOC entry 2583 (class 0 OID 13657074)
-- Dependencies: 2234
-- Data for Name: medico; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE medico DISABLE TRIGGER ALL;

INSERT INTO medico (idmed, nome) VALUES (1, 'Roberto Campelo');
INSERT INTO medico (idmed, nome) VALUES (18, 'Antonio Roberto Leite Campelo');
INSERT INTO medico (idmed, nome) VALUES (21, 'Maria Paula Gonçalves de Athayde');
INSERT INTO medico (idmed, nome) VALUES (19, 'Antonio Roberto Leite Campelo');
INSERT INTO medico (idmed, nome) VALUES (22, 'Sandra Santa Cruz de Oliveira');
INSERT INTO medico (idmed, nome) VALUES (23, 'Eduardo Henrique de Barros Campelo');
INSERT INTO medico (idmed, nome) VALUES (24, 'Leonardo Cordeiro Campelo');
INSERT INTO medico (idmed, nome) VALUES (25, 'Emmanuel Cavalcanti Campelo Neto');


ALTER TABLE medico ENABLE TRIGGER ALL;

--
-- TOC entry 2584 (class 0 OID 13657077)
-- Dependencies: 2235
-- Data for Name: medico_internacao; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE medico_internacao DISABLE TRIGGER ALL;



ALTER TABLE medico_internacao ENABLE TRIGGER ALL;

--
-- TOC entry 2585 (class 0 OID 13657080)
-- Dependencies: 2236
-- Data for Name: paciente; Type: TABLE DATA; Schema: clinicalmanager; Owner: realinstitutodopulma
--

ALTER TABLE paciente DISABLE TRIGGER ALL;

INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (66, 'JOSÉ EVALDO PINTO DE ALBUQUERQUE', NULL, 53770);
INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (10, 'Alexandre Campelo', '00822571406', 1);
INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (59, 'José Rodrigues Ferreira da Silva', NULL, 23291);
INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (62, 'José Rodrigues da Silva', NULL, 134567);
INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (63, 'Renato Campelo de Barros', '123456781', 5474);
INSERT INTO paciente (idpac, nome, cpf, codprontuario) VALUES (64, 'José Edvaldo Pinto de Albuquerque', NULL, 53772);


ALTER TABLE paciente ENABLE TRIGGER ALL;

-- Completed on 2010-02-03 21:15:45

--
-- PostgreSQL database dump complete
--

