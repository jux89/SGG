/* Consulta 6: Trará a soma de todos os nomes de produto com a quantidade maior que 200. */

SELECT SUM(NOME)
FROM PRODUTO
WHERE QUANTIDADE > 200
ORDER BY NOME DESC;