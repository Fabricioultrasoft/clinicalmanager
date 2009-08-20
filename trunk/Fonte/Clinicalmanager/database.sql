drop schema if exists clinicalmanager;
create schema clinicalmanager;


create table clinicalmanager.paciente(
 idpac serial primary key not null,
 nome varchar(100),
 cpf varchar(11),
 CONSTRAINT cpf_unique UNIQUE (cpf)
);


create table clinicalmanager.fatura( 
 idfat serial primary key not null,
 data_fechamento date,
 paga boolean,
 fechada boolean
 );

create table clinicalmanager.local( 
 idloc serial primary key not null,
 nome varchar(255),
 gera_prd boolean
);

create table clinicalmanager.convenio( 
 idcon serial primary key not null,
 descricao varchar(50)
); 


create table clinicalmanager.medico(
 idmed serial primary key not null,
 nome varchar(50)
);


create table clinicalmanager.internacao(
  idint serial primary key not null,
  idpac integer references clinicalmanager.paciente(idpac),
  idcon integer references clinicalmanager.convenio(idcon),
  idfat integer references clinicalmanager.fatura(idfat),
  data_in date,
  data_out date,
  obs varchar(255),
  vl_esperado_hn float,
  vl_recebido_hn float,
  vl_recebido_pr float  
);


create table clinicalmanager.local_internacao(
 idint integer not null references clinicalmanager.internacao(idint),
 idloc integer not null references clinicalmanager.local(idloc),
 data_in_loc date,
 data_out_loc date,
 obs_loc varchar(255),
 primary key(idint, idloc)
);


create table clinicalmanager.medico_internacao(
 idint serial not null references clinicalmanager.internacao(idint),
 idmec serial not null references clinicalmanager.medico(idmed),
 responsavel boolean,
 primary key(idint, idmec)
);

create table clinicalmanager.item_fatura(
 idite serial not null,
 idint integer not null references clinicalmanager.internacao(idint),
 vl_esperado_hn float,
 vl_recebido_hn float,
 vl_recebido_pr float, 
 primary key (idite, idint)
);