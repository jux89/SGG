/*Procedure para atualização do estoque de remédio*/

DELIMITER $$
CREATE PROCEDURE atualiza_estoque_remedio (IN id_remedio INT)
BEGIN
	DECLARE qtde INT 
    DEFAULT (SELECT quantidade - 1 as quantidade 
    FROM medicamento WHERE id_medicamento = @id_remedio);
	   UPDATE medicamento SET quantidade = @qtde WHERE id_medicamento = @id_remedio;
END $$
DELIMITER ;