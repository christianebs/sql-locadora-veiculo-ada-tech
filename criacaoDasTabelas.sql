CREATE DATABASE CARLOCA;

USE CARLOCA;

CREATE TABLE Categoria (
    CategoriaId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Carro (
    CarroId INT AUTO_INCREMENT PRIMARY KEY,
    Modelo VARCHAR(255) NOT NULL,
    Montadora VARCHAR(255) NOT NULL,
    Cor ENUM('Branco', 'Preto', 'Prata') NOT NULL,
    Versao VARCHAR(255) NOT NULL,
    StatusLocacaoCarro ENUM('Disponivel', 'Alugado') DEFAULT 'Disponivel',
    QuilometragemAtual INT NOT NULL,
    CategoriaId INT,
    FOREIGN KEY (CategoriaId) REFERENCES Categoria(categoriaId)
);

CREATE TABLE Cliente (
    ClienteId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Cpf VARCHAR(14) NOT NULL UNIQUE,
    Cnh VARCHAR(20) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    StatusLocacaoCliente ENUM('Com Carro Alugado', 'Sem Carro Alugado') DEFAULT 'Sem Carro Alugado'
);

CREATE TABLE Franquia (
    FranquiaId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(50) NOT NULL
);

CREATE TABLE Locacao (
    LocacaoId INT AUTO_INCREMENT PRIMARY KEY,
    CarroId INT,
    ClienteId INT,
    FranquiaLocacaoId INT,
    FranquiaDevolucaoId INT DEFAULT NULL,
    DataLocacao DATE NOT NULL,
    DataDevolucao DATE DEFAULT NULL,
    QuilometragemInicial INT NOT NULL,
    QuilometragemFinal INT DEFAULT NULL,
    FOREIGN KEY (CarroId) REFERENCES Carro(CarroId),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId),
    FOREIGN KEY (FranquiaLocacaoId) REFERENCES Franquia(FranquiaId),
    FOREIGN KEY (FranquiaDevolucaoId) REFERENCES Franquia(FranquiaId)
);