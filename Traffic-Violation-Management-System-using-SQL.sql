create database vehicles;
use vehicles;

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_number VARCHAR(15) UNIQUE,
    vehicle_type VARCHAR(20),
    owner_city VARCHAR(50),
    registration_date DATE
);

INSERT INTO vehicles VALUES
(1,'MH12AB1234','Car','Pune','2021-06-15'),
(2,'DL8CAF9876','Bike','Delhi','2020-09-10'),
(3,'MH01CD4567','Car','Mumbai','2022-01-20'),
(4,'KA05EF7788','Bike','Bangalore','2019-03-12'),
(5,'TN09GH3344','Car','Chennai','2018-11-05'),
(6,'UP32JK2211','Car','Lucknow','2020-07-18'),
(7,'GJ01LM8899','Truck','Ahmedabad','2017-02-14'),
(8,'RJ14NP4455','Bike','Jaipur','2021-09-09'),
(9,'WB20QR6677','Car','Kolkata','2019-12-30'),
(10,'KL07ST1122','Bike','Kochi','2022-05-25'),
(11,'DL10UV9988','Car','Delhi','2020-10-10'),
(12,'MH14WX5566','Car','Pune','2021-01-01'),
(13,'KA03YZ3344','Bike','Bangalore','2019-08-08'),
(14,'TN10AA1212','Car','Chennai','2018-04-22'),
(15,'HR26BB3434','Car','Gurgaon','2022-03-17');

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    license_number VARCHAR(20) UNIQUE,
    age INT,
    city VARCHAR(50)
);
INSERT INTO drivers VALUES
(1,'Rahul Sharma','DL1001',28,'Delhi'),
(2,'Amit Verma','MH1002',35,'Mumbai'),
(3,'Sneha Patil','MH1003',26,'Pune'),
(4,'Rohit Mehta','GJ1004',42,'Ahmedabad'),
(5,'Anjali Singh','UP1005',30,'Lucknow'),
(6,'Vikas Rao','KA1006',38,'Bangalore'),
(7,'Neha Kapoor','DL1007',24,'Delhi'),
(8,'Suresh Iyer','TN1008',45,'Chennai'),
(9,'Manoj Yadav','BR1009',33,'Patna'),
(10,'Pooja Nair','KL1010',29,'Kochi'),
(11,'Arjun Malhotra','DL1011',40,'Delhi'),
(12,'Kiran Joshi','MH1012',36,'Pune'),
(13,'Deepak Chauhan','RJ1013',34,'Jaipur'),
(14,'Sanjay Das','WB1014',41,'Kolkata'),
(15,'Ritu Arora','HR1015',27,'Gurgaon');

CREATE TABLE violations (
    violation_id INT PRIMARY KEY,
    violation_type VARCHAR(50),
    fine_amount INT,
    severity_level VARCHAR(20)
);

INSERT INTO violations VALUES
(1, 'Overspeeding', 1000, 'High'),
(2, 'Signal Jump', 1500, 'High'),
(3, 'No Helmet', 500, 'Medium'),
(4, 'Wrong Parking', 300, 'Low'),
(5, 'Drunk Driving', 5000, 'Critical');

CREATE TABLE violation_records (
    record_id INT PRIMARY KEY,
    vehicle_id INT,
    driver_id INT,
    violation_id INT,
    location VARCHAR(100),
    violation_date DATE,
    paid_status VARCHAR(10),

    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (violation_id) REFERENCES violations(violation_id)
);
INSERT INTO violation_records VALUES
(1,1,3,1,'MG Road','2024-01-05','Paid'),
(2,2,1,3,'Ring Road','2024-01-06','Paid'),
(3,3,2,2,'Andheri East','2024-01-07','Unpaid'),
(4,4,6,1,'Whitefield','2024-01-08','Paid'),
(5,5,8,4,'T Nagar','2024-01-08','Paid'),
(6,6,5,1,'Hazratganj','2024-01-09','Unpaid'),
(7,7,4,5,'SG Highway','2024-01-10','Paid'),
(8,8,13,3,'MI Road','2024-01-11','Paid'),
(9,9,14,2,'Salt Lake','2024-01-11','Unpaid'),
(10,10,10,3,'MG Road','2024-01-12','Paid'),

(11,11,7,1,'Connaught Place','2024-01-13','Paid'),
(12,12,12,4,'Hinjewadi','2024-01-13','Paid'),
(13,13,6,2,'Electronic City','2024-01-14','Unpaid'),
(14,14,8,5,'Anna Nagar','2024-01-15','Paid'),
(15,15,15,1,'Cyber City','2024-01-16','Paid'),

(16,1,3,2,'FC Road','2024-01-17','Paid'),
(17,2,1,1,'Ring Road','2024-01-18','Unpaid'),
(18,3,2,3,'Bandra','2024-01-19','Paid'),
(19,4,6,4,'Indiranagar','2024-01-20','Paid'),
(20,5,8,1,'Velachery','2024-01-21','Paid'),

(21,6,5,2,'Alambagh','2024-01-22','Unpaid'),
(22,7,4,1,'Maninagar','2024-01-23','Paid'),
(23,8,13,4,'C Scheme','2024-01-24','Paid'),
(24,9,14,3,'Howrah','2024-01-25','Unpaid'),
(25,10,10,1,'Vyttila','2024-01-26','Paid');

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    record_id INT,
    payment_date DATE,
    payment_mode VARCHAR(20),
    payment_status VARCHAR(20),

    FOREIGN KEY (record_id) REFERENCES violation_records(record_id)
);

INSERT INTO payments VALUES
(1,1,'2024-01-05','UPI','Success'),
(2,2,'2024-01-06','Card','Success'),
(3,4,'2024-01-08','Cash','Success'),
(4,5,'2024-01-08','UPI','Success'),
(5,7,'2024-01-10','Card','Success'),
(6,8,'2024-01-11','UPI','Success'),
(7,10,'2024-01-12','Cash','Success'),
(8,11,'2024-01-13','UPI','Success'),
(9,12,'2024-01-13','Card','Success'),
(10,14,'2024-01-15','UPI','Success');

select * from payments;
select * from violation_records;
select * from violations;
select * from vehicles;
select * from drivers;
-- unpaid recoards 
SELECT record_id, violation_id, location
FROM violation_records
where paid_status = "Unpaid";
-- city vise 
SELECT vehicle_number, vehicle_type,owner_city
FROM vehicles
WHERE owner_city = 'Pune';
-- date vise 
SELECT record_id, location, violation_date, paid_status,driver_id
FROM violation_records
WHERE violation_date = '2024-01-10';
-- High-fine vise 
SELECT violation_type, fine_amount
FROM violations
WHERE fine_amount > 1000;
-- only first few records 
SELECT * FROM drivers
LIMIT 5;
--   name and license 
SELECT 
name AS driver_name,
license_number AS license
FROM drivers;

-- dates by descending order 

SELECT record_id, violation_date, paid_status 
FROM violation_records
ORDER BY violation_date DESC;
-- violation details with driver names
SELECT 
d.name AS driver_name,
v.violation_type,
vr.location,
vr.violation_date
FROM violation_records vr
INNER JOIN drivers d ON vr.driver_id = d.driver_id
INNER JOIN violations v ON vr.violation_id = v.violation_id;

-- Show all violations even if driver info is missing using alias

SELECT 
vr.record_id,
d.name
FROM drivers d

RIGHT JOIN violation_records  vr  ON d.driver_id = vr.driver_id;    

-- using if condition cheack the adult or minor
SELECT 
name,
if( age >= 18, 'Adult','Minor') AS age_status
FROM drivers;

-- total fine collection
SELECT 
    SUM(v.fine_amount) AS total_revenue
FROM violation_records vr
JOIN violations v ON vr.violation_id = v.violation_id
WHERE vr.paid_status = 'Paid';

-- use of join + windows function 

SELECT 
vr.location,
COUNT(*) AS total_violations
FROM violation_records vr
JOIN violations v ON vr.violation_id = v.violation_id
GROUP BY vr.location
ORDER BY total_violations DESC;




