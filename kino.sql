-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Paź 29, 2024 at 01:34 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `BILETY`
--

CREATE TABLE `BILETY` (
  `ID` int(11) NOT NULL,
  `SEANS_ID` int(11) NOT NULL,
  `SPRZEDAWCA_ID` int(11) NOT NULL,
  `KLIENT_ID` int(11) NOT NULL,
  `CENA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BILETY`
--

INSERT INTO `BILETY` (`ID`, `SEANS_ID`, `SPRZEDAWCA_ID`, `KLIENT_ID`, `CENA`) VALUES
(4, 4, 1, 1, 19),
(5, 5, 2, 2, 199),
(6, 6, 3, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `FILMY`
--

CREATE TABLE `FILMY` (
  `ID` int(11) NOT NULL,
  `TYTUŁ` varchar(50) NOT NULL,
  `REŻYSER` varchar(50) NOT NULL,
  `CZAS_TRWANIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `FILMY`
--

INSERT INTO `FILMY` (`ID`, `TYTUŁ`, `REŻYSER`, `CZAS_TRWANIA`) VALUES
(1, 'TickTock', 'Marcin Kropidłowski', 720),
(2, 'Kurs do matury rozszerzonej z matematyki', 'Lil Sigma', 4),
(3, 'Generic ahh', 'Bigga D', 120);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `FILMY_RODZAJ`
--

CREATE TABLE `FILMY_RODZAJ` (
  `ID` int(11) NOT NULL,
  `FILMY_ID` int(11) DEFAULT NULL,
  `RODZAJ_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `FILMY_RODZAJ`
--

INSERT INTO `FILMY_RODZAJ` (`ID`, `FILMY_ID`, `RODZAJ_ID`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `KLIENCI`
--

CREATE TABLE `KLIENCI` (
  `ID` int(11) NOT NULL,
  `IMIE` varchar(50) NOT NULL,
  `NAZWISKO` varchar(50) NOT NULL,
  `MAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `KLIENCI`
--

INSERT INTO `KLIENCI` (`ID`, `IMIE`, `NAZWISKO`, `MAIL`) VALUES
(1, 'MARCIN', 'KROPIDŁOWSKI', 'MYNAMEIS@BB.ABQ'),
(2, 'SZAWEŁ', 'DOBROMĘŻCZYZNA', 'SKYLERWHITE@BB.ABQ'),
(3, 'FLORIAN', 'GEYER', 'YO@BB.ABQ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `RODZAJ_FILMU`
--

CREATE TABLE `RODZAJ_FILMU` (
  `ID` int(11) NOT NULL,
  `NAZWA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `RODZAJ_FILMU`
--

INSERT INTO `RODZAJ_FILMU` (`ID`, `NAZWA`) VALUES
(1, 'Horror'),
(2, 'Komedia'),
(3, 'Thriller');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `SALE`
--

CREATE TABLE `SALE` (
  `ID` int(11) NOT NULL,
  `ILOSC_MIEJSC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SALE`
--

INSERT INTO `SALE` (`ID`, `ILOSC_MIEJSC`) VALUES
(12, 40),
(13, 30),
(14, 60),
(15, 35),
(16, 576),
(17, 4),
(18, 46);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `SEANSE`
--

CREATE TABLE `SEANSE` (
  `ID` int(11) NOT NULL,
  `TERMIN` datetime DEFAULT NULL,
  `SALA_ID` int(11) NOT NULL,
  `FILM_ID` int(11) NOT NULL,
  `LICZBA_WOLNYCH_MIEJSC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SEANSE`
--

INSERT INTO `SEANSE` (`ID`, `TERMIN`, `SALA_ID`, `FILM_ID`, `LICZBA_WOLNYCH_MIEJSC`) VALUES
(4, '2025-12-10 23:00:00', 12, 1, 7),
(5, '2026-01-12 08:00:00', 13, 2, 0),
(6, '2030-06-01 10:00:00', 14, 3, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `SPRZEDAWCY`
--

CREATE TABLE `SPRZEDAWCY` (
  `ID` int(11) NOT NULL,
  `IMIE` varchar(50) DEFAULT NULL,
  `NAZIWSKO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SPRZEDAWCY`
--

INSERT INTO `SPRZEDAWCY` (`ID`, `IMIE`, `NAZIWSKO`) VALUES
(1, 'Mithrandir', 'Grau'),
(2, 'Mitthrawnurudo', 'Blau'),
(3, 'Biggie', 'Czarny'),
(4, 'Smeagol', 'Hambubler'),
(5, 'Frodot', 'Oppenheimer');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `BILETY`
--
ALTER TABLE `BILETY`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SEANS_ID` (`SEANS_ID`),
  ADD KEY `SPRZEDAWCA_ID` (`SPRZEDAWCA_ID`);

--
-- Indeksy dla tabeli `FILMY`
--
ALTER TABLE `FILMY`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `FILMY_RODZAJ`
--
ALTER TABLE `FILMY_RODZAJ`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FILMY_ID` (`FILMY_ID`),
  ADD KEY `RODZAJ_ID` (`RODZAJ_ID`);

--
-- Indeksy dla tabeli `KLIENCI`
--
ALTER TABLE `KLIENCI`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `RODZAJ_FILMU`
--
ALTER TABLE `RODZAJ_FILMU`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `SALE`
--
ALTER TABLE `SALE`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `SEANSE`
--
ALTER TABLE `SEANSE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SALA_ID` (`SALA_ID`),
  ADD KEY `FILM_ID` (`FILM_ID`);

--
-- Indeksy dla tabeli `SPRZEDAWCY`
--
ALTER TABLE `SPRZEDAWCY`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BILETY`
--
ALTER TABLE `BILETY`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `FILMY`
--
ALTER TABLE `FILMY`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `FILMY_RODZAJ`
--
ALTER TABLE `FILMY_RODZAJ`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `KLIENCI`
--
ALTER TABLE `KLIENCI`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `RODZAJ_FILMU`
--
ALTER TABLE `RODZAJ_FILMU`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SALE`
--
ALTER TABLE `SALE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `SEANSE`
--
ALTER TABLE `SEANSE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `SPRZEDAWCY`
--
ALTER TABLE `SPRZEDAWCY`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BILETY`
--
ALTER TABLE `BILETY`
  ADD CONSTRAINT `BILETY_ibfk_1` FOREIGN KEY (`SEANS_ID`) REFERENCES `SEANSE` (`ID`),
  ADD CONSTRAINT `BILETY_ibfk_2` FOREIGN KEY (`SPRZEDAWCA_ID`) REFERENCES `SPRZEDAWCY` (`ID`);

--
-- Constraints for table `FILMY_RODZAJ`
--
ALTER TABLE `FILMY_RODZAJ`
  ADD CONSTRAINT `FILMY_RODZAJ_ibfk_1` FOREIGN KEY (`FILMY_ID`) REFERENCES `FILMY` (`ID`),
  ADD CONSTRAINT `FILMY_RODZAJ_ibfk_2` FOREIGN KEY (`RODZAJ_ID`) REFERENCES `RODZAJ_FILMU` (`ID`);

--
-- Constraints for table `SEANSE`
--
ALTER TABLE `SEANSE`
  ADD CONSTRAINT `SEANSE_ibfk_1` FOREIGN KEY (`SALA_ID`) REFERENCES `SALE` (`ID`),
  ADD CONSTRAINT `SEANSE_ibfk_2` FOREIGN KEY (`FILM_ID`) REFERENCES `FILMY` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
