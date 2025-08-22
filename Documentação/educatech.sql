-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/08/2025 às 20:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `educatech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `presenca_faltas`
--

CREATE TABLE `presenca_faltas` (
  `id_presenca` int(11) NOT NULL,
  `RM` int(11) NOT NULL,
  `Data_Hora` datetime NOT NULL,
  `Presença` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `temperaturas`
--

CREATE TABLE `temperaturas` (
  `id_temperatura` int(11) NOT NULL,
  `RM` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Turma` varchar(50) DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Temperatura` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `RM` int(11) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Turma` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Endereco` varchar(150) DEFAULT NULL,
  `Imagem_Aluno` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `presenca_faltas`
--
ALTER TABLE `presenca_faltas`
  ADD PRIMARY KEY (`id_presenca`),
  ADD KEY `RM` (`RM`);

--
-- Índices de tabela `temperaturas`
--
ALTER TABLE `temperaturas`
  ADD PRIMARY KEY (`id_temperatura`),
  ADD KEY `RM` (`RM`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`RM`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `presenca_faltas`
--
ALTER TABLE `presenca_faltas`
  MODIFY `id_presenca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `temperaturas`
--
ALTER TABLE `temperaturas`
  MODIFY `id_temperatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `RM` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `presenca_faltas`
--
ALTER TABLE `presenca_faltas`
  ADD CONSTRAINT `presenca_faltas_ibfk_1` FOREIGN KEY (`RM`) REFERENCES `usuario` (`RM`);

--
-- Restrições para tabelas `temperaturas`
--
ALTER TABLE `temperaturas`
  ADD CONSTRAINT `temperaturas_ibfk_1` FOREIGN KEY (`RM`) REFERENCES `usuario` (`RM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
