-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2023 alle 08:06
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4a_museo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `biglietti`
--

CREATE TABLE `biglietti` (
  `idBiglietto` int(11) NOT NULL,
  `data` varchar(10) NOT NULL,
  `idPercorso` int(11) NOT NULL,
  `annoNascita` smallint(6) NOT NULL,
  `studente` tinyint(1) NOT NULL,
  `abbonamento` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `biglietti`
--

INSERT INTO `biglietti` (`idBiglietto`, `data`, `idPercorso`, `annoNascita`, `studente`, `abbonamento`) VALUES
(1, '2023-05-09', 2, 1990, 0, 1),
(2, '2023-05-10', 1, 1970, 0, 0),
(3, '2023-05-10', 3, 1965, 0, 1),
(4, '2023-05-10', 4, 1980, 0, 1),
(5, '2023-05-10', 1, 2000, 1, 0),
(6, '2023-05-07', 2, 2000, 1, 0),
(7, '2023-05-07', 4, 2001, 1, 0),
(8, '2023-05-07', 4, 1995, 0, 1),
(9, '2023-05-07', 3, 1948, 0, 1),
(10, '2023-05-06', 1, 1993, 0, 1),
(11, '2023-05-06', 2, 1992, 0, 1),
(12, '2023-05-06', 1, 1994, 0, 1),
(13, '2023-05-06', 3, 1965, 0, 0),
(14, '2023-05-06', 3, 1966, 0, 0),
(15, '2023-05-06', 4, 1971, 0, 1),
(16, '2023-05-06', 4, 2006, 0, 0),
(17, '2023-05-06', 1, 1984, 0, 0),
(18, '2023-05-06', 4, 1993, 0, 1),
(19, '2023-04-30', 5, 2006, 1, 0),
(20, '2023-04-30', 5, 2006, 1, 0),
(21, '2023-04-30', 5, 2006, 1, 0),
(22, '2023-04-30', 5, 2006, 1, 0),
(23, '2023-04-30', 5, 2006, 1, 0),
(24, '2023-04-30', 5, 2006, 1, 0),
(25, '2023-04-30', 5, 2006, 1, 0),
(26, '2023-04-30', 5, 2006, 1, 0),
(27, '2023-04-30', 5, 2006, 1, 0),
(28, '2023-04-30', 5, 2006, 1, 0),
(29, '2023-04-30', 5, 2006, 1, 0),
(30, '2023-04-30', 5, 2006, 1, 0),
(31, '2023-04-30', 5, 2006, 1, 0),
(32, '2023-04-30', 5, 2006, 1, 0),
(33, '2023-04-30', 5, 1975, 0, 1),
(34, '2023-04-30', 5, 1978, 0, 1),
(35, '2023-04-30', 5, 1955, 0, 0),
(36, '2023-04-30', 5, 1956, 0, 0),
(37, '2023-04-30', 5, 1962, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `percorsi`
--

CREATE TABLE `percorsi` (
  `idPercorso` int(11) NOT NULL,
  `descr` varchar(50) NOT NULL,
  `nSale` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `percorsi`
--

INSERT INTO `percorsi` (`idPercorso`, `descr`, `nSale`) VALUES
(1, 'Mostra Leonardo Da Vinci', 10),
(2, 'Le stanze reali', 5),
(3, 'Museo storico del risorgimento', 8),
(4, 'Le prigioni', 15),
(5, 'La torre', 4);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `biglietti`
--
ALTER TABLE `biglietti`
  ADD PRIMARY KEY (`idBiglietto`);

--
-- Indici per le tabelle `percorsi`
--
ALTER TABLE `percorsi`
  ADD PRIMARY KEY (`idPercorso`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `biglietti`
--
ALTER TABLE `biglietti`
  MODIFY `idBiglietto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT per la tabella `percorsi`
--
ALTER TABLE `percorsi`
  MODIFY `idPercorso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
