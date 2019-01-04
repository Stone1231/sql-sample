CREATE TABLE `orders` (
	`id` INT(11) NOT NULL,
	`price` INT(11) NOT NULL,
	PRIMARY KEY (`id`)	
)
;


CREATE TABLE `products` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(40) NOT NULL,
	`price` INT(11) NOT NULL,
	PRIMARY KEY (`id`)
)
;


CREATE TABLE `order_details` (
	`order_id` INT(11) NOT NULL,
	`product_id` INT(11) NOT NULL,
	`count` INT(11) NOT NULL,
	`price` INT(11) NOT NULL,
	PRIMARY KEY (`order_id`, `product_id`)
)
;

INSERT INTO orders VALUES (1, 0);
INSERT INTO orders VALUES (2, 0);

INSERT INTO products VALUES (1, 'prd-1', 1);
INSERT INTO products VALUES (2, 'prd-10', 10);
INSERT INTO products VALUES (3, 'prd-100', 100);

INSERT INTO order_details VALUES (1, 1, 1, 1);
INSERT INTO order_details VALUES (1, 2, 1, 10);