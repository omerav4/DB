select members.name
from members
except
select members.name
from members join memberInKnesset on members.uid = memberInKnesset.uid
join knessets on knessets.number = memberInKnesset.number
where knessets.number in
(select memberInKnesset.number from members join memberInKnesset on members.uid = memberInKnesset.uid
where member.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai')
and memberInKnesset.party <> 'Mapai'
order by members.name

