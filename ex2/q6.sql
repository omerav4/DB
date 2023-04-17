select distinct members1.name
from members members1 join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid
where not exists(
    select distinct memberInKnesset2.number
    from members members2 join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
    where members2.name = 'David Ben-Gurion' and memberInKnesset2.party = 'Mapai'
    except
    select distinct memberInKnesset3.number
    from members members3 join memberInKnesset memberInKnesset3 on members3.uid = memberInKnesset3.uid
    where members3.name = members1.name and memberInKnesset3.party = 'Mapai')
order by members1.name;