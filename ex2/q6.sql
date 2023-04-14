select distinct members.name
from members
except
select distinct members.name
from members join memberInKnesset on members.uid = memberInKnesset.uid
join knessets on knessets.number = memberInKnesset.number
where memberInKnesset.party <> 'Mapai' and knessets.number in
(select memberInKnesset.number from members join memberInKnesset on members.uid = memberInKnesset.uid
where members.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai')
--order by members.name

