CREATE TABLE product(prodid VARCHAR(5),pname VARCHAR(50),price INTEGER);

CREATE TABLE depot(depid VARCHAR(5),addr VARCHAR(50),volume INTEGER);

CREATE TABLE stock(prodid VARCHAR(5),depid VARCHAR(5),quantity INTEGER);

INSERT INTO product(prodid,pname,price) VALUES('p1','tape',2.5);

INSERT INTO product(prodid,pname,price) VALUES('p2','tv',250),('p3','vcr',80);

select * from product;

INSERT INTO depot(depid,addr,volume) VALUES('d1','New York',9000),('d2','Syracuse',6000),('d4','New York',2000);

INSERT INTO stock(prodid,depid,quantity) VALUES('p1','d1',1000),('p1','d2',-100);

INSERT INTO stock(prodid,depid,quantity) VALUES('p1','d4',1200),('p3','d1',3000),('p3','d4',2000),('p2','d4',1500),('p2','d1',-400),('p2','d2',2000);

select * from stock;

ALTER TABLE product ADD CONSTRAINT pk_product PRIMARY KEY(prodid);

ALTER TABLE depot ADD CONSTRAINT pk_depot PRIMARY KEY(depid);

ALTER TABLE stock ADD CONSTRAINT pk_stock PRIMARY KEY(prodid,depid);

ALTER TABLE stock ADD CONSTRAINT fk_stock FOREIGN KEY(prodid) REFERENCES product(prodid);

ALTER TABLE stock ADD CONSTRAINT fk_stock_depot FOREIGN KEY(depid) REFERENCES depot(depid);
