CREATE DATABASE  IF NOT EXISTS `mercado_facil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mercado_facil`;
-- MySQL dump 10.13  Distrib 8.0.38, for Linux (x86_64)
--
-- Host: localhost    Database: mercado_facil
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cargo_Funcionarios`
--

DROP TABLE IF EXISTS `Cargo_Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cargo_Funcionarios` (
  `Id_Cargo` smallint NOT NULL AUTO_INCREMENT,
  `Cargo` enum('Gerente','Vendedor','Caixa','Estoquista','Assistente','Supervisor','Assistente Administrativo','Administrador') NOT NULL,
  PRIMARY KEY (`Id_Cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo_Funcionarios`
--

LOCK TABLES `Cargo_Funcionarios` WRITE;
/*!40000 ALTER TABLE `Cargo_Funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cargo_Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria_Produto`
--

DROP TABLE IF EXISTS `Categoria_Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria_Produto` (
  `Id_Categoria` smallint NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(75) NOT NULL,
  `Sub_Categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria_Produto`
--

LOCK TABLES `Categoria_Produto` WRITE;
/*!40000 ALTER TABLE `Categoria_Produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria_Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compra`
--

DROP TABLE IF EXISTS `Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compra` (
  `Id_Compra` int NOT NULL AUTO_INCREMENT,
  `Valor_Unitario` decimal(10,2) unsigned NOT NULL,
  `Unidade_Medida` varchar(50) NOT NULL,
  `Valor_Total` decimal(10,2) unsigned NOT NULL,
  `Qtde_Total` int NOT NULL,
  `Id_Fornecedor` int NOT NULL,
  `Previsao_Entrega` date NOT NULL,
  `Status_Entrega` enum('Pendente','Em Transito','Concluída','Cancelada') NOT NULL DEFAULT 'Pendente',
  PRIMARY KEY (`Id_Compra`),
  KEY `fk_fornecedor_compra` (`Id_Fornecedor`),
  CONSTRAINT `fk_fornecedor_compra` FOREIGN KEY (`Id_Fornecedor`) REFERENCES `Fornecedores` (`Id_Fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra`
--

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Controle_Acesso_Usuario`
--

DROP TABLE IF EXISTS `Controle_Acesso_Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Controle_Acesso_Usuario` (
  `Id_Log` bigint NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int NOT NULL,
  `Horario_Login` datetime NOT NULL,
  `Horario_Logoff` datetime NOT NULL,
  PRIMARY KEY (`Id_Log`),
  KEY `fk_usuario_acesso` (`Id_Usuario`),
  CONSTRAINT `fk_usuario_acesso` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario_Interno` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Controle_Acesso_Usuario`
--

LOCK TABLES `Controle_Acesso_Usuario` WRITE;
/*!40000 ALTER TABLE `Controle_Acesso_Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Controle_Acesso_Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `Id_Empresa` int NOT NULL DEFAULT '1',
  `Razao_Social` varchar(200) NOT NULL,
  `CNPJ` varchar(50) NOT NULL,
  `Rua` varchar(200) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL DEFAULT 'Brasil',
  `Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Empresa`),
  UNIQUE KEY `Id_Empresa` (`Id_Empresa`),
  UNIQUE KEY `Razao_Social` (`Razao_Social`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estoque`
--

DROP TABLE IF EXISTS `Estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estoque` (
  `Id_Estoque` int NOT NULL AUTO_INCREMENT,
  `Id_Produto` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Data_Validade` date DEFAULT NULL,
  `Data_Solicitacao` date NOT NULL,
  `Data_Entrada` date DEFAULT NULL,
  `Custo` decimal(10,2) unsigned NOT NULL,
  `Id_Fornecedor` int NOT NULL,
  `Status_estoque` enum('Disponível','Esgotado','Em Reposição') NOT NULL DEFAULT 'Em Reposição',
  PRIMARY KEY (`Id_Estoque`),
  KEY `fk_produto_estoque` (`Id_Produto`),
  KEY `fk_fornecedor_estoque` (`Id_Fornecedor`),
  CONSTRAINT `fk_fornecedor_estoque` FOREIGN KEY (`Id_Fornecedor`) REFERENCES `Fornecedores` (`Id_Fornecedor`),
  CONSTRAINT `fk_produto_estoque` FOREIGN KEY (`Id_Produto`) REFERENCES `Produto` (`Id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estoque`
--

LOCK TABLES `Estoque` WRITE;
/*!40000 ALTER TABLE `Estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedores`
--

DROP TABLE IF EXISTS `Fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fornecedores` (
  `Id_Fornecedor` int NOT NULL AUTO_INCREMENT,
  `Nome_Fornecedor` varchar(150) NOT NULL,
  `Tipo_Comercio` smallint NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Rua` varchar(200) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Estado` varchar(40) NOT NULL,
  `Pais` varchar(50) NOT NULL DEFAULT 'Brasil',
  `Responsavel` varchar(50) NOT NULL,
  `Documento` varchar(50) NOT NULL,
  `Status_Fornecedor` enum('Ativo','Inativo','Suspenso','Em Avaliação') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`Id_Fornecedor`),
  KEY `fk_tipo_comercio` (`Tipo_Comercio`),
  CONSTRAINT `fk_tipo_comercio` FOREIGN KEY (`Tipo_Comercio`) REFERENCES `Tipo_Comercio` (`Id_Comercio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedores`
--

LOCK TABLES `Fornecedores` WRITE;
/*!40000 ALTER TABLE `Fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `Id_Funcionario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Sobrenome` varchar(150) NOT NULL,
  `CPF` varchar(20) NOT NULL,
  `Cargo` smallint NOT NULL,
  `Setor` smallint DEFAULT NULL,
  `Situacao` enum('Ativo','Inativo','Desligado','Afastado','Suspenso') NOT NULL DEFAULT 'Ativo',
  `Email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id_Funcionario`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `fk_setor` (`Setor`),
  KEY `fk_cargo` (`Cargo`),
  CONSTRAINT `fk_cargo` FOREIGN KEY (`Cargo`) REFERENCES `Cargo_Funcionarios` (`Id_Cargo`),
  CONSTRAINT `fk_setor` FOREIGN KEY (`Setor`) REFERENCES `Setor_Funcionario` (`Id_Setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grupo_Usuario`
--

DROP TABLE IF EXISTS `Grupo_Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grupo_Usuario` (
  `Id_Grupo` smallint NOT NULL AUTO_INCREMENT,
  `Grupo` enum('Administrador','Gerente','Supervisor','Funcionário','Estagiário') NOT NULL,
  PRIMARY KEY (`Id_Grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupo_Usuario`
--

LOCK TABLES `Grupo_Usuario` WRITE;
/*!40000 ALTER TABLE `Grupo_Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Grupo_Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produto` (
  `Id_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(150) NOT NULL,
  `Codigo_Barra` varchar(50) NOT NULL,
  `Valor_Produto` decimal(10,2) unsigned NOT NULL,
  `Categoria` smallint NOT NULL,
  `Descricao_Produto` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Produto`),
  KEY `fk_categoria` (`Categoria`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`Categoria`) REFERENCES `Categoria_Produto` (`Id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Setor_Funcionario`
--

DROP TABLE IF EXISTS `Setor_Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Setor_Funcionario` (
  `Id_Setor` smallint NOT NULL AUTO_INCREMENT,
  `Setor` enum('Vendas','Financeiro','Estoques','Administração','Marketing','Recursos Humanos','Logística') NOT NULL,
  PRIMARY KEY (`Id_Setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Setor_Funcionario`
--

LOCK TABLES `Setor_Funcionario` WRITE;
/*!40000 ALTER TABLE `Setor_Funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Setor_Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Comercio`
--

DROP TABLE IF EXISTS `Tipo_Comercio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Comercio` (
  `Id_Comercio` smallint NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Comercio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Comercio`
--

LOCK TABLES `Tipo_Comercio` WRITE;
/*!40000 ALTER TABLE `Tipo_Comercio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Comercio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Interno`
--

DROP TABLE IF EXISTS `Usuario_Interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario_Interno` (
  `Id_Usuario` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Sobrenome` varchar(150) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Senha` varchar(30) NOT NULL,
  `Situacao_Conta` enum('Ativo','Inativo','Suspenso') NOT NULL,
  `Id_Grupo` smallint NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `fk_grupo_usuario` (`Id_Grupo`),
  CONSTRAINT `fk_funcionario_usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `Funcionarios` (`Id_Funcionario`),
  CONSTRAINT `fk_grupo_usuario` FOREIGN KEY (`Id_Grupo`) REFERENCES `Grupo_Usuario` (`Id_Grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Interno`
--

LOCK TABLES `Usuario_Interno` WRITE;
/*!40000 ALTER TABLE `Usuario_Interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Interno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19 23:27:25
