select memberInKnesset.number, avg(2023-members.birthYear) as avgAge
from memberInKnesset left join members on memberInKnesset.uid = members.uid
group by memberInKnesset.number
