/* #SQLWithIDC 
Day 19 (25/11): Window Functions - ROW_NUMBER, RANK, DENSE_RANK
Topics: ROW_NUMBER(), RANK(), DENSE_RANK(), OVER clause */

-- Practice Qns

-- Q1.Rank patients by satisfaction score within each service.
select patient_id,
name,
service,
satisfaction,
row_number() over (partition by service order by satisfaction DESC) as patients_satisfaction_rank
from patients;


-- Q2.Assign row numbers to staff ordered by their name.
select staff_id,
staff_name,
row_number() over (order by staff_name) as row_num
from staff;


-- Q3.Rank services by total patients admitted.
select service,
sum(patients_admitted) as total_patients_admitted,
row_number() over (order by sum(patients_admitted) DESC) as service_rank
from services_weekly
group by service;


-- Daily Challenge

-- For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.
select * from(
	select service,
    week,
    patient_satisfaction,
    patients_admitted,
    dense_rank() over (partition by service order by patient_satisfaction DESC) as patient_satisfaction_rank
    from services_weekly) t
where patient_satisfaction_rank<=3;

							
