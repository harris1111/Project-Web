-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2022 at 03:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce-web`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `userID` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `roleID` tinyint(3) UNSIGNED DEFAULT 1,
  `isLock` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`userID`, `username`, `email`, `password`, `firstName`, `lastName`, `dob`, `address`, `roleID`, `isLock`) VALUES
(1, 'user1', 'user1@example.com', '123', 'us', 'er', '0000-00-00', '227 NVC', 1, 1),
(2, 'user2', 'user2@example.com', '1234', 'us', 'er2', '0000-00-00', '228 NVC', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userID` int(10) UNSIGNED NOT NULL,
  `proID` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`userID`, `proID`, `quantity`) VALUES
(1, 11, 1),
(1, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `catID` int(10) UNSIGNED NOT NULL,
  `catName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catID`, `catName`) VALUES
(11, 'Sony'),
(12, 'Samsung');

-- --------------------------------------------------------

--
-- Table structure for table `categoriesnext`
--

CREATE TABLE `categoriesnext` (
  `catIDNext` int(20) UNSIGNED NOT NULL,
  `catNextName` varchar(50) NOT NULL,
  `catID` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoriesnext`
--

INSERT INTO `categoriesnext` (`catIDNext`, `catNextName`, `catID`) VALUES
(1, '3', 11),
(2, '4', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `orderID` int(11) UNSIGNED NOT NULL,
  `proID` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) UNSIGNED NOT NULL,
  `orderDate` datetime NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderDate`, `userID`, `total`) VALUES
(1, '0000-00-00 00:00:00', 1, 1),
(2, '0000-00-00 00:00:00', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `userID` int(10) UNSIGNED NOT NULL,
  `otpType` tinyint(4) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `token` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `proID` int(10) UNSIGNED NOT NULL,
  `imgID` char(30) NOT NULL,
  `secureUrl` varchar(256) NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`extra`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `proID` int(10) UNSIGNED NOT NULL,
  `proName` varchar(200) NOT NULL,
  `catIDNext` int(10) UNSIGNED DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `discount` int(10) UNSIGNED DEFAULT NULL,
  `description` text NOT NULL,
  `postDate` datetime DEFAULT current_timestamp(),
  `manufacturer` varchar(50) NOT NULL,
  `shopName` varchar(50) NOT NULL,
  `isDisable` int(11) DEFAULT 1,
  `quantity` int(11) NOT NULL,
  `thumbnailId` char(30) DEFAULT NULL,
  `isReady` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`proID`, `proName`, `catIDNext`, `price`, `discount`, `description`, `postDate`, `manufacturer`, `shopName`, `isDisable`, `quantity`, `thumbnailId`, `isReady`) VALUES
(11, 'Sony', 3, 4, 0, 'nothing', '0000-00-00 00:00:00', 'Sony', 'Shop sony', 0, 1, '1', 1),
(12, 'Samssung', 4, 5, 0, 'nothing', '0000-00-00 00:00:00', 'Samssung', 'Shop samssung', 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratinghistory`
--

CREATE TABLE `ratinghistory` (
  `userID` int(10) UNSIGNED NOT NULL,
  `rateID` int(10) UNSIGNED NOT NULL,
  `proID` int(10) UNSIGNED NOT NULL,
  `ratingTime` datetime NOT NULL DEFAULT current_timestamp(),
  `comment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` tinyint(3) UNSIGNED NOT NULL,
  `roleName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `roleName`) VALUES
(1, 'Admin'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `accounts_ibfk_1` (`roleID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userID`,`proID`),
  ADD KEY `cart_ibfk_2` (`proID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`catID`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category` (`catName`);

--
-- Indexes for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD PRIMARY KEY (`catIDNext`),
  ADD KEY `CatID` (`catID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `orderdetails_ibfk_1` (`orderID`),
  ADD KEY `orderdetails_ibfk_2` (`proID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `order_ibfk_1` (`userID`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`userID`,`otpType`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`proID`,`imgID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`proID`);
ALTER TABLE `products` ADD FULLTEXT KEY `FullTextSearch` (`proName`);

--
-- Indexes for table `ratinghistory`
--
ALTER TABLE `ratinghistory`
  ADD PRIMARY KEY (`userID`,`rateID`,`proID`),
  ADD KEY `ratingHistory_ibfk_2` (`proID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `userID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `catID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  MODIFY `catIDNext` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `proID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);

--
-- Constraints for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD CONSTRAINT `categoriesNext_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `categories` (`catID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`);

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`);

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productImages_ibfk_1` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);

--
-- Constraints for table `ratinghistory`
--
ALTER TABLE `ratinghistory`
  ADD CONSTRAINT `ratingHistory_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`),
  ADD CONSTRAINT `ratingHistory_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
