/* #SQLWithIDC 
Day 3 (05/11): Sorting Data with ORDER BY
Topics: ORDER BY, ASC/DESC, multiple column sorting */


-- Practice Qns

-- Q1.List all patients sorted by age in descending order.
select name
from patients
order by age DESC;

-- Q2.Show all services_weekly data sorted by week number ascending and patients_request descending.
select *
from services_weekly
order by week ASC, patients_request DESC;

-- Q3.Display staff members sorted alphabetically by their names.
select staff_name
from staff
order by staff_name ASC;

-- Daily Challenge

-- Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.
select week, service, patients_refused, patients_request
from services_weekly
order by patients_refused DESC
LIMIT 5;