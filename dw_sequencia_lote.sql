/* Executar 5

1- CRIA TABELA PARA ARMAZENAR A SEQUENCIE (MYSQL N POSSI FNC)
2- Fazer um insert
3- CRIAR PROCEDURE PARA ACHAR QUAL É 
4- CONTROLAR DATAS DE EXECUÇÃO

*/



/* 1  criar tabela*/

CREATE TABLE dw_sequencia_lote (
    id INT AUTO_INCREMENT PRIMARY KEY,
    proximo_lote INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* 2 fazer o insert*/

INSERT INTO dw_sequencia_lote (proximo_lote) VALUES (202301);


/* 3 criar procedure*/

DELIMITER //

CREATE PROCEDURE dw_sequencia_proximo_lote()
BEGIN
    DECLARE proximo_lote INT;
    
    -- Iniciar uma transação
    START TRANSACTION;
    
    -- Obter o próximo valor da sequência de lote e travar a linha para garantir a exclusão mútua
    SELECT proximo_lote INTO proximo_lote FROM st_sequencia_lote FOR UPDATE;
    
    -- Atualizar o valor da sequência de lote para o próximo valor
    UPDATE st_sequencia_lote SET proximo_lote = proximo_lote + 1;
    
    -- Inserir um novo registro na tabela sequencia_lote com o próximo valor do lote e a data de criação atual
    INSERT INTO st_sequencia_lote (proximo_lote) VALUES (proximo_lote + 1);
    
    -- Confirmar a transação
    COMMIT;
    
    -- Retornar o próximo valor da sequência de lote
    SELECT proximo_lote;
END //

DELIMITER ;





/* 4 executar a call  */


call dw_sequencia_proximo_lote()

or 


 Select dw_sequencia_proximo_lote() as proximo_lote


or 

SET @proximo_lote := obter_proximo_lote();

-- Inserir os dados na tabela principal e atribuir o valor do lote
INSERT INTO tabela_principal (lote, nome, idade)
SELECT @proximo_lote AS lote, nome, idade
FROM dados_a_inserir;