/* Retornar o valor da tabela lista venda dos produtos com menos de 20 vendas. */

SELECT id_produto, SUM(quantidade) AS valor FROM lista_venda  GROUP BY id_produto HAVING SUM(quantidade) < 20;