create schema clinicalmanager;
create table clinicalmanager.paciente(
 idpac serial primary key not null,
 nome varchar(100)
);

create table clinicalmanager.internacao(
  idint serial primary key not null,
  data_in date,
  data_out date  
);

create table clinicalmanager.fatura( 
 idfat serial primary key not null,
 vl_esperado_hn float,
 vl_recebido_hn float,
 vl_recebido_pr float,
 idint serial references clinicalmanager.internacao(idint)
);

create table clinicalmanager.local( 
 idloc serial primary key not null,
 nome varchar(255),
 gera_prd boolean
);

create table clinicalmanager.local_internacao(
 idint serial not null references clinicalmanager.internacao(idint),
 idloc serial not null references clinicalmanager.local(idloc),
 data_in_loc date,
 data_out_loc date,
 primary key(idint, idloc)
);

create table clinicalmanager.medico(
 idmed serial primary key not null,
 nome varchar(50)
);

create table clinicalmanager.medico_internacao(
 idint serial not null references clinicalmanager.internacao(idint),
 idmec serial not null references clinicalmanager.medico(idmed),
 responsavel boolean,
 primary key(idint, idmec)
);

create table clinicalmanager.convenio( 
 idcon serial primary key not null,
 descricao varchar(50)
); 

