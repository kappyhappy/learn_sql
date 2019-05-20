CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(32) NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE transactions (
    transaction_id INT NOT NULL,
    transactiondetails_id INT NOT NULL
);

CREATE TABLE transactiondetails (
    transactiondetails_id INT NOT NULL AUTO_INCREMENT,
    transaction_time DATETIME,
    product_id INT NOT NULL,
    PRIMARY KEY (transactiondetails_id),
    CONSTRAINT `fkey_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
);
