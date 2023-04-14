select distinct members.name, memberInKnesset.number
from members join memberInKnesset on members.uid = memberInKnesset.uid
join knessets on knessets.number = memberInKnesset.number
where (memberInKnesset.party = 'Likud' or memberInKnesset.party = 'Meretz')
and (knessets.startYear - members.birthYear > 70)
order by members.name, memberInKnesset.number