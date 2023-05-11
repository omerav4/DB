-- select memberInKnesset1.party, memberInKnesset1.number, femalePercent
-- from members members1 left join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid
-- where exists(

with helper as (
    select memberInKnesset1.party party, memberInKnesset1.number number,
           (select count(uid)
        from members members2 left join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
    where memberInKnesset2.party = memberInKnesset1.party and memberInKnesset2.number = memberInKnesset1.number and
          members2.gender = 'female') as femaleCount,
            (select count(uid)
        from members members3 left join memberInKnesset memberInKnesset3 on members3.uid = memberInKnesset3.uid
    where memberInKnesset3.party = memberInKnesset1.party and memberInKnesset3.number = memberInKnesset1.number)
        as totalCount,
        from members members1 left join memberInKnesset memberInKnesset1 on members1.uid = memberInKnesset1.uid

    (select count(uid)
        from members members2 left join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
    where memberInKnesset2.party = memberInKnesset1.party and memberInKnesset2.number = memberInKnesset1.number and
          members2.gender = 'female') as femaleCount,
    (select count(uid)
        from members members3 left join memberInKnesset memberInKnesset3 on members3.uid = memberInKnesset3.uid
    where memberInKnesset3.party = memberInKnesset1.party and memberInKnesset3.number = memberInKnesset1.number)
        as totalCount,
select femaleCount/totalCount)
select party, number, (femaleCount/totalCount) as femalePercent
from helper
where (femaleCount/totalCount) >= 30
order by party, number




--         count(uid) / total
--         from members members2 left join memberInKnesset memberInKnesset2 on members2.uid = memberInKnesset2.uid
--     where memberInKnesset2.party = memberInKnesset1.party and memberInKnesset2.number = memberInKnesset1.number and
--           members2.gender = 'female'
--     group by number
--     having count(uid) / total >= 0.3
--           )
-- order by party, number