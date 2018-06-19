DELIMITER $
 
CREATE TRIGGER Tgr_estoque_alimento AFTER INSERT
ON nutricao
FOR EACH ROW
BEGIN
	UPDATE alimento SET quantidade = quantiade - NEW.quantidade WHERE id_alimento = NEW.id_alimento;
END$
 
DELIMITER ;