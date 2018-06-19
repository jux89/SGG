/* Retornar o valor da tabela lista venda dos produtos com menos de 20 vendas. */

SELECT ID_PRODUTO, SUM(QUANTIDADE) AS VALOR
FROM LISTA_VENDA
GROUP BY ID_PRODUTO
HAVING SUM(QUANTIDADE) < 20;