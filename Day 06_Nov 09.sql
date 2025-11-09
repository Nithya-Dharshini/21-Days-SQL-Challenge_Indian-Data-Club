/* #SQLWithIDC 
Day 6 (09/11): GROUP BY Clause
Topics: GROUP BY, aggregating by categories */

-- Practice Qns

-- Q1.Count the number of patients by each service.
select service, count(distinct patient_id) as no_of_patients
from patients
group by service;

-- Q2.Calculate the average age of patients grouped by service.
select service, AVG(age) as avg_patients_age
from patients
group by service;

-- Q3.Find the total number of staff members per role.
select role, COUNT(distinct staff_id) AS no_of_staff
from staff
group by role;

-- Daily Challenge

-- For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
select service, SUM(patients_admitted), SUM(patients_refused), (SUM(patients_admitted)*100/SUM(patients_request)) AS admission_rate
from services_weekly
group by service
order by admission_rate DESC;
