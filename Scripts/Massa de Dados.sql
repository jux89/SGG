
/* Migração dos dados da Tabela Pessoa (Banco BDII) para Pessoa (Banco SGG)*/

INSERT INTO sgg.pessoa (nome, telefone, endereco)

	SELECT d.NOME, d.TELEFONE, CONCAT_WS (', ', e.LOGRADOURO, e.NUMERO) FROM bdii.pessoa d
	
	LEFT JOIN bdii.endereco e on e.ID_PESSOA = d.id_pessoa;



INSERT INTO cabanha (endereco, id_pessoa) SELECT endereco,id_pessoa FROM pessoa ; -- INSERÇÃO NA TABELA CABANHA


INSERT INTO galpao (nome, capacidade, id_cabanha) SELECT CONCAT('Cabanha ', id_cabanha) AS nome, (id_cabanha + 10), id_cabanha FROM cabanha; -- INSERÇÃO NA TABELA GALPÃO
