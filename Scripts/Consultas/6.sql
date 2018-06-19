/* Consulta 6: Trará a soma de todos os nomes de produto com a quantidade maior que 200. */

SELECT SUM(nome) FROM produto WHERE quantidade > 200 ORDER BY nome DESC;