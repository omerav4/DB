-- select distinct members.name
-- -- from members
-- -- except
-- -- select distinct members.name
-- -- from members join memberInKnesset on members.uid = memberInKnesset.uid
-- -- join knessets on knessets.number = memberInKnesset.number
-- -- where memberInKnesset.party <> 'Mapai' and knessets.number in
-- -- (select memberInKnesset.number from members join memberInKnesset on members.uid = memberInKnesset.uid
-- -- where members.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai')
-- -- --order by members.name


select distinct members1.name
from members members1 join memberInKnesset on members.uid = memberInKnesset.uid
where count(
select memberInKnesset.number from members join memberInKnesset on members.uid = memberInKnesset.uid
where members.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai'
except
select memberInKnesset.number from members members2 join memberInKnesset on members.uid = memberInKnesset.uid
where members1.name = members2.name and memberInKnesset.party = 'Mapai') >= 0
--order by members1.name
