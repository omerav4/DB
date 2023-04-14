select distinct name, party
from members join memberInKnesset on members.uid = memberInKnesset.uid
where memberInKnesset.number = 1
order by name, party