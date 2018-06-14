INSERT INTO sgg.pessoa (nome, telefone)
	SELECT NOME, TELEFONE FROM bdii.pessoa;

INSERT INTO sgg.pessoa (endereco)
	SELECT CONCAT_WS (', ', LOGRADOURO, NUMERO) AS ENDERECO FROM bdii.endereco;

INSERT INTO sgg.pessoa (nome, telefone, endereco)
	SELECT d.NOME, d.TELEFONE, CONCAT_WS (', ', e.LOGRADOURO, e.NUMERO) FROM bdii.pessoa d
	LEFT JOIN bdii.endereco e on e.ID_PESSOA = d.id_pessoa;