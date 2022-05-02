-- Adding Customers
create or replace function addCustomers (
	_first_name VARCHAR(255),
	_last_name VARCHAR(255),
	_email VARCHAR(255),
	_phone_number INT8
)
returns void
as $main$
begin
	insert into customers (first_name, last_name, email, phone_number)
	values (_first_name, _last_name, _email, _phone_number);
end;
$main$
language plpgsql;

select addCustomers ('Thomas', 'Brady', 'tb12@tb.com', 7771257127)

insert into customers (first_name, last_name, email, phone_number)
values
('Brandon', 'Marshall', 'bmarsh15@iamathlete.com', 5157892921)

select * 
from customers  

-- Adding Invoices
insert into invoices (amount, date_of_purchase, customer_id, sales_person_id)
values
(18940, now()::timestamp, 10, 10) 


-- Adding Sales Person
insert into sales_persons (first_name, last_name, customer_id) 
values 
('Frank', 'Vogel', 10)

-- Adding Mechanics
insert into mechanics (first_name, last_name, store_id, car_type_id, service_id)
values
('Gerald', 'Green', 1, 1, 1),
('Jose', 'Alvorado', 1, 2, 2),
('Francisco', 'Liriano', 2, 3, 3),
('Peyton', 'Hillis', 2, 4, 4)

-- Adding Cars **
insert into cars (car_type_id, sales_person_id, customer_id)
values 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 7),
(7, 7, 6),
(8, 9, 8),
(9, 8, 9),
(10, 10, 10)
-- Adding Car Types
insert into car_types (car_make, car_model, car_year)
values 
('Acura', 'MDX', 2021),
('Toyota', 'Yaris IA', 2020),
('Honda', 'Odysey', 2022),
('Ford', 'Mustang', 2018),
('Tesla', 'Model 3', 2021),
('Chevy', 'Impala', 2017),
('Hyundai', 'Sonata', 2018),
('Mazda', '3', 2016),
('Dodge', 'Durango', 2019),
('Honda', 'Accord', 2016)

-- Adding Services
insert into services (service_type, cars)
values 
('Oil Change', 1),
('Tire Rotation', 2),
('Oil Change', 4),
('Software Update', 5),
('Brake Pads Changed', 6),
('Brake & Oil Filter/Change', 7),
('Oil Change', 10)


-- Adding Inventory
insert into inventory (stock, store_id, car_type_id)
values 
(4, 1, 1),
(2, 1, 2),
(6, 2, 2),
(4, 2, 3),
(5, 1, 4),
(6, 2, 5),
(6, 1, 5),
(1, 2, 6),
(2, 1, 7),
(8, 2, 8),
(7, 2, 9),
(3, 1, 10),
(2, 2, 10)

-- Adding Stores
insert into stores (address)
values 
('1856 Stadium Ln, Kalamazoo, MI 49008'),
('1190 Wicker Park, Chicago, IL 60718')










