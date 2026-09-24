ALTER TABLE contratos
ADD CONSTRAINT antiSobreporContratos
EXCLUDE USING GIST (
    id_veiculo WITH =,
    daterange(inicio, fim, '[]') WITH &&
);