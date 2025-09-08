
-- create
-- Flights Table
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    total_seats INT NOT NULL
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

-- Seats Table
CREATE TABLE Seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT,
    seat_number VARCHAR(10),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id) ON DELETE CASCADE
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    seat_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Booked', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

-- Sample Flights
INSERT INTO Flights (flight_number, origin, destination, departure_time, arrival_time, total_seats)
VALUES 
('AI101', 'Delhi', 'Mumbai', '2025-09-15 08:00:00', '2025-09-15 10:00:00', 150),
('AI102', 'Delhi', 'Bangalore', '2025-09-16 09:00:00', '2025-09-16 12:00:00', 180);

-- Sample Customers
INSERT INTO Customers (name, email, phone)
VALUES
('John Doe', 'john@example.com', '9876543210'),
('Jane Smith', 'jane@example.com', '8765432109');

-- Insert Seats for flights (example for flight_id = 1)
INSERT INTO Seats (flight_id, seat_number, is_available)
SELECT 1, CONCAT('A', LPAD(n, 2, '0')), TRUE FROM (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS numbers;

-- Bookings
INSERT INTO Bookings (customer_id, flight_id, seat_id)
VALUES (1, 1, 1), (2, 1, 2);

SELECT seat_id, seat_number FROM Seats
WHERE flight_id = 1 AND is_available = TRUE;

SELECT * FROM Flights
WHERE origin = 'Delhi' AND destination = 'Mumbai'
  AND departure_time >= NOW();


DELIMITER //

CREATE TRIGGER after_booking_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Seats SET is_available = FALSE WHERE seat_id = NEW.seat_id;
END; //

DELIMITER ;


DELIMITER //

CREATE TRIGGER after_booking_update
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.status = 'Cancelled' THEN
        UPDATE Seats SET is_available = TRUE WHERE seat_id = NEW.seat_id;
    END IF;
END; //

DELIMITER ;


SELECT f.flight_number, f.origin, f.destination, COUNT(b.booking_id) AS total_bookings
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id AND b.status = 'Booked'
GROUP BY f.flight_id, f.flight_number, f.origin, f.destination;


CREATE VIEW Available_Seats AS
SELECT flight_id, seat_number FROM Seats WHERE is_available = TRUE;

CREATE VIEW Booking_Summary AS
SELECT f.flight_number, f.origin, f.destination, COUNT(b.booking_id) AS booked_seats
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id AND b.status = 'Booked'
GROUP BY f.flight_number, f.origin, f.destination;

