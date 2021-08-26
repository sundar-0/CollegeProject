-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2021 at 08:40 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `password`, `contact`) VALUES
(1, 'sundar', 'sundar12', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `catname` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catname`, `status`) VALUES
(1, 'Chocolate', 'Yes'),
(2, 'Noodles', 'Yes'),
(5, 'Wheat', 'No'),
(7, 'Rice', 'Yes'),
(9, 'detergent', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `contact`, `location`, `gender`) VALUES
(5, 'Bivek', '981222102', 'gangabu', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodid` int(11) NOT NULL,
  `prodname` varchar(50) DEFAULT NULL,
  `mfgdate` varchar(100) DEFAULT NULL,
  `expirydate` varchar(100) DEFAULT NULL,
  `catidfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodid`, `prodname`, `mfgdate`, `expirydate`, `catidfk`) VALUES
(4, 'Wai Wai', '30 Aug 2019 18:15:00 ', '8 Sep 2020 18:15:00 ', 2),
(5, 'Gyan Chakki Aata', '5 Oct 2019 11:05:26 ', '9 Oct 2020 11:05:33 ', 5),
(7, 'kitkat', '1 Jun 2020 18:15:00 ', '11 Jun 2025 01:31:57 ', 1),
(8, 'Ramen korean', '15 Jun 2021 21:51:47 ', '22 Jun 2023 18:15:00 ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `productprice`
--

CREATE TABLE `productprice` (
  `price_id` int(11) NOT NULL,
  `buying_price` float NOT NULL,
  `profit_percentage` float NOT NULL,
  `discount_percentage` float NOT NULL,
  `final_sp` float NOT NULL,
  `prod_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productprice`
--

INSERT INTO `productprice` (`price_id`, `buying_price`, `profit_percentage`, `discount_percentage`, `final_sp`, `prod_id_fk`) VALUES
(3, 145, 20, 5, 166.75, 5),
(4, 50, 10, 5, 52.5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseinvoice`
--

CREATE TABLE `purchaseinvoice` (
  `invoiceid` int(11) NOT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `product` varchar(50) DEFAULT NULL,
  `perunitprice` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaseinvoice`
--

INSERT INTO `purchaseinvoice` (`invoiceid`, `supplier`, `productid`, `product`, `perunitprice`, `quantity`, `total`) VALUES
(1, 'ABCD', 3, 'Cadburry Dairy milk', 200, 121, 240),
(2, 'Shree Ridhi Sidhi Store', 4, 'Wai Wai', 20, 120, 2400),
(8, 'Shree Ridhi Sidhi Store', 5, 'Gyan Chakki Aata', 40, 120, 4800),
(9, 'Shree Ridhi Sidhi Store', 4, 'Wai Wai', 20, 100, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `staff_password` varchar(30) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_password`, `phone_no`, `email`, `status`) VALUES
(1, 'himal', 'himal@12', '9804459171', 'hhpandey@gmail.com', 'Active'),
(11, 'David123', 'David123', '9239290920', 'david12@gmail.com', 'Active'),
(12, 'Yajju12', 'Yajju12', '9892932923', 'yajju12@gmail.com', 'Active'),
(13, 'bivek12', 'Bivek12', '9811211231', 'bvek@gmail.com', 'Active'),
(14, 'shyam12', 'Shyam@12', '9812222109', 'sam@gmaa.co', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierid` int(11) NOT NULL,
  `suppliername` varchar(50) DEFAULT NULL,
  `contactperson` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `panno` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierid`, `suppliername`, `contactperson`, `phoneno`, `location`, `panno`, `status`) VALUES
(2, 'ABCD', 'hari', '9829389829', 'gongabu', '12-233-1233', 'Active'),
(3, 'Shree Ridhi Sidhi Store', 'Hem Bahadhur', '12838919', 'Bhairahawa', '901929', 'Active'),
(4, 'New Pasa Shop', 'Pasa dai', '988191918', 'duwakot', '818182', 'Active'),
(5, 'patel supplier brothers', 'patel bhai', '9812129012', 'biratnagar', '80121012', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodid`),
  ADD KEY `catidfk` (`catidfk`);

--
-- Indexes for table `productprice`
--
ALTER TABLE `productprice`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `prod_id_fk` (`prod_id_fk`);

--
-- Indexes for table `purchaseinvoice`
--
ALTER TABLE `purchaseinvoice`
  ADD PRIMARY KEY (`invoiceid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `productprice`
--
ALTER TABLE `productprice`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchaseinvoice`
--
ALTER TABLE `purchaseinvoice`
  MODIFY `invoiceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catidfk`) REFERENCES `category` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productprice`
--
ALTER TABLE `productprice`
  ADD CONSTRAINT `productprice_ibfk_1` FOREIGN KEY (`prod_id_fk`) REFERENCES `product` (`prodid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
