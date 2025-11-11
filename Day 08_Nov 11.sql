/* #SQLWithIDC 
Day 8 (11/11): String Functions
Topics: UPPER, LOWER, LENGTH, CONCAT, SUBSTRING */

-- Practice Qns

-- Q1.Convert all patient names to uppercase.
select UPPER(name)
from patients;

-- Q2.Find the length of each staff member's name.
select staff_name, LENGTH(staff_name)
from staff;

-- Q3.Concatenate staff_id and staff_name with a hyphen separator.
select CONCAT(staff_id,'-',staff_name)
from staff;

-- Daily Challenge

-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters.
select patient_id,
UPPER(name),
LOWER(service),
CASE 
when age >= 65 then 'Senior'
when age >= 18 then 'Adult'
else 'Minor'
end as Age_Category,
LENGTH(name)
from patients
where LENGTH(name)>10;
