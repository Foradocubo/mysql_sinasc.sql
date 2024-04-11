/* Executar 06*/


CREATE TABLE dw_dados_sexo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sexo VARCHAR(6) NOT NULL,
    bairro_id INT NOT NULL,
    valor INT NOT NULL,
    data date,
    lote int not null,
    FOREIGN KEY (bairro_id) REFERENCES dm_st_bairros(id)
);


SET @proximo_lote := dw_sequencia_sexo();

INSERT INTO dw_dados_sexo (SEXO, bairro_id, VALOR, DATA, lote)
SELECT sexo, bairro_id, valor, data, @proximo_lote FROM st_dados_sexo
