-- select distinct members.name
-- -- from members
-- -- except
-- -- select distinct members.name
-- -- from members join memberInKnesset on members.uid = memberInKnesset.uid
-- -- join knessets on knessets.number = memberInKnesset.number
-- -- where memberInKnesset.party <> 'Mapai' and knessets.number in
-- -- (select memberInKnesset.number from members join memberInKnesset on members.uid = memberInKnesset.uid
-- -- where members.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai')
-- -- --order by members.name


-- select distinct members1.name
-- from members members1 join memberInKnesset on members1.uid = memberInKnesset.uid
-- where count(
-- select memberInKnesset.number from members1 join memberInKnesset on members1.uid = memberInKnesset.uid
-- where members1.name = 'David Ben Gurion' and memberInKnesset.party = 'Mapai'
-- except
-- select memberInKnesset.number from members members2 join memberInKnesset on members3.uid = memberInKnesset.uid
-- where members1.name = members2.name and memberInKnesset.party = 'Mapai') <= 0
-- --order by members1.name

SELECT DISTINCT members1.name
FROM members members1
JOIN memberInKnesset mk1 ON members1.uid = mk1.uid
WHERE mk1.party = 'Mapai'
AND mk1.number IN (
  SELECT mk2.number
  FROM members members2
  JOIN memberInKnesset mk2 ON members2.uid = mk2.uid
  WHERE members2.name = 'David Ben Gurion'
  AND mk2.party = 'Mapai')
order by members1.name