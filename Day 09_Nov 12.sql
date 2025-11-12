/* #SQLWithIDC 
Day 9 (12/11): Date Functions
Topics: DATE functions, date arithmetic, EXTRACT */

-- Practice Qns

-- Q1.Extract the year from all patient arrival dates.
select name, year(arrival_date)
from patients;

-- Q2.Calculate the length of stay for each patient (departure_date - arrival_date).
select name, datediff(departure_date, arrival_date) AS stay_length
from patients;

-- Q3.Find all patients who arrived in a specific month.
select name, arrival_date
from patients
where month(arrival_date)=6;

-- Daily Challenge

-- Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.
select service, count(patient_id), avg(datediff(departure_date, arrival_date)) as avg_stay_length
from patients
group by service
having avg(datediff(departure_date, arrival_date))>7
order by avg(datediff(departure_date, arrival_date)) DESC;
