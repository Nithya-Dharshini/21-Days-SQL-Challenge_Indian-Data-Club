/* #SQLWithIDC 
Day 2 (04/11): Filtering Data with WHERE Clause
Topics: WHERE clause, comparison operators, basic filtering */


-- Practice Qns

-- Q1.Find all patients who are older than 60 years.
select name
from patients
where age>60;

-- Q2.Retrieve all staff members who work in the 'Emergency' service.
select distinct staff_name
from staff_schedule
where service="emergency";

-- Q3.List all weeks where more than 100 patients requested admission in any service.
select week, month
from services_weekly
where patients_request>100;

-- Daily Challenge

-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.
select patient_id, name, age, satisfaction
from patients
where service="surgery" AND satisfaction<70;
