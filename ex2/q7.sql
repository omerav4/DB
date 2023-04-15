select memberInKnesset1.number, members.name
from members join memberInKnesset memberInKnesset1 on members.uid = memberInKnesset1.uid
where exists
          (
              select memberInKnesset2.number, members.name
              from members
                       join memberInKnesset memberInKnesset2 on members.uid = memberInKnesset.uid
              where memberInKnesset1.number = memberInKnesset2.number
                and members.age = (select max(members.age)
                                   from members
                                            join memberInKnesset on members.uid = memberInKnesset.uid
                                   where memberInKnesset.number = memberInKnesset1.number)
          )
order by memberInKnesset.number, members.name