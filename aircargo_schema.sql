-- mysql database creation

-- start from customers.csv

DROP SCHEMA IF EXISTS aircargo;

CREATE SCHEMA IF NOT EXISTS aircargo; 
-- [CHARACTER SET utf8mb4]
-- [COLLATE utf8mb4_0900_ai_ci];

-- SELECT * FROM information_schema.schemata;
-- | def | aircargo | utf8mb4 | utf8mb4_0900_ai_ci | NULL | NO |

use aircargo;

-- customer: customer_id (PK),first_name,last_name,date_of_birth,gender
-- 1,Julie,Sam,1/12/1989,F

create table customer(
customer_id int primary key,
first_name varchar(100),
last_name varchar(100),
date_of_birth date,
gender varchar(1)
);

describe customer;

-- routes: route_id,flight_num,origin_airport,destination_airport,aircraft_id,distance_miles
-- 1,1111,EWR,HNL,767-301ER,4962

create table routes(
route_id int primary key,
flight_num int,
origin_airport varchar(3),
destination_airport varchar(3),
aircraft_id varchar(40),
distance_miles int
);

describe routes;

-- passengers_on_flights: customer_id,aircraft_id,route_id,depart,arrival,seat_num,class_id,travel_date,flight_num
-- 2,A321,34,CRW,COD,01B,Bussiness,1/26/2019,1117

create table poflights(
customer_id int,
aircraft_id varchar(40),
route_id int,
depart varchar(3),
arrival varchar(3),
seat_num varchar(10),
class_id varchar(40),
travel_date date,
flight_num int,
CONSTRAINT fk_poflights_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
CONSTRAINT fk_poflights_route_id FOREIGN KEY (route_id) REFERENCES routes(route_id)

);

describe poflights;

-- ticket_details: p_date,customer_id,aircraft_id,class_id,no_of_tickets,a_code,price_per_ticket,brand
-- 12/26/2018,27,767-301ER,Economy,1,DAL,130,Emirates
create table tdetails(
p_date date,
customer_id int,
aircraft_id varchar(40),
class_id varchar(40),
no_of_tickets int,
a_code varchar(3),
price_per_ticket int,
brand varchar(40),
CONSTRAINT fk_tdetails_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

describe tdetails;