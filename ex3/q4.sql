--select number, party, max(memberCount)

select memberInKnesset1.number as number, memberInKnesset1.party as party, count(memberInKnesset1.uid) as memberCount
from memberInKnesset memberInKnesset1
where count(memberInKnesset1.uid) = (select max(count(memberInKnesset1.uid)
from memberInKnesset memberInKnesset3
where memberInKnesset3.number = memberInKnesset2.number
group by party))
group by number, party
order by number, party;

