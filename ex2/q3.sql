select distinct name, number
from members join memberInKnesset on members.uid = memberInKnesset.uid
join knessets on knessets.number = memberInKnesset.number
where (memberInKnesset.party = 'Likud' or memberInKnesset.party = 'Meretz')
and (knessets.startYear - members.birthYear > 70)
order by name, number