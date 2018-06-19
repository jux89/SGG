/*Consulta número 4: Listar o nome da raça dos animais que estão em reprodução.*/

SELECT rc.nome as nome 
	FROM animal AS a 
	INNER JOIN reproducao AS r ON r.id_animal = a.id_animal
	INNER JOIN raca AS rc ON rc.id_raca = a.id_animal
		WHERE descricao IS NOT NULL;


