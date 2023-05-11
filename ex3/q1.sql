select distinct number, count(*) as partyCount
from (select distinct number, party from memberInKnesset)
group by number
order by number