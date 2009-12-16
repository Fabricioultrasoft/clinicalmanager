select pac.idpac, pac.codprontuario, pac.nome, to_char(it.data_in,'dd/mm/yyyy') as entrada, to_char(it.data_out,'dd/mm/yyyy') as saida,
 it.vl_esperado_hn,itf.valor as valor_recebido
 from clinicalmanager.internacao it left join clinicalmanager.item_de_fatura itf on (itf.idint = it.idint),
  clinicalmanager.paciente pac 
where itf.valor is null
and it.idpac = pac.idpac
and data_out is not null


--select * from clinicalmanager.fatura

--select * from clinicalmanager.internacao

--select * from clinicalmanager.paciente