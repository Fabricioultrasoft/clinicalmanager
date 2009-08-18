drop schema if exists clinicalmanager;
create schema clinicalmanager;

drop table if exists clinicalmanager.paciente;
create table clinicalmanager.paciente(
 idpac serial primary key not null,
 nome varchar(100),
 cpf varchar(11),
 CONSTRAINT cpf_unique UNIQUE (cpf)
);

drop table if exists clinicalmanager.fatura;
create table clinicalmanager.fatura( 
 idfat serial primary key not null,
 vl_esperado_hn float,
 vl_recebido_hn float,
 vl_recebido_pr float
 );

drop table if exists clinicalmanager.local;
create table clinicalmanager.local( 
 idloc serial primary key not null,
 nome varchar(255),
 gera_prd boolean
);

drop table if exists clinicalmanager.convenio;
create table clinicalmanager.convenio( 
 idcon serial primary key not null,
 descricao varchar(50)
); 

drop table if exists clinicalmanager.medico;
create table clinicalmanager.medico(
 idmed serial primary key not null,
 nome varchar(50)
);

drop table if exists clinicalmanager.internacao;
create table clinicalmanager.internacao(
  idint serial primary key not null,
  data_in date,
  data_out date,
  obs varchar(255),
  idpac integer references clinicalmanager.paciente(idpac),
  idfat integer references clinicalmanager.fatura(idfat),
  idcon integer references clinicalmanager.convenio(idcon)
);

drop table if exists clinicalmanager.local_internacao;
create table clinicalmanager.local_internacao(
 idint integer not null references clinicalmanager.internacao(idint),
 idloc integer not null references clinicalmanager.local(idloc),
 data_in_loc date,
 data_out_loc date,
 obs_loc varchar(255),
 primary key(idint, idloc)
);

drop table if exists clinicalmanager.medico_internacao;
create table clinicalmanager.medico_internacao(
 idint serial not null references clinicalmanager.internacao(idint),
 idmec serial not null references clinicalmanager.medico(idmed),
 responsavel boolean,
 primary key(idint, idmec)
);