
CREATE DATABASE sgg;

USE sgg; 


CREATE TABLE Pessoa (
	id_pessoa INT NOT NULL auto_increment,
	endereco char(80) NOT NULL,
	telefone INT NOT NULL,
	email VARCHAR(20),
	PRIMARY KEY (id_pessoa)
)ENGINE = INNODB;

CREATE TABLE Raca (
	id_raca INT NOT NULL auto_increment,
	descricao VARCHAR(20) NOT NULL, 
	nome VARCHAR(20),
	PRIMARY KEY (id_raca)
)ENGINE = INNODB;

CREATE TABLE Animal (
	id_animal INT NOT NULL auto_increment, 
	peso float NOT NULL, 
	sexo char(1) NOT NULL, 
	dt_nasc INT NOT NULL,
	id_cabanha INT,
	id_galpao INT,
	id_raca INT,
	PRIMARY KEY (id_animal),
	index fk_Cabanha (id_cabanha),
	FOREIGN KEY (id_cabanha) REFERENCES Cabanha (id_cabanha),
	index fk_Galpao (id_galpao),
	FOREIGN KEY (id_galpao) REFERENCES Galpao (id_galpao),
	index fk_Raca (id_raca),
	FOREIGN KEY (id_raca) REFERENCES Raca (id_raca)
)ENGINE = INNODB;

CREATE TABLE Cabanha (
	id_cabanha INT NOT NULL auto_increment,
	id_pessoa INT,
	endereco VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_cabanha),
	index fk_Pessoa (id_pessoa),
	FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
)ENGINE = INNODB;

CREATE TABLE Medicamento ( 
	id_medicamento INT NOT NULL auto_increment,
	nome VARCHAR(50) NOT NULL, 
	dt_validade INT NOT NULL,
	quantidade INT,
	PRIMARY KEY (id_medicamento)
)ENGINE = INNODB;

CREATE TABLE Nutricao ( 
	id_nutricao INT NOT NULL,
	horario float,
	data_nutricao DATE NOT NULL,
	quantidade INT NOT NULL,
	index fk_Animal (id_nutricao),
	FOREIGN KEY (id_nutricao) REFERENCES Animal (id_animal) 
)ENGINE = INNODB;

CREATE TABLE Alimento ( 
	id_alimento INT NOT NULL auto_increment,
	descricao VARCHAR(100),
	nome VARCHAR(20) NOT NULL,
	id_fornecedor INT,
	PRIMARY KEY (id_alimento),
	index fk_Alimento (id_fornecedor), 
	FOREIGN KEY (id_alimento) REFERENCES Fornecedor (id_fornecedor)
)ENGINE = INNODB;

CREATE TABLE Fornecedor (
	id_fornecedor INT NOT NULL auto_increment,
	id_pessoa INT,
	id_alimento INT,
	id_medicamento INT,
	PRIMARY KEY (id_fornecedor),
	index fk_Alimento (id_alimento), 
	FOREIGN KEY (id_alimento) REFERENCES Alimento (id_alimento),
	index fk_Pessoa (id_pessoa), 
	FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa),
	index fk_Medicamento (id_medicamento),
	FOREIGN KEY (id_medicamento) REFERENCES Raca (id_medicamento)
)ENGINE = INNODB;



CREATE TABLE Fisica (
	id_pf INT NOT NULL auto_increment,
	cpf char(9) NOT NULL,
	id_pessoa INT,
	PRIMARY KEY (id_pf),
	index fk_Pessoa (id_pessoa), 
	FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
)ENGINE = INNODB;

CREATE TABLE Juridica (
	id_pj INT NOT NULL auto_increment,
	cnpj char(11) NOT NULL,
	id_pessoa INT,
	PRIMARY KEY (id_pj),
	index fk_Pessoa (id_pessoa), 
	FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
)ENGINE = INNODB;

CREATE TABLE Galpao (
	id_galpao INT NOT NULL auto_increment,
	nome_galpao VARCHAR(50) NOT NULL,
	caracteristica VARCHAR(50),
	localizacao VARCHAR(25),
	PRIMARY KEY (id_galpao)
)ENGINE = INNODB;

CREATE TABLE Venda (
	id_venda INT NOT NULL auto_increment,
	quantidade INT,
	valor_unit INT,
	dt_venda DATE,
	PRIMARY KEY (id_venda)
)ENGINE = INNODB;

CREATE TABLE Producao (
	id_producao INT NOT NULL auto_increment,
	ltda INT,
	validade DATE,
	id_animal INT,
	index fk_animal (id_producao),
	FOREIGN KEY (id_producao) REFERENCES Animal (id_animal),
	PRIMARY KEY (id_producao)
)ENGINE = INNODB;

CREATE TABLE Reproducao (
	id_reproducao INT NOT NULL auto_increment,
	dt_separo DATE,
	id_animal INT,
	index fk_Animal (id_reproducao),
	FOREIGN KEY (id_reproducao) REFERENCES Animal (id_animal),
	PRIMARY KEY (id_reproducao)
)ENGINE = INNODB;

CREATE TABLE Compra (
	id_compra INT NOT NULL auto_increment,
	dt_compra DATE,
	qtde_compra INT,
	valor_unit double,
	total double,
	id_medicamento INT,
	index fk_Medicamento (id_medicamento),
	FOREIGN KEY (id_medicamento) REFERENCES Compra (id_compra),
	id_alimento INT,
	index fk_Alimento (id_alimento),
	FOREIGN KEY (id_alimento) REFERENCES Compra (id_compra),
	PRIMARY KEY (id_compra)
)ENGINE = INNODB;

CREATE TABLE Tratamento (
	id_tratamento INT NOT NULL auto_increment,
	posologia double,
	dt_aplicacao DATE,
	id_medicamento INT,
	index fk_Medicamento (id_medicamento),
	FOREIGN KEY (id_medicamento) REFERENCES Tratamento (id_tratamento),
	id_animal INT,
	index fk_Animal (id_animal),
	FOREIGN KEY (id_animal) REFERENCES Tratamento (id_tratamento),
	PRIMARY KEY (id_tratamento)
)ENGINE = INNODB;


-- ARRUMAR ISTO 
ALTER TABLE `medicamento`
	ALTER `dt_validade` DROP DEFAULT;
ALTER TABLE `medicamento`
	CHANGE COLUMN `dt_validade` `dt_validade` DATE NOT NULL AFTER `nome`;

ALTER TABLE `nutricao`
	ALTER `data_nutricao` DROP DEFAULT;
ALTER TABLE `nutricao`
	CHANGE COLUMN `data_nutricao` `dt_nutricao` DATE NOT NULL AFTER `horario`;

ALTER TABLE `nutricao`
	CHANGE COLUMN `horario` `horario` TIME NULL DEFAULT NULL AFTER `id_nutricao`;
ALTER TABLE `pessoa`
	ALTER `endereco` DROP DEFAULT;

ALTER TABLE `pessoa`
	CHANGE COLUMN `endereco` `endereco` VARCHAR(50) NOT NULL AFTER `id_pessoa`,
	DROP COLUMN `email`;

ALTER TABLE `fisica`
	ALTER `cpf` DROP DEFAULT;
ALTER TABLE `fisica`
	CHANGE COLUMN `cpf` `cpf` CHAR(11) NOT NULL AFTER `id_pf`;

ALTER TABLE `pessoa`
	ADD COLUMN `nome` VARCHAR(100) NOT NULL AFTER `id_pessoa`;

ALTER TABLE `juridica`
	ALTER `cnpj` DROP DEFAULT;
ALTER TABLE `juridica`
	CHANGE COLUMN `cnpj` `cnpj` CHAR(14) NOT NULL AFTER `id_pj`;
ALTER TABLE `producao`
	CHANGE COLUMN `ltda` `quantidade` INT(11) NULL DEFAULT NULL AFTER `id_producao`;
ALTER TABLE `pessoa`
	CHANGE COLUMN `telefone` `telefone` VARCHAR(11) NULL DEFAULT NULL AFTER `endereco`;
ALTER TABLE `pessoa`
	CHANGE COLUMN `endereco` `endereco` VARCHAR(250) NOT NULL AFTER `nome`;