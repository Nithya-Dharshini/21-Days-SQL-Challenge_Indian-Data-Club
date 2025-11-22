/* #SQLWithIDC 
Day 17 (22/11): Subqueries (SELECT and FROM clause)
Topics: Subqueries in SELECT, derived tables, inline views */

-- Practice Qns

-- Q1.Show each patient with their service's average satisfaction as an additional column.
select p1.name, p1.service,
(select AVG(p2.satisfaction)
from patients p2
where p2.service=p1.service) as avg_satisfaction_per_service
from patients p1;


-- Q2.Create a derived table of service statistics and query from it.
select *
from (
    select
        service,
        SUM(available_beds) AS total_beds,
        SUM(patients_request) AS total_requests,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        AVG(patient_satisfaction) AS avg_satisfaction,
        SUM(staff_morale) AS total_morale
    from services_weekly
    group by service
) AS service_stats;



-- Q3.Display staff with their service's total patient count as a calculated field.
select s.staff_name, s.service,
(select SUM(sw.patients_admitted)
from services_weekly sw
where s.service=sw.service) as total_patient_count_service
from staff s;


-- Daily Challenge

-- Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
select
    service,
    total_patients_admitted,
    total_patients_admitted - avg_admissions_all as patients_admitted_deviation,
    case 
        WHEN total_patients_admitted - avg_admissions_all > 0 THEN 'Above Average'
        WHEN total_patients_admitted - avg_admissions_all < 0 THEN 'Below Average'
        ELSE 'Average'
	end as Rank_Indicator
from(
    select service,
	SUM(patients_admitted) as total_patients_admitted,
	(select AVG(patients_admitted) from services_weekly) as avg_admissions_all
    from services_weekly
	group by service
) as t
order by total_patients_admitted DESC;

							
