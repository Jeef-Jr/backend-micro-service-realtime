-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para chat
CREATE DATABASE IF NOT EXISTS `chat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chat`;

-- Copiando estrutura para tabela chat.friends
CREATE TABLE IF NOT EXISTS `friends` (
  `id` char(36) COLLATE armscii8_bin NOT NULL,
  `idSender` varchar(255) COLLATE armscii8_bin NOT NULL,
  `idReceiver` varchar(255) COLLATE armscii8_bin NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela chat.friends: ~3 rows (aproximadamente)
INSERT INTO `friends` (`id`, `idSender`, `idReceiver`, `active`, `createdAt`, `updatedAt`) VALUES
	('2ec4c9d0-3092-40b3-8e41-f43c8f728c2e', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'c25904e2-4c66-4e9d-a861-6e164b7b9d20', 1, '2023-03-19 00:59:13', '2023-03-19 00:59:13'),
	('4df7b42e-565a-4009-8dc8-a96ea3ba21f2', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 1, '2023-03-19 00:55:36', '2023-03-19 00:55:36'),
	('c710026f-22d3-4c94-9fa4-8dfd8340fcc3', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '17138602-8415-4b02-9321-fc4976a8f8e3', 1, '2023-03-19 16:44:32', '2023-03-19 16:44:32'),
	('c9910026f-22d3-4c94-9fa4-8dfd8340f', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 1, '2023-03-19 16:44:32', '2023-03-19 16:44:32');

-- Copiando estrutura para tabela chat.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idSender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idReceiver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFriend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visualizado` tinyint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chat.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) COLLATE armscii8_bin NOT NULL,
  `nome` varchar(255) COLLATE armscii8_bin NOT NULL,
  `email` varchar(255) COLLATE armscii8_bin NOT NULL,
  `senha` varchar(255) COLLATE armscii8_bin NOT NULL,
  `img` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `socketId` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela chat.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`id`, `nome`, `email`, `senha`, `img`, `socketId`, `createdAt`, `updatedAt`) VALUES
	('09b07c04-88de-4b3f-80a3-43853195f3e5', 'Jefferson', 'jefferson@gmail.com', '1234', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'qvbY7GqNqAC33VH0AAAZ', '2023-03-18 22:56:41', '2023-03-28 23:02:54'),
	('17138602-8415-4b02-9321-fc4976a8f8e3', 'Igor', 'igor@gmail.com', '1234', 'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg', 'tCNP9GHfOOu2aIIPAABZ', '2023-03-19 16:45:32', '2023-03-25 20:45:43'),
	('7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'Iris', 'iris@gmail.com', '1234', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'RLG0yu8fLuEEVnPOAAAb', '2023-03-18 22:57:52', '2023-03-28 23:02:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
