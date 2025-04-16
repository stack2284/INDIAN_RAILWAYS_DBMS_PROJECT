
delimiter $$
-- adding route 
CREATE TRIGGER after_route_insert
AFTER INSERT ON route
FOR EACH ROW
BEGIN
    INSERT INTO seat (tid, cid, seatno, jdate, status , rid)
    SELECT NEW.tid, st.cid, st.seatno, NEW.jdate, st.status , NEW.rid 
    FROM seat_train st
    WHERE st.tid = NEW.tid;
END$$

CREATE TRIGGER after_route_delete
BEFORE DELETE ON route
FOR EACH ROW
BEGIN
    DELETE FROM seat
    WHERE tid = OLD.tid AND jdate = OLD.jdate;
END$$



-- making seat booked
create trigger seatbook
after insert on ticket
for each row
begin
    update seat set status = 'booked' where seatid = new.seatid;
end $$

-- setting refund pending
create trigger refundset
after update on ticket
for each row
begin
    if new.bstatus = 'cancelled' then
        update payment set refund = 'pending' where ticketid = new.ticketid;
    end if;
end $$


-- making seat free again
create trigger seatfree
after update on ticket
for each row
begin
    if new.bstatus = 'cancelled' then
        update seat set status = 'available' where seatid = new.seatid;
    end if;
end $$



