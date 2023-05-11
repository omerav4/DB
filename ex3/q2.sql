with membersAge as
(select members.uid, knessets.startYear-memberInKnesset.birthYear as age
from members left join memberInKnesset on members.uid = memberInKnesset.uid
left join knessets on knessets.number = memberInKnesset.numer)
select memberInKnesset.number, avg(age) as avgAge
from memberInKnesset left join membersAge on memberInKnesset.uid = membersAge.uid
group by memberInKnesset.number
order by memberInKnesset.number
