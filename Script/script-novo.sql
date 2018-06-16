CREATE TABLE `ppk`.`raca` (
	`id_raca` INT NOT NULL AUTO_INCREMENT,
  	`nome` VARCHAR(20) NOT NULL,
  	`descricao` VARCHAR(20) NULL,
  	PRIMARY KEY (`id_raca`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`pessoa` (
  	`id_pessoa` INT NOT NULL AUTO_INCREMENT,
  	`nome` VARCHAR(100) NOT NULL,
  	`telefone` VARCHAR(11) NULL,
  	`endereco` VARCHAR(250) NULL,
  	PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`pessoa_fisica` (
  `id_fisica` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `id_pessoa` INT NULL,
  PRIMARY KEY (`id_fisica`),
  INDEX `fk_pessoa_idx` (`id_pessoa` ASC),
  CONSTRAINT `fk_pessoa`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `ppk`.`pessoa` (`id_pessoa`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`pessoa_juridica` (
  `id_juridica` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NOT NULL,
  `id_pessoa` INT NULL,
  PRIMARY KEY (`id_juridica`),
  INDEX `fk_pj_idx` (`id_pessoa` ASC),
  CONSTRAINT `fk_pj`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `ppk`.`pessoa` (`id_pessoa`))
ENGINE = InnoDB;


CREATE TABLE `ppk`.`cabanha` (
  `id_cabanha` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(250) NULL,
  `id_pessoa` INT NULL,
  PRIMARY KEY (`id_cabanha`),
  INDEX `fk_peao_idx` (`id_pessoa` ASC),
  CONSTRAINT `fk_peao`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `ppk`.`pessoa` (`id_pessoa`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`galpao` (
  `id_galpao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `caracteristica` VARCHAR(50) NULL,
  `capacidade` INT NOT NULL,
  `localizacao` VARCHAR(50) NULL,
  `id_cabanha` INT NULL,
  PRIMARY KEY (`id_galpao`),
  INDEX `fk_cabanha_idx` (`id_cabanha` ASC),
  CONSTRAINT `fk_cabanha`
    FOREIGN KEY (`id_cabanha`)
    REFERENCES `ppk`.`cabanha` (`id_cabanha`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`medicamento` (
  `id_medicamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `dt_validade` DATE NULL,
  `quantiade` INT NULL,
  `id_cabanha` INT NULL,
  PRIMARY KEY (`id_medicamento`),
  INDEX `fk_estoque_medicamento_idx` (`id_cabanha` ASC),
  CONSTRAINT `fk_estoque_medicamento`
    FOREIGN KEY (`id_cabanha`)
    REFERENCES `ppk`.`cabanha` (`id_cabanha`))
ENGINE = InnoDB;


CREATE TABLE `ppk`.`animal` (
  `id_animal` INT NOT NULL AUTO_INCREMENT,
  `peso` FLOAT NULL,
  `sexo` ENUM('Fêmea', 'Macho') NULL,
  `dt_nasc` DATE NULL,
  `id_raca` INT NULL,
  `id_galpao` INT NULL,
  PRIMARY KEY (`id_animal`),
  INDEX `fk_galpao_idx` (`id_galpao` ASC),
  INDEX `fk_raca_idx` (`id_raca` ASC),
  CONSTRAINT `fk_galpao`
    FOREIGN KEY (`id_galpao`)
    REFERENCES `ppk`.`galpao` (`id_galpao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_raca`
    FOREIGN KEY (`id_raca`)
    REFERENCES `ppk`.`raca` (`id_raca`))
ENGINE = InnoDB;


CREATE TABLE `ppk`.`tratamento` (
  `id_tratamento` INT NOT NULL AUTO_INCREMENT,
  `id_medicamento` INT NOT NULL,
  `id_animal` INT NOT NULL,
  `posologia` VARCHAR(50) NULL,
  `dt_aplicacao` DATE NOT NULL,
  PRIMARY KEY (`id_tratamento`),
  INDEX `fk_medicamento_idx` (`id_medicamento` ASC),
  INDEX `fk_animal_idx` (`id_animal` ASC),
  CONSTRAINT `fk_medicamento`
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `ppk`.`medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animal`
    FOREIGN KEY (`id_animal`)
    REFERENCES `ppk`.`animal` (`id_animal`))
ENGINE = InnoDB;


CREATE TABLE `ppk`.`reproducao` (
  `id_reproducao` INT NOT NULL AUTO_INCREMENT,
  `id_animal` INT NOT NULL,
  `dt_separo` DATE NULL,
  PRIMARY KEY (`id_reproducao`),
  INDEX `fk_animal_idx` (`id_animal` ASC),
  CONSTRAINT `fk_animal_reproducao`
    FOREIGN KEY (`id_animal`)
    REFERENCES `ppk`.`animal` (`id_animal`))
ENGINE = InnoDB;


CREATE TABLE `ppk`.`producao` (
  `id_producao` INT NOT NULL AUTO_INCREMENT,
  `quantidade` FLOAT NULL,
  `data` DATE NULL,
  `id_animal` INT NOT NULL,
  PRIMARY KEY (`id_producao`),
  INDEX `fk_animal_producao_idx` (`id_animal` ASC),
  CONSTRAINT `fk_animal_producao`
    FOREIGN KEY (`id_animal`)
    REFERENCES `ppk`.`animal` (`id_animal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE `ppk`.`fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  INDEX `fk_fornecedor_pessoa_idx` (`id_pessoa` ASC),
  CONSTRAINT `fk_fornecedor_pessoa`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `ppk`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE `ppk`.`alimento` (
  `id_alimento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(100) NULL,
  `quantiade` FLOAT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_alimento`),
  INDEX `fk_alimento_idx` (`id_fornecedor` ASC),
  CONSTRAINT `fk_alimento`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `ppk`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `ppk`.`nutricao` (
  `id_nutricao` INT NOT NULL AUTO_INCREMENT,
  `quantidade` FLOAT NOT NULL,
  `frequencia` VARCHAR(45) NOT NULL,
  `id_animal` INT NOT NULL,
  `id_alimento` INT NOT NULL,
  PRIMARY KEY (`id_nutricao`),
  INDEX `fk_nutricao_animal_idx` (`id_animal` ASC),
  INDEX `fk_alimento_nutricao_idx` (`id_alimento` ASC),
  CONSTRAINT `fk_nutricao_animal`
    FOREIGN KEY (`id_animal`)
    REFERENCES `ppk`.`animal` (`id_animal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alimento_nutricao`
    FOREIGN KEY (`id_alimento`)
    REFERENCES `ppk`.`alimento` (`id_alimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `ppk`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('Medicamento', 'Alimento', 'Leite') NULL,
  `quantidade` FLOAT NULL,
  `id_animal` INT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_animal_produto_idx` (`id_animal` ASC),
  CONSTRAINT `fk_animal_produto`
    FOREIGN KEY (`id_animal`)
    REFERENCES `ppk`.`animal` (`id_animal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE `ppk`.`venda` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `total` FLOAT NOT NULL,
  `dt_venda` DATE NULL,
  PRIMARY KEY (`id_venda`))
ENGINE = InnoDB;

CREATE TABLE `ppk`.`lista_venda` (
  `id_lista_venda` INT NOT NULL AUTO_INCREMENT,
  `id_produto` INT NOT NULL,
  `quantidade` FLOAT NULL,
  `valor` FLOAT NULL,
  `id_venda` INT NOT NULL,
  PRIMARY KEY (`id_lista_venda`),
  INDEX `fk_produto_venda_idx` (`id_produto` ASC),
  INDEX `fk_venda_idx` (`id_venda` ASC),
  CONSTRAINT `fk_produto_venda`
    FOREIGN KEY (`id_produto`)
    REFERENCES `ppk`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda`
    FOREIGN KEY (`id_venda`)
    REFERENCES `ppk`.`venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE `ppk`.`compra` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NOT NULL,
  `dt_compra` DATE NOT NULL,
  PRIMARY KEY (`id_compra`))
ENGINE = InnoDB;
	
CREATE TABLE `ppk`.`lista_compra` (
  `id_lista_compra` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `tipo` ENUM('Medicamento', 'Alimento') NOT NULL,
  `quantidade` FLOAT NOT NULL,
  `valor` FLOAT NOT NULL,
  `id_compra` INT NOT NULL,
  PRIMARY KEY (`id_lista_compra`),
  INDEX `fk_lista_compra_idx` (`id_compra` ASC),
  CONSTRAINT `fk_lista_compra`
    FOREIGN KEY (`id_compra`)
    REFERENCES `ppk`.`compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





