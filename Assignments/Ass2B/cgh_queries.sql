--****PLEASE ENTER YOUR DETAILS BELOW****
--cgh_queries.sql

--Student ID: 29799260
--Student Name: Morad Abou Shadi
--Tutorial No: FIT3171 Tutorial 2

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolons
-- (;) at the end of this answer
SELECT doctor_title, doctor_fname, doctor_lname, doctor_phone
FROM ((CGH.Doctor D JOIN CGH.Doctor_speciality DS ON D.doctor_id = DS.doctor_id) JOIN CGH.speciality S ON DS.spec_code = S.spec_code)
WHERE Upper(spec_description) = 'ORTHOPEDIC SURGERY'
ORDER BY doctor_lname,doctor_fname;

/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT item_code, item_description, item_stock, cc_title
FROM cgh.item I JOIN CGH.costcentre CC on I.cc_code = cc.cc_code
WHERE item_stock > 50 AND lower(item_description) LIKE '%disposable%'
ORDER BY item_code;

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer


/*
    Q9a (FIT2094 only) or Q9b (FIT3171 only)
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer

