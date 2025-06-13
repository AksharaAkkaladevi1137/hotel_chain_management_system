CREATE DATABASE Hotel_chain_management_system;

USE Hotel_chain_management_system;

CREATE TABLE Hotel(
hotel_code INT NOT NULL PRIMARY KEY,
hotel_name VARCHAR(250),
city VARCHAR(250),
number_of_rooms INT,
star_rating FLOAT
);

CREATE TABLE Rooms (
room_number INT NOT NULL PRIMARY KEY,
room_type VARCHAR(250),
price_per_night INT,
availability_status VARCHAR(250),
hotel_id INT,
FOREIGN KEY(hotel_id) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Guests (
 guest_ID INT NOT NULL PRIMARY KEY,
 guest_name VARCHAR(250),
 loyality_level VARCHAR(250)
);

CREATE TABLE Bookings(
booking_ID INT NOT NULL PRIMARY KEY,
guest_ID INT,
room_ID INT,
chech_in DATETIME,
check_out DATETIME,
dates DATETIME,
total_bill FLOAT,
FOREIGN KEY(guest_id) REFERENCES Guests(guest_id),
FOREIGN KEY(room_id) REFERENCES Rooms(room_number)
);

CREATE TABLE Roles(
role_id INT NOT NULL PRIMARY KEY,
role_name VARCHAR(250)
);

CREATE  TABLE Employee (
employee_ID INT NOT NULL PRIMARY KEY,
emp_name VARCHAR(250),
role_id INT,
hotel_assidned INT,
shift_details VARCHAR(250),
FOREIGN KEY(role_id) REFERENCES Roles(role_id),
FOREIGN KEY(room_number) REFERENCES Rooms(room_number)
);

CREATE TABLE Feedback(
frrdback_id INT NOT NULL PRIMARY KEY,
booking_id INT,
comments VARCHAR(250),
rating FLOAT,
FOREIGN KEY(booking_id) REFERENCES Bookings(booking_ID)
);


-- HOTEL
INSERT INTO Hotel VALUES
(1, 'Ocean View Resort', 'Goa', 120, 4.5),
(2, 'Royal Heritage', 'Jaipur', 80, 4.8),
(3, 'Green Valley Inn', 'Shimla', 60, 4.2),
(4, 'City Comforts', 'Bangalore', 150, 4.0),
(5, 'Hilltop Escape', 'Manali', 70, 4.3),
(6, 'Urban Stay', 'Delhi', 100, 3.9);

-- ROOMS
INSERT INTO Rooms VALUES
(101, 'Deluxe', 4500, 'Available', 1),
(102, 'Standard', 3000, 'Occupied', 1),
(201, 'Suite', 6500, 'Available', 2),
(202, 'Deluxe', 4800, 'Occupied', 2),
(301, 'Standard', 3200, 'Available', 3),
(302, 'Suite', 7000, 'Occupied', 3);

-- GUESTS
INSERT INTO Guests VALUES
(1, 'Amit Sharma', 'Gold'),
(2, 'Reena Das', 'Silver'),
(3, 'Siddharth Rao', 'Platinum'),
(4, 'Nikita Singh', 'Bronze'),
(5, 'Rakesh Kumar', 'Gold'),
(6, 'Priya Mehta', 'Silver');

-- BOOKINGS
INSERT INTO Bookings VALUES
(1, 1, 102, '2025-06-01 14:00:00', '2025-06-05 11:00:00', '2025-06-01', 18000),
(2, 2, 201, '2025-06-03 15:00:00', '2025-06-06 10:00:00', '2025-06-03', 19500),
(3, 3, 202, '2025-06-05 13:00:00', '2025-06-08 12:00:00', '2025-06-05', 14400),
(4, 4, 302, '2025-06-07 12:00:00', '2025-06-10 12:00:00', '2025-06-07', 21000),
(5, 5, 101, '2025-06-09 11:00:00', '2025-06-12 11:00:00', '2025-06-09', 13500),
(6, 6, 301, '2025-06-10 13:00:00', '2025-06-13 11:00:00', '2025-06-10', 9600);

-- ROLES
INSERT INTO Roles VALUES
(1, 'Manager'),
(2, 'Receptionist'),
(3, 'Housekeeping'),
(4, 'Chef'),
(5, 'Security'),
(6, 'Bellboy');

-- EMPLOYEE
INSERT INTO Employee VALUES
(1, 'Rajiv Verma', 1, 1, 'Morning'),
(2, 'Sneha Kapoor', 2, 2, 'Evening'),
(3, 'Naveen Joshi', 3, 3, 'Night'),
(4, 'Anjali Deshmukh', 4, 4, 'Morning'),
(5, 'Tarun Singh', 5, 5, 'Evening'),
(6, 'Meena Kumari', 6, 6, 'Night');

-- FEEDBACK
INSERT INTO Feedback VALUES
(1, 1, 'Excellent stay and service.', 4.8),
(2, 2, 'Clean rooms and helpful staff.', 4.5),
(3, 3, 'Food was delicious.', 4.7),
(4, 4, 'Wi-Fi was weak, but overall good.', 4.0),
(5, 5, 'Loved the location and view.', 4.6),
(6, 6, 'Good experience, will visit again.', 4.4);
