-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/03/2024 às 00:12
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
-- Banco de dados: `db_depositogas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `preco_entrada` decimal(10,0) NOT NULL,
  `preco_venda` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbclientes`
--

CREATE TABLE `tbclientes` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf_cnpj` varchar(18) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbentrega`
--

CREATE TABLE `tbentrega` (
  `id` int(11) NOT NULL,
  `data_entrega` date NOT NULL,
  `id_motorista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbitens_da_entrega`
--

CREATE TABLE `tbitens_da_entrega` (
  `id` int(11) NOT NULL,
  `codigo_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `codigo_cliente` int(11) NOT NULL,
  `codigo_entrega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmotoristas`
--

CREATE TABLE `tbmotoristas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbentrega`
--
ALTER TABLE `tbentrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacaomotorista` (`id_motorista`);

--
-- Índices de tabela `tbitens_da_entrega`
--
ALTER TABLE `tbitens_da_entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacaoproduto` (`codigo_produto`),
  ADD KEY `relacaocliente` (`codigo_cliente`),
  ADD KEY `relacaoentrega` (`codigo_entrega`);

--
-- Índices de tabela `tbmotoristas`
--
ALTER TABLE `tbmotoristas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbentrega`
--
ALTER TABLE `tbentrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbitens_da_entrega`
--
ALTER TABLE `tbitens_da_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbmotoristas`
--
ALTER TABLE `tbmotoristas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbentrega`
--
ALTER TABLE `tbentrega`
  ADD CONSTRAINT `relacaomotorista` FOREIGN KEY (`id_motorista`) REFERENCES `tbmotoristas` (`id`);

--
-- Restrições para tabelas `tbitens_da_entrega`
--
ALTER TABLE `tbitens_da_entrega`
  ADD CONSTRAINT `relacaocliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `relacaoentrega` FOREIGN KEY (`codigo_entrega`) REFERENCES `tbentrega` (`id`),
  ADD CONSTRAINT `relacaoproduto` FOREIGN KEY (`codigo_produto`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
