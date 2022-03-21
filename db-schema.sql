SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


-- Database: `ecommerce-web`




-- 
-- Table structure for roles
-- 
CREATE TABLE `roles` (
  `roleID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for `accounts`
-- 
CREATE TABLE `accounts` (
  `userID` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `email` varchar(60) NOT NULL UNIQUE,
  `password` varchar(60),
  `firstName` varchar(40),
  `lastName` varchar(40),
  `dob` date,
  `address` varchar(100),
  `roleID` tinyint unsigned DEFAULT 1,
  `isLock` boolean DEFAULT 0,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Table structure for OTP
-- Each user can only have one token
-- 
CREATE TABLE `otp` (
  `userID` int unsigned NOT NULL,
  `otpType` tinyint NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `token` char(6) NOT NULL,
  PRIMARY KEY (`userID`, `otpType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 
-- Table structure for categories
-- 
CREATE TABLE `categories` (
  `catID` int unsigned NOT NULL AUTO_INCREMENT,
  `catName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 
-- Table structure for table `categoriesnext`
-- 
CREATE TABLE `categoriesnext` (
  `catIDNext` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catNextName` varchar(50) NOT NULL,
  `catID` int(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`catIDNext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Table structure for products
-- 
CREATE TABLE `products` (
  `proID` int unsigned 	NOT NULL AUTO_INCREMENT,
  `proName` varchar(200) 	COLLATE utf8mb4_general_ci NOT NULL,
  `catIDNext` int unsigned 	DEFAULT NULL,
  `price` int unsigned 	NOT NULL,
  `discount` int unsigned default NULL,
  `description` text	NOT NULL,
  `postDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `manufacturer` varchar(50) NOT NULL,
  `shopName` varchar(50) NOT NULL,
  `isDisable` int DEFAULT 1,
  `quantity` int NOT NULL,
  `thumbnailId`	char(30) DEFAULT NULL,
  `isReady` int DEFAULT 1, 
  PRIMARY KEY (`proID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Table structure for cart
-- 

CREATE TABLE `cart` (
  `userID` int unsigned NOT NULL,
  `proID` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
   PRIMARY KEY (`userID`,`proID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Table structure for table `orders`
-- 

CREATE TABLE `orders` (
  `orderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderDate` datetime NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `total` bigint(20) NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderID` int(11) unsigned NOT NULL,
  `proID` int(11) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;






-- 
-- Table structure for rating history
-- 

CREATE TABLE `ratingHistory` (
  `userID` int unsigned NOT NULL,
  `rateID` int unsigned NOT NULL,
  `proID` int unsigned NOT NULL,
  `ratingTime` datetime NOT NULL DEFAULT current_timestamp(),
  `comment` varchar(100),
   PRIMARY KEY (`userID`, `rateID`, `proID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `productImages` (
    `proID` int unsigned NOT NULL,
    `imgID`	char(30) NOT NULL,
    `secureUrl`	varchar(256) NOT NULL,
    `extra`	json NOT NULL,
	 PRIMARY KEY (`proID`, `imgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `categories` ADD FULLTEXT KEY `category` (`catName`);

 

ALTER TABLE `categoriesnext`
  ADD KEY `CatID` (`catID`);
 


ALTER TABLE `products` ADD FULLTEXT KEY `FullTextSearch` (`proName`);



ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);


ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`);

ALTER TABLE `categoriesNext`
  ADD CONSTRAINT `categoriesNext_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `categories` (`catID`);





ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);


ALTER TABLE `orders`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`);



ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);


ALTER TABLE `ratingHistory`
  ADD CONSTRAINT `ratingHistory_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`),
  ADD CONSTRAINT `ratingHistory_ibfk_2` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);


ALTER TABLE `productImages`
  ADD CONSTRAINT `productImages_ibfk_1` FOREIGN KEY (`proID`) REFERENCES `products` (`proID`);


