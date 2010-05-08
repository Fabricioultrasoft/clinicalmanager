CREATE TABLE convenio (
  idcon INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(50) NULL,
  PRIMARY KEY(idcon)
);

CREATE TABLE fatura (
  idfat INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  vl_esperado_hn FLOAT NULL,
  vl_lancado_hn FLOAT NULL,
  vl_produtividade FLOAT NULL,
  PRIMARY KEY(idfat)
);

CREATE TABLE internacao (
  idint INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  convenio_idcon INTEGER UNSIGNED NOT NULL,
  fatura_idfat INTEGER UNSIGNED NOT NULL,
  paciente_idpac INTEGER UNSIGNED NOT NULL,
  data_in DATE NULL,
  data_out DATE NULL,
  obs VARCHAR(255) NULL,
  PRIMARY KEY(idint),
  INDEX internacao_FKIndex1(paciente_idpac),
  INDEX internacao_FKIndex2(fatura_idfat),
  INDEX internacao_FKIndex3(convenio_idcon)
);

CREATE TABLE internacao_has_localidade (
  internacao_idint INTEGER UNSIGNED NOT NULL,
  localidade_idloc INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(internacao_idint, localidade_idloc),
  INDEX internacao_has_localidade_FKIndex1(internacao_idint),
  INDEX internacao_has_localidade_FKIndex2(localidade_idloc)
);

CREATE TABLE internacao_has_medico (
  internacao_idint INTEGER UNSIGNED NOT NULL,
  medico_idmed INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(internacao_idint, medico_idmed),
  INDEX internacao_has_medico_FKIndex1(internacao_idint),
  INDEX internacao_has_medico_FKIndex2(medico_idmed)
);

CREATE TABLE localidade (
  idloc INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NULL,
  gera_prd BOOL NULL,
  PRIMARY KEY(idloc)
);

CREATE TABLE medico (
  idmed INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  PRIMARY KEY(idmed)
);

CREATE TABLE paciente (
  idpac INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  cpf VARCHAR(11) NULL,
  PRIMARY KEY(idpac),
  UNIQUE INDEX cpf_index(cpf)
);


