/* Consulta número 1: Listar ID dos animais, onde a alocação (galpão) não possui localização */

SELECT an.id_animal
	FROM animal AS an
		INNER JOIN galpao AS g ON g.id_galpao = an.id_galpao
WHERE g.localizacao IS NULL;
