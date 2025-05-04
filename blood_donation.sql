create database blood_donation;
use blood_donation;
-- donor table
create table donor (
    donorid int primary key auto_increment ,
    name varchar(100) not null,
    age int,
    gender varchar(10),
    bloodgroup varchar(5),
    contactnumber varchar(15),
    address text,
    lastdonationdate date
);

-- recipient table
create table recipient (
    recipientid int primary key ,
    name varchar(100) not null,
    age int,
    gender varchar(10),
    bloodgroup varchar(5),
    contactnumber varchar(15),
    address text,
    requestdate date
);

-- hospital table
create table hospital (
    hospitalid int primary key ,
    name varchar(100) not null,
    location text,
    contactnumber varchar(15)
);

-- admin table
create table admin (
    adminid int primary key ,
    username varchar(50) unique not null,
    password varchar(100) not null
);

--  donation table
create table donation (
    donationid int primary key ,
    donorid int,
    hospitalid int,
    donationdate date,
    quantity int,
    foreign key (donorid) references donor(donorid) on delete cascade,
    foreign key (hospitalid) references hospital(hospitalid) on delete set null
);

-- bloodrequest table
create table bloodrequest (
    requestid int primary key ,
    recipientid int,
    hospitalid int,
    bloodgroup varchar(5),
    requestdate date,
    status enum('pending', 'approved', 'rejected'),
    foreign key (recipientid) references recipient(recipientid) on delete cascade,
    foreign key (hospitalid) references hospital(hospitalid) on delete set null);
select * from bloodrequest;
insert into donor (name, age, gender, bloodgroup, contactnumber, address, lastdonationdate) values
('john doe', 30, 'male', 'a+', '1234567890', '123 st, city', '2024-12-01'),
('jane smith', 28, 'female', 'b-', '1234567891', '456 ave, city', '2024-11-15'),
('ali khan', 35, 'male', 'o+', '1234567892', '789 rd, city', '2024-10-10'),
('maya lee', 32, 'female', 'ab+', '1234567893', '147 blvd, city', '2024-09-25'),
('rahul verma', 27, 'male', 'b+', '1234567894', '369 sq, city', '2025-01-01'),
('anna white', 40, 'female', 'a-', '1234567895', '741 circle, city', '2024-08-20'),
('emily green', 31, 'female', 'o-', '1234567896', '852 st, city', '2024-12-10'),
('omar said', 29, 'male', 'b+', '1234567897', '951 lane, city', '2024-10-30'),
('leo walker', 26, 'male', 'ab-', '1234567898', '159 court, city', '2025-02-05'),
('nina brown', 34, 'female', 'a+', '1234567899', '753 ave, city', '2024-11-20'),
('sam fox', 36, 'male', 'b-', '2234567890', '951 sq, city', '2024-12-15'),
('rita ray', 33, 'female', 'ab+', '2234567891', '963 st, city', '2024-10-10'),
('liam kay', 30, 'male', 'o-', '2234567892', '345 blvd, city', '2025-01-10'),
('sara tan', 25, 'female', 'a-', '2234567893', '876 loop, city', '2024-09-25'),
('alex kim', 29, 'male', 'o+', '2234567894', '234 ring, city', '2024-12-02'),
('chloe cho', 31, 'female', 'b+', '2234567895', '754 zone, city', '2024-11-11'),
('mike ali', 39, 'male', 'ab-', '2234567896', '845 deck, city', '2024-08-15'),
('nancy verma', 30, 'female', 'a+', '2234567897', '156 sky, city', '2025-02-01'),
('bruce will', 45, 'male', 'b+', '2234567898', '278 bay, city', '2024-10-01'),
('elena rose', 22, 'female', 'ab+', '2234567899', '987 gulf, city', '2024-11-30'),
('tony zed', 38, 'male', 'o-', '3234567890', '123 pier, city', '2025-01-25'),
('jill smith', 29, 'female', 'a-', '3234567891', '321 lock, city', '2024-12-12'),
('dan brown', 33, 'male', 'o+', '3234567892', '111 rise, city', '2024-11-11'),
('lucy hale', 27, 'female', 'ab+', '3234567893', '555 sun, city', '2024-09-09'),
('jack yoon', 36, 'male', 'b-', '3234567894', '432 shade, city', '2024-10-10'),
('ivy may', 31, 'female', 'a+', '3234567895', '764 lane, city', '2025-01-20'),
('ron east', 28, 'male', 'o-', '3234567896', '678 wall, city', '2025-01-05'),
('kim hill', 40, 'female', 'b+', '3234567897', '345 dam, city', '2024-08-08'),
('steve job', 37, 'male', 'ab-', '3234567898', '888 mac, city', '2024-12-20'),
('emma tea', 30, 'female', 'a-', '3234567899', '999 leaf, city', '2024-11-14');
select * from donor;
insert into recipient (name, age, gender, bloodgroup, contactnumber, address, requestdate) values
('alice brown', 45, 'female', 'a+', '888880001', 'road 1, city', '2025-04-01'),
('mark lee', 50, 'male', 'o-', '888880002', 'road 2, city', '2025-04-02'),
('helen cho', 27, 'female', 'ab-', '888880003', 'road 3, city', '2025-04-03'),
('ray moon', 33, 'male', 'b+', '888880004', 'road 4, city', '2025-04-04'),
('sara ali', 39, 'female', 'a-', '888880005', 'road 5, city', '2025-04-05'),
('jack noor', 41, 'male', 'o+', '888880006', 'road 6, city', '2025-04-06'),
('kim tran', 29, 'female', 'b-', '888880007', 'road 7, city', '2025-04-07'),
('daniel cruz', 36, 'male', 'ab+', '888880008', 'road 8, city', '2025-04-08'),
('elena ray', 31, 'female', 'a+', '888880009', 'road 9, city', '2025-04-09'),
('nathan fox', 48, 'male', 'o-', '888880010', 'road 10, city', '2025-04-10'),
('lucy park', 34, 'female', 'b+', '888880011', 'road 11, city', '2025-04-11'),
('omar ghani', 52, 'male', 'a-', '888880012', 'road 12, city', '2025-04-12'),
('tina rose', 26, 'female', 'o+', '888880013', 'road 13, city', '2025-04-13'),
('li wei', 37, 'male', 'ab-', '888880014', 'road 14, city', '2025-04-14'),
('emma west', 28, 'female', 'a+', '888880015', 'road 15, city', '2025-04-15'),
('mohit singh', 43, 'male', 'b-', '888880016', 'road 16, city', '2025-04-16'),
('julia black', 30, 'female', 'ab+', '888880017', 'road 17, city', '2025-04-17'),
('jason white', 35, 'male', 'o+', '888880018', 'road 18, city', '2025-04-18'),
('anita shah', 32, 'female', 'b+', '888880019', 'road 19, city', '2025-04-19'),
('george kim', 44, 'male', 'a-', '888880020', 'road 20, city', '2025-04-20'),
('sophie tan', 29, 'female', 'o-', '888880021', 'road 21, city', '2025-04-21'),
('alex choi', 38, 'male', 'ab+', '888880022', 'road 22, city', '2025-04-22'),
('lisa fern', 36, 'female', 'b-', '888880023', 'road 23, city', '2025-04-23'),
('ron east', 31, 'male', 'a+', '888880024', 'road 24, city', '2025-04-24'),
('ivy dean', 27, 'female', 'o+', '888880025', 'road 25, city', '2025-04-25'),
('brad hale', 47, 'male', 'b+', '888880026', 'road 26, city', '2025-04-26'),
('clara jeff', 33, 'female', 'a-', '888880027', 'road 27, city', '2025-04-27'),
('dave hugh', 40, 'male', 'o-', '888880028', 'road 28, city', '2025-04-28'),
('nina may', 30, 'female', 'ab-', '888880029', 'road 29, city', '2025-04-29'),
('kevin hart', 43, 'male', 'o+', '888880030', 'road 30, city', '2025-04-30');
select * from recipient;
insert into hospital (name, location, contactnumber) values
('city hospital', 'central', '9000000001'),
('green valley hospital', 'north district', '9000000002'),
('sunrise clinic', 'south gate', '9000000003'),
('mercy general', 'east end', '9000000004'),
('hope healthcare', 'west bay', '9000000005'),
('apollo center', 'uptown', '9000000006'),
('health hub', 'midtown', '9000000007'),
('newlife hospital', 'suburbs', '9000000008'),
('curewell center', 'harbor', '9000000009'),
('trust medical', 'lakeside', '9000000010'),
('st. mary hospital', 'central hill', '9000000011'),
('grand care hospital', 'old town', '9000000012'),
('fortis healthcare', 'new colony', '9000000013'),
('bliss hospital', 'green town', '9000000014'),
('united hospital', 'city outskirts', '9000000015'),
('medilife hospital', 'tech park', '9000000016'),
('noble hospital', 'railway junction', '9000000017'),
('prime medical', 'north market', '9000000018'),
('global care hospital', 'east tower', '9000000019'),
('peoples hospital', 'central west', '9000000020'),
('lotus hospital', 'garden view', '9000000021'),
('shine hospital', 'moon avenue', '9000000022'),
('healcare center', 'valley ring', '9000000023'),
('evergreen hospital', 'forest side', '9000000024'),
('rainbow hospital', 'hilltop', '9000000025'),
('safehands hospital', 'metro area', '9000000026'),
('lifeaid hospital', 'coastal zone', '9000000027'),
('rescue hospital', 'south island', '9000000028'),
('angel hospital', 'diamond cross', '9000000029'),
('medisafe hospital', 'iron bridge', '9000000030');
select * from hospital;
insert into admin (username, password) values
('admin1', 'pass1'),
('admin2', 'pass2'),
('admin3', 'pass3'),
('admin4', 'pass4'),
('admin5', 'pass5'),
('admin6', 'pass6'),
('admin7', 'pass7'),
('admin8', 'pass8'),
('admin9', 'pass9'),
('admin10', 'pass10'),
('admin11', 'pass11'),
('admin12', 'pass12'),
('admin13', 'pass13'),
('admin14', 'pass14'),
('admin15', 'pass15'),
('admin16', 'pass16'),
('admin17', 'pass17'),
('admin18', 'pass18'),
('admin19', 'pass19'),
('admin20', 'pass20'),
('admin21', 'pass21'),
('admin22', 'pass22'),
('admin23', 'pass23'),
('admin24', 'pass24'),
('admin25', 'pass25'),
('admin26', 'pass26'),
('admin27', 'pass27'),
('admin28', 'pass28'),
('admin29', 'pass29'),
('admin30', 'pass30');
select * from admin;
insert into donation (donorid, hospitalid, donationdate, quantity) values
(1, 1, '2025-01-01', 450),
(2, 2, '2025-01-03', 500),
(3, 3, '2025-01-05', 480),
(4, 4, '2025-01-07', 460),
(5, 5, '2025-01-09', 470),
(6, 6, '2025-01-11', 450),
(7, 7, '2025-01-13', 500),
(8, 8, '2025-01-15', 480),
(9, 9, '2025-01-17', 460),
(10, 10, '2025-01-19', 470),
(11, 1, '2025-01-21', 450),
(12, 2, '2025-01-23', 490),
(13, 3, '2025-01-25', 500),
(14, 4, '2025-01-27', 460),
(15, 5, '2025-01-29', 470),
(16, 6, '2025-01-31', 480),
(17, 7, '2025-02-02', 450),
(18, 8, '2025-02-04', 500),
(19, 9, '2025-02-06', 460),
(20, 10, '2025-02-08', 470),
(21, 1, '2025-02-10', 480),
(22, 2, '2025-02-12', 490),
(23, 3, '2025-02-14', 500),
(24, 4, '2025-02-16', 450),
(25, 5, '2025-02-18', 460),
(26, 6, '2025-02-20', 470),
(27, 7, '2025-02-22', 480),
(28, 8, '2025-02-24', 490),
(29, 9, '2025-02-26', 500),
(30, 10, '2025-02-28', 450);
select * from donor;
insert into bloodrequest (requestid,recipientid, hospitalid, requestdate, bloodgroup) values
(101,1, 1, '2025-03-01', 'a+'),
(102,2, 2, '2025-03-02', 'o-'),
(103,3, 3, '2025-03-03', 'ab-'),
(104,4, 4, '2025-03-04', 'b+'),
(105,5, 5, '2025-03-05', 'a-'),
(106,6, 6, '2025-03-06', 'o+'),
(107,7, 7, '2025-03-07', 'b-'),
(108,8, 8, '2025-03-08', 'ab+'),
(109,9, 9, '2025-03-09', 'a+'),
(110,10, 10, '2025-03-10', 'o-'),
( 111,11, 1, '2025-03-11', 'b+'),
(112,12, 2, '2025-03-12', 'a-'),
(113,3, 3, '2025-03-13', 'o+'),
(114,14, 4, '2025-03-14', 'ab-'),
(115,15, 5, '2025-03-15', 'a+'),
(116,16, 6, '2025-03-16', 'b-'),
(117,17, 7, '2025-03-17', 'ab+'),
(118,18, 8, '2025-03-18', 'o-'),
(119,19, 9, '2025-03-19', 'a-'),
(120,20, 10, '2025-03-20', 'b+'),
(121,21, 1, '2025-03-21', 'ab-'),
(122,22, 2, '2025-03-22', 'a+'),
(123,23, 3, '2025-03-23', 'o+'),
(124,24, 4, '2025-03-24', 'b-'),
(125,25, 5, '2025-03-25', 'ab+'),
(126,26, 6, '2025-03-26', 'a-'),
(127,27, 7, '2025-03-27', 'o-'),
(128,28, 8, '2025-03-28', 'b+'),
(129,29, 9, '2025-03-29', 'a+'),
(130,30, 10, '2025-03-30', 'ab-');
select * from bloodrequest;


-- 1)View: Donor Donation History Create a view that shows donor name, blood group, donation date, quantity donated, and hospital name.
CREATE VIEW DonorDonationHistory AS
SELECT 
    d.name AS donor_name,
    d.bloodgroup,
    do.donationdate,
    do.quantity,
    h.name AS hospital_name
FROM donation do
JOIN donor d ON do.donorid = d.donorid
LEFT JOIN hospital h ON do.hospitalid = h.hospitalid;
select * from DonorDonationHistory;

-- View Hospitals in a Specific City (e.g., "Bangalore").You can adjust this view to filter by location
CREATE VIEW view_bangalore_hospitals AS
SELECT 
    hospitalid,
    name,
    location,
    contactnumber
FROM hospital
WHERE location LIKE '%Bangalore%';
select * from view_bangalore_hospitals;





-- TO CREATE STORED PROCEDURES --
CREATE PROCEDURE AddDonor(
    In p_id INT,
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender VARCHAR(10),
    IN p_bloodgroup VARCHAR(5),
    IN p_contactnumber VARCHAR(15),
    IN p_address TEXT,
    IN p_lastdonationdate date
    )
BEGIN
    INSERT INTO donor(donor_id,name, age, gender, bloodgroup, contactnumber, address, lastdonationdate)
        VALUES (p_donor_id,p_name, p_age, p_gender, p_bloodgroup, p_contactnumber, p_address, p_lastdonationdate
        );
END //

DELIMITER ;
CALL AddDonor('31','John Doe', 30, 'Male', 'A+', '1234567890', '123 Main St', '2024-12-01');

-- TO UPDATE CONTACT IN STORED PROCEDURES --
DELIMITER //
CREATE PROCEDURE UpdateContact(
    IN p_donorid INT,
    IN p_contactnumber VARCHAR(15)
)
BEGIN
    UPDATE donor
    SET contactnumber = p_contactnumber
    WHERE donorid = p_donorid;
END //
DELIMITER ;
 CALL updatecontact('1233454334','41');
 
 -- TO UPDATE CONTANT IN STORED PROCEDURES --
DELIMITER //
CREATE PROCEDURE GetAverageAge()
BEGIN
    SELECT AVG(age) AS average_age FROM donor;
END //
DELIMITER ;
CALL GetAverageAge();

-- TO STORED PROCEDURE ADD RECIPIENT --

CREATE PROCEDURE AddRecipient(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_gender VARCHAR(10),
    IN p_bloodgroup VARCHAR(5),
    IN p_contactnumber VARCHAR(15),
    IN p_address TEXT,
    IN p_requestdate DATE
)
BEGIN
    INSERT INTO recipient (
        name, age, gender, bloodgroup, contactnumber, address, requestdate) 
        VALUES(p_name, p_age, p_gender, p_bloodgroup, p_contactnumber, p_address, p_requestdate);
END //

DELIMITER ;
CALL AddRecipient('Ravi Kumar', 42, 'Male', 'A+', '9812345678', '789 MG Road', '2025-05-01');

DELIMITER //

-- TO STORED PROCEDURE FOR GET RECIPIENT BY BLOOD GROUP --

CREATE PROCEDURE GetRecipientsByBloodGroup(
    IN p_bloodgroup VARCHAR(5)
)
BEGIN
    SELECT * FROM recipient WHERE bloodgroup = p_bloodgroup;
END //

DELIMITER ;
CALL GetRecipientsByBloodGroup('A+');
DELIMITER //

-- TO STORED PROCEDURE FOR GET RECIPIENTBY GENDER --

CREATE PROCEDURE GetRecipientsByGender(
    IN p_gender VARCHAR(10)
)
BEGIN
    SELECT * FROM recipient WHERE gender = p_gender;
END //

DELIMITER ;
CALL GetRecipientsByGender('Female');

















