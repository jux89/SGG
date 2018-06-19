/*Consulta número 4: Listar o nome da raça dos animais que estão em reprodução.*/

SELECT rc.nome as NOME

FROM ANIMAL AS a
		INNER JOIN reproducao AS r ON r.id_animal = a.id_animal
		INNER JOIN raca AS rc ON rc.id_raca = a.id_animal

WHERE DESCRICAO IS NOT NULL;
O

