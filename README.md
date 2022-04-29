# order-and-inventory-system
Order and Inventory System

database 

CREATE KEYSPACE ordInv_db WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};
use ordInv_db ;

Create Table staff (
username text,
name text,
password text,
email text,
position text,
primary key (username)
);


INSERT INTO ordInv_db.staff (username,  name  , password, email, position ) VALUES ('hm',  'Ah Ming',  '111111111', 'hm@aa.com','Manager' );
INSERT INTO ordInv_db.staff (username,  name  , password, email, position ) VALUES ('jl',  'Ah Luo', '222222222', 'jl@aa.com','Staff' );
INSERT INTO ordInv_db.staff (username,  name  , password, email, position ) VALUES ('ew',  'Ah Wei', '333333333', 'ew@aa.com','Manager' );
INSERT INTO ordInv_db.staff (username,  name  , password, email, position ) VALUES ('wl',  'Ah Lun', '999999999', 'wl@aa.com','Staff' );

Create Table Customer(
cust_id int,
name text,
email text,
ph_num text,
primary key (cust_id )
);


INSERT INTO ordInv_db.Customer ( cust_id ,  name  , email , ph_num ) VALUES (1,   'Rodriguez',  'rod@aa.com', '011-1231231' );
INSERT INTO ordInv_db.Customer ( cust_id ,  name  , email , ph_num ) VALUES (2,   'Johnson',  'joh@aa.com', '012-1231231' );
INSERT INTO ordInv_db.Customer ( cust_id ,  name  , email , ph_num ) VALUES (3,   'Davis',  'dav@aa.com', '013-1231231' );


Create Table product (
product_id int,
product_name text,
category text,
location text,
manufacturer text,
supplier text,
model text,
description text,
comments text,
transaction int,
quantity int,
price double,
reorderLevel int,
targetStockLevel int,
discontinued text,
primary key (product_id)

);


INSERT INTO ordInv_db.product (product_id,product_name,category,location,manufacturer,supplier,model,description,comments,transaction,quantity,price,reorderLevel,targetStockLevel,discontinued) VALUES (1,'The Comfort Zone',  'SHOES',  'No. 12A, Jalan Suria Puchong 1, Perniagaan Suria Puchong Gateway,Puchong,Selangor', 'Puma','Jackson Lee','NMZ-021','This is the latest product of Puma in 2020','Stock located at the main location',690,1000,300.00,250,1000,'Not discontinued');
INSERT INTO ordInv_db.product (product_id,product_name,category,location,manufacturer,supplier,model,description,comments,transaction,quantity,price,reorderLevel,targetStockLevel,discontinued) VALUES (2,'All About Feet',  'SHOES',  'No. 12A, Jalan Suria Puchong 1, Perniagaan Suria Puchong Gateway,Puchong,Selangor', 'Bastion','Jasmine Low','KAB-059','This is the latest product of Bastion in 2020','Stock located at the main location',800,1000,150.00,250,1000,'Not discontinued');



create table orders (
order_id int,
cust_id int,
add_from text,
add_to text,
order_Date date,
staff_name text,
total_price double,
status text,
primary key (order_id)
); 




INSERT INTO ordInv_db.orders ( order_id, cust_id , add_from , add_to , order_Date , staff_name, total_price , status ) VALUES (1,1, 'Kuala Lumpur' , 'Selangor' , '2020-06-01', 'Ah Hong' , 10.00, 'delivered');
INSERT INTO ordInv_db.orders ( order_id,  cust_id , add_from , add_to , order_Date , staff_name, total_price , status ) VALUES (2,2, 'Kuala Lumpur' , 'Selangor' , '2020-08-01', 'Ah Hong' , 10.50, 'pending');
INSERT INTO ordInv_db.orders ( order_id, cust_id ,  add_from , add_to , order_Date , staff_name, total_price , status ) VALUES (3,2, 'Johor' , 'Selangor' , '2020-08-05', 'Ah Hong' , 10.00, 'canceled');
INSERT INTO ordInv_db.orders ( order_id, cust_id ,  add_from , add_to , order_Date , staff_name, total_price , status ) VALUES (6,2, 'Johor' , 'Selangor' , '2020-08-15', 'Ah Hong' , 10.00, 'canceled');




create table orders_details (
order_id int,
product_id int, 
qty int,
sell_price double,
disc double,
subtotal double,
primary key ((order_id,product_id))
);

INSERT INTO ordInv_db.orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal  ) VALUES (1,1, 1 , 5.00 , 0,5);
INSERT INTO ordInv_db.orders_details  ( order_id, product_id , qty , sell_price , disc,subtotal  ) VALUES (1,2, 1 , 5.00 , 0,5);

INSERT INTO ordInv_db.orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal  ) VALUES (2,1, 1 , 5.00 , 0,5);
INSERT INTO ordInv_db.orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal  ) VALUES (2,2, 1 , 5.50 , 0,5.5);
INSERT INTO ordInv_db.orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal  ) VALUES (6,1, 1 , 10.00 , 0,10);

