-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
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
  `id` char(36) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `idSender` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `idReceiver` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela chat.friends: ~1 rows (aproximadamente)
INSERT INTO `friends` (`id`, `idSender`, `idReceiver`, `active`, `createdAt`, `updatedAt`) VALUES
	('8cbc0aee-926b-4ef9-8e20-77f40a40d56b', 'ce2bc9f8-e54d-4058-a821-b8c5270df692', 'e71a8a5e-5b79-426a-96cc-a70f0f16349e', 1, '2023-05-04 20:56:07', '2023-05-04 20:56:07');

-- Copiando estrutura para tabela chat.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPrivate` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chat.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idSender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idReceiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idFriend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visualizado` tinyint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chat.message_groups
CREATE TABLE IF NOT EXISTS `message_groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idUser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.message_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chat.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` enum('SOLO','GROUP','SERVER') COLLATE utf8mb4_unicode_ci NOT NULL,
  `idSender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idReceiver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isVisualizado` tinyint(1) NOT NULL DEFAULT '0',
  `isAcepty` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.notifications: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela chat.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `idRelacionado` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `nome` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `tag` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `socketId` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela chat.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `idRelacionado`, `nome`, `img`, `tag`, `socketId`, `createdAt`, `updatedAt`) VALUES
	('2f9066a5-fe31-4934-b9ff-c1b5b0f49b82', '11', 'Yuri Martins', 'userDefult.png', 'aNUVY', NULL, '2023-05-04 19:46:03', '2023-05-04 19:46:03'),
	('aefce739-60c1-48ed-81fb-3d7c4b40daf2', '9', 'Jefferson Junior', 'userDefult.png', '8P2J9', 'dYPK9b_M-cBOyj57AAAF', '2023-05-04 19:35:34', '2023-05-04 20:23:59'),
	('ce2bc9f8-e54d-4058-a821-b8c5270df692', '7', 'Jefferson S', 'userDefult.png', 'NqUWF', 'Xgl7p6mbpFj108v1AAAB', '2023-05-05 15:15:25', '2023-05-05 15:31:14'),
	('e71a8a5e-5b79-426a-96cc-a70f0f16349e', '10', 'Yucatan ', 'userDefult.png', 'D1kYW', NULL, '2023-05-04 19:44:06', '2023-05-04 19:44:06');

-- Copiando estrutura para tabela chat.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.user_groups: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
