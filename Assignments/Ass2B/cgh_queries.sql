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
SELECT A.patient_id, ltrim(patient_fname || ' ' || patient_lname) AS "Patient Name", to_char(adm_date_time,'dd-mm-yyyy hh24:mi:ss') AS "adm_date_time", doctor_title || ' ' || ltrim(doctor_fname || ' ' || doctor_lname) AS "Doctor
 Name"
FROM ((CGH.admission A JOIN CGH.patient P ON P.patient_id = A.patient_id) JOIN CGH.doctor D ON A.doctor_id = D.doctor_id )
WHERE adm_date_time BETWEEN to_date('11-09-2021 10:00:00','dd-mm-yyyy hh24:mi:ss') AND to_date('14-09-2021 18:00:00','dd-mm-yyyy hh24:mi:ss')
ORDER BY adm_date_time;
/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT proc_code, proc_name, proc_description, to_char(proc_std_cost, '$9999.99') AS "prod_std_cost"
FROM cgh.procedure
WHERE proc_std_cost < (SELECT avg(proc_std_cost) FROM cgh.procedure)
ORDER BY proc_std_cost DESC;

/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT A.patient_id , patient_lname, patient_fname, patient_dob, count(A.patient_id) As "Admission Count"
FROM CGH.admission A JOIN CGH.patient P ON P.patient_id = A.patient_id
GROUP BY A.patient_id, patient_lname, patient_fname, patient_dob
HAVING count(A.patient_id) > 2
ORDER BY count(A.patient_id) DESC, patient_dob;

/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer

SELECT adm_no, A.patient_id, patient_fname, patient_lname, trunc((adm_discharge - adm_date_time)) || ' days ' || ltrim(to_char(mod((to_number(adm_discharge - adm_date_time))*24,24),'990.0'))|| ' hours' AS "Length of stay"
FROM CGH.admission A JOIN CGH.patient P ON P.patient_id = A.patient_id
WHERE adm_discharge is Not NULL AND (adm_discharge - adm_date_time) > (SELECT AVG(adm_discharge - adm_date_time) FROM CGH.admission)
ORDER BY adm_no;


/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer

SELECT AP.proc_code, proc_name, proc_description, proc_time, proc_std_cost, AVG(adprc_pat_cost) - proc_std_cost As "Procedure Price Differential"
FROM CGH.adm_prc AP JOIN CGH.procedure P on AP.proc_code = P.proc_code 
group by AP.proc_code, proc_name, proc_description, proc_time, proc_std_cost
ORDER BY proc_code;

/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer

SELECT P.proc_code, proc_name, NVL(IT.item_code,'---') AS "item_code", NVL(item_description,'---') AS "item_description", NVL(to_char(max(it.it_qty_used)),'---') AS "Maximum Quantity"
FROM ((CGH.procedure P LEFT JOIN CGH.adm_prc AP on p.proc_code = ap.proc_code) LEFT JOIN CGH.item_treatment IT on IT.adprc_no = AP.adprc_no) LEFT JOIN CGH.item I on I.item_code = IT.item_code 
group by P.proc_code, proc_name, NVL(IT.item_code,'---'), NVL(item_description,'---')
ORDER BY proc_name;

/*
    Q9a (FIT2094 only) or Q9b (FIT3171 only)
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer

SELECT adprc_no, proc_code, AP.adm_no, patient_id, to_char(adprc_date_time,'dd-mm-yyyy hh24:mi:ss') AS "adprc_date_time", adprc_pat_cost + adprc_items_cost As "Total Cost"
From CGH.admission A JOIN CGH.adm_prc AP on A.adm_no = AP.adm_no
ORDER BY adprc_no;
