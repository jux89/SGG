
/*Função Retorna relação de alimentos abastecidos por um fornecedor*/

DELIMITER $$
CREATE FUNCTION FC_GET_ALIMENTO (id_fornecedor INT)
	returns varchar(100)
		BEGIN
        select al.nome AS nome
            FROM alimento al
				INNER JOIN fornecedor fn on fn.id_fornecedor = al.id_fornecedor;
		END $$

CALL FC_GET_ALIMENTO (1);