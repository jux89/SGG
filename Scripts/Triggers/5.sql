DELIMITER $
 
CREATE TRIGGER Tgr_repoducao AFTER INSERT
ON reproducao
FOR EACH ROW
BEGIN
	UPDATE animal SET id_cabanha = NULL WHERE id_animal = NEW.id_animal;
END$
 
DELIMITER ;