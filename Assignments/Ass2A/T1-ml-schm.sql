--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-ml-schm.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 tut 2

/* Comments for your marker:




*/

-- 1.1 Add Create table statments for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- BOOK_COPY
CREATE TABLE book_copy (
    branch_code         NUMBER(2) NOT NULL,
    bc_id      NUMBER(6) NOT NULL,
    bc_purchase_price      NUMBER(7,2) NOT NULL,
    bc_counter_reserve CHAR(1) NOT NULL,
    book_call_no VARCHAR2(20) NOT NULL
);


-- LOAN
CREATE TABLE loan (
    branch_code         NUMBER(2) NOT NULL,
    bc_id      NUMBER(6) NOT NULL,
    loan_date_time      DATE NOT NULL,
    loan_due_date   DATE NOT NULL,
    loan_actual_return_date DATE,
    bor_no NUMBER(6) NOT NULL
);

-- RESERVE
CREATE TABLE reserve (
    reserve_id          NUMBER(6) NOT NULL,
    branch_code         NUMBER(2) NOT NULL,
    bc_id      NUMBER(6) NOT NULL,
    reserve_date_time_placed      DATE NOT NULL,
    bor_no NUMBER(6) NOT NULL
);

-- Add all missing FK Constraints below here



