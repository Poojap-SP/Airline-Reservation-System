# ✈️ Airline Reservation System

## 📋 Project Overview
The **Airline Reservation System** is a MySQL-based database designed to manage flight schedules, customer information, seat allocation, and booking details. It helps airlines track available seats, manage bookings and cancellations, and generate summary reports.

This project uses **MySQL Workbench** as the primary tool for database management.

---

## ✅ Features

- Manage flights with schedules, destinations, and seat capacity
- Store customer details securely
- Allocate seats and track availability
- Handle bookings and cancellations through automated triggers
- Generate reports summarizing bookings and flight occupancy

---

## 🛠 Tools Used

- **MySQL Workbench** – Interface for designing and managing the database
- **MySQL Server** – Relational database system
- SQL scripting for defining tables, triggers, views, and reports

---

## 🚀 Setup Instructions

### 1. Install MySQL and MySQL Workbench
- Download and install from [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)

### 2. Create the Database
```sql
CREATE DATABASE airline_reservation;
USE airline_reservation;
## ✅ Instructions for Running the Project

### 3. Run the Schema Script

Execute the `schema.sql` file to create the necessary database structure. This script sets up the following tables:

- **Flights** – Stores flight information including flight number, origin, destination, schedule, and total seats
- **Customers** – Stores customer profiles with name, contact details, and email
- **Seats** – Tracks seat availability for each flight with seat numbers and status
- **Bookings** – Records flight reservations, including customer, seat, and booking status

Run this script in **MySQL Workbench** or through the MySQL command line.

---

### 4. Insert Sample Data

Run the `dummy_data.sql` file to insert sample records into your tables. The dataset includes:

- Multiple flight schedules across different routes
- Customer profiles with unique emails and contact information
- Seat allocation for each flight
- Sample bookings to test the system

This data will help simulate real-world scenarios for testing and validation.

---

### 5. Create Triggers

Run the `triggers.sql` file to create automation logic that:
## 📜 Key SQL Components

### ✅ Tables

- **Flights**  
  Stores flight schedules, including flight number, origin, destination, departure/arrival times, and total seat capacity.

- **Customers**  
  Stores customer profiles with information such as name, email, phone number, and other contact details.

- **Seats**  
  Tracks seat availability for each flight, including seat numbers and whether the seat is available or booked.

- **Bookings**  
  Manages reservations and cancellations by linking customers to flights and specific seats. It also tracks booking dates and status.

---

### ✅ Triggers

- Automatically update seat availability when a booking is made.
- Restore seat availability when a booking is cancelled.
- Ensure that the seat allocation is always consistent and prevent overbooking scenarios.

---

### ✅ Views

- Provide easy-to-access filtered data for reporting purposes.
- Examples:
  - List of available seats for a flight
  - Summary of bookings per flight
- Views simplify data retrieval and make reports more efficient to generate.

---

### ✅ Queries

- **Search flights** by origin and destination to find available schedules.
- **Retrieve available seats** before confirming bookings.
- **Summarize bookings** by flight to analyze occupancy and performance.

These components work together to ensure seamless management of flights, customers, and bookings while maintaining data integrity and providing actionable insights.

