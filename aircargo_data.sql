-- mysql import from csv datasets


use aircargo;

-- ----------------------------
-- CUSTOMER LOADING
-- ----------------------------

LOAD DATA INFILE 'cleaneddata/customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id,first_name,last_name,@date_of_birth,gender)
SET date_of_birth = STR_TO_DATE(@date_of_birth, '%m/%d/%Y')
-- default date format of mysql is YYY-MM-DD 
;

select count(customer_id) from customer;

-- ----------------------------
-- ROUTES LOADING
-- ----------------------------
LOAD DATA INFILE 'cleaneddata/routes.csv'
INTO TABLE routes
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- (route_id,flight_num,origin_airport,destination_airport,aircraft_id,distance_miles)
-- SET date_of_birth = STR_TO_DATE(@date_of_birth, '%m/%d/%Y')
-- default date format of mysql is YYY-MM-DD 
;

select count(route_id) from routes;

-- ----------------------------
-- POFLIGHTS LOADING
-- ----------------------------
LOAD DATA INFILE 'cleaneddata/passengers_on_flights.csv'
INTO TABLE poflights
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id,aircraft_id,route_id,depart,arrival,seat_num,class_id,@travel_date,flight_num)

SET travel_date = STR_TO_DATE(@travel_date, '%m/%d/%Y')
-- default date format of mysql is YYY-MM-DD 
;

select count(customer_id) from poflights;

-- ----------------------------
-- TDETAILS LOADING
-- ----------------------------
LOAD DATA INFILE 'cleaneddata/ticket_details.csv'
INTO TABLE tdetails
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@p_date,customer_id,aircraft_id,class_id,no_of_tickets,a_code,price_per_ticket,brand)

Set p_date = STR_TO_DATE(@p_date, '%m/%d/%Y')
-- default date format of mysql is YYY-MM-DD 
;

select count(p_date) from tdetails;