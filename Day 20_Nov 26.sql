/* #SQLWithIDC 
Day 20 (26/11) : Window Functions - Aggregate Window Functions
Topics: SUM() OVER, AVG() OVER, running totals, moving averages */

-- Practice Qns

-- Q1.Calculate running total of patients admitted by week for each service.
select
    service,
    week,
    patient_satisfaction,
    ROUND(
        AVG(patient_satisfaction) over(
            partition by service
            order by week
            rows between 3 preceding and current row
        ), 2
    ) as moving_avg_4week
from services_weekly
order by service, week;


-- Q2.Find the moving average of patient satisfaction over 4-week periods.
select
    service,
    week,
    patient_satisfaction,
    ROUND(
        AVG(patient_satisfaction) over(
            partition by service
            order by week
            rows between 3 preceding and current row
        ), 2
    ) as moving_avg_4week
from services_weekly
order by service, week;


-- Q3.Show cumulative patient refusals by week across all services.
select
    week,
    SUM(weekly_refused) over(
        order by week
        rows between unbounded preceding and current row
    ) AS cumulative_refusals
from (
	select
		week,
		SUM(patients_refused) AS weekly_refused
	from services_weekly
	group by week) as t
order by week;


-- Daily Challenge

-- Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.
select
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) over(
        partition by service
        order by week
        rows between unbounded preceding and current row
    ) AS cumulative_admissions,
    ROUND(
        AVG(patient_satisfaction) over(
            partition by service
            order by week
            rows between 2 preceding and current row
        ), 2
    ) as moving_avg_3week,
    patients_admitted - AVG(patients_admitted) over(partition by service) as diff_from_avg
from services_weekly
WHERE week between 10 and 20
order by service, week;



							