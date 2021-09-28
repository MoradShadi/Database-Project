--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-ml-dm.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 tut 2

/* Comments for your marker:




*/

-- 2 (b) (i)
INSERT INTO book_detail VALUES (
    '005.74 C824C',
    'Database Systems: Design, Implementation, and Management',
    'R',
    793,
    to_date('2019','YYYY'),
    '13'
);

INSERT INTO book_copy VALUES (
    (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395413120
    ),
        (
        SELECT
            Max(bc_id)
        FROM
            (book_copy join branch on book_copy.branch_code = branch.branch_code)
        WHERE
            branch_contact_no = 0395413120) + 1,
    120.00,
    'N',
    '005.74 C824C'
);

INSERT INTO book_copy VALUES (
    (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395601655
    ),
        (
        SELECT
            Max(bc_id)
        FROM
            (book_copy join branch on book_copy.branch_code = branch.branch_code)
        WHERE
            branch_contact_no = 0395601655) + 1,
    120.00,
    'N',
    '005.74 C824C'
);

INSERT INTO book_copy VALUES (
    (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395461253
    ),
        (
        SELECT
            Max(bc_id)
        FROM
            (book_copy join branch on book_copy.branch_code = branch.branch_code)
        WHERE
            branch_contact_no = 0395461253) + 1,
    120.00,
    'N',
    '005.74 C824C'
);



-- 2 (b) (ii)

DROP SEQUENCE borrower_seq;

CREATE SEQUENCE borrower_seq START WITH 100 INCREMENT BY 1;

DROP SEQUENCE reserve_seq;

CREATE SEQUENCE reserve_seq START WITH 100 INCREMENT BY 1;



-- 2 (b) (iii)

INSERT INTO borrower VALUES (
    borrower_seq.NEXTVAL,
    'Ada',
    'Lovelace',
    'Old airport',
    'Doha',
    '209',
    (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395413120
    )
);

INSERT INTO reserve VALUES (
    reserve_seq.NEXTVAL,
        (
        SELECT
            branch_code
        FROM
            branch
        WHERE
            branch_contact_no = 0395413120
    ),
            (
        SELECT
            bc_id
        FROM
            (book_copy join branch on book_copy.branch_code = branch.branch_code)
        WHERE
            branch_contact_no = 0395413120 AND book_call_no = '005.74 C824C'),
    TO_DATE('2021-09-14 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),
            (
        SELECT
            bor_no
        FROM
            borrower
        WHERE
            bor_fname = 'Ada' AND bor_lname = 'Lovelace'
    )
);

commit;

-- 2 (b) (iv)

