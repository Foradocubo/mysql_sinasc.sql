CREATE TABLE sinasc_controle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_tabela VARCHAR(255),
    estagio VARCHAR(50),
    proximo_lote INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



DDELIMITER //

CREATE FUNCTION sinasc_controle(estagio VARCHAR(50), nome_tabela VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE maior_lote INT;

    -- Obter o máximo valor atual da sequência de lote
    SELECT MAX(proximo_lote) INTO maior_lote FROM sinasc_controle;

    -- Se não houver registros na tabela sequencia_lote, definir o próximo valor como 1
    IF maior_lote IS NULL THEN
        SET maior_lote = 1;
    END IF;

    -- Incrementar o próximo valor da sequência de lote
    SET maior_lote = maior_lote + 1;

    -- Inserir um novo registro na tabela sequencia_lote com o próximo valor do lote
    INSERT INTO sinasc_controle (estagio, nome_tabela, proximo_lote) VALUES (estagio, nome_tabela, maior_lote);

    -- Retornar o próximo valor da sequência de lote
    RETURN maior_lote;
END //

DELIMITER ;
