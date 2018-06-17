
/*Função Inline table-valued => Solução: Mostrar quais bezerros nasceram após certo período*/
DELIMITER //
CREATE FUNCTION fcBezerrosApos (dataApos date)
	RETURNS date
	 
		return (SELECT *
        FROM sgg.reproducao 
        WHERE parto >= dataApos);
    
// DELIMITER ; 

/* Chama a função, passa como parâmetro a data desejada*/
CALL fcBezerrosApos ('2018/04/30');

