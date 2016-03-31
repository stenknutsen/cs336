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
units_sold INT DEFAULT NULL,
PRIMARY KEY (upc_code)
);
-- this INSERT not necessary right now. . .so I'm commenting it out 
--INSERT INTO game ();
DROP TABLE IF EXISTS item;
CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
condition VARCHAR(20),
min_price DECIMAL(10,2),
max_price DECIMAL(10,2)
);

DROP TABLE IF EXISTS cart;
CREATE TABLE cart(
purchase_id VARCHAR(20),
user_id VARCHAR(20),
guest_id VARCHAR(20),
item_id VARCHAR(20),
PRIMARY KEY (purchase_id)
);

DROP TABLE IF EXISTS buy_now_guest
CREATE TABLE buy_now_guest(
guest_id VARCHAR(20) REFERENCES guest ON DELETE CASCADE,
auction_id VARCHAR(20) REFERENCES auction ON DELETE CASCADE,
PRIMARY KEY (guest_id, auction_id) 
);

DROP TABLE IF EXISTS buy_now_member
CREATE TABLE buy_now_member(
member_id VARCHAR(20) references member on delete cascade,
auction_id VARCHAR(20) references Auction on delete cascade,
Primary Key (member_id, auction_id) 
);

--Took from Karl--
DROP TABLE IF EXISTS creates
CREATE TABLE creates(
bid_history_id VARCHAR(20) references bid_history on delete cascade,
auction_id VARCHAR(20) references auction on delete cascade,
Primary Key (bid_history_id, auction_id) 
);


DROP TABLE IF EXISTS has_unique;
CREATE TABLE has_unique(
upc_code VARCHAR(12),
item_id INT,
PRIMARY KEY (item_id),
FOREIGN KEY (upc_code) REFERENCES game,
FOREIGN KEY (item_id) REFERENCES item
);

DROP TABLE IF EXISTS item_of;
CREATE TABLE item_of(
auction_id INT NOT NULL,
item_id INT NOT NULL,
PRIMARY KEY (item_id),
FOREIGN KEY (autction_id) REFERENCES auction,
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
paypal_account_number VARCHAR(20),
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
guest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
auction_id INT,
bid_id INT,
FOREIGN KEY (auction_id) REFERENCES auction,
FOREIGN KEY (bid_id) REFERENCES bid
);






