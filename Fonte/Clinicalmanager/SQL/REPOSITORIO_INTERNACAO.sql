/*===============================================
	CLASSE: REPOSITÓRIO INTERNAÇÃO
 ===============================================*/

 

/*===============================================
Autor: Renato Campelo
Data: 15/10/2009
String para ConsultaPorPacienteNome Não liberados
 ===============================================*/

select i.idint, i.idpac, i.idcon, i.data_in, i.data_out,
 i.obs, p.nome, p.cpf, li.idloc, li.data_in_loc, li.obs_loc as local_obs, l.nome as local
 from clinicalmanager.internacao i
 inner join clinicalmanager.paciente p on (i.idpac=p.idpac)
 left join clinicalmanager.local_internacao li on (li.idint=i.idint) 
 left join clinicalmanager.local l on (li.idloc=l.idloc)
 where  p.nome like '%' 
 and i.data_out is null 
 and li.data_out_loc is null
 order by i.data_in desc


/*===============================================
Autor: Renato Campelo
Data: 15/10/2009
String para ConsultaPorPacienteNome que receberam alta
 ===============================================*/
select i.idint, i.idpac, i.idcon, i.data_in, i.data_out,
 i.obs, p.nome, p.cpf, l.nome as local
 from clinicalmanager.internacao i, (select li.idint, max(li.data_out_loc) from clinicalmanager.local_internacao li group by li.idint) li_max,
 clinicalmanager.paciente p, clinicalmanager.local l,  clinicalmanager.local_internacao li
 where  p.nome like '%' 
 and i.idpac=p.idpac
 and i.idint=li_max.idint
 and li.idloc=l.idloc
 and li_max.idint=li.idint and li.data_out_loc=li_max.max
