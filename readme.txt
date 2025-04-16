# Indian Railways Database Management System

## Overview
This project implements a database management system for Indian Railways. It includes tables, triggers, stored procedures, and sample data to manage train schedules, passenger bookings, seat availability, payments, and more.

## Files and Their Purpose

1. **tables.sql**  
   - Contains the schema definitions for all tables in the database.
   - Includes tables like `passenger`, `train`, `station`, `route`, `seat`, `ticket`, `payment`, etc.

2. **sample_Data.sql**  
   - Populates the database with sample data for testing.
   - Includes sample entries for stations, trains, passengers, routes, seats, and payments.

3. **Triggers.sql**  
   - Defines triggers to automate actions such as updating seat availability, handling refunds, and maintaining data consistency.

4. **procedures_triggers.sql**  
   - Contains stored procedures for various operations like booking tickets, checking seat availability, generating bills, and calculating revenue.

5. **calls.sql**  
   - Demonstrates how to call the stored procedures to perform operations like booking tickets, checking schedules, and managing payments.

## Key Features
- **Dynamic Seat Management**: Automatically updates seat availability and status based on bookings and cancellations.
- **Payment Integration**: Tracks payments and refunds for tickets.
- **Stored Procedures**: Simplifies complex operations like booking, cancellations, and revenue calculations.
- **Triggers**: Ensures data consistency and automates routine tasks.

## How to Use
1. Run `tables.sql` to create the database schema.
2. Run `sample_Data.sql` to populate the database with sample data.
3. Use `Triggers.sql` to set up triggers for automated actions.
4. Use `procedures_triggers.sql` to define stored procedures for various operations.
5. Use `calls.sql` to test the stored procedures and triggers.

## Prerequisites
- MySQL or a compatible database system.
- Basic knowledge of SQL for running scripts and queries.

## Notes
- Ensure the database `indianrailways` is created before running the scripts.
- Modify the sample data as needed to suit specific use cases.
- Handle errors gracefully when calling stored procedures.

## Contact
For any issues or suggestions, please contact the project maintainer.
