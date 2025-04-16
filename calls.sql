-- checking procs
call pnr(1000000003);
call seat_details(5);
call sched(2);
call avail(1,1);
call rac(1, 1);
call all_seats_class(1, 1);
call passlist(1, '2025-04-20');
call waitlist(1);
call refund(1);
call revenue('2025-04-01', '2025-04-30');
call cancelrec();
call busyroute();
call bill(1000000003);
call rac(1, 1);
call all_seats_class(1, 1);
call all_seats_train(1);
call Total_due_amount(1);
call pay_ticket(1, 1, 'online');
call book_ticket(1, 9);
select * from ticket ; 


