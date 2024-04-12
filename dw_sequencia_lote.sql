/* Executar 5

1- CRIA TABELA PARA ARMAZENAR A SEQUENCIE (MYSQL N POSSI FNC)
2- Fazer um insert
3- CRIAR PROCEDURE PARA ACHAR QUAL É 
4- CONTROLAR DATAS DE EXECUÇÃO

*/



/* 1  criar tabela*/

CREATE TABLE dw_sequencia_sexo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proximo_lote INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



/* 3 criar fnc*/

DELIMITER //

CREATE FUNCTION dw_sequencia_sexo() RETURNS INT
BEGIN
    DECLARE maior_lote INT;

    -- Obter o máximo valor atual da sequência de lote
    SELECT MAX(proximo_lote) INTO maior_lote FROM dw_sequencia_sexo;

        -- Se não houver registros na tabela sequencia_lote, definir o próximo valor como 1
    IF maior_lote IS NULL THEN
        SET maior_lote = 100000;
    END IF;


    -- Incrementar o próximo valor da sequência de lote
    SET maior_lote = maior_lote + 1;

    -- Inserir um novo registro na tabela sequencia_lote com o próximo valor do lote
    INSERT INTO dw_sequencia_sexo (proximo_lote) VALUES (maior_lote);

    -- Retornar o próximo valor da sequência de lote
    RETURN maior_lote;
END //

DELIMITER ;
