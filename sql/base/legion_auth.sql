-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.21-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla legion_auth.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(512) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(10) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int(10) unsigned DEFAULT NULL,
  `battlenet_index` tinyint(3) unsigned DEFAULT NULL,
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `AtAuthFlag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `hwid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `limit` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `bnet_acc` (`battlenet_account`,`battlenet_index`) USING BTREE,
  KEY `recruiter` (`recruiter`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `battlenet_account` (`battlenet_account`) USING BTREE,
  KEY `battlenet_index` (`battlenet_index`) USING BTREE,
  KEY `username_idx` (`username`) USING BTREE,
  KEY `hwid` (`hwid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Account System';

-- Volcando datos para la tabla legion_auth.account: ~0 rows (aproximadamente)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_access
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `comments` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`RealmID`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `RealmID` (`RealmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_access: ~0 rows (aproximadamente)
DELETE FROM `account_access`;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_banned
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Ban List';

-- Volcando datos para la tabla legion_auth.account_banned: ~0 rows (aproximadamente)
DELETE FROM `account_banned`;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_character_template
CREATE TABLE IF NOT EXISTS `account_character_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL DEFAULT '0',
  `bnet_account` int(10) NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `iLevel` mediumint(6) NOT NULL DEFAULT '810',
  `money` int(10) unsigned NOT NULL DEFAULT '100',
  `artifact` tinyint(1) NOT NULL DEFAULT '0',
  `transferId` int(10) NOT NULL DEFAULT '0',
  `charGuid` int(10) NOT NULL DEFAULT '0',
  `realm` int(10) NOT NULL DEFAULT '0',
  `templateId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnet_account`) USING BTREE,
  KEY `transferId` (`transferId`) USING BTREE,
  KEY `charGuid` (`charGuid`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_character_template: ~0 rows (aproximadamente)
DELETE FROM `account_character_template`;
/*!40000 ALTER TABLE `account_character_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_character_template` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_flagged
CREATE TABLE IF NOT EXISTS `account_flagged` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Id',
  `banduration` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_flagged: ~0 rows (aproximadamente)
DELETE FROM `account_flagged`;
/*!40000 ALTER TABLE `account_flagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_flagged` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_ip_access
CREATE TABLE IF NOT EXISTS `account_ip_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL,
  `ip` varchar(18) DEFAULT NULL,
  `min` varchar(15) NOT NULL DEFAULT '',
  `max` varchar(15) NOT NULL DEFAULT '',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pid_ip` (`pid`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_ip_access: ~0 rows (aproximadamente)
DELETE FROM `account_ip_access`;
/*!40000 ALTER TABLE `account_ip_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_ip_access` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_last_played_character
CREATE TABLE IF NOT EXISTS `account_last_played_character` (
  `accountId` int(10) unsigned NOT NULL,
  `region` tinyint(3) unsigned NOT NULL,
  `battlegroup` tinyint(3) unsigned NOT NULL,
  `realmId` int(10) unsigned DEFAULT NULL,
  `characterName` varchar(12) DEFAULT NULL,
  `characterGUID` bigint(20) unsigned DEFAULT NULL,
  `lastPlayedTime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`) USING BTREE,
  KEY `accountId` (`accountId`) USING BTREE,
  KEY `region` (`region`) USING BTREE,
  KEY `battlegroup` (`battlegroup`) USING BTREE,
  KEY `realmId` (`realmId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_last_played_character: ~1 rows (aproximadamente)
DELETE FROM `account_last_played_character`;
/*!40000 ALTER TABLE `account_last_played_character` DISABLE KEYS */;
INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES
	(1, 2, 1, 1, 'Test', 1, 1606541006);
/*!40000 ALTER TABLE `account_last_played_character` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_log_ip
CREATE TABLE IF NOT EXISTS `account_log_ip` (
  `accountid` int(11) unsigned NOT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`,`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla legion_auth.account_log_ip: 0 rows
DELETE FROM `account_log_ip`;
/*!40000 ALTER TABLE `account_log_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_log_ip` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_mute
CREATE TABLE IF NOT EXISTS `account_mute` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT '0',
  `mutetime` int(10) unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='mute List';

-- Volcando datos para la tabla legion_auth.account_mute: ~0 rows (aproximadamente)
DELETE FROM `account_mute`;
/*!40000 ALTER TABLE `account_mute` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_mute` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_muted
CREATE TABLE IF NOT EXISTS `account_muted` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Ban List';

-- Volcando datos para la tabla legion_auth.account_muted: ~0 rows (aproximadamente)
DELETE FROM `account_muted`;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_rates
CREATE TABLE IF NOT EXISTS `account_rates` (
  `account` int(11) NOT NULL DEFAULT '0',
  `bnet_account` int(11) unsigned NOT NULL DEFAULT '0',
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `rate` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unique` (`account`,`bnet_account`,`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_rates: ~0 rows (aproximadamente)
DELETE FROM `account_rates`;
/*!40000 ALTER TABLE `account_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_rates` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_reputation
CREATE TABLE IF NOT EXISTS `account_reputation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `reputation` varchar(5) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `date` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.account_reputation: ~0 rows (aproximadamente)
DELETE FROM `account_reputation`;
/*!40000 ALTER TABLE `account_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_reputation` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_spec
CREATE TABLE IF NOT EXISTS `account_spec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `oldid` int(11) unsigned NOT NULL COMMENT 'Identifier',
  `username` varchar(32) NOT NULL,
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `gmlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `email_new` varchar(50) DEFAULT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_module` char(32) DEFAULT '',
  `module_day` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `active_realm_id` int(11) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `mutetime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` int(10) unsigned NOT NULL DEFAULT '0',
  `recruiter` int(11) NOT NULL DEFAULT '0',
  `premium` int(255) NOT NULL DEFAULT '0',
  `premium_time` int(255) NOT NULL DEFAULT '0',
  `access_mask` tinyint(1) NOT NULL DEFAULT '0',
  `realmgm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sha_new_pass` varchar(40) NOT NULL DEFAULT '',
  `newpassword` varchar(50) DEFAULT NULL,
  `protectedkey` varchar(40) DEFAULT NULL,
  `found` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1152679 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla legion_auth.account_spec: 0 rows
DELETE FROM `account_spec`;
/*!40000 ALTER TABLE `account_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_spec` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.account_spell
CREATE TABLE IF NOT EXISTS `account_spell` (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`) USING BTREE,
  KEY `account` (`accountId`) USING BTREE,
  KEY `account_spell` (`accountId`,`spell`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla legion_auth.account_spell: ~0 rows (aproximadamente)
DELETE FROM `account_spell`;
/*!40000 ALTER TABLE `account_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_spell` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.autobroadcast
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.autobroadcast: ~0 rows (aproximadamente)
DELETE FROM `autobroadcast`;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.battlenet_accounts
CREATE TABLE IF NOT EXISTS `battlenet_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(255) NOT NULL,
  `email_blocked` int(11) unsigned NOT NULL DEFAULT '0',
  `sha_pass_hash` varchar(512) NOT NULL DEFAULT '',
  `balans` int(10) unsigned NOT NULL DEFAULT '30',
  `karma` int(10) unsigned NOT NULL DEFAULT '0',
  `activate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `verify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `donate` int(10) unsigned NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `phone_hash` varchar(32) NOT NULL DEFAULT '',
  `telegram_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `telegram_id` int(11) unsigned NOT NULL DEFAULT '0',
  `v` varchar(512) NOT NULL DEFAULT '',
  `s` varchar(512) NOT NULL DEFAULT '',
  `sessionKey` varchar(512) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `access_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_email` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(10) NOT NULL DEFAULT '',
  `recruiter` int(11) NOT NULL DEFAULT '0',
  `invite` varchar(32) NOT NULL DEFAULT '',
  `lang` enum('tw','cn','en','ua','ru') NOT NULL DEFAULT 'ru',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `unsubscribe` varchar(32) NOT NULL DEFAULT '0',
  `dt_vote` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `recruiter` (`recruiter`) USING BTREE,
  KEY `email_idx` (`email`) USING BTREE,
  KEY `sha_pass_hash` (`sha_pass_hash`(255)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Account System';

-- Volcando datos para la tabla legion_auth.battlenet_accounts: ~0 rows (aproximadamente)
DELETE FROM `battlenet_accounts`;
/*!40000 ALTER TABLE `battlenet_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_accounts` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.battlenet_account_bans
CREATE TABLE IF NOT EXISTS `battlenet_account_bans` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE,
  KEY `active` (`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Ban List';

-- Volcando datos para la tabla legion_auth.battlenet_account_bans: ~0 rows (aproximadamente)
DELETE FROM `battlenet_account_bans`;
/*!40000 ALTER TABLE `battlenet_account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_bans` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.battlenet_account_toys
CREATE TABLE IF NOT EXISTS `battlenet_account_toys` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Volcando datos para la tabla legion_auth.battlenet_account_toys: 0 rows
DELETE FROM `battlenet_account_toys`;
/*!40000 ALTER TABLE `battlenet_account_toys` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_account_toys` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.battlenet_components
CREATE TABLE IF NOT EXISTS `battlenet_components` (
  `Program` varchar(4) NOT NULL,
  `Platform` varchar(4) NOT NULL,
  `Build` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Program`,`Platform`,`Build`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.battlenet_components: ~0 rows (aproximadamente)
DELETE FROM `battlenet_components`;
/*!40000 ALTER TABLE `battlenet_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_components` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.battlenet_modules
CREATE TABLE IF NOT EXISTS `battlenet_modules` (
  `Hash` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `Type` varchar(8) NOT NULL,
  `System` varchar(8) NOT NULL,
  `Data` text,
  PRIMARY KEY (`Name`,`System`) USING BTREE,
  UNIQUE KEY `uk_name_type_system` (`Name`,`Type`,`System`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.battlenet_modules: ~0 rows (aproximadamente)
DELETE FROM `battlenet_modules`;
/*!40000 ALTER TABLE `battlenet_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlenet_modules` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.build_info
CREATE TABLE IF NOT EXISTS `build_info` (
  `build` int(11) NOT NULL,
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `bugfixVersion` int(11) DEFAULT NULL,
  `hotfixVersion` char(3) DEFAULT NULL,
  `winAuthSeed` varchar(32) DEFAULT NULL,
  `win64AuthSeed` varchar(32) DEFAULT NULL,
  `mac64AuthSeed` varchar(32) DEFAULT NULL,
  `winChecksumSeed` varchar(40) DEFAULT NULL,
  `macChecksumSeed` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla legion_auth.build_info: ~86 rows (aproximadamente)
DELETE FROM `build_info`;
/*!40000 ALTER TABLE `build_info` DISABLE KEYS */;
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`, `winAuthSeed`, `win64AuthSeed`, `mac64AuthSeed`, `winChecksumSeed`, `macChecksumSeed`) VALUES
	(5875, 1, 12, 1, NULL, NULL, NULL, NULL, '95EDB27C7823B363CBDDAB56A392E7CB73FCCA20', '8D173CC381961EEBABF336F5E6675B101BB513E5'),
	(6005, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(6141, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(8606, 2, 4, 3, NULL, NULL, NULL, NULL, '319AFAA3F2559682F9FF658BE01456255F456FB1', 'D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
	(9947, 3, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(10505, 3, 2, 2, 'a', NULL, NULL, NULL, NULL, NULL),
	(11159, 3, 3, 0, 'a', NULL, NULL, NULL, NULL, NULL),
	(11403, 3, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(11723, 3, 3, 3, 'a', NULL, NULL, NULL, NULL, NULL),
	(12340, 3, 3, 5, 'a', NULL, NULL, NULL, 'CDCBBD5188315E6B4D19449D492DBCFAF156A347', 'B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
	(13623, 4, 0, 6, 'a', NULL, NULL, NULL, NULL, NULL),
	(13930, 3, 3, 5, 'a', NULL, NULL, NULL, NULL, NULL),
	(14545, 4, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(15595, 4, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL),
	(19116, 6, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(19243, 6, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(19342, 6, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(19702, 6, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(19802, 6, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(19831, 6, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(19865, 6, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(20182, 6, 2, 0, 'a', NULL, NULL, NULL, NULL, NULL),
	(20201, 6, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(20216, 6, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(20253, 6, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(20338, 6, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(20444, 6, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(20490, 6, 2, 2, 'a', NULL, NULL, NULL, NULL, NULL),
	(20574, 6, 2, 2, 'a', NULL, NULL, NULL, NULL, NULL),
	(20726, 6, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(20779, 6, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(20886, 6, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(21355, 6, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL),
	(21463, 6, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL),
	(21742, 6, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL),
	(22248, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22293, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22345, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22410, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22423, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22498, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22522, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22566, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22594, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22624, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22747, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22810, 7, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL),
	(22900, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(22908, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(22950, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(22995, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(22996, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(23171, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(23222, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(23360, 7, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(23420, 7, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(23911, 7, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(23937, 7, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(24015, 7, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(24330, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(24367, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(24415, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(24430, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(24461, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(24742, 7, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL),
	(25549, 7, 3, 2, NULL, 'FE594FC35E7F9AFF86D99D8A364AB297', '1252624ED8CBD6FAC7D33F5D67A535F3', '66FC5E09B8706126795F140308C8C1D8', NULL, NULL),
	(25996, 7, 3, 5, NULL, '23C59C5963CBEF5B728D13A50878DFCB', 'C7FF932D6A2174A3D538CA7212136D2B', '210B970149D6F56CAC9BADF2AAC91E8E', NULL, NULL),
	(26124, 7, 3, 5, NULL, 'F8C05AE372DECA1D6C81DA7A8D1C5C39', '46DF06D0147BA67BA49AF553435E093F', 'C9CA997AB8EDE1C65465CB2920869C4E', NULL, NULL),
	(26365, 7, 3, 5, NULL, '2AAC82C80E829E2CA902D70CFA1A833A', '59A53F307288454B419B13E694DF503C', 'DBE7F860276D6B400AAA86B35D51A417', NULL, NULL),
	(26654, 7, 3, 5, NULL, 'FAC2D693E702B9EC9F750F17245696D8', 'A752640E8B99FE5B57C1320BC492895A', '9234C1BD5E9687ADBD19F764F2E0E811', NULL, NULL),
	(26822, 7, 3, 5, NULL, '283E8D77ECF7060BE6347BE4EB99C7C7', '2B05F6D746C0C6CC7EF79450B309E595', '91003668C245D14ECD8DF094E065E06B', NULL, NULL),
	(26899, 7, 3, 5, NULL, 'F462CD2FE4EA3EADF875308FDBB18C99', '3551EF0028B51E92170559BD25644B03', '8368EFC2021329110A16339D298200D4', NULL, NULL),
	(26972, 7, 3, 5, NULL, '797ECC19662DCBD5090A4481173F1D26', '6E212DEF6A0124A3D9AD07F5E322F7AE', '341CFEFE3D72ACA9A4407DC535DED66A', NULL, NULL),
	(28153, 8, 0, 1, NULL, NULL, 'DD626517CC6D31932B479934CCDC0ABF', NULL, NULL, NULL),
	(30706, 8, 1, 5, NULL, NULL, 'BB6D9866FE4A19A568015198783003FC', NULL, NULL, NULL),
	(30993, 8, 2, 0, NULL, NULL, '2BAD61655ABC2FC3D04893B536403A91', NULL, NULL, NULL),
	(31229, 8, 2, 0, NULL, NULL, '8A46F23670309F2AAE85C9A47276382B', NULL, NULL, NULL),
	(31429, 8, 2, 0, NULL, NULL, '7795A507AF9DC3525EFF724FEE17E70C', NULL, NULL, NULL),
	(31478, 8, 2, 0, NULL, NULL, '7973A8D54BDB8B798D9297B096E771EF', NULL, NULL, NULL),
	(32305, 8, 2, 5, NULL, NULL, '21F5A6FC7AD89FBF411FDA8B8738186A', NULL, NULL, NULL),
	(32494, 8, 2, 5, NULL, NULL, '58984ACE04919401835C61309A848F8A', NULL, NULL, NULL),
	(32580, 8, 2, 5, NULL, NULL, '87C2FAA0D7931BF016299025C0DDCA14', NULL, NULL, NULL),
	(32638, 8, 2, 5, NULL, NULL, '5D07ECE7D4A867DDDE615DAD22B76D4E', NULL, NULL, NULL),
	(32722, 8, 2, 5, NULL, NULL, '1A09BE1D38A122586B4931BECCEAD4AA', NULL, NULL, NULL),
	(32750, 8, 2, 5, NULL, NULL, 'C5CB669F5A5B237D1355430877173207', 'EF1F4E4D099EA2A81FD4C0DEBC1E7086', NULL, NULL),
	(32978, 8, 2, 5, NULL, NULL, '76AE2EA03E525D97F5688843F5489000', '1852C1F847E795D6EB45278CD433F339', NULL, NULL);
/*!40000 ALTER TABLE `build_info` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.character_history
CREATE TABLE IF NOT EXISTS `character_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL,
  `action` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `characterName` text NOT NULL,
  `characterGuid` int(20) NOT NULL,
  `characterLevel` tinyint(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastPlayedTime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla legion_auth.character_history: 0 rows
DELETE FROM `character_history`;
/*!40000 ALTER TABLE `character_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_history` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.hwid_penalties
CREATE TABLE IF NOT EXISTS `hwid_penalties` (
  `hwid` bigint(20) unsigned NOT NULL,
  `penalties` int(10) NOT NULL DEFAULT '0',
  `last_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`hwid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.hwid_penalties: ~0 rows (aproximadamente)
DELETE FROM `hwid_penalties`;
/*!40000 ALTER TABLE `hwid_penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `hwid_penalties` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.ip2nation
CREATE TABLE IF NOT EXISTS `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Volcando datos para la tabla legion_auth.ip2nation: 0 rows
DELETE FROM `ip2nation`;
/*!40000 ALTER TABLE `ip2nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nation` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.ip2nationcountries
CREATE TABLE IF NOT EXISTS `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla legion_auth.ip2nationcountries: 0 rows
DELETE FROM `ip2nationcountries`;
/*!40000 ALTER TABLE `ip2nationcountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nationcountries` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.ip_banned
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `bandate` (`bandate`) USING BTREE,
  KEY `unbandate` (`unbandate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Banned IPs';

-- Volcando datos para la tabla legion_auth.ip_banned: ~0 rows (aproximadamente)
DELETE FROM `ip_banned`;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.ip_ddos
CREATE TABLE IF NOT EXISTS `ip_ddos` (
  `ip` varchar(32) NOT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.ip_ddos: ~0 rows (aproximadamente)
DELETE FROM `ip_ddos`;
/*!40000 ALTER TABLE `ip_ddos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_ddos` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.license
CREATE TABLE IF NOT EXISTS `license` (
  `id` int(11) NOT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla legion_auth.license: ~1 rows (aproximadamente)
DELETE FROM `license`;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` (`id`, `license_key`) VALUES
	(1, 'C435351425731323032323846355B4934425F4E414B4D205F445B4355444');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int(14) NOT NULL,
  `realm` int(4) NOT NULL,
  `type` int(4) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `string` text,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla legion_auth.logs: ~0 rows (aproximadamente)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.online
CREATE TABLE IF NOT EXISTS `online` (
  `realmID` int(11) unsigned NOT NULL DEFAULT '0',
  `online` int(11) unsigned NOT NULL DEFAULT '0',
  `diff` int(11) unsigned NOT NULL DEFAULT '0',
  `uptime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.online: ~0 rows (aproximadamente)
DELETE FROM `online`;
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
/*!40000 ALTER TABLE `online` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.realmcharacters
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`) USING BTREE,
  KEY `acctid` (`acctid`) USING BTREE,
  KEY `realmid` (`realmid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Realm Character Tracker';

-- Volcando datos para la tabla legion_auth.realmcharacters: ~1 rows (aproximadamente)
DELETE FROM `realmcharacters`;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.realmlist
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `gamePort` int(11) NOT NULL DEFAULT '8086',
  `portCount` mediumint(4) unsigned NOT NULL DEFAULT '1',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  `Region` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `Battlegroup` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_name` (`name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Realm System';

-- Volcando datos para la tabla legion_auth.realmlist: ~1 rows (aproximadamente)
DELETE FROM `realmlist`;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `port`, `gamePort`, `portCount`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`, `Region`, `Battlegroup`, `localAddress`, `localSubnetMask`) VALUES
	(1, 'Nordrassil Work Server', '127.0.0.1', 8085, 8086, 1, 0, 2, 1, 0, 0, 26124, 2, 1, '127.0.0.1', '255.255.255.0');
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.realm_transfer
CREATE TABLE IF NOT EXISTS `realm_transfer` (
  `from_realm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `to_realm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`from_realm`,`to_realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.realm_transfer: ~0 rows (aproximadamente)
DELETE FROM `realm_transfer`;
/*!40000 ALTER TABLE `realm_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_transfer` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_categories
CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL,
  `type` smallint(10) NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `faction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(1) unsigned NOT NULL DEFAULT '6',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_categories: ~0 rows (aproximadamente)
DELETE FROM `store_categories`;
/*!40000 ALTER TABLE `store_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_categories` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_category_locales
CREATE TABLE IF NOT EXISTS `store_category_locales` (
  `category` int(11) NOT NULL DEFAULT '0',
  `name_us` varchar(255) NOT NULL DEFAULT '',
  `name_gb` varchar(255) NOT NULL DEFAULT '',
  `name_kr` varchar(255) NOT NULL DEFAULT '',
  `name_fr` varchar(255) NOT NULL DEFAULT '',
  `name_de` varchar(255) NOT NULL DEFAULT '',
  `name_cn` varchar(255) NOT NULL DEFAULT '',
  `name_tw` varchar(255) NOT NULL DEFAULT '',
  `name_es` varchar(255) NOT NULL DEFAULT '',
  `name_mx` varchar(255) NOT NULL DEFAULT '',
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `name_pt` varchar(255) NOT NULL DEFAULT '',
  `name_br` varchar(255) NOT NULL DEFAULT '',
  `name_it` varchar(255) NOT NULL DEFAULT '',
  `name_ua` varchar(255) NOT NULL DEFAULT '',
  `description_us` varchar(255) NOT NULL DEFAULT '',
  `description_gb` varchar(255) NOT NULL DEFAULT '',
  `description_kr` varchar(255) NOT NULL DEFAULT '',
  `description_fr` varchar(255) NOT NULL DEFAULT '',
  `description_de` varchar(255) NOT NULL DEFAULT '',
  `description_cn` varchar(255) NOT NULL DEFAULT '',
  `description_tw` varchar(255) NOT NULL DEFAULT '',
  `description_es` varchar(255) NOT NULL DEFAULT '',
  `description_mx` varchar(255) NOT NULL DEFAULT '',
  `description_ru` varchar(255) NOT NULL DEFAULT '',
  `description_pt` varchar(255) NOT NULL DEFAULT '',
  `description_br` varchar(255) NOT NULL DEFAULT '',
  `description_it` varchar(255) NOT NULL DEFAULT '',
  `description_ua` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_category_locales: ~0 rows (aproximadamente)
DELETE FROM `store_category_locales`;
/*!40000 ALTER TABLE `store_category_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_category_locales` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_category_realms
CREATE TABLE IF NOT EXISTS `store_category_realms` (
  `category` int(11) NOT NULL DEFAULT '0',
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `return` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `unique` (`category`,`realm`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_category_realms: ~0 rows (aproximadamente)
DELETE FROM `store_category_realms`;
/*!40000 ALTER TABLE `store_category_realms` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_category_realms` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_discounts
CREATE TABLE IF NOT EXISTS `store_discounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `product` int(11) NOT NULL DEFAULT '0',
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rate` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_discounts: ~0 rows (aproximadamente)
DELETE FROM `store_discounts`;
/*!40000 ALTER TABLE `store_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_discounts` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_favorites
CREATE TABLE IF NOT EXISTS `store_favorites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `product` int(11) NOT NULL DEFAULT '0',
  `acid` int(11) unsigned NOT NULL,
  `bacid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`,`acid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_favorites: ~0 rows (aproximadamente)
DELETE FROM `store_favorites`;
/*!40000 ALTER TABLE `store_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_favorites` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_history
CREATE TABLE IF NOT EXISTS `store_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realm` int(11) unsigned NOT NULL,
  `account` int(11) unsigned NOT NULL,
  `bnet_account` int(11) unsigned NOT NULL DEFAULT '0',
  `char_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `char_level` int(11) unsigned NOT NULL DEFAULT '0',
  `art_level` varchar(255) NOT NULL DEFAULT '',
  `guild_name` varchar(255) NOT NULL DEFAULT '',
  `item_guid` int(11) unsigned DEFAULT NULL,
  `item` int(11) NOT NULL DEFAULT '0',
  `bonus` varchar(11) DEFAULT NULL,
  `product` int(11) NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '1',
  `token` int(11) unsigned NOT NULL,
  `karma` int(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` enum('cp','game') NOT NULL DEFAULT 'game',
  `trans_project` varchar(255) NOT NULL DEFAULT '',
  `trans_realm` int(11) unsigned NOT NULL DEFAULT '0',
  `dt_buy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_return` timestamp NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_guid` (`item_guid`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnet_account`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `char_guid` (`char_guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_history: ~0 rows (aproximadamente)
DELETE FROM `store_history`;
/*!40000 ALTER TABLE `store_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_history` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_level_prices
CREATE TABLE IF NOT EXISTS `store_level_prices` (
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `level` smallint(4) unsigned NOT NULL DEFAULT '0',
  `token` int(11) unsigned NOT NULL DEFAULT '0',
  `karma` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unique` (`type`,`realm`,`level`,`token`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_level_prices: ~0 rows (aproximadamente)
DELETE FROM `store_level_prices`;
/*!40000 ALTER TABLE `store_level_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_level_prices` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_products
CREATE TABLE IF NOT EXISTS `store_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '0',
  `item` int(11) NOT NULL DEFAULT '0',
  `bonus` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `display` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `token` int(11) unsigned NOT NULL DEFAULT '0',
  `karma` int(11) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `faction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`category`,`item`,`bonus`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_products: ~0 rows (aproximadamente)
DELETE FROM `store_products`;
/*!40000 ALTER TABLE `store_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_products` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_product_locales
CREATE TABLE IF NOT EXISTS `store_product_locales` (
  `product` int(11) NOT NULL DEFAULT '0',
  `type` smallint(10) NOT NULL DEFAULT '0',
  `us` varchar(255) NOT NULL DEFAULT '',
  `gb` varchar(255) NOT NULL DEFAULT '',
  `kr` varchar(255) NOT NULL DEFAULT '',
  `fr` varchar(255) NOT NULL DEFAULT '',
  `de` varchar(255) NOT NULL DEFAULT '',
  `cn` varchar(255) NOT NULL DEFAULT '',
  `tw` varchar(255) NOT NULL DEFAULT '',
  `es` varchar(255) NOT NULL DEFAULT '',
  `mx` varchar(255) NOT NULL DEFAULT '',
  `ru` varchar(255) NOT NULL DEFAULT '',
  `pt` varchar(255) NOT NULL DEFAULT '',
  `br` varchar(255) NOT NULL DEFAULT '',
  `it` varchar(255) NOT NULL DEFAULT '',
  `ua` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`product`,`type`) USING BTREE,
  UNIQUE KEY `unique` (`product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_product_locales: ~0 rows (aproximadamente)
DELETE FROM `store_product_locales`;
/*!40000 ALTER TABLE `store_product_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_locales` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_product_realms
CREATE TABLE IF NOT EXISTS `store_product_realms` (
  `product` int(11) NOT NULL DEFAULT '0',
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `token` int(11) unsigned NOT NULL DEFAULT '0',
  `karma` int(11) unsigned NOT NULL DEFAULT '0',
  `return` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique` (`realm`,`product`) USING BTREE,
  KEY `product` (`product`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_product_realms: ~0 rows (aproximadamente)
DELETE FROM `store_product_realms`;
/*!40000 ALTER TABLE `store_product_realms` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_realms` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_purchase_history
CREATE TABLE IF NOT EXISTS `store_purchase_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(11) unsigned NOT NULL,
  `bnetaccountId` int(11) unsigned NOT NULL DEFAULT '0',
  `charGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `charLevel` int(11) unsigned NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  `balanceInitial` int(11) unsigned NOT NULL,
  `balanceEnd` int(11) unsigned NOT NULL DEFAULT '0',
  `charRace` varchar(255) NOT NULL,
  `charFaction` varchar(255) NOT NULL,
  `DatePurchase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnetaccountId`) USING BTREE,
  KEY `char_guid` (`charGuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_purchase_history: ~0 rows (aproximadamente)
DELETE FROM `store_purchase_history`;
/*!40000 ALTER TABLE `store_purchase_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_purchase_history` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_rating
CREATE TABLE IF NOT EXISTS `store_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `product` int(11) NOT NULL DEFAULT '0',
  `rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `acid` int(11) unsigned NOT NULL,
  `bacid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`,`acid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_rating: ~0 rows (aproximadamente)
DELETE FROM `store_rating`;
/*!40000 ALTER TABLE `store_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_rating` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.store_statistics
CREATE TABLE IF NOT EXISTS `store_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL DEFAULT '0',
  `realm` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_value` int(11) unsigned NOT NULL DEFAULT '0',
  `buy` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`realm`,`product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.store_statistics: ~0 rows (aproximadamente)
DELETE FROM `store_statistics`;
/*!40000 ALTER TABLE `store_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_statistics` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.transferts
CREATE TABLE IF NOT EXISTS `transferts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL DEFAULT '0',
  `perso_guid` int(11) NOT NULL DEFAULT '0',
  `from` int(11) NOT NULL DEFAULT '0',
  `to` int(11) NOT NULL DEFAULT '0',
  `toacc` int(11) NOT NULL DEFAULT '0',
  `dump` longtext NOT NULL,
  `nb_attempt` int(11) NOT NULL DEFAULT '0',
  `state` int(10) DEFAULT '0',
  `error` int(10) DEFAULT '0',
  `revision` int(10) DEFAULT '0',
  `transferId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `perso_guid` (`perso_guid`) USING BTREE,
  KEY `from` (`from`) USING BTREE,
  KEY `to` (`to`) USING BTREE,
  KEY `state` (`state`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.transferts: ~0 rows (aproximadamente)
DELETE FROM `transferts`;
/*!40000 ALTER TABLE `transferts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.transferts_logs
CREATE TABLE IF NOT EXISTS `transferts_logs` (
  `id` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT '0',
  `perso_guid` int(11) DEFAULT '0',
  `from` int(2) DEFAULT '0',
  `to` int(2) DEFAULT '0',
  `dump` longtext,
  `toacc` int(11) NOT NULL DEFAULT '0',
  `newguid` int(11) NOT NULL DEFAULT '0',
  `transferId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.transferts_logs: ~0 rows (aproximadamente)
DELETE FROM `transferts_logs`;
/*!40000 ALTER TABLE `transferts_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts_logs` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.transfer_requests
CREATE TABLE IF NOT EXISTS `transfer_requests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(11) unsigned NOT NULL,
  `bacid` int(11) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `guid` int(11) unsigned DEFAULT NULL,
  `char_faction` tinyint(1) unsigned DEFAULT NULL,
  `char_class` tinyint(3) unsigned DEFAULT NULL,
  `char_set` int(11) unsigned DEFAULT NULL,
  `realm` tinyint(3) unsigned NOT NULL,
  `dump` mediumtext,
  `promo_code` varchar(32) DEFAULT '',
  `client_expansion` tinyint(1) unsigned DEFAULT NULL,
  `client_build` smallint(5) unsigned DEFAULT NULL,
  `client_locale` varchar(4) DEFAULT '',
  `site` varchar(32) NOT NULL DEFAULT '',
  `realmlist` varchar(32) NOT NULL DEFAULT '',
  `transfer_user_name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `transfer_realm` varchar(32) NOT NULL DEFAULT '',
  `char_name` varchar(12) NOT NULL DEFAULT '',
  `dump_version` varchar(255) DEFAULT '',
  `dt_create` timestamp NULL DEFAULT NULL,
  `dt_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `moderator` int(11) unsigned DEFAULT NULL,
  `comment` varchar(255) DEFAULT '',
  `cost` int(11) unsigned NOT NULL DEFAULT '0',
  `type` enum('fee','free') NOT NULL DEFAULT 'free',
  `test` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` enum('check','test','paid','cancel','4','2','0','reject','payment','verify','new') NOT NULL DEFAULT 'new',
  `parser` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Volcando datos para la tabla legion_auth.transfer_requests: ~0 rows (aproximadamente)
DELETE FROM `transfer_requests`;
/*!40000 ALTER TABLE `transfer_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_requests` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.updates
CREATE TABLE IF NOT EXISTS `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='List of all applied updates in this database.';

-- Volcando datos para la tabla legion_auth.updates: 0 rows
DELETE FROM `updates`;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.updates_include
CREATE TABLE IF NOT EXISTS `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='List of directories where we want to include sql updates.';

-- Volcando datos para la tabla legion_auth.updates_include: 1 rows
DELETE FROM `updates_include`;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` (`path`, `state`) VALUES
	('$/sql/updates/auth', 'RELEASED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;

-- Volcando estructura para tabla legion_auth.uptime
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(11) unsigned NOT NULL,
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(255) DEFAULT NULL,
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Uptime system';

-- Volcando datos para la tabla legion_auth.uptime: ~4 rows (aproximadamente)
DELETE FROM `uptime`;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` (`realmid`, `starttime`, `startstring`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1604238978, NULL, 0, 0, 'TrinityCore rev. v.1.0r-426b53bed7 2020-10-31 23:08:09 -0400 ( branch) (Win64, RelWithDebInfo)'),
	(1, 1606540384, NULL, 0, 0, 'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)'),
	(1, 1606540451, NULL, 0, 0, 'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)'),
	(1, 1606540845, NULL, 0, 0, 'TrinityCore rev. Archived 0000-00-00 00:00:00 +0000 ( branch) (Win64, RelWithDebInfo)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
