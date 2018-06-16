
INSERT INTO sgg.pessoa (nome, telefone, endereco)
	SELECT d.NOME, d.TELEFONE, CONCAT_WS (', ', e.LOGRADOURO, e.NUMERO) FROM bdii.pessoa d
	LEFT JOIN bdii.endereco e on e.ID_PESSOA = d.id_pessoa;