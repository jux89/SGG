
--PRIMEIRA TRIGGER
DELIMITER $
 
CREATE TRIGGER Tgr_compra_medicamento AFTER INSERT
ON lista_compra
FOR EACH ROW
BEGIN
	IF NEW.tipo = 'Medicamento' THEN
		INSERT INTO medicamento (nome,quantidade) VALUES(NEW.nome,NEW.quantidade);
	END IF;
END$
 
DELIMITER ;


--SEGUNDA TRIGGER
DELIMITER $
 
CREATE TRIGGER Tgr_venda_prod AFTER INSERT
ON lista_venda
FOR EACH ROW
BEGIN
	UPDATE produto SET quantidade = quantiade + NEW.quantidade WHERE id_produto = NEW.id_produto;
END$
 
DELIMITER ;


--TERCEIRA TRIGGER
DELIMITER $
 
CREATE TRIGGER Tgr_aplica_medicacao AFTER INSERT
ON tratamento
FOR EACH ROW
BEGIN
	UPDATE medicamento SET quantidade = quantiade - NEW.quantidade WHERE id_medicamento = NEW.id_medicamento;
END$
 
DELIMITER ;

--QUARTA TRIGGER
DELIMITER $
 
CREATE TRIGGER Tgr_estoque_alimento AFTER INSERT
ON nutricao
FOR EACH ROW
BEGIN
	UPDATE alimento SET quantidade = quantiade - NEW.quantidade WHERE id_alimento = NEW.id_alimento;
END$
 
DELIMITER ;

DELIMITER $
 
CREATE TRIGGER Tgr_repoducao AFTER INSERT
ON reproducao
FOR EACH ROW
BEGIN
	UPDATE animal SET id_cabanha = NULL WHERE id_animal = NEW.id_animal;
END$
 
DELIMITER ;

--QUINTA TRIGGER
DELIMITER $
 
CREATE TRIGGER Tgr_separa_tratamento AFTER INSERT
ON tratamento
FOR EACH ROW
BEGIN
	UPDATE animal SET id_cabanha = NULL WHERE id_animal = NEW.id_animal;
END$
 
DELIMITER ;
