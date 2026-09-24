CREATE OR REPLACE FUNCTION atualiza_pontos_cliente()
RETURNS TRIGGER AS $$
BEGIN

    IF (TG_OP = 'INSERT') THEN
        UPDATE cliente
        SET pontosGanhos = pontosGanhos + NEW.pontosContrato
        WHERE idc = NEW.id_cliente;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE cliente
        SET pontosGanhos = pontosGanhos - OLD.pontosContrato + NEW.pontosContrato
        WHERE idc = NEW.id_cliente;

    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE cliente
        SET pontosGanhos = pontosGanhos - OLD.pontosContrato
        WHERE idc = OLD.id_cliente;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
    