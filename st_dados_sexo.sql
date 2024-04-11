/* Executar 04*/


CREATE TABLE st_dados_sexo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bairro VARCHAR(250),
    valor INT NOT NULL,
    sexo VARCHAR(6) NOT NULL,
    data date,
    bairro_id INT NOT NULL,
    lote int not null,
    FOREIGN KEY (bairro_id) REFERENCES dm_st_bairros(id)
    
);

/* --------------------------- Insert ----------------------------------- */

SET @proximo_lote := st_sequencia_proximo_lote();


INSERT INTO st_dados_sexo (BAIRRO, VALOR, SEXO, DATA, bairro_id, lote)

SELECT BAIRRO, VALOR, SEXO, DATA, dm_st_bairros.id,  @proximo_lote as lote FROM (
SELECT 'Água Rasa' AS bairro, agua_rasa AS valor, sexo, data FROM ods_dados_sexo 
UNION ALL
SELECT 'Alto de Pinheiros' AS bairro, alto_de_pinheiros AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Anhanguera' AS bairro, anhanguera AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Aricanduva' AS bairro, aricanduva AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Artur Alvim' AS bairro, artur_alvim AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Barra Funda' AS bairro, barra_funda AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Bela Vista' AS bairro, bela_vista AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Belém' AS bairro, belem AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Bom Retiro' AS bairro, bom_retiro AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Brás' AS bairro, bras AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Brasilândia' AS bairro, brasilandia AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Butantã' AS bairro, butanta AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cachoeirinha' AS bairro, cachoeirinha AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cambuci' AS bairro, cambuci AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Campo Belo' AS bairro, campo_belo AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Campo Grande' AS bairro, campo_grande AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Campo Limpo' AS bairro, campo_limpo AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cangaíba' AS bairro, cangaiba AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Capão Redondo' AS bairro, capao_redondo AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Carrão' AS bairro, carrão AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Casa Verde' AS bairro, casa_verde AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cidade Ademar' AS bairro, cidade_ademar AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cidade Dutra' AS bairro, cidade_dutra AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cidade Líder' AS bairro, cidade_lider AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cidade Tiradentes' AS bairro, cidade_tiradentes AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Consolação' AS bairro, consolacao AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Cursino' AS bairro, cursino AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Ermelino Matarazzo' AS bairro, ermelino_matarazzo AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Freguesia do Ó' AS bairro, freguesia_do_o AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Grajaú' AS bairro, grajau AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Guaianases' AS bairro, guaianases AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Iguatemi' AS bairro, iguatemi AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Ipiranga' AS bairro, ipiranga AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Itaim Bibi' AS bairro, itaim_bibi AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Itaim Paulista' AS bairro, itaim_paulista AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Itaquera' AS bairro, itaquera AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jabaquara' AS bairro, jabaquara AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jaçanã' AS bairro, jacana AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jaguara' AS bairro, jaguara AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jaguaré' AS bairro, jaguare AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jaraguá' AS bairro, jaragua AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jardim Ângela' AS bairro, jardim_angela AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jardim Helena' AS bairro, jardim_helena AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jardim Paulista' AS bairro, jardim_paulista AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Jardim São Luís' AS bairro, jardim_sao_luis AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'José Bonifácio' AS bairro, jose_bonifacio AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Lajeado' AS bairro, lajeado AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Lapa' AS bairro, lapa AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Liberdade' AS bairro, liberdade AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Limão' AS bairro, limao AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Mandaqui' AS bairro, mandaqui AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Marsilac' AS bairro, marsilac AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Moema' AS bairro, moema AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Moóca' AS bairro, mooca AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Morumbi' AS bairro, morumbi AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Parelheiros' AS bairro, parelheiros AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Pari' AS bairro, pari AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Parque do Carmo' AS bairro, parque_do_carmo AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Pedreira' AS bairro, pedreira AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Penha' AS bairro, penha AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Perdizes' AS bairro, perdizes AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Perus' AS bairro, perus AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Pinheiros' AS bairro, pinheiros AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Pirituba' AS bairro, pirituba AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Ponte Rasa' AS bairro, ponte_rasa AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Raposo Tavares' AS bairro, raposo_tavares AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'República' AS bairro, republica AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Rio Pequeno' AS bairro, rio_pequeno AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Sacomã' AS bairro, sacoma AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Santa Cecília' AS bairro, santa_cecilia AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Santana' AS bairro, santana AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Santo Amaro' AS bairro, santo_amaro AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'São Domingos' AS bairro, sao_domingos AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'São Lucas' AS bairro, sao_lucas AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'São Mateus' AS bairro, sao_mateus AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'São Miguel' AS bairro, sao_miguel AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'São Rafael' AS bairro, sao_rafael AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Sapopemba' AS bairro, sapopemba AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Saúde' AS bairro, saude AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Sé' AS bairro, se AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Socorro' AS bairro, socorro AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Tatuapé' AS bairro, tatuape AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Tremembé' AS bairro, tremembe AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Tucuruvi' AS bairro, tucuruvi AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Andrade' AS bairro, vila_andrade AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Curuçá' AS bairro, vila_curuca AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Formosa' AS bairro, vila_formosa AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Guilherme' AS bairro, vila_guilherme AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Jacuí' AS bairro, vila_jacui AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Leopoldina' AS bairro, vila_leopoldina AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Maria' AS bairro, vila_maria AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Mariana' AS bairro, vila_mariana AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Matilde' AS bairro, vila_matilde AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Medeiros' AS bairro, vila_medeiros AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Prudente' AS bairro, vila_prudente AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Vila Sônia' AS bairro, vila_sonia AS valor, sexo, data FROM ods_dados_sexo
UNION ALL
SELECT 'Ignorado' AS bairro, ignorado AS valor, sexo, data FROM ods_dados_sexo
) dados_sexo JOIN  dm_st_bairros ON  dados_sexo.BAIRRO = dm_st_bairros.NOME;
