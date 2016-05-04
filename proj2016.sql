--TEAM 8
--Deliverable #3
--tables for project
CREATE DATABASE IF NOT EXISTS proj2016;
USE proj2016;

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

--inserts default admin info into account;
-- on team VM as of 4.17.2016
INSERT INTO account (username, password, first_name, last_name, email, regdate)
VALUES ('admin','password','john','doe','jdoe@gmail.com','2016-04-06');

-- on team VM as of 4.17.2016	
DROP TABLE IF EXISTS admin_account;
CREATE TABLE admin_account(
admin_id VARCHAR(50) NOT NULL,
PRIMARY KEY (admin_id),
FOREIGN KEY (admin_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);

--inserts default admin info into admin_account;
-- on team VM as of 4.17.2016
INSERT INTO admin_account (admin_id) Values ('admin');

-- on team VM as of 4.24.2016
DROP TABLE IF EXISTS csr_account;
CREATE TABLE csr_account(
csr_id VARCHAR(50) NOT NULL,
PRIMARY KEY (csr_id),
FOREIGN KEY (csr_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS member_account;
CREATE TABLE member_account(
member_id VARCHAR(50) NOT NULL,
street_address VARCHAR(60),
city VARCHAR(50),
zip VARCHAR(20),
credit_card_number VARCHAR(20),
PRIMARY KEY (member_id),
FOREIGN KEY (member_id) REFERENCES account (username) ON DELETE CASCADE ON UPDATE CASCADE
);
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS bid;
CREATE TABLE bid(
bid_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
time_placed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
offer DECIMAL(10,2),
autobid BOOLEAN,
autobid_limit DECIMAL(10,2),
username VARCHAR(50) NOT NULL,
FOREIGN KEY(username) REFERENCES account (username)
);

--on team VM as of 5.1.2016
DROP TABLE IF EXISTS game;
CREATE TABLE game(
upc_code BIGINT NOT NULL,
title VARCHAR(50) DEFAULT NULL,
system VARCHAR(20) DEFAULT NULL,
rating INT DEFAULT NULL,
genre VARCHAR(20) DEFAULT NULL,
units_sold INT DEFAULT NULL,
PRIMARY KEY (upc_code)
);

-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS item;
CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
min_price DECIMAL(10,2),
item_condition VARCHAR(20),
upc_code BIGINT NOT NULL REFERENCES game
);

DROP TABLE IF EXISTS auction;
CREATE TABLE auction(
auction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
hours_open TIMESTAMP,
auto_sale_price DECIMAL(10,2),
current_highest_bid DECIMAL(10,2),
item_id INT NOT NULL REFERENCES item,
seller_id VARCHAR(50) NOT NULL REFERENCES member_account,
bidder_id VARCHAR(50) REFERENCES member_account
); 
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS bid_history;
CREATE TABLE bid_history(
bid_id INT NOT NULL REFERENCES bid ON DELETE cascade,
auction_id INT NOT NULL REFERENCES auction ON DELETE cascade,
PRIMARY KEY (bid_id, auction_id)
);

-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS buy_now_member;
CREATE TABLE buy_now_member(
member_id INT NOT NULL REFERENCES member_account on delete cascade,
auction_id INT NOT NULL REFERENCES auction on delete cascade,
Primary Key (member_id, auction_id) 
);
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS cart;
CREATE TABLE cart(
purchase_id INT NOT NULL,
has_a_member_id INT NOT NULL REFERENCES member_account,
has_guest_id INT NOT NULL REFERENCES guest,
placed_in_item_id INT NOT NULL REFERENCES item,
PRIMARY KEY (purchase_id)
);
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS creates;
CREATE TABLE creates(
bid_history_id INT NOT NULL references bid_history on delete cascade,
auction_id INT NOT NULL references auction on delete cascade,
Primary Key (bid_history_id, auction_id) 
);
-- on team VM as of 5.3.2016
DROP TABLE IF EXISTS makes;
CREATE TABLE makes(
bid_id INT NOT NULL REFERENCES bid ON DELETE cascade,
member_id INT NOT NULL REFERENCES member_account ON DELETE cascade,
PRIMARY KEY (bid_id, member_id)
);


-- on team VM as of 4.24.2016
DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	message_id INT NOT NULL AUTO_INCREMENT,
	src VARCHAR(50),
	dest VARCHAR(50),
	msg_text VARCHAR(140),
	PRIMARY KEY (message_id)

);

--NEW!!! Q and A page table
-- on team VM as of 4.30.2016
CREATE TABLE questions(
	question_id INT NOT NULL AUTO_INCREMENT,
	src VARCHAR(50),
	subject VARCHAR(50),
	q_text VARCHAR(140),
	a_text VARCHAR(140),
	helpful INT,
	PRIMARY KEY (question_id)

);

--for demonstration purposes; 
--on team VM as of 5.1.2016
CREATE TABLE demo_auctions(
	auction_id INT NOT NULL AUTO_INCREMENT,
	seller VARCHAR(50),
	PRIMARY KEY (auction_id)

);
INSERT INTO demo_auctions(auction_id,seller)VALUES(NULL,'lurch');
INSERT INTO demo_auctions(auction_id,seller)VALUES(NULL,'uncle_fester');
INSERT INTO demo_auctions(auction_id,seller)VALUES(NULL,'morticia');
INSERT INTO demo_auctions(auction_id,seller)VALUES(NULL,'gomez');

--for demonstration purposes;
--on team VM as of 5.1.2016
CREATE TABLE demo_bids(
	bid_id INT NOT NULL AUTO_INCREMENT,
	bidder VARCHAR(50),
	PRIMARY KEY (bid_id)

);
INSERT INTO demo_bids(bid_id,bidder)VALUES(NULL,'herman');
INSERT INTO demo_bids(bid_id,bidder)VALUES(NULL,'grandpa');
INSERT INTO demo_bids(bid_id,bidder)VALUES(NULL,'lillian');
INSERT INTO demo_bids(bid_id,bidder)VALUES(NULL,'eddie');

--for demonstration purposes;
--on team VM as of 5.1.2016
CREATE TABLE demo_sales(
	sale_id INT NOT NULL AUTO_INCREMENT,
	buyer VARCHAR(50),
	seller VARCHAR(50),
	item_name VARCHAR(50),
	sale_price DECIMAL(10,2),
	PRIMARY KEY (sale_id)
);
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'herman','gomez','The Simpsons','29.99');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'grandpa','gomez','Minecraft','19.99');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'lillian','gomez','Call of Duty','35.00');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'eddie','gomez','Tetris','9.99');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'herman','lurch','Minecraft','29.99');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'herman','morticia','Tomb Raider','23.50');
INSERT INTO demo_sales(sale_id,buyer,seller,item_name,sale_price)VALUES(NULL,'herman','uncle_fester','Tetris','29.99');


--trigger detects "hacker" registering and sends message to admin
--on team VM as of 5.1.2016
DELIMITER //
CREATE TRIGGER before_account_insert
BEFORE INSERT ON account
FOR EACH ROW
BEGIN
IF NEW.username = 'hacker' or NEW.username = 'hacker1' or NEW.username = 'hacker2' THEN
INSERT INTO messages(message_id,src,dest,msg_text)VALUES(NULL,'security_system','admin','hacker has just registered!');
END IF;
END;//
DELIMITER;

DELIMITER //
CREATE TRIGGER after_delete_auction
AFTER DELETE ON auction
FOR EACH ROW
BEGIN
Insert into messages(message_id,src,dest,msg_text)VALUES(NULL,'System',old.seller_id,'Your auction ended');
END;//
DELIMITER;

DELIMITER //
CREATE TRIGGER after_delete_auction
AFTER DELETE ON auction
FOR EACH ROW
BEGIN
Insert into messages(message_id,src,dest,msg_text)VALUES(NULL,'System',old.bidder_id,'You won an auction!');
END;//
DELIMITER;

create event newevent on schedule every 1 minute do delete from auction where hours_open < Now();
