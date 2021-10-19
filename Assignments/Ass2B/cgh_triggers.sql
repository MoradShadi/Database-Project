--****PLEASE ENTER YOUR DETAILS BELOW****
--cgh_triggers.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 tutorial 2

/* Comments for your marker:




*/


/*
    Trigger1
*/
/*Please copy your trigger code with a slash(/) followed by an empty line after this line*/
CREATE OR REPLACE TRIGGER cost_gap
    BEFORE INSERT ON ADM_PRC
    FOR EACH ROW
DECLARE
    lower20 number(7,2);
    upper20 number(7,2);
BEGIN
    SELECT proc_std_cost*0.8 INTO lower20 FROM procedure WHERE PROC_CODE = :new.proc_code;
    SELECT proc_std_cost*1.2 INTO upper20 FROM procedure WHERE PROC_CODE = :new.proc_code;
    IF :new.adprc_pat_cost > upper20 or :new.adprc_pat_cost <lower20 THEN
        raise_application_error(-20000, 'Charged procedure cost cannot be outside 20% of standard cost!');
    END IF;
END;
/



/*Test Harness for Trigger1*/
/*Please copy SQL statements for Test Harness after this line*/

--display before values
select* from adm_prc;

--trying to insert value greater than 20% of standard cost, will not be allowed
insert into adm_prc values ('1030', to_date('01-08-2021 15:30:00', 'dd-mm-yyyy HH24:mi:ss'), 37, 0, 100010, 65554);

--display values after attempted change, will be the same as before
select* from adm_prc;

--inserting valid value, row will be inserted successfully
insert into adm_prc values ('1030', to_date('01-08-2021 15:30:00', 'dd-mm-yyyy HH24:mi:ss'), 36, 0, 100010, 65554);

--display values after, will have the newly inserted row
select* from adm_prc;

--trying to insert value less than 20% of standard cost, will not be allowed
insert into adm_prc values ('1040', to_date('02-08-2021 15:35:00', 'dd-mm-yyyy HH24:mi:ss'), 23, 0, 100010, 65554);

--display values after attempted change, will be the same as before
select* from adm_prc;

--inserting valid value, row will be inserted successfully
insert into adm_prc values ('1040', to_date('02-08-2021 15:35:00', 'dd-mm-yyyy HH24:mi:ss'), 24, 0, 100010, 65554);

--display values after, will have the newly inserted row
select* from adm_prc;

--closes transaction
rollback;


/*
    Trigger2
*/
/*Please copy your trigger code with a slash(/) followed by an empty line after this line*/

CREATE OR REPLACE TRIGGER discharge_check
    AFTER UPDATE of adm_discharge on admission
    FOR EACH ROW
DECLARE
    last_proc_end DATE;
    admin_cost number(7,2) DEFAULT 50;
    pat_cost number(7,2) DEFAULT 0;
    item_cost number(7,2) DEFAULT 0;
BEGIN
    SELECT MAX(adprc_date_time) INTO last_proc_end FROM adm_prc WHERE adm_no = :new.adm_no;
    SELECT SUM(adprc_pat_cost) INTO pat_cost FROM adm_prc WHERE adm_no = :new.adm_no;
    SELECT SUM(adprc_items_cost) INTO item_cost FROM adm_prc WHERE adm_no = :new.adm_no;
    IF :new.adm_discharge < last_proc_end or :new.adm_discharge < :new.adm_date_time THEN
        raise_application_error(-20000, 'Discharge date/time not allowed!');
    ELSE UPDATE admission SET adm_total_cost = (admin_cost + pat_cost + item_cost) WHERE adm_no = :old.adm_no;
    
    END IF;
END;
/



/*Test Harness for Trigger2*/
/*Please copy SQL statements for Test Harness after this line*/

select* from admission;

UPDATE admission
set adm_discharge =  to_date('02-11-2021 15:35:00', 'dd-mm-yyyy HH24:mi:ss')
WHERE adm_no = '100280'