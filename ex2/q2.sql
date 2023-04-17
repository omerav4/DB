select distinct members.name, memberInKnesset.party
from members join memberInKnesset on members.uid = memberInKnesset.uid
where memberInKnesset.number = 1
order by members.name, memberInKnesset.party;