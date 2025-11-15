/* #SQLWithIDC 
Day 12 (15/11): NULL Values and IS NULL/IS NOT NULL
Topics: NULL handling, IS NULL, IS NOT NULL, COALESCE */

-- Practice Qns

-- Q1.Find all weeks in services_weekly where no special event occurred.
select week, event
from services_weekly
where event is NULL OR event='none' OR event='';

-- Q2.Count how many records have null or empty event values.
select count(*) AS num_of_null_or_empty_events
from services_weekly
where event is NULL OR event='none' OR event='';

-- Q3.List all services that had at least one week with a special event.
select distinct(service)
from services_weekly
where event is not null AND event!='none';

-- Daily Challenge

-- Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.
select count(*) as week, avg(patient_satisfaction), avg(staff_morale),
CASE when event is NULL or event='none'then 'No Event'
else 'With Event'
end as event_status
from services_weekly
group by CASE when event is NULL or event='none'then 'No Event'
else 'With Event'
end
order by avg(patient_satisfaction) DESC;
