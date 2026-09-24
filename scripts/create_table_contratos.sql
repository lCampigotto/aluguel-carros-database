CREATE TABLE IF NOT EXISTS contratos (
    idcontrato SERIAL PRIMARY KEY,
    numero VARCHAR(20) UNIQUE NOT NULL,
    inicio DATE NOT NULL,
    fim DATE NOT NULL,
    tipoPagamento VARCHAR(50) NOT NULL CHECK(tipoPagamento IN ('pix','cartao','boleto','transferencia')),
    id_cliente INT NOT NULL REFERENCES cliente(idc),
    id_veiculo INT NOT NULL REFERENCES veiculos(idv),
    id_atendente INT REFERENCES atendente(ida),
    valorContrato NUMERIC(10,2) NOT NULL,
    pontosContrato NUMERIC(10,2) GENERATED ALWAYS AS (valorContrato * 0.5) STORED
);