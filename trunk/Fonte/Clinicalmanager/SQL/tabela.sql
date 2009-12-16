create table clinicalmanager.item_de_fatura(
 iditem serial not null primary key,
 idfat integer not null references clinicalmanager.fatura(idfat),
 idint integer not null references clinicalmanager.internacao(idint),
 valor float
);