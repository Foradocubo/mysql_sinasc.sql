/* Executar 3

1- CRIA TABELA PARA ARMAZENAR A SEQUENCIE (MYSQL N POSSI FNC)
2- Fazer um insert
3- CRIAR PROCEDURE PARA ACHAR QUAL É 
4- CONTROLAR DATAS DE EXECUÇÃO

*/



/* 1  criar tabela*/

CREATE TABLE st_sequencia_lote (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proximo_lote INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* 2 fazer o insert*/

INSERT INTO st_sequencia_lote (proximo_lote) VALUES (202301);


/* 3 criar fnc*/

DELIMITER //

CREATE FUNCTION st_sequencia_proximo_lote() RETURNS INT
BEGIN
    DECLARE proximo_lote INT;

    -- Obter o máximo valor atual da sequência de lote
    SELECT MAX(proximo_lote) INTO proximo_lote FROM st_sequencia_lote;

    -- Se não houver registros na tabela sequencia_lote, definir o próximo valor como 1
    IF proximo_lote IS NULL THEN
        SET proximo_lote = 1;
    END IF;

    -- Incrementar o próximo valor da sequência de lote
    SET proximo_lote = proximo_lote + 1;

    -- Inserir um novo registro na tabela sequencia_lote com o próximo valor do lote
    INSERT INTO st_sequencia_lote (proximo_lote) VALUES (proximo_lote);

    -- Retornar o próximo valor da sequência de lote
    RETURN proximo_lote;
END //

DELIMITER ;




/* 4 executar a call  */


call st_sequencia_proximo_lote()

or 


 Select st_sequencia_proximo_lote() as proximo_lote


or 

SET @proximo_lote := obter_proximo_lote();

-- Inserir os dados na tabela principal e atribuir o valor do lote
INSERT INTO tabela_principal (lote, nome, idade)
SELECT @proximo_lote AS lote, nome, idade
FROM dados_a_inserir;