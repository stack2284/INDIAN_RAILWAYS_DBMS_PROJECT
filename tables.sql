create database if not exists indianrailways;
use indianrailways;
-- tables

create table passenger (
    pid int auto_increment primary key,
    name varchar(100),
    age int,
    gender char(1),
    phone varchar(15),
    email varchar(100)
);

create table train (
    tid int auto_increment primary key,
    tname varchar(100),
    src int,
    dest int
);

create table station (
    sid int auto_increment primary key,
    sname varchar(100)
);

create table route (
    rid int auto_increment primary key,
    tid int,
    sid int,
    atime time,
    dtime time,
    jdate date,
    foreign key (tid) references train(tid),
    foreign key (sid) references station(sid),
    UNIQUE (jdate , tid , sid , atime)
);

create table class (
    cid int auto_increment primary key,
    cname varchar(50),
    multiplier decimal(5,2)
);


-- seat will be dynamiclly maintained 
create table seat ( 
    seatid int auto_increment primary key,
    tid int,
    cid int,
    seatno varchar(10),
    jdate date,
    rid int,
    status enum('available', 'booked', 'rac', 'waitlist'),
    foreign key (rid) references route(rid),
    foreign key (tid) references train(tid),
    foreign key (cid) references class(cid),
    UNIQUE (seatno, rid , tid , cid)
);

create table seat_train( 
seatno varchar(10),
tid int,
cid int,
status enum('available', 'rac' ),
primary key (seatno, tid, cid),
foreign key (tid) references train(tid),
foreign key (cid) references class(cid)
);



create table ticket (
    ticketid int auto_increment primary key,
    pnr bigint unique,
    pid int,
    tid int,
    seatid int,
    cid int,
    jdate date,
    rid int,
    bstatus enum('confirmed', 'rac', 'waitlist', 'cancelled'),
    bdate timestamp default current_timestamp,
    foreign key (pid) references passenger(pid),
    foreign key (seatid) references seat(seatid ),
    foreign key (rid) references route(rid)
);


create table payment (
    payid int auto_increment primary key,
    ticketid int,
    amount decimal(10,2),
    pdate timestamp default current_timestamp,
    mode ENUM('online', 'counter') DEFAULT NULL,
    refund enum('not applicable', 'pending', 'refunded') default 'not applicable',
    foreign key (ticketid) references ticket(ticketid)
);