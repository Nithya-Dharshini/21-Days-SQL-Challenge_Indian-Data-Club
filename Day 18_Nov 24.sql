/* #SQLWithIDC 
Day 18 (24/11): UNION and UNION ALL
Topics: UNION, UNION ALL, combining result sets */

-- Practice Qns

-- Q1.Combine patient names and staff names into a single list.
select name as Name, 'Patient' as source
from patients
UNION ALL
select staff_name, 'Staff' as source
from staff;

-- Q2.Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
select name,satisfaction, 'High Satisfaction' as Satisfaction_Label
from patients
where satisfaction>90
UNION ALL
select name,satisfaction, 'Low Satisfaction' as Satisfaction_Label
from patients
where satisfaction<50;


-- Q3.List all unique names from both patients and staff tables.
select DISTINCT name as Name, 'Patient' as source
from patients
UNION
select DISTINCT staff_name, 'Staff' as source
from staff;


-- Daily Challenge

-- Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.
select patient_id as 'identifier', name as name, 'Patient' as type, service
from patients
where service in ('emergency','surgery')
UNION ALL
select staff_id as 'identifier', staff_name as name, 'Staff' as type, service
from staff
where service in ('emergency','surgery')
order by type, service, name;
							
