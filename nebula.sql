-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 08, 2021 alle 09:01
-- Versione del server: 10.3.27-MariaDB-0+deb10u1
-- Versione PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nebula`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `community`
--

CREATE TABLE `community` (
  `id` int(11) NOT NULL,
  `tg_group_name` varchar(50) DEFAULT NULL,
  `tg_group_id` varchar(50) DEFAULT NULL,
  `tg_group_link` varchar(50) DEFAULT NULL,
  `language` varchar(50) NOT NULL DEFAULT 'IT',
  `type` varchar(50) NOT NULL DEFAULT 'supergroup'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `id_group` varchar(50) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `welcome_text` text NOT NULL,
  `welcome_buttons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{  "buttons": [   {      "id": 0,       "title": "Bot Logs",       "url": "https://t.me/nebulalogs"   }  ] }',
  `rules_text` text NOT NULL,
  `community` tinyint(1) NOT NULL DEFAULT 0,
  `languages` varchar(20) DEFAULT 'EN',
  `set_welcome` tinyint(2) NOT NULL DEFAULT 1,
  `max_warn` int(11) NOT NULL DEFAULT 3,
  `set_silence` tinyint(2) NOT NULL DEFAULT 0,
  `exe_filter` tinyint(1) NOT NULL DEFAULT 0,
  `block_new_member` tinyint(1) NOT NULL DEFAULT 0,
  `set_arabic_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_cirillic_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_chinese_filter` tinyint(1) NOT NULL DEFAULT 1,
  `set_user_profile_picture` tinyint(1) NOT NULL DEFAULT 0,
  `gif_filter` tinyint(1) NOT NULL DEFAULT 0,
  `set_cas_ban` tinyint(1) NOT NULL DEFAULT 1,
  `type_no_username` int(1) NOT NULL DEFAULT 1,
  `log_channel` varchar(50) NOT NULL DEFAULT '-1001359708474',
  `group_photo` varchar(255) NOT NULL DEFAULT 'https://naos.hersel.it/group_photo/default.jpg',
  `total_users` int(50) NOT NULL DEFAULT 0,
  `zip_filter` tinyint(1) NOT NULL DEFAULT 0,
  `targz_filter` tinyint(1) NOT NULL DEFAULT 0,
  `jpg_filter` tinyint(1) NOT NULL DEFAULT 0,
  `docx_filter` tinyint(1) NOT NULL DEFAULT 0,
  `apk_filter` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_badwords`
--

CREATE TABLE `groups_badwords` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `tg_group_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `groups_blacklist`
--

CREATE TABLE `groups_blacklist` (
  `id` int(11) NOT NULL,
  `tg_id_group` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `group_users`
--

CREATE TABLE `group_users` (
  `id` int(11) NOT NULL,
  `tg_id` varchar(50) DEFAULT NULL,
  `tg_group_id` varchar(50) DEFAULT NULL,
  `warn_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `nebula_updates`
--

CREATE TABLE `nebula_updates` (
  `id` int(11) NOT NULL,
  `update_id` varchar(255) NOT NULL,
  `tg_group_id` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `owner_list`
--

CREATE TABLE `owner_list` (
  `id` int(11) NOT NULL,
  `tg_id` varchar(255) NOT NULL,
  `tg_username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `superban_table`
--

CREATE TABLE `superban_table` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `motivation_text` varchar(255) NOT NULL,
  `user_date` datetime NOT NULL,
  `id_operator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `tg_id` varchar(50) NOT NULL,
  `tg_username` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `whitelist_table`
--

CREATE TABLE `whitelist_table` (
  `id` int(11) NOT NULL,
  `tg_id` varchar(50) NOT NULL,
  `tg_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `community`
--
ALTER TABLE `community`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_group_id` (`tg_group_id`);

--
-- Indici per le tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`id_group`);

--
-- Indici per le tabelle `groups_badwords`
--
ALTER TABLE `groups_badwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `word_index` (`word`,`tg_group_id`);

--
-- Indici per le tabelle `groups_blacklist`
--
ALTER TABLE `groups_blacklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_group_index` (`tg_id_group`);

--
-- Indici per le tabelle `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_user_group` (`tg_id`,`tg_group_id`);

--
-- Indici per le tabelle `nebula_updates`
--
ALTER TABLE `nebula_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `update_index` (`update_id`);

--
-- Indici per le tabelle `owner_list`
--
ALTER TABLE `owner_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_index_tg` (`tg_id`);

--
-- Indici per le tabelle `superban_table`
--
ALTER TABLE `superban_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_key` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tg_id_key` (`tg_id`);

--
-- Indici per le tabelle `whitelist_table`
--
ALTER TABLE `whitelist_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_index` (`tg_id`,`tg_username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `community`
--
ALTER TABLE `community`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups_badwords`
--
ALTER TABLE `groups_badwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `groups_blacklist`
--
ALTER TABLE `groups_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `nebula_updates`
--
ALTER TABLE `nebula_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `owner_list`
--
ALTER TABLE `owner_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `superban_table`
--
ALTER TABLE `superban_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `whitelist_table`
--
ALTER TABLE `whitelist_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
