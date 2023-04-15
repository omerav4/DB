select distinct memberInKnesset1.number, members1.name
from members members1 join memberInKnesset memberInKnesset1 on members.uid = memberInKnesset1.uid
where exists
          (
              select distinct memberInKnesset2.number, members2.name
              from members members2 join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
              where memberInKnesset2.number = memberInKnesset1.number
                and members2.birthYear = (select min(members3.birthYear)
                                   from members members3 join memberInKnesset memberInKnesset3
                                       on members3.uid = memberInKnesset3.uid
                                   where memberInKnesset3.number = memberInKnesset2.number)
          )
order by memberInKnesset1.number, members.name