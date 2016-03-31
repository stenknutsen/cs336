--TEAM 8
--Deliverable #3
--tables for project
CREATE DATABASE IF NOT EXISTS proj2016
USE proj2016

--follow this pattern for the rest of the tables we do
DROP TABLE IF EXISTS game;
CREATE TABLE game(
upc_code VARCHAR(12) NOT NULL,
title VARCHAR(50) DEFAULT NULL,
system VARCHAR(20) DEFAULT NULL,
rating VARCHAR(20)DEFAULT NULL,
genre(20) DEFAULT NULL,
PRIMARY KEY (upc_code)
);
-- this INSERT not necessary right now. . .so I'm commenting it out 
--INSERT INTO game ();
DROP TABLE IF EXISTS item;
CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
condition VARCHAR(20),
min_price NUMERIC(20),
max_price NUMERIC(20)
);


DROP TABLE IF EXISTS has_unique;
CREATE TABLE has_unique(
upc_code VARCHAR(12),
item_id INT
PRIMARY KEY (item_id),
FOREIGN KEY (upc_code) REFERENCES game,
FOREIGN KEY (item_id) REFERENCES item
);

DROP TABLE IF EXISTS admin_account;
CREATE TABLE admin_account(
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
PRIMARY KEY (username)
);

DROP TABLE IF EXISTS member_account;
CREATE TABLE member_account(
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
street_address VARCHAR(20),
city VARCHAR(20),
zip VARCHAR(20),
credit_card_number VARCHAR(20),
paypal_account_number VARCHAR(20)
PRIMARY KEY (username)
);


DROP TABLE IF EXISTS csr_account;
CREATE TABLE csr_account(
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
PRIMARY KEY (username)
);


DROP TABLE IF EXISTS guest;
CREATE TABLE guest(
guest_id VARCHAR(20),
name VARCHAR(20),
email VARCHAR(30),
shipping_address VARCHAR(30),
credit_card_info VARCHAR(16),
paypal_info VARCHAR(30),
PRIMARY KEY (guest_id)
);

DROP TABLE IF EXISTS auction;
CREATE TABLE auction(
auction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
hours_open INT,
sale_price DECIMAL(10,2),
auto_sale_price DECIMAL(10,2),
current_highest_bid DECIMAL(10,2),
item_id INT,
FOREIGN KEY (item_id) REFERENCES item
); 

DROP TABLE IF EXISTS bid;
CREATE TABLE bid(
bid_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
time_placed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
offer DECIMAL(10,2),
autobid BOOLEAN
);

DROP TABLE IF EXISTS bid_history;
CREATE TABLE bid_history(
bid_history_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (auction_id) REFERENCES auction,
FOREIGN KEY (bid_id) REFERENCES bid
);






