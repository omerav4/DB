-- with ValidCouples as (select d1.name as n1, d2.name as n2
-- from donors d1, donors d2
-- except
-- select d1.name as n1, d2.name as n2
-- from donors d1, donors d2 where
-- d1.cause not in (select distinct cause from donors where name = d2.name))
-- select n1, n2
-- from ValidCouples
-- where n1 < n2
-- order by n1, n2

select d1.name as n1, d2.name as n2
from donors d1, donors d2
where d1.name < d2.name
and not exists (select distinct h1.cause from donors h1 where h1.name = d2.name except select distinct h2.cause from donors h2 where h2.name = d1.name)
and not exists (select distinct h1.cause from donors h1 where h1.name = d1.name except select distinct h2.cause from donors h2 where h2.name = d2.name)
order by n1, n2

