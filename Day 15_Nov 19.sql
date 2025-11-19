/* #SQLWithIDC 
Day 15 (19/11): Multiple Joins
Topics: Joining more than two tables, complex relationships */

-- Practice Qns

-- Q1.Join patients, staff, and staff_schedule to show patient service and staff availability.
select p.*,
s.*, ss.*
from patients p
left join staff s on p.service=s.service
left join staff_schedule ss on s.service=ss.service;


-- Q2.Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
select sw.*,
s.*, ss.*
from services_weekly sw
left join staff s on sw.service=s.service
left join staff_schedule ss on s.service=ss.service;

-- Q3.Create a multi-table report showing patient admissions with staff information.
select p.*,
s.*
from patients p
left join staff s on p.service=s.service;


-- Daily Challenge

-- Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.
select sw.service,
sw.patients_admitted,
sw.patients_refused,
AVG(sw.patient_satisfaction),
COUNT(distinct s.staff_id) AS count_of_staff_assigned,
COUNT(distinct CASE 
WHEN ss.present = 1 
THEN ss.staff_id 
END) AS staff_present
from services_weekly sw
left join staff_schedule ss on sw.service=ss.service and ss.week = 20
left join staff s on sw.service=s.service
where sw.week = 20
group by sw.service,sw.patients_admitted,sw.patients_refused
order by sw.patients_admitted DESC;
