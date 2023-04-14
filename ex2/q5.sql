select members.name
from members join memberInKnesset on members.uid = memberInKnesset.uid
where members.birthPlace = 'Jerusalem'
group by members.name
having count(memberInKnesset.number) = 1
order by members.name