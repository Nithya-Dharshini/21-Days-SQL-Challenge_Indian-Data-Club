/* #SQLWithIDC 
Day 5 (07/11): Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
Topics: COUNT, SUM, AVG, MIN, MAX functions */

-- Practice Qns

-- Q1.Count the total number of patients in the hospital.
select count(distinct patient_id) as total_no_of_patients
from patients;

-- Q2.Calculate the average satisfaction score of all patients.
select AVG(satisfaction) as avg_satisfaction_score
from patients;

-- Q3.Find the minimum and maximum age of patients.
select MIN(age), MAX(age)
from patients;

-- Daily Challenge

-- Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
select SUM(patients_admitted) as total_no_of_patients_admitted,
SUM(patients_refused) as total_patients_refused,
round(AVG(patient_satisfaction),2) as avg_patient_satisfaction
from services_weekly;