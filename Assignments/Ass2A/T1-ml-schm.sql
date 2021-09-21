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

COMMENT ON COLUMN book_copy.bc_id IS
    'Book copy identifier';

COMMENT ON COLUMN book_copy.bc_purchase_price IS
    'Price of book';
    
COMMENT ON COLUMN book_copy.bc_counter_reserve IS
    'Reserved for the library?';
    
ALTER TABLE book_copy ADD CONSTRAINT book_copy_pk PRIMARY KEY ( branch_code, bc_id );


-- LOAN
CREATE TABLE loan (
    branch_code         NUMBER(2) NOT NULL,
    bc_id      NUMBER(6) NOT NULL,
    loan_date_time      DATE NOT NULL,
    loan_due_date   DATE NOT NULL,
    loan_actual_return_date DATE,
    bor_no NUMBER(6) NOT NULL
);

COMMENT ON COLUMN loan.loan_date_time IS
    'Date and time the book went out on loan';
    
COMMENT ON COLUMN loan.loan_due_time IS
    'Date and time the book is due for return';

COMMENT ON COLUMN loan.loan_actual_return_date IS
    'Date and time the book actually got returned';
    
ALTER TABLE loan ADD CONSTRAINT loan_pk PRIMARY KEY ( branch_code, bc_id, loan_date_time );

-- RESERVE
CREATE TABLE reserve (
    reserve_id          NUMBER(6) NOT NULL,
    branch_code         NUMBER(2) NOT NULL,
    bc_id      NUMBER(6) NOT NULL,
    reserve_date_time_placed      DATE NOT NULL,
    bor_no NUMBER(6) NOT NULL
);

COMMENT ON COLUMN reserve.reserve_id IS
    'Reserve identifier';
    
COMMENT ON COLUMN reserve.reserve_date_time_placed IS
    'date and time on which the reservation was placed';

ALTER TABLE reserve ADD CONSTRAINT reserve_pk PRIMARY KEY ( reserve_id );

ALTER TABLE reserve ADD CONSTRAINT reserve_date_time_uq UNIQUE ( branch_code, bc_id, reserve_date_time_placed );


-- Add all missing FK Constraints below here

ALTER TABLE book_copy
    ADD CONSTRAINT bookdet_bookcopy FOREIGN KEY ( book_call_no )
        REFERENCES book_detail ( book_call_no );
        
ALTER TABLE book_copy
    ADD CONSTRAINT branch_bookcopy FOREIGN KEY ( branch_code )
        REFERENCES branch ( branch_code );
        
ALTER TABLE reserve
    ADD CONSTRAINT borrower_reserve FOREIGN KEY ( bor_no )
        REFERENCES burrower ( bor_no );

ALTER TABLE reserve
    ADD CONSTRAINT bookcopy_reserve FOREIGN KEY ( branch_code, bc_id )
        REFERENCES book_copy ( branch_code, bc_id );
        
ALTER TABLE loan
    ADD CONSTRAINT borrower_loan FOREIGN KEY ( bor_no )
        REFERENCES borrower ( bor_no );
        
ALTER TABLE loan
    ADD CONSTRAINT bookcopy_loan FOREIGN KEY ( branch_code, bc_id )
        REFERENCES book_copy ( branch_code, bc_id );
        