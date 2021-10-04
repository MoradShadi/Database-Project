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

DROP TABLE Branch_Management PURGE;

CREATE TABLE Branch_Management (
    branch_code         NUMBER(2) NOT NULL,
    man_id              NUMBER(2) NOT NULL,
    genre_managed       char(1) DEFAULT 'B' NOT NULL
);

COMMENT ON COLUMN Branch_Management.genre_managed IS
    'Identifies which genre(s) a manager at a given branch handles -> (R)-reference, (F)- fiction, (B)-both reference and fiction ';
    
ALTER TABLE Branch_Management
    ADD CONSTRAINT bm_genre_chk CHECK ( genre_managed IN ( 'R', 'F', 'B' ) );

ALTER TABLE Branch_Management ADD CONSTRAINT Branch_Management_pk PRIMARY KEY ( branch_code, man_id );

ALTER TABLE Branch_Management
    ADD CONSTRAINT branch_Branch_Management FOREIGN KEY ( branch_code )
        REFERENCES branch ( branch_code );
        
ALTER TABLE Branch_Management
    ADD CONSTRAINT manager_Branch_Management FOREIGN KEY ( man_id )
        REFERENCES manager ( man_id );
commit;

INSERT INTO Branch_Management (branch_code, man_id)
Select branch_code, man_id
from Branch;

commit;

ALTER TABLE Branch
DROP CONSTRAINT manager_branch;

ALTER TABLE Branch
DROP COLUMN man_id;

commit;

UPDATE Branch_Management
set genre_managed = 'R'
where branch_code = (select branch_code from branch where branch_contact_no = '0395413120') AND man_id = 10;

commit;

Insert INTO Branch_Management values((select branch_code from branch where branch_contact_no = '0395413120'),12, 'F');

commit;