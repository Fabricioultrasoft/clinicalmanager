create or replace function atualiza_vl_int() returns trigger as $$
begin
if (TG_OP = 'INSERT') then
update clinicalmanager.internacao set vl_recebido_hn = vl_recebido_hn + new.valor
where idint = new.idint;
RETURN NULL;
end if;
if (tg_op = 'DELETE') then
update clinicalmanager.internacao set vl_recebido_hn = vl_recebido_hn - old.valor
where idint = old.idint;
RETURN NULL;
end if;
RETURN NULL;
end;
$$ LANGUAGE plpgsql;

create TRIGGER atualizar_honorario after insert or delete on clinicalmanager.item_de_fatura
FOR EACH ROW EXECUTE PROCEDURE atualiza_vl_int();

