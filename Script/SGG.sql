use sgg; 

create table Raca (
id_raca int not null auto_increment,
descricao varchar(20) not null, 
nome varchar(20),
primary key (id_raca)
);

create table Animal ( 
id_animal int not null auto_increment, 
peso float not null, 
sexo char(1) not null, 
dt_nasc int not null,
id_cabanha int,
id_galpao int,
id_raca int,
primary key (id_animal),
index fk_Cabanha (id_cabanha),
foreign key (id_cabanha) references Cabanha (id_cabanha),
index fk_Galpao (id_galpao),
foreign key (id_galpao) references Galpao (id_galpao),
index fk_Raca (id_raca),
foreign key (id_raca) references Raca (id_raca)
);

create table Cabanha (
id_cabanha int not null auto_increment,
id_pessoa int,
endereco varchar(20) not null,
primary key (id_cabanha),
index fk_Pessoa (id_pessoa),
foreign key (id_pessoa) references Pessoa (id_pessoa)
);

create table Medicamento ( 
id_medicamento int not null auto_increment,
nome varchar(50) not null, 
dt_validade int not null,
quantidade int,
primary key (id_medicamento)
);

create table Nutricao ( 
id_nutricao int not null,
horario float,
data_nutricao date not null,
quantidade int not null,
index fk_Animal (id_nutricao),
foreign key (id_nutricao) references Animal (id_animal) 
);

create table Alimento ( 
id_alimento int not null auto_increment,
descricao varchar(100),
nome varchar(20) not null,
id_fornecedor int,
primary key (id_alimento),
index fk_Alimento (id_fornecedor), 
foreign key (id_alimento) references Fornecedor (id_fornecedor)
);

create table Fornecedor (
id_fornecedor int not null auto_increment,
id_pessoa int,
id_alimento int,
id_medicamento int,
primary key (id_fornecedor),
index fk_Alimento (id_alimento), 
foreign key (id_alimento) references Alimento (id_alimento),
index fk_Pessoa (id_pessoa), 
foreign key (id_pessoa) references Pessoa (id_pessoa),
index fk_Medicamento (id_medicamento),
foreign key (id_medicamento) references Raca (id_medicamento)
);

create table Pessoa (
id_pessoa int not null auto_increment,
endereco char(80) not null,
telefone int not null,
email varchar(20),
primary key (id_pessoa)
);

create table Fisica (
id_pf int not null auto_increment,
cpf char(9) not null,
id_pessoa int,
primary key (id_pf),
index fk_Pessoa (id_pessoa), 
foreign key (id_pessoa) references Pessoa (id_pessoa)
);

create table Juridica (
id_pj int not null auto_increment,
cnpj char(14) not null,
id_pessoa int,
primary key (id_pj),
index fk_Pessoa (id_pessoa), 
foreign key (id_pessoa) references Pessoa (id_pessoa)
);

create table Galpao (
id_galpao int not null auto_increment,
nome_galpao varchar(50) not null,
caracteristica varchar(50),
localizacao varchar(25),
primary key (id_galpao)
);


