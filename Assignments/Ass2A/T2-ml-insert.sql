--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-ml-insert.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 tut 2

/* Comments for your marker:




*/

-- 2 (a) Load the BOOK_COPY, LOAN and RESERVE tables with your own
-- test data following the data requirements expressed in the brief
INSERT INTO book_copy VALUES (
    10,
    1,
    100.20,
    'N',
    '005.74 D691D'
);

INSERT INTO book_copy VALUES (
    10,
    2,
    100.20,
    'N',
    '005.74 D691D'
);

INSERT INTO book_copy VALUES (
    10,
    3,
    100.20,
    'Y',
    '005.74 D691D'
);

INSERT INTO book_copy VALUES (
    10,
    4,
    99.99,
    'N',
    '005.432 L761P'
);

INSERT INTO book_copy VALUES (
    11,
    1,
    89.99,
    'N',
    '112.6 S874D'
);

INSERT INTO book_copy VALUES (
    11,
    2,
    99.99,
    'N',
    '005.432 L761P'
);

INSERT INTO book_copy VALUES (
    11,
    3,
    99.99,
    'Y',
    '005.432 L761P'
);

INSERT INTO book_copy VALUES (
    13,
    1,
    100.20,
    'N',
    '005.74 D691D'
);

INSERT INTO book_copy VALUES (
    13,
    2,
    149.99,
    'N',
    '823.914 H219A'
);

INSERT INTO book_copy VALUES (
    13,
    3,
    129.99,
    'N',
    '823.914 A211H'
);

INSERT INTO book_copy VALUES (
    13,
    4,
    129.99,
    'Y',
    '823.914 A211H'
);

INSERT INTO book_copy VALUES (
    13,
    5,
    89.99,
    'N',
    '112.6 S874D'
);

INSERT INTO loan VALUES (
    10,
    1,
    TO_DATE('2021-06-02 10:34:09', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-06-16', 'YYYY-MM-DD'),
    TO_DATE('2021-06-16', 'YYYY-MM-DD'),
    1
);

INSERT INTO loan VALUES (
    10,
    1,
    TO_DATE('2021-06-16 18:39:19', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-06-30', 'YYYY-MM-DD'),
    TO_DATE('2021-06-22', 'YYYY-MM-DD'),
    1
);

INSERT INTO loan VALUES (
    10,
    4,
    TO_DATE('2021-06-11 18:39:19', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-06-25', 'YYYY-MM-DD'),
    TO_DATE('2021-06-24', 'YYYY-MM-DD'),
    1
);

INSERT INTO loan VALUES (
    11,
    1,
    TO_DATE('2021-06-03 19:49:09', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-06-17', 'YYYY-MM-DD'),
    TO_DATE('2021-06-18', 'YYYY-MM-DD'),
    2
);

INSERT INTO loan VALUES (
    11,
    2,
    TO_DATE('2021-06-03 19:49:09', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-06-17', 'YYYY-MM-DD'),
    TO_DATE('2021-06-18', 'YYYY-MM-DD'),
    2
);

INSERT INTO loan VALUES (
    11,
    1,
    TO_DATE('2021-07-03 10:37:10', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-07-17', 'YYYY-MM-DD'),
    TO_DATE('2021-07-25', 'YYYY-MM-DD'),
    2
);

INSERT INTO loan VALUES (
    11,
    2,
    TO_DATE('2021-08-15 05:28:06', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-08-29', 'YYYY-MM-DD'),
    NULL,
    3
);

INSERT INTO loan VALUES (
    13,
    2,
    TO_DATE('2021-07-01 15:48:06', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-07-15', 'YYYY-MM-DD'),
    TO_DATE('2021-07-10', 'YYYY-MM-DD'),
    5
);

INSERT INTO loan VALUES (
    13,
    5,
    TO_DATE('2021-07-16 15:48:06', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-07-30', 'YYYY-MM-DD'),
    TO_DATE('2021-07-29', 'YYYY-MM-DD'),
    5
);

INSERT INTO loan VALUES (
    13,
    3,
    TO_DATE('2021-08-16 23:42:16', 'YYYY-MM-DD HH24:MI:SS'),
    TO_DATE('2021-08-30', 'YYYY-MM-DD'),
    NULL,
    5
);

INSERT INTO reserve VALUES (
    1,
    13,
    3,
    TO_DATE('2021-08-25 20:32:06', 'YYYY-MM-DD HH24:MI:SS'),
    3
);

INSERT INTO reserve VALUES (
    2,
    11,
    2,
    TO_DATE('2021-08-30 06:12:46', 'YYYY-MM-DD HH24:MI:SS'),
    5
);

commit;