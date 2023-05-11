select distinct members.name
from members
    natural join (select uid from memberInKnesset group by uid having count(number)>=5 and count(distinct party)=1) m1
order by members.name;