select members1.name
from members members1 join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid
where members1.birthPlace = 'Jerusalem' and not exists
(
    select memberInKnesset2.uid
    from memberInKnesset memberInKnesset2
    where memberInKnesset2.uid = members1.uid
    and memberInKnesset2.number <> memberInKnesset1.number
    )
order by members1.name