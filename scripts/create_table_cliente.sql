CREATE TABLE IF NOT EXISTS cliente (
    idc SERIAL PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    endereco VARCHAR(8) NOT NULL,
    banco VARCHAR(50) NOT NULL,
    ag VARCHAR(4) NOT NULL,
    conta VARCHAR(9) UNIQUE NOT NULL,
    pontosGanhos NUMERIC(10,2) NOT NULL DEFAULT 0
);