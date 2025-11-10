/* #SQLWithIDC 
Day 7 (10/11): HAVING Clause
Topics: HAVING clause, filtering aggregated results */

-- Practice Qns

-- Q1.Find services that have admitted more than 500 patients in total.
select service, SUM(patients_admitted)
from services_weekly
group by service
having SUM(patients_admitted)>500;

-- Q2.Show services where average patient satisfaction is below 75.
select service, AVG(patient_satisfaction)
from services_weekly
group by service
having AVG(patient_satisfaction)<75;

-- Q3.List weeks where total staff presence across all services was less than 50.
select week, SUM(present)
from staff_schedule
group by week
having SUM(present)<50;

-- Daily Challenge

-- Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.
select service, SUM(patients_refused), AVG(patient_satisfaction)
from services_weekly
group by service
having SUM(patients_refused)>100 AND AVG(patient_satisfaction)<80;
