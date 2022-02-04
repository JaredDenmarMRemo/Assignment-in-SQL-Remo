--ADMIN--

create table  Admin_table (admin_id varchar(6) primary key constraint admin_idc check(admin_id like 'A%'),
"email" varchar(20),
"password" varchar(20));

--USER--

create table User_table (user_id varchar(6) primary key constraint user_idc check(user_id like 'U%'),
user_name char(20),
email varchar(20),
"password" varchar(20),
date_of_reg date,
address varchar(20),
contact_no number(20));

--PRODUCT--

create table Product_table (product_id varchar(6) primary key,
product_name varchar(20),
category_id varchar(6),
product_price number(8,2),
product_image varchar(20),
product_available_qty number(8,0),
constraint product_idc check (product_id like 'P%'));

--CATEGORY--

create table Category_table (category_id varchar(6) primary key references Product_table,
category_name varchar(20),
constraint category_idc check (category_id like 'CAT%'));

--COUPON--

create table Coupon_table (coupon_id varchar(6),
coupon_name varchar(20),
discount_val number(10,2),
expiry_date date,
constraint coupon_idc check (coupon_id like 'COU%'));

--CART--

create table Cart_table (cart_id varchar(6) primary key,
user_id varchar(6) unique,
constraint cart_idc check (cart_id like 'CAR%'));

--CART ITEM--
create table Cart_Item_table(cart_item_id varchar(6) primary key,
cart_id varchar(6) references cart_table, user_id varchar(6) references cart_table,product_id varchar(6), product_qty number(6),
constraint cart_item_idc check (cart_item_id like 'CII%'));

--ORDER--

create table Order_table (order_id varchar(6), cart_id varchar(6) references cart_table, 
user_id varchar(6) references user_table,
order_date date, delivery_date date,coupon_id varchar(6), bill_amount number(6,2), 
payment_method varchar(20) constraint payment_methodc check(payment_method in('COD','Credit','Debit','Wallet')),
constraint order_idc check (order_id like 'O%'));



