/* #SQLWithIDC 
Days 4 (06/11): LIMIT and OFFSET
Topics: LIMIT, OFFSET, pagination concepts */

-- Practice Qns

-- Q1.Display the first 5 patients from the patients table.
select *
from patients
LIMIT 5;

-- Q2.Show patients 11-20 using OFFSET.
select *
from patients
LIMIIT 10
OFFSET 10;

-- Q3.Get the 10 most recent patient admissions based on arrival_date.
select *
from patients
order by arrival_date DESC
LIMIT 10;

-- Daily Challenge

-- Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records.
select patient_id, name, service, satisfaction
from patients
order by satisfaction DESC
LIMIT 5
offset 2;
/* since multiple patients have the same satisfaction score, the output seems shuffled or inconsistent so we can add a tie-breaker column (for stable ordering) if required
eg : select patient_id, name, service, satisfaction
from patients
order by satisfaction DESC, patient_id
LIMIT 5
offset 2; */
