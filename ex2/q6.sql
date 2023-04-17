select distinct members1.name
from members members1 join memberInKnesset memberInKnesset1 ON members1.uid = memberInKnesset1.uid
where exists(
    select helper1.number from (select memberInKnesset2.number
  from members members2 join memberInKnesset memberInKnesset2 ON members2.uid = memberInKnesset2.uid
  where members2.name = 'David Ben-Gurion' and memberInKnesset2.party = 'Mapai') helper1
    where helper1.number in (select memberInKnesset3.number
  from members members3 join memberInKnesset memberInKnesset3 ON members3.uid = memberInKnesset3.uid
  where members3.name = members1.name and memberInKnesset3.party = 'Mapai'))
)