/* Executar 04*/


/*-----------------Constraint-----------------------*/

ALTER TABLE dados_bairros
ADD COLUMN bairro_id INT;

UPDATE dados_bairros db
JOIN bairros b ON db.bairro = b.nome
SET db.bairro_id = b.id;

ALTER TABLE dados_bairros
DROP COLUMN bairro;

