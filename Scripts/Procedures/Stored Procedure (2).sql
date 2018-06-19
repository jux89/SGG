-- SEGUNDA PROCEDURE
DELIMITER ;
CREATE PROCEDURE insere_vaca (IN id_raca INT, IN id_galpao INT, OUT id_animal INT)
BEGIN
	INSERT INTO animal(id_raca,id_galpao) VALUES (@id_raca, @id_galpao);
	SELECT LAST_INSERT_ID();
END $$
DELIMITER ;