/* Consulta 8: Lista os animais do maior galpão com a menor frequência de nutrição. */

SELECT * FROM animal A 
	INNER JOIN nutricao N ON N.id_animal = A.id_animal
	INNER JOIN galpao G ON G.id_galpao = N.galpao
		WHERE MIN(N.frequencia) OR MAX(C.capacidade);