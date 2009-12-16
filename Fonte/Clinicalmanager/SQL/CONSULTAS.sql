/*
CONSULTA PARA RECUPERAR ÚLTIMO LOCAL DA INTERNAÇÃO DE PACIENTE.
*/
select pac.idpac, pac.nome, inter.data_in, inter.data_out, inter.vl_esperado_hn, loc.nome  from clinicalmanager.internacao inter
inner join clinicalmanager.local_internacao linter on (inter.idint=linter.idint)
inner join clinicalmanager.local loc on (linter.idloc=loc.idloc) 
inner join clinicalmanager.paciente pac on (inter.idpac=pac.idpac)
where linter.data_in_loc = 
    (select max(linter.data_in_loc) from clinicalmanager.local_internacao linter
    where linter.idint = inter.idint)



select i.idint, i.idpac, i.idcon, i.data_in, i.data_out, 
i.obs, p.nome, p.cpf, li.idloc, li.data_in_loc, li.obs_loc as local_obs, l.nome as local 
from clinicalmanager.internacao i 
inner join clinicalmanager.paciente p on (i.idpac=p.idpac) 
left join clinicalmanager.local_internacao li on (li.idint=i.idint) 
left join clinicalmanager.local l on (li.idloc=l.idloc) 
where  p.idpac=62
and  li.data_in_loc = 
    (select max(li.data_in_loc) from clinicalmanager.local_internacao li
    where li.idint = i.idint)


select inter.data_in as entrada, pac.nome, pac.codprontuario, med.nome as medico, fat.codigo as fatura, ifat.valor, conv.descricao as convenio
   from clinicalmanager.fatura fat
 inner join clinicalmanager.item_de_fatura ifat on (fat.idfat=ifat.idfat)
 inner join clinicalmanager.internacao inter on (inter.idint = ifat.idint)
 inner join clinicalmanager.paciente pac on (inter.idpac = pac.idpac)
 inner join clinicalmanager.medico med on (inter.idmed = med.idmed)
 inner join clinicalmanager.convenio conv on (inter.idcon = conv.idcon)