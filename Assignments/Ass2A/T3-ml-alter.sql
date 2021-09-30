--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-ml-alter.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 tut 2

/* Comments for your marker:




*/

-- 3 (a)

ALTER TABLE book_copy
ADD book_cond char(1) default 'G' Not NULL;

COMMENT ON COLUMN book_copy.book_cond IS
    'A book is damaged (D) or lost (L). If the book is not damaged or lost, then it
is good (G) ';

ALTER TABLE book_copy
    ADD CONSTRAINT bc_cond_chk CHECK ( book_cond IN ( 'D', 'L', 'G' ) );
    
commit;

update book_copy
set book_cond = 'L'
where branch_code = (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395601655
    ) AND book_call_no = '005.74 C824C';

commit;

-- 3 (b)
ALTER TABLE loan
ADD returned_branch Number(2,0);

COMMENT ON COLUMN loan.returned_branch IS
    'Branch code of which book on loan is returned to.';
commit;

update loan
set returned_branch = branch_code
where loan_actual_return_date is Not NULL;

commit;
-- 3 (c)



