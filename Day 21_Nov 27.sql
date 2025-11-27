/* #SQLWithIDC 
Day 21 (27/11): Common Table Expressions (CTEs)
Topics: WITH clause, CTEs, recursive CTEs (if applicable), query organization */

-- Practice Qns

-- Q1.Create a CTE to calculate service statistics, then query from it.
with service_stats as (
    select
        service,
        count(*) as total_patients,
        avg(satisfaction) as avg_satisfaction
    from patients
    group by service
)
select *
from service_stats;


-- Q2.Use multiple CTEs to break down a complex query into logical steps.
with
step1 as (
    select
        service,
        sum(patients_admitted) as total_admitted
    from services_weekly
    group by service
),
step2 as (
    select
        service,
        sum(patients_refused) as total_refused
    from services_weekly
    group by service
),
step3 as (
    select
        s1.service,
        s1.total_admitted,
        s2.total_refused,
        (s1.total_admitted + s2.total_refused) as total_cases
    from step1 s1
    join step2 s2 on s1.service = s2.service
)
select *
from step3;


-- Q3.Build a CTE for staff utilization and join it with patient data.
with staff_weeks as (
    select
        staff_id,
        service,
        sum(case when present = 1 then 1 else 0 end) as weeks_present
    from staff_schedule
    group by staff_id, service
),
staff_util as (
    select
        service,
        count(*) as total_staff,
        avg(weeks_present) as avg_weeks_present
    from staff_weeks
    group by service
)
select
    p.service,
    count(*) as total_patients,
    su.total_staff,
    su.avg_weeks_present
from patients p
left join staff_util su on p.service = su.service
group by p.service, su.total_staff, su.avg_weeks_present;



-- Daily Challenge

-- Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.
with service_metrics as (
    select
        service,
        sum(patients_admitted) as total_admitted,
        sum(patients_refused) as total_refused,
        avg(patient_satisfaction) as avg_satisfaction
    from services_weekly
    group by service
),
staff_weeks as (
    select
        staff_id,
        service,
        sum(case when present = 1 then 1 else 0 end) as weeks_present
    from staff_schedule
    group by staff_id, service
),
staff_metrics as (
    select
        service,
        count(*) as total_staff,
        avg(weeks_present) as avg_weeks_present
    from staff_weeks
    group by service
),
patient_demographics as (
    select
        service,
        avg(age) as avg_age,
        count(*) as total_patients
    from patients
    group by service
)
select
    sm.service,
    sm.total_admitted,
    sm.total_refused,
    sm.avg_satisfaction,
    st.total_staff,
    st.avg_weeks_present,
    pd.avg_age,
    pd.total_patients,
        (
            (sm.total_admitted * 1.0 / nullif(sm.total_admitted + sm.total_refused, 0)) * 0.6
            +
            (sm.avg_satisfaction * 0.4)
        ) AS performance_score
from service_metrics sm
left join staff_metrics st on sm.service = st.service
left join patient_demographics pd on sm.service = pd.service
order by performance_score DESC;
