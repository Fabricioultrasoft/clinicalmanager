SELECT i.idint, p.codprontuario, p.nome, m.nome, itf.idfat, 
 i.vl_esperado_hn, 
 (select l.gera_prd from clinicalmanager.local_internacao l_i inner join clinicalmanager.local l on (l.idloc = l_i.idloc) where l_i.idint=i.idint and l.gera_prd=true limit 1 ) as gera_prd,
 (select sum(valor) from clinicalmanager.item_de_fatura i inner join clinicalmanager.fatura f on (i.idfat=f.idfat)  where i.idfat=itf.idfat and f.tipo='H') as hn_recebido,
 (select sum(valor) from clinicalmanager.item_de_fatura i inner join clinicalmanager.fatura f on (i.idfat=f.idfat)  where i.idfat=itf.idfat and f.tipo='P') as prd_recebido

FROM CLINICALMANAGER.INTERNACAO i
INNER JOIN CLINICALMANAGER.paciente P ON (i.IDPAC = P.idpac) 
INNER JOIN CLINICALMANAGER.medico M ON (m.idmed = i.idmed)
left join clinicalmanager.item_de_fatura itf on (i.idint = itf.idint)
left join clinicalmanager.fatura fat on (itf.idfat=fat.idfat)
--group by i.idint, p.codprontuario, p.nome, m.nome, itf.idfat, i.vl_esperado_hn