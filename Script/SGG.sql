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
cnpj char(11) not null,
id_pessoa int,
primary key (id_pj),
index fk_Pessoa (id_pessoa), 
foreign key (id_pessoa) references Pessoa (id_pessoa)
);
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

create table Venda (
id_venda int not null auto_increment,
quantidade int,
valor_unit int,
dt_venda date,
primary key (id_venda)
);

create table Producao (
id_producao int not null auto_increment,
ltda int,
validade date,
id_animal int,
index fk_animal (id_producao),
foreign key (id_producao) references Animal (id_animal) 
);

create table Reproducao (
id_reproducao int not null auto_increment,
dt_separo date,
id_animal int,
index fk_Animal (id_reproducao),
foreign key (id_reproducao) references Animal (id_animal) 
);

create table Compra (
id_compra int not null auto_increment,
dt_compra date,
qtde_compra int,
valor_unit double,
total double,
id_medicamento int,
index fk_Medicamento (id_medicamento),
foreign key (id_medicamento) references Compra (id_compra),
id_alimento int,
index fk_Alimento (id_alimento),
foreign key (id_alimento) references Compra (id_compra)
);

create table Tratamento (
id_tratamento int not null auto_increment,
posologia double,
dt_aplicacao date,
id_medicamento int,
index fk_Medicamento (id_medicamento),
foreign key (id_medicamento) references Tratamento (id_tratamento),
id_animal int,
index fk_Animal (id_animal),
foreign key (id_animal) references Tratamento (id_tratamento)
);

