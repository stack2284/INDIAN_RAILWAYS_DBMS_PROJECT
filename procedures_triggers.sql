
delimiter $$


-- get booking status of tciket with pnr 
create procedure pnr(in p bigint)
begin
    select pnr, bstatus from ticket where pnr = p;
end $$


-- gets details of a seat with seatid
create procedure seat_details(in p bigint)
begin
    select * from seat where seatid = p;
end $$



-- gets details of a trains journies  with tid
create procedure sched(in t int)
begin
    select tname, sname, atime, dtime, jdate 
    from route r
    join train tr on r.tid = tr.tid
    join station st on r.sid = st.sid
    where tr.tid = t;
end $$


-- gets details of a trains empty seats with tid class wise 
create procedure avail(in t int, in c int)
begin
    select seatno from seat where tid = t and cid = c and status = 'available';
end $$

-- gives details of a trains rac seats with tid class wise
create procedure rac(in t int, in c int)
begin
    select seatno from seat where tid = t and cid = c and status = 'rac';
end $$

create procedure all_seats_class(in t int, in c int)
begin
    select seatno from seat where tid = t and cid = c and status != 'booked';
end $$


-- gets details of a trains empty seats with tid 
create procedure all_seats_train(in t int)
begin
    select seatno from seat where tid = t and status != 'booked';
end $$


-- gets details of a all passengers on a date 
create procedure passlist(in t int, in d date)
begin
    select name, tname, jdate
    from ticket tk
    join passenger p on tk.pid = p.pid
    join train tr on tk.tid = tr.tid
    where tk.tid = t and tk.jdate = d;
end $$


-- checks all waitlisted passengers on a train pnr and name 
create procedure waitlist(in t int)
begin
    select name, pnr , email , phone 
    from ticket tk
    join passenger p on tk.pid = p.pid
    where tk.tid = t and bstatus = 'waitlist';
end $$


-- refunds all passengers on a train with ticket id 
create procedure refund(
    in t int -- Ticket ID
    )
begin
    select sum(amount) as totalrefund
    from payment p
    join ticket tkt on p.ticketid = tkt.ticketid
    where tkt.tid = t and tkt.bstatus = 'cancelled';
end $$

-- gives total revenue of a train with betenn time intervals of date 
create procedure revenue(in sd date, in ed date)
begin
    select sum(amount) as totalrevenue from payment where pdate between sd and ed;
end $$


-- cacelles reservation 
create procedure cancelrec()
begin
    select pnr, refund
    from ticket tk
    join payment p on tk.ticketid = p.ticketid
    where bstatus = 'cancelled';
end $$


-- gives the most busy route 
create procedure busyroute()
begin
    select r.tid, count(*) as pc
    from ticket tk
    join route r on tk.tid = r.tid
    group by r.tid
    order by pc desc
    limit 1;
end $$


-- gives bill of pnr 
create procedure bill(
    in p bigint    -- PNR number
)
begin
    select tk.pnr, p.amount, p.mode
    from ticket tk
    join payment p on tk.ticketid = p.ticketid
    where tk.pnr = p;
end $$


-- gives total amount to be paid 
create procedure Total_due_amount(
    in p_pid int  -- Passenger ID
)
begin 
select sum(amount) as total_due
from payment p 
join ticket t on p.ticketid = t.ticketid
where t.pid = p_pid and p.mode is  NULL;
end $$


-- PAYS for a ticket 
CREATE PROCEDURE pay_ticket(
    IN p_pid INT,          -- Passenger ID
    IN p_ticketid INT,     -- Ticket ID
    IN p_mode VARCHAR(10)  -- Payment Mode (e.g., 'online', 'counter')
)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM payment p
        JOIN ticket t ON p.ticketid = t.ticketid
        WHERE t.pid = p_pid AND p.ticketid = p_ticketid AND p.mode IS NULL
    ) THEN
        
        UPDATE payment
        SET mode = p_mode
        WHERE ticketid = p_ticketid;
    ELSE
        
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid ticket or payment already made';
    END IF;
END$$


-- books a ticket for a passenger with passangerid and seatid 
CREATE PROCEDURE book_ticket(
    IN p_pid INT,          -- Passenger ID
    IN p_seatid INT        -- Seat ID
)
BEGIN
    DECLARE seat_status VARCHAR(10);
    DECLARE seat_tid INT;
    DECLARE seat_cid INT;
    DECLARE seat_jdate DATE;
    DECLARE seat_rid INT;
    DECLARE pnr_value BIGINT;

    SELECT status, tid, cid, jdate, rid
    INTO seat_status, seat_tid, seat_cid, seat_jdate, seat_rid
    FROM seat
    WHERE seatid = p_seatid
    LIMIT 1;

    IF seat_status = 'available' THEN

        SET pnr_value = 1000000000 * p_pid + p_seatid;

        INSERT INTO ticket (pnr, pid, tid, seatid, cid, jdate, rid, bstatus)
        VALUES (pnr_value, p_pid, seat_tid, p_seatid, seat_cid, seat_jdate, seat_rid, 'confirmed');

        UPDATE seat
        SET status = 'booked'
        WHERE seatid = p_seatid;
    ELSEIF seat_status = 'rac' THEN 

            SET pnr_value = 1000000000 * p_pid + p_seatid;
            INSERT INTO ticket (pnr, pid, tid, seatid, cid, jdate, rid, bstatus)
            VALUES (pnr_value, p_pid, seat_tid, p_seatid, seat_cid, seat_jdate, seat_rid, 'rac');
            UPDATE seat
            SET status = 'booked'
            WHERE seatid = p_seatid;
        ELSE

            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Seat not available';
    END IF;
END$$

DELIMITER ;