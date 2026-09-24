CREATE TRIGGER trg_atualiza_pontos_cliente
AFTER INSERT OR UPDATE OR DELETE ON contratos
FOR EACH ROW
EXECUTE FUNCTION atualiza_pontos_cliente();