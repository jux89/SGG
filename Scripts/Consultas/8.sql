/* Consulta 8: Lista os animais do maior galpão com a menor frequência de nutrição. */

SELECT * FROM ANIMAL A

INNER JOIN NUTRICAO N ON N.ID_ANIMAL = A.ID_ANIMAL
INNER JOIN GALPAO G ON G.ID_GALPAO = N.GALPAO

WHERE 
	MIN(N.FREQUENCIA)
OR
	MAX(C.CAPACIDADE)