DELIMITER $
 
CREATE TRIGGER Tgr_separa_tratamento AFTER INSERT
ON tratamento
FOR EACH ROW
BEGIN
	UPDATE animal SET id_cabanha = NULL WHERE id_animal = NEW.id_animal;
END$
 
DELIMITER ;
