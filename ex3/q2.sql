with membersAge as
(select members.uid, startYear-birthYear as age
from members natural join memberInKnesset natural join knessets)
select memberInKnesset.number, avg(age) as avgAge
from memberInKnesset natural join membersAge
group by number
order by number;
