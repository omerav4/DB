select memberInKnesset1.number, members.name
from members join memberInKnesset memberInKnesset1 on members.uid = memberInKnesset1.uid
where memberInKnesset1.number, members.name in
          (
              select memberInKnesset2.number, members.name
              from members join memberInKnesset memberInKnesset2 on members.uid = memberInKnesset2.uid
              where memberInKnesset1.number = memberInKnesset2.number
                and members.birthYear = (select min(members.birthYear)
                                   from members join memberInKnesset on members.uid = memberInKnesset.uid
                                   where memberInKnesset.number = memberInKnesset2.number)
          )
order by memberInKnesset1.number, members.name