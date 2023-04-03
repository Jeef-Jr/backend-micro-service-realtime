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

-- Copiando estrutura para tabela chat.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPrivate` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.groups: ~0 rows (aproximadamente)

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

-- Copiando dados para a tabela chat.messages: ~2 rows (aproximadamente)
INSERT INTO `messages` (`id`, `idSender`, `idReceiver`, `idFriend`, `message`, `visualizado`, `createdAt`, `updatedAt`) VALUES
	('033ab742-5371-450d-8dbb-9f875c430038', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'saldwokodkwa', 1, '2023-04-02 19:09:21', '2023-04-02 19:09:21'),
	('044409a5-1def-4417-a8ea-7e497484b8dd', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 18:42:41', '2023-04-02 18:42:41'),
	('04d5336a-9158-456f-94ac-f25107486c8a', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:12:47', '2023-04-02 19:12:47'),
	('08078efa-f7c9-4600-8c3d-bf34009e5625', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salvee', 1, '2023-04-02 18:55:29', '2023-04-02 18:55:29'),
	('0c127a4f-4a02-4bee-b271-bc0bfd747a30', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:52:02', '2023-04-02 19:52:02'),
	('1003123b-c4fa-4a3c-9668-73faa3e3dbf6', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:07:47', '2023-04-02 19:07:47'),
	('117ba5f9-7036-4015-97ba-7b1775208262', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', '3892139821', 1, '2023-04-02 19:13:11', '2023-04-02 19:13:11'),
	('167b1467-e509-4a8c-bd44-8fa46c4d73ae', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'oi', 1, '2023-04-02 18:42:27', '2023-04-02 18:42:27'),
	('17f5d36b-3b2e-4974-9ddf-93cf22d07e74', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-02 18:44:11', '2023-04-02 18:44:11'),
	('1d8c1330-5d36-4581-81cb-7ed3f7983ffc', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:12:57', '2023-04-02 19:12:57'),
	('2162520e-ef32-4fb7-b7db-0acd37a976e8', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'awdwa', 1, '2023-04-02 18:51:57', '2023-04-02 18:51:57'),
	('2169cb4f-a85e-4318-9f0f-0fa91e8ecb8e', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:08:35', '2023-04-02 19:08:35'),
	('21fd6870-640c-4eee-878a-2e6c7677225e', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eae', 1, '2023-04-02 19:50:41', '2023-04-02 19:50:41'),
	('2c2b4cbc-a53f-4e87-93e8-e43e590e5dc7', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-02 19:06:47', '2023-04-02 19:06:47'),
	('2d1a3b0a-400d-4780-b116-2647cef51173', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'ddd', 1, '2023-04-03 09:56:05', '2023-04-03 09:56:05'),
	('36531fe0-3024-48d5-99fb-c15385ae138d', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'de boa?', 1, '2023-04-02 19:51:47', '2023-04-02 19:51:47'),
	('373362e7-1a25-4ea3-82a0-465c4c57de8d', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'bug', 1, '2023-04-02 18:44:32', '2023-04-02 18:44:32'),
	('374a43af-59eb-490f-b533-9b1e23542527', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-02 18:42:12', '2023-04-02 18:42:12'),
	('37868719-dc15-4535-b32b-dbd20cb16b01', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dawdwa', 1, '2023-04-02 18:51:56', '2023-04-02 18:51:56'),
	('3c74b6cb-4146-4db1-80de-8503b1b73a08', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:18:10', '2023-04-02 19:18:10'),
	('3fc62130-72c3-4a2d-8c75-a92eaa3bbcf4', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eae man', 1, '2023-04-02 18:40:13', '2023-04-02 18:40:13'),
	('4149755a-1ea3-4e4c-9426-4b9e46f6f889', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve mano', 1, '2023-04-02 18:55:25', '2023-04-02 18:55:25'),
	('48113b44-9376-42e6-837e-8ea06feca0f0', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'ei', 1, '2023-04-02 18:42:20', '2023-04-02 18:42:20'),
	('4b2388b0-bb53-4330-aa21-5e81012e73db', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'man', 1, '2023-04-02 19:51:45', '2023-04-02 19:51:45'),
	('4da600ad-a0e5-464f-844b-cacea9a38ca4', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 18:44:07', '2023-04-02 18:44:07'),
	('56ce76bf-6b15-473d-a76d-d0158bb5162d', '17138602-8415-4b02-9321-fc4976a8f8e3', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'c710026f-22d3-4c94-9fa4-8dfd8340fcc3', 'lista para mim o objeto que tem o createAt mais recente', 1, '2023-04-02 18:49:39', '2023-04-02 18:49:39'),
	('580a9694-fbac-4af8-bdd4-7e5b08f5c634', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:51:42', '2023-04-02 19:51:42'),
	('5c5fc5dd-739c-46ea-9a2f-d0fa24e86eab', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'eae', 1, '2023-04-03 09:55:55', '2023-04-03 09:55:55'),
	('6103c157-d6c6-46c6-aab7-6d7d79265833', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dwad', 1, '2023-04-02 18:51:58', '2023-04-02 18:51:58'),
	('6e74fcd2-1a04-4a13-963c-f65ffc6d860c', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-03 09:56:02', '2023-04-03 09:56:02'),
	('7205cd48-3c5d-4ce8-9648-caa25c9c5c7d', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dwadaw', 1, '2023-04-02 18:51:56', '2023-04-02 18:51:56'),
	('77fada44-1ff3-46ac-ba66-21742a5fce62', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dowakdowaok', 1, '2023-04-02 19:13:08', '2023-04-02 19:13:08'),
	('78bd9054-fda8-4704-a9ac-02ee5a0f2fa6', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-03 09:56:15', '2023-04-03 09:56:15'),
	('78cc6ce8-d195-4080-ba92-3fcae037191e', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eae', 1, '2023-04-02 19:06:44', '2023-04-02 19:06:44'),
	('7f30490c-a6c1-415e-9c9b-c953c02c9a8b', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eee', 1, '2023-04-02 19:23:59', '2023-04-02 19:23:59'),
	('828414f7-8305-4c63-9df7-8d35c9ed6526', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'hehe', 1, '2023-04-02 19:17:26', '2023-04-02 19:17:26'),
	('83111ccb-302f-4f0d-aa92-969cdd11f887', '17138602-8415-4b02-9321-fc4976a8f8e3', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'c710026f-22d3-4c94-9fa4-8dfd8340fcc3', 'eee', 1, '2023-04-02 18:55:12', '2023-04-02 18:55:12'),
	('860521c4-5183-4188-900f-0263c23ffb85', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'eae', 1, '2023-04-02 18:39:07', '2023-04-02 18:39:07'),
	('95c2d991-549d-4844-9b83-e40bab2b540a', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dawd', 1, '2023-04-02 18:51:57', '2023-04-02 18:51:57'),
	('97b9c81d-e625-43e0-80b3-3c0379615594', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'djwaijdjwa', 1, '2023-04-02 19:12:59', '2023-04-02 19:12:59'),
	('98e9c419-de77-429b-8889-4710c01a407b', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eae', 1, '2023-04-02 18:44:03', '2023-04-02 18:44:03'),
	('9a4026f0-19bb-4f61-b957-d9888341b912', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eae', 1, '2023-04-02 19:07:43', '2023-04-02 19:07:43'),
	('9db81e9c-0eeb-4e9c-b9cd-d1f1ba11ce1e', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eee', 1, '2023-04-02 18:51:53', '2023-04-02 18:51:53'),
	('a51ac67a-5704-407b-9369-b213dcb43144', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-02 18:44:01', '2023-04-02 18:44:01'),
	('aba406c3-f736-4671-aa49-50982d63e562', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'Olá', 1, '2023-04-02 18:39:09', '2023-04-02 18:39:09'),
	('ad239444-3a41-42de-9abe-842bf9c91232', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'djwaidjiwa', 1, '2023-04-02 19:12:48', '2023-04-02 19:12:48'),
	('aed1ee13-a6b9-42e7-8684-c0e7837cf087', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salvbe', 1, '2023-04-02 19:18:02', '2023-04-02 19:18:02'),
	('aef88ad5-7a2a-46fc-be2a-4a728aaca931', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'hehe', 1, '2023-04-02 19:12:32', '2023-04-02 19:12:32'),
	('b004103e-0860-4b71-92aa-ea8e63fbd0d1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'salve', 1, '2023-04-02 19:12:10', '2023-04-02 19:12:10'),
	('b700aeee-5eac-4b7c-956e-f06ac2ab9065', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'nossa', 1, '2023-04-02 18:44:17', '2023-04-02 18:44:17'),
	('ce459fb7-34bd-4f92-9b11-afd7af6b0f98', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'hehe', 1, '2023-04-02 19:12:28', '2023-04-02 19:12:28'),
	('d246d8b4-3bdb-4050-999f-b923a40f1f8d', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'eee', 1, '2023-04-02 19:08:17', '2023-04-02 19:08:17'),
	('d48191c7-32c6-4df8-b7ea-38ecf9127db1', '17138602-8415-4b02-9321-fc4976a8f8e3', '09b07c04-88de-4b3f-80a3-43853195f3e5', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'salve', 1, '2023-04-02 19:50:39', '2023-04-02 19:50:39'),
	('d5b261fc-6084-4e2b-8bbd-e88c6ff6d6d8', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'jdiwajid', 1, '2023-04-02 19:12:49', '2023-04-02 19:12:49'),
	('d9c0f249-f885-4f77-9fa1-3d2738b64f3f', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'dkowakdokaw', 1, '2023-04-02 19:13:10', '2023-04-02 19:13:10'),
	('db78e587-0aad-4335-a534-c374de549803', '17138602-8415-4b02-9321-fc4976a8f8e3', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'c710026f-22d3-4c94-9fa4-8dfd8340fcc3', 'salve', 1, '2023-04-02 18:48:04', '2023-04-02 18:48:04'),
	('dbe2b50c-2a1d-43a3-94e7-81272c1fc22d', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'hehe', 1, '2023-04-02 19:06:52', '2023-04-02 19:06:52'),
	('dd6aa1b2-edef-4463-9549-10c1dbbcdff9', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'hehehe', 1, '2023-04-02 19:17:31', '2023-04-02 19:17:31'),
	('e0966430-ec3c-421c-b3a9-0d4e40bb81f6', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'que isso', 1, '2023-04-02 18:44:27', '2023-04-02 18:44:27'),
	('e17bea5b-f79a-42e4-97a5-f2ea26df0ed6', '17138602-8415-4b02-9321-fc4976a8f8e3', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'c710026f-22d3-4c94-9fa4-8dfd8340fcc3', '  const prevList = [...websocket.conversationRecents];', 1, '2023-04-02 18:49:41', '2023-04-02 18:49:41'),
	('e8875d56-24c9-43ba-aa45-87b87db268e7', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'olá', 1, '2023-04-03 09:56:11', '2023-04-03 09:56:11'),
	('e9ae0ffd-c5d4-40c6-ac41-9d0267ffbac0', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '09b07c04-88de-4b3f-80a3-43853195f3e5', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'mundo', 1, '2023-04-03 09:56:13', '2023-04-03 09:56:13'),
	('ebd89301-0ee3-48a7-a9d8-0858456a77b2', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'eee', 1, '2023-04-02 18:51:51', '2023-04-02 18:51:51'),
	('eeef0bee-3ead-4936-888e-3f65a29ee45b', '09b07c04-88de-4b3f-80a3-43853195f3e5', '7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', '4df7b42e-565a-4009-8dc8-a96ea3ba21f2', 'e', 1, '2023-04-02 18:47:58', '2023-04-02 18:47:58'),
	('f253a6a8-2bc9-4f62-bb2e-0967bce5483a', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'hehe', 1, '2023-04-02 19:13:07', '2023-04-02 19:13:07'),
	('f5bfa7af-65c5-4ca1-92aa-e8b59ee00cc0', '09b07c04-88de-4b3f-80a3-43853195f3e5', '17138602-8415-4b02-9321-fc4976a8f8e3', 'c9910026f-22d3-4c94-9fa4-8dfd8340f', 'Eae', 1, '2023-04-02 18:22:05', '2023-04-02 18:22:05');

-- Copiando estrutura para tabela chat.message_groups
CREATE TABLE IF NOT EXISTS `message_groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idUser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idGroup` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela chat.message_groups: ~0 rows (aproximadamente)

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
	('09b07c04-88de-4b3f-80a3-43853195f3e5', 'Jefferson', 'jefferson@gmail.com', '1234', 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', '6ulO6mf-u1MQHliBAAAh', '2023-03-18 22:56:41', '2023-04-03 13:15:47'),
	('17138602-8415-4b02-9321-fc4976a8f8e3', 'Igor', 'igor@gmail.com', '1234', 'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg', 'e9W9zKS8R55tNC48AAAH', '2023-03-19 16:45:32', '2023-04-02 20:08:57'),
	('7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1', 'Iris', 'iris@gmail.com', '1234', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'iX-JPA7C9wi2EY6sAAAF', '2023-03-18 22:57:52', '2023-04-03 10:57:13');

-- Copiando estrutura para tabela chat.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `idGroup` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
