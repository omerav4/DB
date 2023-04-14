select members.name
from members join memberInKnesset on members.uid = memberInKnesset.uid
where members.occupation <> 'politician' and members.gender = 'female' and memberInKnesset.number = 23
and exists
(select members.name
from members join memberInKnesset on members.uid = memberInKnesset.uid
where members.occupation <> 'politician' and members.gender = 'female' and memberInKnesset.number = 24)
order by name