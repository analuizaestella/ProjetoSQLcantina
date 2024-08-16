-- Apagando o banco de dados
drop database dbcantina;
-- Criando o banco de dados
create database dbcantina;
-- Acessando o banco de dados
use dbcantina;
-- Criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default "F" check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));

create table tbFornecedores(
    codForn int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    cnpj char(18) not null unique,
    primary key(codForn));

create table tbClientes(
    codCli int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    telCelular char(10),
    primary key(codCli));

create table tbUsuarios(
codUsuario int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsuario),
foreign key(codFunc) references tbFuncionarios(codFunc));

create table tbProdutos(
    codProduto int not null auto_increment,
    descricao varchar(100),
    quantidade int,
    valor decimal(9,2),
    validade date,
    dataEntrada date,
    horaEntrada time,
    codForn int not null,
    primary key(codProduto),
    foreign key(codForn) references tbFornecedores(codForn));

create table tbVendas(
    codVenda int not null auto_increment,
    dataVenda date,
    horaVenda time,
    quantidade int,
    codUsuario int not null,
    codCli int not null,
    codProduto int not null,
    primary key(codVenda),
    foreign key(codUsuario) references tbUsuarios(codUsuario),    
    foreign key(codCli) references tbClientes(codCli),    
    foreign key(codProduto) references tbProdutos(codProduto));

--visualizando banco de dados
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

--inserindo registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Amarildo Santiago','amarildo@santiago','445.124.758-56','M','1500.50','1999/06/25','94241-2233');

insert into tbFornecedores(nome,email,cnpj)values('Oboticario','florestaverde@gmail.com','51.205.170/0001-43');

insert into tbFornecedores(nome,email,cnpj)values('Casa do churros','churrosquentinhos@gmail.com','22.544.372/0001-11');

insert into tbClientes(nome, email, telCelular)values('Joana','joana21@gmail.com','55555-2222');

--visualizando os registros das tabelas
select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;