DELIMITER $
 
CREATE TRIGGER Tgr_aplica_medicacao AFTER INSERT
ON tratamento
FOR EACH ROW
BEGIN
	UPDATE medicamento SET quantidade = quantiade - NEW.quantidade WHERE id_medicamento = NEW.id_medicamento;
END$
 
DELIMITER ;