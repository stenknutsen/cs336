--TEAM 8
--Deliverable #3
--tables for project
CREATE TABLE game
(upc_code VARCHAR(12),
title VARCHAR(50),
system VARCHAR(20),
rating VARCHAR(20),
genre(20)
PRIMARY KEY (upc_code)
);

CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
condition VARCHAR(20),
min_price NUMERIC(20),
max_price NUMERIC(20)
);

CREATE TABLE has_unique(
upc_code VARCHAR(12),
item_id INT
PRIMARY KEY (item_id),
FOREIGN KEY (upc_code) REFERENCES game,
FOREIGN KEY (item_id) REFERENCES item
);

CREATE TABLE admin_account(
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
PRIMARY KEY (username)
);

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

CREATE TABLE csr_account(
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
PRIMARY KEY (username)
);

