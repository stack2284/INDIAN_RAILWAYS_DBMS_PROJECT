
insert into station (sname) values 
('chennai'), 
('bangalore'), 
('mumbai'), 
('delhi'), 
('patna'), 
('hyderabad');



insert into train (tname, src, dest) values 
('chennai exp', 1, 2),
('mumbai raj', 3, 4),
('hyd exp', 5, 1),
('delhi exp', 5, 1),
('del-hyd exp', 4, 5);

insert into class (cname, multiplier) values 
('sleeper', 1.0),
('ac3', 2.0),
('ac2', 2.5),
('first', 3.0);

insert into passenger (name, age, gender, phone, email) values 
('sahil shaikh', 20, 'm', '1234567890', 'sahil@gmail.com'),
('shreyas kotha', 21, 'm', '1834567891', 'shreyk@gmail.com'),
('arnav reddy', 20, 'm', '1234560789', 'reddyballs@gmail.com'),
('deep kaur', 25, 'f', '8888888888', 'deep@gmail.com'),
('samrat mondal', 30, 'm', '8888888888', 'sm@gmail.com');


INSERT INTO seat_train (tid, cid, seatno, status) 
VALUES
(1, 1, 's1-01', 'available'),
(1, 1, 's1-02', 'available'),
(1, 1, 's1-03', 'available'),
(1, 1, 's1-04', 'rac'),
(1, 1, 's1-05', 'rac'),
(1, 2, 'b1-01', 'rac'),
(1, 2, 'b1-02', 'rac'),
(1, 3, 'z1-01', 'available'),
(1, 3, 'z1-02', 'available'),

(3, 1, 's1-01', 'available'),
(3, 1, 's1-02', 'available'),
(3, 2, 'b1-01', 'available'),
(3, 2, 'b1-02', 'available'),
(3, 3, 'z1-01', 'available'),
(3, 3, 'z1-02', 'available'),

(4, 4, 's1-01', 'available'),
(4, 2, 'b1-01', 'available'),
(4, 4, 's1-02', 'available'),
(4, 2, 'b1-02', 'available'),
(4, 1, 's1-01', 'rac'),
(4, 1, 's1-02', 'rac'),
(4, 1, 's1-03', 'rac'),
(4, 1, 's1-04', 'rac'),
(4, 1, 'b1-01', 'rac'),
(4, 1, 'b1-02', 'rac'),
(4, 1, 'b1-03', 'rac'),
(4, 1, 'b1-04', 'rac'),

(2, 3, 'a1-01', 'available'),
(2, 4, 'f1-01', 'available'),

(5, 4, 's1-01', 'available'),
(5, 4, 's1-02', 'available'),
(5, 2, 'b1-01', 'available'),
(5, 2, 'b1-02', 'available'),
(5, 3, 'z1-01', 'available'),
(5, 3, 'z1-02', 'available');


insert into route (tid, sid, atime, dtime, jdate) values 
(1, 1, '06:00:00', '06:10:00', '2025-04-20'),
(1, 2, '10:00:00', '10:10:00', '2025-04-20'),
(2, 3, '09:00:00', '09:10:00', '2025-04-20'),
(2, 4, '15:00:00', '15:10:00', '2025-04-20'),
(3, 1, '05:00:00', '05:10:00', '2025-04-20'),
(3, 5, '11:00:00', '11:10:00', '2025-04-20'),
(4, 4, '07:00:00', '07:10:00', '2025-04-20'),
(4, 5, '12:00:00', '12:10:00', '2025-04-20');

select * from seat ;
insert into route (tid, sid, atime, dtime, jdate) values(3, 2, '12:00:00', '12:10:00', '2025-04-21');

CALL book_ticket(1, 3);
CALL book_ticket(1, 4);
CALL book_ticket(1, 5);
call book_ticket(1, 1);



insert into payment (ticketid, amount, mode) values 
(1, 500.00, NULL),
(3, 500.00, 'counter'),
(2, 1200.00, 'counter');

