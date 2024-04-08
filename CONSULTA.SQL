/*-----------------Consulta----------------------*/

SELECT
    db.sexo,
    b.nome AS bairro,
    db.valor
FROM
    dados_bairros db
JOIN
    bairros b ON db.bairro_id = b.id;
