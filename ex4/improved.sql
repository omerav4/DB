with helper as(
    select e2.year, max(e2.students5_estimated) max_students_estimated
    from enrollment e2
    group by e2.year
)
select distinct e1.year, e1.eng_name
from enrollment e1
left join helper on e1.year = helper.year
where e1.students5_estimated = helper.max_students_estimated
order by year, eng_name;
