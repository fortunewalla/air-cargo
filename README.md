# Air Cargo Database

## Introduction
The goal is to provide a database ready version of the Air Cargo dataset. 



## Background

This is the individual SQL Project for the BCG Rise Course.

Project Name : Air Cargo Analysis

### DESCRIPTION

Air Cargo is an aviation company that provides air transportation services for passengers and freight. Air Cargo uses its aircraft to provide different services with the help of partnerships or alliances with other airlines. The company wants to prepare reports on regular passengers, busiest routes, ticket sales details, and other scenarios to improve the ease of travel and booking for customers.

### Project Objective:

You, as a DBA expert, need to focus on identifying the regular customers to provide offers, analyze the busiest route which helps to increase the number of aircraft required and prepare an analysis to determine the ticket sales details. This will ensure that the company improves its operability and becomes more customer-centric and a favorable choice for air travel.

Note: You must download the dataset from the course resource section in the LMS and create the tables to perform the above objective.

### Dataset description:

Customer: Contains the information of customers

    customer_id — ID of the customer (PK)
    first_name — First name of the customer
    last_name — Last name of the customer
    date_of_birth — Date of birth of the customer
    gender — Gender of the customer

passengers_on_flights: Contains information about the travel details

    aircraft_id — ID of each aircraft in a brand (PK)
    route_id — Route ID of from and to location (FK)
    customer_id — ID of the customer (FK)
    depart — Departure place from the airport
    arrival — Arrival place in the airport
    seat_num — Unique seat number for each passenger
    class_id — ID of travel class
    travel_date — Travel date of each passenger
    flight_num — Specific flight number for each route

ticket_details: Contains information about the ticket details

    p_date — Ticket purchase date
    customer_id — ID of the customer (FK)
    aircraft_id — ID of each aircraft in a brand (FK)
    class_id — ID of travel class
    no_of_tickets — Number of tickets purchased
    a_code — Code of each airport
    price_per_ticket — Price of a ticket
    brand — Aviation service provider for each aircraft

routes: Contains information about the route details

    Route_id — Route ID of from and to location (PK)
    Flight_num — Specific flight number for each route
    Origin_airport — Departure location
    Destination_airport — Arrival location
    Aircraft_id — ID of each aircraft in a brand
    Distance_miles — Distance between departure and arrival location

## Database creation


#### Dataset Files

`customer.csv`

```
customer_id,first_name,last_name,date_of_birth,gender
1,Julie,Sam,12-01-1989,F
2,Steve,Ryan,03-04-1983,M
3,Morris,Lois,09-12-1993,M
4,Cathenna,Emily,14-09-1977,F
5,Aaron,Kim,18-02-1991,M
```

`passengers_on_flights.csv`

```
customer_id,aircraft_id,route_id,depart,arrival,seat_num,class_id,travel_date,flight_num
2,A321,34,CRW,COD,01B,Bussiness,26-01-2019,1117
2,767-301ER,4,JFK,LAX,01E,Economy,02-09-2018,1114
1,ERJ142,9,DEN,LAX,01EP,Economy Plus,26-12-2019,1119
1,CRJ900,30,BUR,STT,01FC,First Class,04-11-2018,1140
5,767-301ER,12,ABI,ADK,02B,Bussiness,02-07-2018,1122
```

`routes.csv`

```
route_id,flight_num,origin_airport,destination_airport,aircraft_id,distance_miles
1,1111,EWR,HNL,767-301ER,4962
2,1112,HNL,EWR,767-301ER,4962
3,1113,EWR,LHR,A321,3466
4,1114,JFK,LAX,767-301ER,2475
```

`ticket_details`

```
p_date,customer_id,aircraft_id,class_id,no_of_tickets,a_code,Price_per_ticket,brand
26-12-2018,27,767-301ER,Economy,1,DAL,130,Emirates
02-02-2020,22,ERJ142,Economy Plus,1,AGB,220,Jet Airways
03-03-2020,21,CRJ900,Bussiness,1,BOH,490,Bristish Airways
04-04-2020,4,767-301ER,First Class,1,AGB,390,Emirates
```


#### Data Checks

We check the files for 4 types of errors:

1. Missing data
2. Duplicate data
3. Improper data
4. Software-based errors


`customer.csv`

Raw form of the data:

```
customer_id,first_name,last_name,date_of_birth,gender
1,Julie,Sam,12-01-1989,F
2,Steve,Ryan,03-04-1983,M
3,Morris,Lois,09-12-1993,M
4,Cathenna,Emily,14-09-1977,F
5,Aaron,Kim,18-02-1991,M
```

Data after opening the CSV in MS Excel:

```
customer_id	first_name	last_name	date_of_birth	gender
1	Julie	Sam	12/1/1989	F
2	Steve	Ryan	3/4/1983	M
3	Morris	Lois	9/12/1993	M
4	Cathenna	Emily	14-09-1977	F
5	Aaron	Kim	18-02-1991	M
```

The reason is that the date format of the CSV (DD-MM-YYYY) differs from the data format that Excel understand for United States region/locale (MM/DD/YYYY).

Solution: Before importing data, define the date format according to the CSV format first.


`passengers_on_flights.csv`

Raw form of the data:


```
customer_id,aircraft_id,route_id,depart,arrival,seat_num,class_id,travel_date,flight_num
2,A321,34,CRW,COD,01B,Bussiness,26-01-2019,1117
2,767-301ER,4,JFK,LAX,01E,Economy,02-09-2018,1114
1,ERJ142,9,DEN,LAX,01EP,Economy Plus,26-12-2019,1119
1,CRJ900,30,BUR,STT,01FC,First Class,04-11-2018,1140
5,767-301ER,12,ABI,ADK,02B,Bussiness,02-07-2018,1122
```

Data after opening the CSV in MS Excel:

```
customer_id	aircraft_id	route_id	depart	arrival	seat_num	class_id	travel_date	flight_num
2	A321	34	CRW	COD	01B	Bussiness	26-01-2019	1117
2	767-301ER	4	JFK	LAX	01E	Economy	2/9/2018	1114
1	ERJ142	9	DEN	LAX	01EP	Economy Plus	26-12-2019	1119
1	CRJ900	30	BUR	STT	01FC	First Class	4/11/2018	1140
5	767-301ER	12	ABI	ADK	02B	Bussiness	2/7/2018	1122
5	ERJ142	18	ANI	BGR	02E	Economy	6/5/2020	1128
```

The reason is that the date format of the CSV (DD-MM-YYYY) differs from the data format that Excel understand for United States region/locale (MM/DD/YYYY).

Solution: Before importing data, define the date format according to the CSV format first.

`routes.csv`

Raw form of the data:


```
route_id,flight_num,origin_airport,destination_airport,aircraft_id,distance_miles
1,1111,EWR,HNL,767-301ER,4962
2,1112,HNL,EWR,767-301ER,4962
3,1113,EWR,LHR,A321,3466
4,1114,JFK,LAX,767-301ER,2475
```

Data after opening the CSV in MS Excel:

```
route_id	flight_num	origin_airport	destination_airport	aircraft_id	distance_miles
1	1111	EWR	HNL	767-301ER	4962
2	1112	HNL	EWR	767-301ER	4962
3	1113	EWR	LHR	A321	3466
4	1114	JFK	LAX	767-301ER	2475
5	1115	LAX	JFK	767-301ER	2475

```

Route no. 11 is missing.

Both match

`ticket_details`

Raw form of the data:


```
p_date,customer_id,aircraft_id,class_id,no_of_tickets,a_code,Price_per_ticket,brand
26-12-2018,27,767-301ER,Economy,1,DAL,130,Emirates
02-02-2020,22,ERJ142,Economy Plus,1,AGB,220,Jet Airways
03-03-2020,21,CRJ900,Bussiness,1,BOH,490,Bristish Airways
04-04-2020,4,767-301ER,First Class,1,AGB,390,Emirates
```

Data after opening the CSV in MS Excel:

```
p_date	customer_id	aircraft_id	class_id	no_of_tickets	a_code	Price_per_ticket	brand
26-12-2018	27	767-301ER	Economy	1	DAL	130	Emirates
2/2/2020	22	ERJ142	Economy Plus	1	AGB	220	Jet Airways
3/3/2020	21	CRJ900	Bussiness	1	BOH	490	Bristish Airways
4/4/2020	4	767-301ER	First Class	1	AGB	390	Emirates

```



The reason is that the date format of the CSV (DD-MM-YYYY) differs from the data format that Excel understand for United States region/locale (MM/DD/YYYY).

Solution: Before importing data, define the date format according to the CSV format first.

Also spelling mistake "Bristish" perhaps? We will correct it to "British".

Also spelling mistake "Bussiness" perhaps? We will correct it to "Business".

Also "Price_per_ticket" must be corrected to "price_per_ticket"


#### Database

1) Load all four files into a single Excel .xls files with dates in US Format.

Since the date is in format DD-MM-YYYY, we change Date Type according to Locale. Selected en-IN as the transformation locale & this changes the date into MM/DD/YYYY which is default for US Locale.
 
2) Correct errors within Excel

* Changed `Price_per_ticket` to `price_per_ticket`
* Changed `Bussiness` to `Business`
* Changed `Bristish Airways` to `British Airways`

3) Save the corrected CSV files.

From the Single Excel, export each sheet to its respective CSV file. 

`ticket_details.csv` has an extra `\r` character attached to the end of the line. This was found using Notepad++ & cleaned up by removing it using replace string.

4) route_id 11 is missing.

5) Only the `customer` and `routes` seems to have unique ID entries, the rest of the tables are mixed information rows.

6) Design database schema

Observations:

Let's assign the Primary Keys (PK) & Foreign Keys (FK) as mentioned below.

customer: customer_id (PK),first_name,last_name,date_of_birth,gender
passengers_of_flights: customer_id(FK),aircraft_id,route_id(FK),depart,arrival,seat_num,class_id,travel_date,flight_num
routes: route_id(PK),flight_num,origin_airport,destination_airport,aircraft_id,distance_miles
ticket_details: p_date,customer_id(FK),aircraft_id,class_id,no_of_tickets,a_code,price_per_ticket,brand

7) Since we will not be updating any data, foreign keys are not really required for our work but it is good to have those relationships for learning.


## Installation

After taking all the above design considerations, we have created two files, one to create the schema & the other to import the data.

In mysql prompt 

Using
`source /path/to/file/aircargo_schema.sql`

`source /path/to/file/aircargo_data.sql`

Or if you prefer using database imported script:

`mysqldump -u user -ppasss aircargo > aircargo.sql`

`source /path/to/file/aircargo.sql`

Should there be any permission errors while importing the data, add the following to the `my.ini` file.

```ini
[mysql]
default-character-set=utf8mb4
local-infile=1

[mysqld]
secure-file-priv=''
local-infile=1
```


These were the questions given for the project

### Questions to answer.

1. Create an ER diagram for the given airlines database.

2. Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.

3. Write a query to display all the passengers (customers) who have traveled in routes 01 to 25. Take data from the passengers_on_flights table.

4. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

5. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

6. Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.

7. Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.

8. Write a query to identify the customers who have traveled by Economy Plus class using Group By and Having clause on the passengers_on_flights table.

9. Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.

10. Write a query to create a view with only business class customers along with the brand of airlines.

11. Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn’t exist.

12. Write a query to create a stored procedure that extracts all the details from the routes table where the traveled distance is more than 2000 miles.

13. Write a query to create a stored procedure that groups the distance traveled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.


#### Sources 

This was inspired by the course project repo of Jonathan James Jie [1]. 

[1] https://github.com/JonathanJamesJie/BCG-SQL-Air-Cargo

[2] https://github.com/kaushik-prasad-dey/sql_data_science_air_cargo_analysis Contains .mwb file. Exported .sql file based on the .mwb

[3] https://github.com/Ad232164/Air-Cargo-Analysis-SQL-project

[4] https://github.com/prajwal-mv/Air-Cargo-Analysis

[5] https://github.com/Satyam1391/SQL_Projects

[6] https://www.linkedin.com/posts/satyam-baviskar-b9891625a_sql-dataanalysis-businessintelligence-activity-7092112493895913473-pUub

[7] https://www.linkedin.com/posts/tushar-jakhalekar-b675181ab_air-cargo-analysis-mysql-activity-7054132881337528320-U_F-

[8]  https://github.com/shubh-2698/AirCargo-Analysis

