
/* Função Escalar = > Solução: Exibe dia de maior venda do ano escolhido*/
DELIMITER $$
CREATE FUNCTION fcMaiorVenda (ano int)
	RETURNS date
	BEGIN 
			DECLARE dia date;
			SELECT dia = dt_venda and ROWNUM = 1
			FROM sgg.venda 
			WHERE YEAR(dt_venda) = @ano
			GROUP BY dt_venda
			ORDER BY SUM(total) DESC;
			RETURN dia;
	END 
// DELIMITER ;

/* Chama a função, passa como parâmetro o ano escolhido*/
CALL fcMaiorVenda(2018);


