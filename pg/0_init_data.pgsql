CREATE TABLE "orders" (
	"id" SMALLINT NOT NULL,
	"price" SMALLINT NOT NULL,
	PRIMARY KEY ("id")
)
;


CREATE TABLE "products" (
	"id" SMALLINT NOT NULL,
	"name" VARCHAR(40) NOT NULL,
	"price" SMALLINT NOT NULL,
    "utime" TIMESTAMP NULL,
	PRIMARY KEY ("id")
)
;


CREATE TABLE "order_details" (
	"order_id" SMALLINT NOT NULL,
	"product_id" SMALLINT NOT NULL,
	"count" SMALLINT NOT NULL,
	"price" SMALLINT NOT NULL,
	PRIMARY KEY ("order_id", "product_id")
)
;

CREATE TABLE "students" (
	"name" VARCHAR NOT NULL,
	"gender" VARCHAR NULL DEFAULT NULL,
	"height" SMALLINT NULL DEFAULT NULL,
	"parent" VARCHAR NULL DEFAULT NULL
)
;

CREATE TABLE "category" (
	"id" VARCHAR NOT NULL,
	"parent" VARCHAR NULL DEFAULT NULL,
	"name" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id")
)
;

INSERT INTO orders VALUES (1, 0);
INSERT INTO orders VALUES (2, 0);

INSERT INTO products VALUES (1, 'prd-1', 1);
INSERT INTO products VALUES (2, 'prd-10', 10);
INSERT INTO products VALUES (3, 'prd-100', 100);

INSERT INTO order_details VALUES (1, 1, 1, 1);
INSERT INTO order_details VALUES (1, 2, 1, 10);

INSERT INTO seat VALUES ('U1L9', '', false);

INSERT INTO students VALUES ('tom', 'male', 170, 'peter');
INSERT INTO students VALUES ('john', 'male', 180, 'sam');
INSERT INTO students VALUES ('sue', 'female', 160, 'joe');
INSERT INTO students VALUES ('rita', 'female', 173, 'aa');
INSERT INTO students VALUES ('emma', 'female', 155, 'mary');
INSERT INTO students VALUES ('bill', 'male', 175, 'sam');

INSERT INTO category VALUES ('a', NULL, 'A');
INSERT INTO category VALUES ('b', NULL, 'B');
INSERT INTO category VALUES ('aa', 'a', 'AA');
INSERT INTO category VALUES ('aa2', 'a', 'AA2');
INSERT INTO category VALUES ('bb', 'b', 'BB');
INSERT INTO category VALUES ('aaa', 'aa', 'AAAA');
