
/*Função Inline table-valued => Solução: Mostrar a quantidade de bezerros que nasceram após certo período*/
DELIMITER //
CREATE FUNCTION fcBezerrosApos (dataApos date)
	RETURNS date
	BEGIN 
		return (SELECT *
        FROM sgg.reproducao 
        WHERE parto >= dataApos);
    END
// DELIMITER ; 

/* Chama a função, passa como parâmetro a data desejada*/
CALL fcBezerrosApos ('2018/04/30');

