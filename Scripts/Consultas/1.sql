/* Consulta número 1: Listar animais que possuem " endereço " incompleto */

SELECT * FROM animal A INNER JOIN galpao G ON G.id_animal = A.id_animal INNER JOIN cabanha C ON C.id_cabanha = G.id_cabanha WHERE C.endereco IS NULL OR G.localizacao IS NULL;

