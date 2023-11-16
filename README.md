# Air Cargo Database

## Introduction
The goal is to provide a database ready version of the Air Cargo dataset. This was inspired by the course project repo of Jonathan James Jie [1]. 

## Database creation

## Installation

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

    customer_id — ID of the customer
    first_name — First name of the customer
    last_name — Last name of the customer
    date_of_birth — Date of birth of the customer
    gender — Gender of the customer

passengers_on_flights: Contains information about the travel details

    aircraft_id — ID of each aircraft in a brand
    route_id — Route ID of from and to location
    customer_id — ID of the customer
    depart — Departure place from the airport
    arrival — Arrival place in the airport
    seat_num — Unique seat number for each passenger
    class_id — ID of travel class
    travel_date — Travel date of each passenger
    flight_num — Specific flight number for each route

ticket_details: Contains information about the ticket details

    p_date — Ticket purchase date
    customer_id — ID of the customer
    aircraft_id — ID of each aircraft in a brand
    class_id — ID of travel class
    no_of_tickets — Number of tickets purchased
    a_code — Code of each airport
    price_per_ticket — Price of a ticket
    brand — Aviation service provider for each aircraft

routes: Contains information about the route details

    Route_id — Route ID of from and to location
    Flight_num — Specific flight number for each route
    Origin_airport — Departure location
    Destination_airport — Arrival location
    Aircraft_id — ID of each aircraft in a brand
    Distance_miles — Distance between departure and arrival location

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

[1] https://github.com/JonathanJamesJie/BCG-SQL-Air-Cargo
