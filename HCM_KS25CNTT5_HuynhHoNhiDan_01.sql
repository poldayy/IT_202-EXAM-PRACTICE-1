create database SalesManagement;
use SalesManagement;

-- 1. 
create table products(
	product_id varchar(20) primary key,
    product_name varchar(100) not null,
    manufacturer varchar(100) not null,
    product_price decimal(18,4) not null,
    amount int not null
);

create table customers(
	customer_id varchar(20) primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    phone varchar(15) unique,
    address varchar(100) not null
);

create table orders(
	order_id varchar(20) primary key,
    order_date datetime default current_timestamp,
    total_price decimal(18,4) not null
);

create table order_detail(
	order_id varchar(20) not null,
	product_id varchar(100) not null,
    customer_id varchar(20) not null unique,
    quantity int not null,
    price decimal(18,4) not null,
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references products(product_id),
    foreign key(customer_id) references customers(customer_id)
);

-- 2. 
alter table orders
add column note varchar(200);

alter table products
rename column manufacturer to Nha_San_Xuat;

drop table order_detail;
drop table orders;

-- 3. 
insert into products
values
('P001', 'MacBook Air M2', 'Apple', 18000000, 10),
('P002', 'MacBook Pro M3', 'Apple', 25000000, 5),
('P003', 'Dell XPS 13', 'Dell', 20000000, 7),
('P004', 'HP Pavilion', 'HP', 15000000, 8),
('P005', 'Asus TUF Gaming', 'Asus', 17000000, 6);

insert into customers
values
('C001', 'Nguyen Van A', 'a@gmail.com', '0901234567', 'Ha Noi'),
('C002', 'Tran Thi B', 'b@gmail.com', '0912345678', 'HCM'),
('C003', 'Le Van C', 'c@gmail.com', NULL, 'Da Nang'),
('C004', 'Pham Thi D', 'd@gmail.com', '0923456789', 'Hai Phong'),
('C005', 'Hoang Van E', 'e@gmail.com', '0934567890', 'Can Tho');

insert into orders
values
('DH001', '2026-04-01', 0, 'C001'),
('DH002', '2026-04-02', 0, 'C002'),
('DH003', '2026-04-03', 0, 'C001'),
('DH004', '2026-04-04', 0, 'C004'),
('DH005', '2026-04-05', 0, 'C005');

insert order_detail
values
('DH001', 'P001','C002', 1, 18000000),
('DH001', 'P004', 'C002', 2, 15000000),
('DH002', 'P003', 'C003', 1, 25000000),
('DH002', 'P003', 'C004', 1, 20000000),
('DH003', 'P001', 'C004', 1, 18000000),
('DH004', 'P005', 'C001', 1, 17000000),
('DH005', 'P003', 'C005', 2, 20000000);

update products
set product_price = product_price * 1.1
where Nha_San_Xuat = 'Apple';

delete from customers
where phone is null;


-- 4.
select * from products
where product_price between 10000000 and 20000000;

select product_name from products
where product_id in ('P001' , 'P003', 'P004', 'P005');

select * from customers
where customer_id in ('C002', 'C004');