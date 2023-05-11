with membersAge as
(select uid, startYear-birthYear as age
from members)
select memberInKnesset.number, avg(age) as avgAge
from memberInKnesset left join membersAge on memberInKnesset.uid = membersAge.uid
group by memberInKnesset.number
order by memberInKnesset.number
