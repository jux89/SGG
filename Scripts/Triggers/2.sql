DELIMITER $
 
CREATE TRIGGER Tgr_venda_prod AFTER INSERT
ON lista_venda
FOR EACH ROW
BEGIN
	UPDATE produto SET quantidade = quantiade + NEW.quantidade WHERE id_produto = NEW.id_produto;
END$
 
DELIMITER ;
