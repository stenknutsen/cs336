--TEAM 8
--Deliverable #3
--tables for project
CREATE DATABASE IF NOT EXISTS proj2016
USE proj2016

--account table on team VM as of 4.7.2016
DROP TABLE IF EXISTS account;
CREATE TABLE account(
username VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
first_name VARCHAR(50)NOT NULL,
last_name VARCHAR(50)NOT NULL,
email VARCHAR(50)NOT NULL,
regdate DATE NOT NULL,
Primary Key (username) 
);

--inserts defauly admin info into account; not yet on team VM
INSERT INTO account (username, password, first_name, last_name, email, regdate)
VALUES ('admin','password','john','doe','jdoe@gmail.com','2016-04-06');
	
DROP TABLE IF EXISTS admin_account;
CREATE TABLE admin_account(
admin_id VARCHAR(50) NOT NULL,
PRIMARY KEY (admin_id),
FOREIGN KEY (admin_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS csr_account;
CREATE TABLE csr_account(
csr_id VARCHAR(20) ,
maintains_admin_id INT NOT NULL REFERENCES admin_account,
PRIMARY KEY (csr_id),
FOREIGN KEY (csr_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS member_account;
CREATE TABLE member_account(
member_id VARCHAR(20),
street_address VARCHAR(20),
city VARCHAR(20),
zip VARCHAR(20),
credit_card_number VARCHAR(20),
paypal_account_number VARCHAR(20),
--maintains_csr_id INT NOT NULL references csr_account,
PRIMARY KEY (member_id),
FOREIGN KEY (member_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS bid;
CREATE TABLE bid(
bid_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
time_placed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
offer DECIMAL(10,2),
autobid BOOLEAN
);

DROP TABLE IF EXISTS game;
CREATE TABLE game(
upc_code VARCHAR(12) NOT NULL,
title VARCHAR(50) DEFAULT NULL,
system VARCHAR(20) DEFAULT NULL,
rating VARCHAR(20)DEFAULT NULL,
genre VARCHAR(20) DEFAULT NULL,
units_sold INT DEFAULT NULL,
PRIMARY KEY (upc_code)
);

DROP TABLE IF EXISTS guest;
CREATE TABLE guest(
guest_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(20),
email VARCHAR(30),
shipping_address VARCHAR(30),
credit_card_info VARCHAR(16),
paypal_info VARCHAR(30),
PRIMARY KEY (guest_id)
);

DROP TABLE IF EXISTS item;
CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
min_price DECIMAL(10,2),
max_price DECIMAL(10,2),
item_condition VARCHAR(20),
has_unique_upc_code VARCHAR(12) NOT NULL REFERENCES game
);

DROP TABLE IF EXISTS auction;
CREATE TABLE auction(
auction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
hours_open INT,
sale_price DECIMAL(10,2),
auto_sale_price DECIMAL(10,2),
current_highest_bid DECIMAL(10,2),
item_of_item_id INT NOT NULL REFERENCES item,
buy_now_guest_guest_id INT NOT NULL REFERENCES guest,
cancel_csr_id INT NOT NULL REFERENCES csr_account,
seller_of_member_id INT NOT NULL REFERENCES member_account 
); 

DROP TABLE IF EXISTS bid_history;
CREATE TABLE bid_history(
bid_id INT NOT NULL REFERENCES bid ON DELETE cascade,
auction_id INT NOT NULL REFERENCES auction ON DELETE cascade,
PRIMARY KEY (bid_id, auction_id)
);

DROP TABLE IF EXISTS buy_now_guest;
CREATE TABLE buy_now_guest(
guest_id INT NOT NULL REFERENCES guest ON DELETE CASCADE,
auction_id INT NOT NULL REFERENCES auction ON DELETE CASCADE,
PRIMARY KEY (guest_id, auction_id) 
);

DROP TABLE IF EXISTS buy_now_member;
CREATE TABLE buy_now_member(
member_id INT NOT NULL REFERENCES member_account on delete cascade,
auction_id INT NOT NULL REFERENCES auction on delete cascade,
Primary Key (member_id, auction_id) 
);

DROP TABLE IF EXISTS cart;
CREATE TABLE cart(
purchase_id INT NOT NULL,
has_a_member_id INT NOT NULL REFERENCES member_account,
has_guest_id INT NOT NULL REFERENCES guest,
placed_in_item_id INT NOT NULL REFERENCES item,
PRIMARY KEY (purchase_id)
);

DROP TABLE IF EXISTS creates;
CREATE TABLE creates(
bid_history_id INT NOT NULL references bid_history on delete cascade,
auction_id INT NOT NULL references auction on delete cascade,
Primary Key (bid_history_id, auction_id) 
);

DROP TABLE IF EXISTS makes;
CREATE TABLE makes(
bid_id INT NOT NULL REFERENCES bid ON DELETE cascade,
member_id INT NOT NULL REFERENCES member_account ON DELETE cascade,
PRIMARY KEY (bid_id, member_id)
);


