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
)

CREATE TABLE item(
item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
condition VARCHAR(20),
min_price NUMERIC(20),
max_price NUMERIC(20)
)


