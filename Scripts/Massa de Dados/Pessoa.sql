
/* Migração dos dados da Tabela Pessoa (Banco BDII) para Pessoa (Banco SGG)*/

INSERT INTO sgg.pessoa (nome, telefone, endereco)

	SELECT d.NOME, d.TELEFONE, CONCAT_WS (', ', e.LOGRADOURO, e.NUMERO) FROM bdii.pessoa d
	
	LEFT JOIN bdii.endereco e on e.ID_PESSOA = d.id_pessoa;



INSERT INTO cabanha (endereco, id_pessoa) SELECT endereco,id_pessoa FROM pessoa ; -- INSERÇÃO NA TABELA CABANHA


INSERT INTO galpao (nome, capacidade, id_cabanha) SELECT CONCAT('Cabanha ', id_cabanha) AS nome, (id_cabanha + 10), id_cabanha FROM cabanha; -- INSERÇÃO NA TABELA GALPÃO

DELIMITER $$
 
 --PRIMEIRA PROCEDURE
 DELIMITER ;
CREATE PROCEDURE atualiza_estoque_remedio (IN id_remedio INT)
BEGIN
	DECLARE qtde INT DEFAULT (SELECT quantidade - 1 as quantidade FROM medicamento WHERE id_medicamento = @id_remedio);
   UPDATE medicamento SET quantidade = @qtde WHERE id_medicamento = @id_remedio;
END $$
DELIMITER ;
-- SEGUNDA PROCEDURE
DELIMITER ;
CREATE PROCEDURE compra_vaca (IN id_raca INT, IN id_galpao INT, OUT id_animal INT)
BEGIN
	INSERT INTO animal(id_raca,id_galpao) VALUES (@id_raca, @id_galpao);
	SELECT LAST_INSERT_ID();
END $$
DELIMITER ;

--TERCEIRA PROCEDURE
DELIMITER ;
CREATE PROCEDURE compra_vaca (IN valor FLOAT, IN id_cabanha INT,OUT id_compra INT)
BEGIN
	INSERT INTO compra (valor, dt_compra, id_cabanha) VALUES (@valor, NOW(), @id_cabanha);

END $$
DELIMITER ;
