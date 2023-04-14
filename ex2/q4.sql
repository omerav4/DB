select members1.name
from members members1 join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid
where members1.occupation <> 'politician' and members1.gender = 'female' and memberInKnesset1.number = 23
and exists
(select members.name
from members members2 join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
where members2.occupation <> 'politician' and members2.gender = 'female' and memberInKnesset2.number = 24)
order by members1.name

