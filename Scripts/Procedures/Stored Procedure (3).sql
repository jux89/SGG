
--TERCEIRA PROCEDURE
DELIMITER ;
CREATE PROCEDURE compra_vaca (IN valor FLOAT, IN id_cabanha INT,OUT id_compra INT)
BEGIN
	INSERT INTO compra (valor, dt_compra, id_cabanha) VALUES (@valor, NOW(), @id_cabanha);

END $$
DELIMITER ;