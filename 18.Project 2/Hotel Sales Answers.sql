-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption. 
select * from payments where paymentmethod = 'UPI';

-- Question - 2] List all unique first names of customers for a duplicate check. 
select distinct firstname from customers;

-- Question - 3] Delete all rooms with Capacity = 1. 
SET SQL_SAFE_UPDATES = 0;
delete from payments where bookingid in (select bookingid from bookings
where roomid in (select roomid from rooms where capacity = 1 ));

delete from bookings 
where roomid in (select roomid from rooms where capacity=1);

delete from rooms where capacity =1;

-- Question - 4] Display each customer’s name and phone number together using CONCAT. 
select concat(firstname,"  ",phone) as customer_info from customers;

-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room. 
select * from bookings where roomid = 10;

-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms.
select * from rooms where capacity>(select avg(capacity) from rooms);

-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and  Phone. 
create view StaffContact as select FirstName, LastName, Role, Phone from staff;
select * from StaffContact;

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
select * from rooms where roomtype = 'Suite' and pricepernight < 7000;

-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table. 
select email, lastname from customers order by lastname;

-- Question - 10] Show staff full names combined into one column. 
select concat(firstname, ' ', lastname) as fullname from staff;

-- Question - 11] Display all payment details in one line using CONCAT_WS. 
select concat_ws(" | ", paymentid, bookingid, paymentdate, paymentmethod, amount) as payment_details from payments;

-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
select * from rooms order by pricepernight desc limit 2;

-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined.
select bookingid, concat(checkindate, ' to ', checkoutdate) as booking_period from bookings;

-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod.
select paymentmethod, avg(amount) from payments group by paymentmethod;

-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50. 
select city, avg(customerid) from customers group by city having avg(customerid) > 50;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery) 
select * from bookings where totalamount > (select avg(totalamount) from bookings);

-- Question - 17] Display the last 2 added rooms from the Rooms table. 
select * from rooms order by roomid desc limit 2;

-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
select * from payments where amount < 1500;

-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 
select customerid, count(*) as total_bookings from bookings group by customerid having total_bookings > 5;


-- Question - 20] Identify customers who live in the same city. (Customers self join) 
select c1.customerid ,c2.customerid ,c1.city from customers c1 join customers c2
on c1.city=c2.city and c1.customerid < c2.customerid;

-- Question - 21] Show the total revenue handled by each StaffID. 
select staffid, sum(totalamount) as total_revenue from bookings group by staffid;

-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns.
select * from customers where city = 'Mumbai';

-- Question - 23] Display the 3 lowest booking amounts. 
select * from bookings order by totalamount asc limit 3;

-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table. 
insert into rooms (roomtype, pricepernight, capacity) values
('Suite', 8500, 3),
('Deluxe', 6000, 2),
('Standard', 3500, 2),
('Presidential', 12000, 4),
('Economy', 2500, 1);

select * from rooms;

-- Question - 25] Show all unique CustomerIDs from bookings. 
select distinct customerid from bookings;

-- Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted
delimiter $$
create trigger trg_delete_payment after delete on bookings
for each row
begin
    delete from payments where bookingid = old.bookingid;
end$$
delimiter ;

-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'. 
update customers set firstname = 'Rahul' where customerid = 30;

-- Question - 28] List all bookings ordered by CheckInDate. 
select * from bookings order by checkindate;

-- Question - 29] Show all rooms where capacity is greater than 2. 
select * from rooms where capacity > 2;

-- Question - 30] List staff emails ordered by their roles.
select role, email from staff order by role;

-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 
select concat_ws(' ', firstname, lastname, city) as customer_details from customers;

-- Question - 32] Show the first 4 customers’ full names only. 
select concat(firstname, ' ', lastname) as full_name from customers limit 4;

-- Question - 33] Show each staff’s role with their full name. 
select role, concat(firstname, ' ', lastname) as staff_name from staff;

-- Question - 34] Management wants to find the average StaffID per role. 
select role, avg(staffid) as avg_staffid from staff group by role;

-- Question - 35] List all bookings handled by StaffID = 2. 
select * from bookings where staffid = 2;

-- Question - 36] Display the first 3 staff alphabetically by their first names. 
select * from staff order by firstname asc limit 3;

-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
select * from customers where firstname = 'amit' and city = 'nagpur';

-- Question - 38] Show all unique payment methods in descending order. 
select distinct paymentmethod from payments order by paymentmethod desc;

-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 
insert into staff (firstname, lastname, role, phone, email) values
('Ritika', 'Menon', 'Receptionist', '8823456789', 'ritikamenon@tcs.in'),
('Kunal', 'Bose', 'Chef', '8712345670', 'kunalbose@arbor.org'),
('Sneha', 'Nair', 'Manager', '8899001122', 'snehanair@infosys.com'),
('Ravi', 'Shah', 'Waiter', '8796543210', 'ravishah@gmail.com'),
('Anjali', 'Verma', 'Security', '8587996325', 'anjaliverma@yahoo.in');
select * from staff;

-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy. 
select * from bookings where checkindate > '2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program. 
select * from customers where firstname = 'rahul';

-- Question - 42] Show all unique room types offered by the hotel. 
select distinct roomtype from rooms;

-- Question - 43] Identify customers who spent more than 50,000 in total. 
select customerid, sum(totalamount) as total_spent 
from bookings 
group by customerid 
having total_spent > 50000;

-- Question - 44] Delete all customers from the city 'TestCity'. 
delete from customers where city = 'testcity';

-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join) 
select a.roomid as room1, b.roomid as room2, a.pricepernight from rooms a 
join rooms b on a.pricepernight = b.pricepernight and a.roomid < b.roomid;

-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie ups. 
select * from staff where email like '%@tcs.in';

-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
select city, max(customerid)
from customers 
group by city 
having  max(customerid) > 100;

-- question 48: show all unique capacities in descending order.
select distinct capacity from rooms order by capacity desc;

-- question 49: list staff working as managers.
select * from staff where role = 'Manager';

-- Question - 50] Display each payment’s ID, Method, Amount in one line. 
select concat('payment id: ', paymentid, ', method: ', paymentmethod, ', amount: ₹', amount) as payment_details from payments;

-- Question - 51] Show the first 4 payments only. 
select * from payments limit 4;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts. 
select * from rooms where pricepernight between 2000 and 4000;

-- Question - 53] List all bookings ordered by CheckInDate. 
select * from bookings order by checkindate;

-- Question - 54] Display all unique CustomerIDs from bookings. 
select distinct customerid from bookings;

-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table. 
insert into customers (firstname, lastname, email, phone, city) values
('Amit', 'Shetty', 'amit.shetty@gmail.com', '9876543210', 'Mumbai'),
('Rhea', 'Kapoor', 'rhea.kapoor@yahoo.in', '9812345678', 'Chennai'),
('Vikas', 'Patil', 'vikas.patil@arbor.org', '9922334455', 'Pune'),
('Snehal', 'Joshi', 'snehal.joshi@gmail.com', '9876123456', 'Nagpur'),
('Arjun', 'Verma', 'arjun.verma@tcs.in', '9845098765', 'Delhi');
select * from customers;

-- Question - 56] Show the last 2 staff hired. 
select * from staff order by staffid desc limit 2;

-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 
select * from rooms where PricePerNight >(select max(PricePerNight) from rooms where capacity=2);

-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation. 
select * from staff where role != 'Chef';

-- Question - 59] Show all unique cities in descending order from the Customers table. 
select distinct city from customers order by city desc;

-- Question - 60] Display the phone number of the Waiter only. 
select role,phone from staff where role="waiter";

-- Question - 61] Display the last 2 bookings in the table.
select * from bookings order by bookingid desc limit 2;

-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for targeted promotions. 
select * from customers where city in ('Delhi', 'Chennai');

-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations. 
select * from rooms where roomtype != 'Family';

-- Question - 64] List staff emails ordered by their roles. 
select email from staff order by role;

-- Question - 65] Display all unique payment methods. 
select distinct paymentmethod from payments;

-- question 66: the receptionist wants a list of customers whose phone starts with '98' for mobile offers.
select * from customers where phone like '98%';

-- question 67: show the 3 cheapest rooms available for budget travelers.
select * from rooms order by pricepernight asc limit 3;

-- Question - 68] Display the last 2 payments. 
select * from payments order by paymentid desc limit 2;

-- Question - 69] Management wants to know which unique cities customers come from. 
select distinct city from customers;

-- Question - 70] List all bookings where TotalAmount > 5000. 
select * from bookings where totalamount > 5000;

-- Question - 71] Display each staff’s Role with their Email in one column. 
select concat('role: ', role, ', email: ', email) as staff_role_email from staff;

-- Question - 72] Show the first 4 staff full names. 
select concat(firstname, ' ', lastname) as full_name from staff limit 4;

-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery)
select * from bookings where totalamount > all (select totalamount from bookings where customerid = 10);
 
-- Question - 74] List rooms with capacity >= 3 for family bookings. 
select * from rooms where capacity >= 3;

-- Question - 75] Display the RoomType and Price of only Suite rooms. 
select roomtype, pricepernight from rooms where roomtype = 'Suite';

-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks. 
select * from payments where amount between 2000 and 7000;

-- Question - 77] Insert 5 booking records into the Bookings table with all details. 
insert into bookings (customerid, roomid, staffid, checkindate, checkoutdate, totalamount) values
(25, 1, 4, '2024-06-10', '2024-06-13', 4800),
(38, 2, 5, '2024-07-02', '2024-07-04', 3100),
(42, 5, 2, '2024-08-05', '2024-08-09', 9200),
(56, 8, 1, '2024-09-15', '2024-09-17', 2600),
(61, 10, 6, '2024-10-01', '2024-10-03', 3400);

-- Question - 78] Display the 3 lowest payments made by customers. 
select * from payments order by amount asc limit 3;

-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 
select concat('booking id: ', bookingid, ', amount: ₹', totalamount) as booking_summary from bookings;

-- Question - 80] Show all unique RoomIDs in descending order. 
select distinct roomid from bookings order by roomid desc;

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 
select concat_ws(' - ₹', roomtype, pricepernight) as room_price from rooms;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.
delete from payments where bookingid in (select bookingid from bookings where staffid = 3);
delete from bookings where StaffID = 3;
 
-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study.
select * from customers where length(firstname) > 5;
 
-- Question - 84] Show all unique roles available in the hotel. 
select distinct role from staff;

-- question 85: list all rooms where capacity is greater than 2.
select * from rooms where capacity > 2;

-- question 86: display each payment’s id with amount using concat.
select concat('payment id: ', paymentid, ', amount: ₹', amount) as payment_info from payments;

-- question 87: list all card payments from the payments table.
select * from payments where paymentmethod = 'Card';

-- question - 88] delete all customers whose email ends with '@test.com' as invalid.
delete from customers where email like '%@test.com';

-- question - 89] the hotel manager wants to review bookings where checkoutdate before '2023-12-31' to measure old occupancy.
select * from bookings where checkoutdate < '2023-12-31';

-- question - 90] the front office manager needs to list rooms with capacity = 2 for couples.
select * from rooms where capacity = 2;

-- question - 91] show all unique capacities in descending order.
select distinct capacity from rooms order by capacity desc;

-- question - 92] the operations team wants to find the minimum totalamount in bookings.
select min(totalamount) as min_totalamount from bookings;

-- question - 93] display all rooms by capacity in ascending order.
select * from rooms order by capacity asc;

-- question - 94] show each booking’s bookingid with totalamount using concat.
select concat('booking id: ', bookingid, ' - amount: ', totalamount) as booking_info from bookings;

-- question - 95] the operations head wants to see rooms with capacity = 4 and pricepernight > ₹6000 for premium family packages.
select * from rooms where capacity = 4 and pricepernight > 6000;

-- question - 96] show staff full names combined into one column.
select concat(firstname, ' ', lastname) as full_name from staff;

-- question - 97] the accounts team wants to see bookings where the totalamount is greater than ₹10,000 to track high-value customers.
select * from bookings where totalamount > 10000;

-- question - 98] show all unique payment methods in descending order.
select distinct paymentmethod from payments order by paymentmethod desc;

-- question - 99] list staff members who share the same role. (staff self join)
select a.firstname as staff1, b.firstname as staff2, a.role
 from staff a join staff b
 on a.role = b.role and a.staffid < b.staffid order by staff1 asc;

-- question - 100] show customer first name, last name, and totalamount of their bookings using join between customers and bookings.
select c.firstname, c.lastname, b.totalamount from customers c join bookings b on c.customerid = b.customerid;

-- question - 101] display the first 4 bookings only.
select * from bookings limit 4;

-- question - 102] show all unique staff first names.
select distinct firstname from staff;

-- question - 103] insert 5 new room records with type, price, and capacity into the rooms table.
insert into rooms (roomtype, pricepernight, capacity) values 
('suite', 7200, 4),
('deluxe', 4500, 2),
('single', 3100, 1),
('double', 5200, 2),
('family', 6900, 4);

-- question - 104] display each customer’s full name and city using concat_ws.
select concat_ws(' ', firstname, lastname,"=", city) as customer_info from customers;

-- question - 105] show all unique cities in descending order from the customers table.
select distinct city from customers order by city desc;

-- question - 106] the analytics team wants to list all cities where maximum customerid is more than 100.
select city,max(customerid) from customers group by city having max(customerid) > 100;

-- question - 107] the hr team wants to see staff whose firstname is 'priya' for employee recognition.
select * from staff where firstname = 'priya';

-- question - 108] display the last 2 staff members from the staff table.
select * from staff order by staffid desc limit 2;

-- question - 109] create a view bookingsummary showing bookingid, customerid, roomid, and totalamount.
create view bookingsummary as select bookingid, customerid, roomid, totalamount from bookings;
select * from bookingsummary;

-- question - 110] show all unique roomids in descending order.
select distinct roomid from rooms order by roomid desc;

-- question - 111] display each staff’s role with their full name.
select concat(role, ' - ', firstname, ' ', lastname) as staff_role from staff;

-- question - 112] the receptionist wants to offer suite rooms under ₹7000 to business travelers.
select * from rooms where roomtype = 'suite' and pricepernight < 7000;

-- question - 113] display the first 3 staff alphabetically by their first names.
select * from staff order by firstname asc limit 3;

-- question - 114] list all bookings ordered by checkindate.
select * from bookings order by checkindate;

-- question - 115] show all unique staffids from the bookings.
select distinct staffid from bookings;

-- question - 116] display the first 4 customers’ full names only.
select concat(firstname, ' ', lastname) as full_name from customers limit 4;

-- question - 117] show all unique room types offered by the hotel.
select distinct roomtype from rooms;

-- question - 118] display the phone number of the waiter only.
select phone,role from staff where role = 'waiter';

-- question - 119] show all bookings where totalamount > 5000.
select * from bookings where totalamount > 5000;

-- question - 120] the hr team wants to update role = 'senior manager' where staffid = 12.
update staff set role = "senior manager" where staffid = 12;

-- question - 121] list all staff working as managers.
select * from staff where role = 'manager';

-- question - 122] show the last 2 registered customers for follow-up.
select * from customers order by customerid desc limit 2;

-- question - 123] display each booking’s bookingid with totalamount using concat.
select concat('booking id: ', bookingid, ' - total: ', totalamount) as booking_info from bookings;

-- question - 124] insert 5 staff members into the staff table with their role, phone, and email.
insert into staff (firstname, lastname, role, phone, email) values
('priya', 'iyer', 'receptionist', '9876543201', 'priya.iyer@hotel.com'),
('manish', 'kapoor', 'chef', '9823456789', 'manish.kapoor@hotel.com'),
('anita', 'rao', 'manager', '9812345678', 'anita.rao@hotel.com'),
('vishal', 'sharma', 'security', '9898765432', 'vishal.sharma@hotel.com'),
('neha', 'patel', 'waiter', '9867894321', 'neha.patel@hotel.com');

-- question - 125] display the roomtype and price of only suite rooms.
select roomtype, pricepernight from rooms where roomtype = 'suite';

-- question - 126] the admin wants to delete all payments linked to bookingid = 15.
delete from payments where bookingid = 15;

-- Question - 127] Display all unique capacities in descending order.
select distinct capacity from rooms order by capacity desc;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType.
select * from rooms order by roomtype asc limit 4;

-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
select * from payments where amount < 1500;

-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat('Booking ', bookingid, ' - Amount ₹', totalamount) as booking_summary from bookings;

-- Question - 131] Display the last 2 added rooms from the Rooms table.
select * from rooms order by roomid desc limit 2;

-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention.
select * from customers where firstname = 'Amit' and city = 'Nagpur';

-- Question - 133] Insert 5 new customer details into the Customers table.
insert into customers (firstname, lastname, email, phone, city) values 
('Riya', 'Kumar', 'riya.kumar@test.com', '9876543210', 'Delhi'),
('Aman', 'Shah', 'aman.shah@test.com', '9123456780', 'Mumbai'),
('Neha', 'Verma', 'neha.verma@test.com', '9988776655', 'Pune'),
('Rohit', 'Patel', 'rohit.patel@test.com', '9090909090', 'Surat'),
('Sneha', 'Joshi', 'sneha.joshi@test.com', '9786543210', 'Chennai');

-- Question - 134] Show staff full names combined into one column.
select concat(firstname, ' ', lastname) as fullname from staff;

-- Question - 135] Show all room details separated by commas using CONCAT_WS.
select concat_ws(', ', roomid, roomtype, pricepernight, capacity) as room_details from rooms;

-- Question - 136] Display each customer’s name and phone number together using CONCAT.
select concat(firstname, ' ', lastname, ' - ', phone) as customer_contact from customers;

-- Question - 137] Display all payment details in one line using CONCAT_WS.
select concat_ws(', ', paymentid, bookingid, amount, paymentmethod, paymentdate) as payment_info from payments;

-- Question - 138] Show the last 2 bookings in the table.
select * from bookings order by bookingid desc limit 2;

-- Question - 139] List all payments ordered by PaymentDate.
select * from payments order by paymentdate;

-- Question - 140] Show the 2 highest payments received.
select * from payments order by amount desc limit 2;

-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyalty program.
select * from customers where firstname = 'Rahul';

-- Question - 142] Display each PaymentID with its method using CONCAT.
select concat('Payment ', paymentid, ' - ', paymentmethod) as payment_summary from payments;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times.
select paymentmethod, count(*) as method_count from payments group by paymentmethod having count(*) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests.
select * from rooms order by pricepernight desc limit 2;

-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS.
select concat_ws(' - ₹', roomtype, pricepernight) as room_price from rooms;

-- Question - 146] Display the first 3 staff alphabetically by their first names.
select * from staff order by firstname asc limit 3;

-- Question - 147] List all bookings handled by StaffID = 2.
select * from bookings where staffid = 2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50.
select city, avg(customerid) as avg_id from customers group by city having avg(customerid) > 50;

-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests.
select * from rooms order by pricepernight desc limit 2;

-- Question - 150] Show all unique first names of customers for a duplicate check.
select distinct firstname from customers;

-- Question - 151] Show all unique roles in descending order.
select distinct role from staff order by role desc;

-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
select * from rooms where capacity > (select avg(capacity) from rooms);

-- Question - 153] Display all rooms by capacity in ascending order.
select * from rooms order by capacity asc;

-- Question - 154] Display the first 4 payments only.
select * from payments limit 4;

-- Question - 155] Show each payment’s ID, Method, Amount in one line.
select concat_ws(', ', paymentid, paymentmethod, amount) as payment_details from payments;

-- Question - 156] List all bookings where TotalAmount > 5000.
select * from bookings where totalamount > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID.(Customers subquery)
select * from customers where customerid > (select avg(customerid) from customers);

-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation.
select * from staff where role != 'Chef';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than ₹10,000.
select * from bookings where totalamount > 10000;

-- Question - 160] Display each staff’s role with their full name.
select concat(role,"- ",firstname,"  ", lastname) as staff_role from staff;

-- Question - 161] List staff members who share the same Role. (Staff self join)
select a.firstname as staff1, b.firstname as staff2, a.role
 from staff a join staff b 
 on a.role = b.role and a.staffid < b.staffid;

-- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments.
select concat(c.firstname, ' ', c.lastname) as customer_name, p.amount 
from customers c join bookings b 
on c.customerid = b.customerid join payments p on b.bookingid = p.bookingid;

-- Total payment amount per customer
select concat(c.firstname, ' ', c.lastname) as customer_name, sum(p.amount) as total_amount 
from customers c join bookings b 
on c.customerid = b.customerid join payments p on b.bookingid = p.bookingid group by c.customerid;

-- Question - 163] Display all bookings where TotalAmount > 5000.
select * from bookings where totalamount > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.
select * from customers where phone like '98%';

-- Question - 165] Identify customers who live in the same city. (Customers self join)
select a.firstname as customer1, b.firstname as customer2, a.city from customers a join customers b on a.city = b.city and a.customerid < b.customerid;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'.
select * from bookings where checkoutdate < '2023-12-31';

-- Question - 167] Display all unique StaffIDs from the bookings.
select distinct staffid from bookings;

-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'.
create view onlinepayments as select * from payments where paymentmethod = 'Online';
select * from onlinepayments;

-- Question - 169] Display all unique payment methods in descending order.
select distinct paymentmethod from payments order by paymentmethod desc;

-- Question - 170] Display each payment’s ID with Amount using CONCAT.
select concat(paymentid, '   ', amount) as payment_info from payments;

-- Question - 171] Show all unique RoomIDs in descending order.
select distinct roomid from rooms order by roomid desc;

-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100.
select city from customers group by city having max(customerid) > 100;

-- Question - 173] List staff emails ordered by their roles.
select email,role from staff order by role;

-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. (Bookings subquery)
select * from bookings where totalamount > (select avg(totalamount) from bookings);

-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer recommendations.
select * from rooms where pricepernight > 5000;

-- Question - 176] Show all unique capacities in descending order.
select distinct capacity from rooms order by capacity desc;

-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType.
select * from rooms order by roomtype asc limit 4;

-- Question - 178] Show all unique staff first names.
select distinct firstname from staff;

-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery)
select * from rooms where pricepernight > (select max(pricepernight) from rooms where capacity = 2);

-- Question - 180] Show all unique cities in descending order from the Customers table.
select distinct city from customers order by city desc;

-- Question - 181] List all bookings where TotalAmount > 5000.
select * from bookings where totalamount > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
select p.paymentid, c.firstname as customer_name, p.bookingid 
from payments p join bookings b 
on p.bookingid = b.bookingid join customers c on b.customerid = c.customerid 
where p.paymentmethod = 'Credit Card';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, '-', totalamount) as booking_info from bookings;

-- Question - 184] Show all bookings handled by StaffID = 2.
select * from bookings where staffid = 2;

-- Question - 185] Display the last 2 added rooms from the Rooms table.
select * from rooms order by roomid desc limit 2;

-- Question - 186] List all rooms where capacity is greater than 2.
select * from rooms where capacity > 2;

-- Question - 187] Display the last 2 staff members from the Staff table.
select * from staff order by staffid desc limit 2;

-- Question - 188] Show all unique roles available in the hotel.
select distinct role from staff;

-- Question - 189] Display the last 2 payments.
select * from payments order by paymentid desc limit 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests.
select * from bookings where customerid in (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check.
select distinct firstname from customers;

-- Question - 192] Display all bookings where TotalAmount > 5000.
select * from bookings where totalamount > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000.
delete from payments where amount < 1000;

-- Question - 194] Display all unique RoomIDs in descending order.
select distinct roomid from rooms order by roomid desc;

-- Question - 195] List customers who made more than 5 bookings.
select customerid from bookings group by customerid having count(*) > 5;

-- Question - 196] Display all rooms by capacity in ascending order.
select * from rooms order by capacity asc;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT.
select concat(bookingid, '-', totalamount) as booking_info from bookings;

-- Question - 198] List all staff working as Managers.
select * from staff where role = 'Manager';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.
select * from customers where length(firstname) > 5;

-- Question - 200] Display all unique capacities in descending order.
select distinct capacity from rooms order by capacity desc;

-- Question - 201] List staff members who share the same Role. (Staff self join)
select a.firstname as staff1, b.firstname as staff2, a.role 
from staff a join staff b 
on a.role = b.role and a.staffid < b.staffid;

-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'.
select p.paymentid, c.firstname as customer_name, p.bookingid 
from payments p join bookings b 
on p.bookingid = b.bookingid join customers c on b.customerid = c.customerid 
where p.paymentmethod = 'Credit Card';

-- Question - 203] Display the first 4 payments only.
select * from payments limit 4;

-- Question - 204] Show each payment’s ID, Method, Amount in one line.
select concat(paymentid, '-', paymentmethod, '-', amount) as payment_info from payments;

-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000.
create view highvaluebookings as select * from bookings where totalamount > 20000;
select * from highvaluebookings;

-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
delimiter $$
create trigger trg_delete_payment after delete on bookings
for each row
begin
    delete from payments where bookingid = old.bookingid;
end$$
delimiter ;

-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate.
delimiter $$
create trigger trg_check_dates before insert on bookings
for each row
begin
    if new.checkoutdate < new.checkindate then
        signal sqlstate '45000' set message_text = 'CheckOutDate cannot be earlier than CheckInDate';
    end if;
end$$
delimiter ;

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments.
delimiter $$
create trigger trg_update_total after insert on payments
for each row
begin
    update bookings set totalamount = totalamount + new.amount where bookingid = new.bookingid;
end$$
delimiter ;











