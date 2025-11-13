/* #SQLWithIDC 
Day 10 (13/11): CASE Statements
Topics: CASE WHEN, conditional logic, derived columns */

-- Practice Qns

-- Q1.Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
select name, satisfaction,
CASE when satisfaction<=33 then 'Low'
when satisfaction>33 AND satisfaction<=66 then 'Medium'
else 'High'
end as satisfaction_category
from patients;

-- Q2.Label staff roles as 'Medical' or 'Support' based on role type.
select distinct role,
case when role in ('doctor','nurse') then 'Medical'
else 'Support'
end as Role_label
from staff;

-- Q3.Create age groups for patients (0-18, 19-40, 41-65, 65+).
select name,age,
case when age between 0 and 18 then '0-18'
when age between 19 and 40 then '19-40'
when age between 41 and 65 then '41-65'
else '65+' 
end as age_group
from patients;

-- Daily Challenge

-- Create a service performance report showing service name, total patients admitted, and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.
select service,
SUM(patients_admitted),
case when AVG(patient_satisfaction)>=85 then 'Excellent'
when AVG(patient_satisfaction)>=75 AND AVG(patient_satisfaction)<85 then 'Good'
when AVG(patient_satisfaction)>=65 AND AVG(patient_satisfaction)<75 then 'Fair'
else 'Needs Improvement'
end as Performance_Category
from services_weekly
group by service
order by AVG(patient_satisfaction) DESC;
