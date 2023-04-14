select memberInKnesset.number, members.name
from members join memberInKnesset m1 on members.uid = memberInKnesset.uid
where exists
          (
              select memberInKnesset.number, members.name
              from members
                       join memberInKnesset on members.uid = memberInKnesset.uid
              where memberInKnesset.number = m1.number
                and members.age = (select max(members.age)
                                   from members
                                            join memberInKnesset on members.uid = memberInKnesset.uid
                                   where memberInKnesset.number = m1.number)
          )
order by number, name