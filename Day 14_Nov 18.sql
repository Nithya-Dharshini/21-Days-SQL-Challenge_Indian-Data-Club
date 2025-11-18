/* #SQLWithIDC 
Day 14 (18/11): LEFT JOIN and RIGHT JOIN
Topics: LEFT JOIN, RIGHT JOIN, including unmatched records */

-- Practice Qns

-- Q1.Show all staff members and their schedule information (including those with no schedule entries).
select s.staff_name,
ss.week, ss.staff_id, ss.role, ss.service, ss.present
from staff s
left join staff_schedule ss
on s.staff_id = ss.staff_id;


-- Q2.List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
select sw.*,
s.staff_name
from services_weekly sw
left join staff s
on sw.service=s.service;

-- Q3.Display all patients and their service's weekly statistics (if available).
select p.name,
sw.*
from patients p
left join services_weekly sw
on p.service=sw.service;

-- Daily Challenge

-- Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records. Order by weeks present descending.
select s.*,
count(ss.week) as weeks_present
from staff s
left join staff_schedule ss
on s.staff_id=ss.staff_id
group by s.staff_id,s.staff_name,s.role,s.service
order by count(ss.week) DESC;