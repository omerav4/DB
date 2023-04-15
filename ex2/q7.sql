select distinct memberInKnesset1.number, members1.name
from members members1 join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid
where exists
          (
              select distinct memberInKnesset2.number
              from memberInKnesset memberInKnesset2
              where memberInKnesset2.number = memberInKnesset1.number
                and members1.birthYear = (select min(members3.birthYear)
                                   from members members3 join memberInKnesset memberInKnesset3
                                       on members3.uid = memberInKnesset3.uid
                                   where memberInKnesset3.number = memberInKnesset1.number)
          )
order by memberInKnesset1.number, members1.name