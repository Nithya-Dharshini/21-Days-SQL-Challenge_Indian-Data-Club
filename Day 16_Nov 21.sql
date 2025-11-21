/* #SQLWithIDC 
Day 16 (21/11): Subqueries (WHERE clause)
Topics: Subqueries in WHERE, nested queries, filtering with subqueries */

-- Practice Qns

-- Q1.Find patients who are in services with above-average staff count.
select *
from patients
where service in(
    select service
    from staff
    group by service
    having COUNT(*)>(
        select avg(staff_count)
        from (
            select service, count(*) AS staff_count
            from staff
            group by service
        ) t
    )
);


-- Q2.List staff who work in services that had any week with patient satisfaction below 70.
select *
from staff
where service in(
    select distinct service
    from services_weekly
    where patient_satisfaction<70
);


-- Q3.Show patients from services where total admitted patients exceed 1000.
select *
from patients
where service in(
    select service
    from services_weekly
    group by service
    having SUM(patients_admitted)>1000
);


-- Daily Challenge

-- Find all patients who were admitted to services that had at least one week where patients were refused AND the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score.
select patient_id,name,service,satisfaction
from patients
where service in(
	select service
	from services_weekly
	group by service
	having SUM(CASE WHEN patients_refused>0 
	THEN 1 
	ELSE 0 END)>0 and
	avg(patient_satisfaction) < (
		select avg(patient_satisfaction)
		from services_weekly));
