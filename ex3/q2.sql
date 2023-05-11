with membersAge as
(select uid, 2023-birthYear as age
from members)
select memberInKnesset.number, avg(age) as avgAge
from memberInKnesset left join membersAge on memberInKnesset.uid = membersAge.uid
group by memberInKnesset.number
order by memberInKnesset.number

-- select memberInKnesset.number, 2023-members.birthYear) as avgAge
-- from memberInKnesset left join members on memberInKnesset.uid = members.uid
-- group by memberInKnesset.number
-- order by memberInKnesset.number