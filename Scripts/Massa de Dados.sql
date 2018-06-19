
/* Migração dos dados da Tabela Pessoa (Banco BDII) para Pessoa (Banco SGG)*/

INSERT INTO sgg.pessoa (nome, telefone, endereco)

	SELECT d.NOME, d.TELEFONE, CONCAT_WS (', ', e.LOGRADOURO, e.NUMERO) FROM bdii.pessoa d
	
	LEFT JOIN bdii.endereco e on e.ID_PESSOA = d.id_pessoa;

-- Inserção de Dados na Tabela Cabanha
INSERT INTO cabanha (endereco, id_pessoa) SELECT endereco,id_pessoa FROM pessoa; -- INSERÇÃO NA TABELA CABANHA

-- Inserção de dados na Tabela Galpão
INSERT INTO galpao (nome, capacidade, id_cabanha) SELECT CONCAT('Cabanha ', id_cabanha) AS nome, (id_cabanha + 10), id_cabanha FROM cabanha;

-- Inserção de dados na Tabela Raça
INSERT INTO raca (nome) VALUES ("Sims"),("Morgan"),("English"),("Herrera"),("Henson"),("Stein"),("Miranda"),("Barlow"),("Fernandez"),("Mckenzie"),("Cox"),("Reynolds"),("Delacruz"),("Andrews"),("Mack"),("Leblanc"),("David"),("Garrison"),("Rasmussen"),("Morrow"),("Sanford"),("Deleon"),("Buckner"),("Jackson"),("Lewis"),("Carroll"),("Bauer"),("Sharpe"),("David"),("Banks"),("Hudson"),("Mckinney"),("Morton"),("Marks"),("Gonzalez"),("Noble"),("Allen"),("Greer"),("Brown"),("Dyer"),("Nicholson"),("Fox"),("Reed"),("Melendez"),("Langley"),("Salazar"),("Robinson"),("Hensley"),("Gaines"),("Puckett"),("Bryant"),("Wolfe"),("Maddox"),("Brock"),("Dickerson"),("Walls"),("Knox"),("Andrews"),("Malone"),("Barnes"),("Cantu"),("Lowery"),("Madden"),("West"),("Branch"),("Dillard"),("Castillo"),("Hicks"),("Warner"),("Mueller"),("Sanchez"),("Dawson"),("Chapman"),("Bryan"),("Kelly"),("Vasquez"),("Roberson"),("Richards"),("Frank"),("Fox"),("Meyers"),("Brennan"),("Guy"),("Hancock"),("Strong"),("Ward"),("Calhoun"),("Morse"),("Rivas"),("Bauer"),("Andrews"),("Francis"),("Gates"),("Poole"),("Lamb"),("Cooper"),("Holder"),("Bell"),("Weaver"),("Levine");

-- Inserção de dados na Tabela Animal
insert into animal (peso,id_raca, id_galpao) select floor(200+(rand()*(1-200))) , floor(10+(rand()*(1-10))) , floor(200+(rand()*(1-200)))from pessoa