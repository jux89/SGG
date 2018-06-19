/* Consulta núemro 2: Listar os 5 maiores fornecedores de alimento, que são pessoas juridicas, que foram cadastrados no ano de 2017 */

SELECT TOP 5 MAX(COUNT(P.id_pessoa)) 
	FROM fornecedor F
	INNER JOIN alimento A ON F.id_fornecedor = A.id_fornecedor	
	INNER JOIN pessoa P ON P.id_pessoa = F.id_pessoa	
	INNER JOIN pessoa_juridica PJ ON PJ.id_pessoa = P.id_pessoa
	WHERE YEAR(P.data_hora_cad) = 2017;