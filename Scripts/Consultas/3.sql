/* Consulta número 3: Listar os 10 produtos mais vendidos. */

SELECT TOP 10 P.id_produto, P.nome, P.tipo, SUM(P.quantidade) as quantidade 
	FROM produto P  
		GROUP BY P.id_produto, P.nome, P.tipo
		ORDER BY quantidade DESC, P.nome, P.tipo;