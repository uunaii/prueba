DROP DATABASE IF EXISTS IKEA;
CREATE DATABASE IKEA;
USE IKEA;


CREATE TABLE furniture (
 store                      VARCHAR(5),
 transaction_id             VARCHAR(70),
 transaction_timestamp      TIMESTAMP,
 membership_id              VARCHAR(70) NOT NULL,
 product_category_1_name    VARCHAR(40),
 product_category_2_name    VARCHAR(100), 
 product_category_3_name    VARCHAR(100),
 qty                        DECIMAL(8,4),
 sales                      DECIMAL(8,4)
);

CREATE TABLE food (
numero_compra               varchar(10),
 store                      VARCHAR(5),
 transaction_id             VARCHAR(70),
 transaction_timestamp      TIMESTAMP,
 membership_id              VARCHAR(70) NOT NULL,
 till_id                    VARCHAR(12),
 product_category_1_name    VARCHAR(4),
 product_category_2_name    VARCHAR(14),
 product_category_3_name    VARCHAR(50),
 item_description           VARCHAR(140),
 qty						DECIMAL(8,4),
 sales                      DECIMAL(8,4)
);

