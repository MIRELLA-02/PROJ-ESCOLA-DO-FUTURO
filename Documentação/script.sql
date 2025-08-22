CREATE DATABASE educatech;

USE educatech;

CREATE TABLE Usuario (
    RM INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Turma VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    Endereco VARCHAR(150),
    ImagemAluno LONGBLOB
);

CREATE TABLE PresencasFaltas (
    id_presenca INT PRIMARY KEY AUTO_INCREMENT,
    RM INT NOT NULL,
    DataHora DATETIME NOT NULL,
    Presente BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (RM) REFERENCES Usuario(RM)
);

CREATE TABLE Temperaturas (
    id_temp INT PRIMARY KEY AUTO_INCREMENT,
    RM INT NOT NULL,
    Data DATE NOT NULL,
    Turma VARCHAR(50),
    Nome VARCHAR(100),
    Status VARCHAR(20), 
    Temperatura DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (RM) REFERENCES Usuario(RM)
);

USE educatech;

ALTER TABLE Usuario --essa função irá adicionar um complemento para a tabela usuarios -- 
ADD CPF CHAR(11) UNIQUE NOT NULL AFTER RM;

