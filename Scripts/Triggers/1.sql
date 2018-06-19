 
CREATE TRIGGER Tgr_compra_medicamento AFTER INSERT
ON lista_compra
FOR EACH ROW
BEGIN
	IF NEW.tipo = 'Medicamento' THEN
		INSERT INTO medicamento (nome,quantidade) VALUES(NEW.nome,NEW.quantidade);
	END IF;
END$
 
DELIMITER ;