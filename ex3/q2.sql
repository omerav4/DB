with membersAge as
(select members.uid, round(knessets.startYear-members.birthYear) as age
from members left join memberInKnesset on members.uid = memberInKnesset.uid
left join knessets on knessets.number = memberInKnesset.number)
select memberInKnesset.number, avg(age) as avgAge
from memberInKnesset left join membersAge on memberInKnesset.uid = membersAge.uid
group by memberInKnesset.number
order by memberInKnesset.number
