WITH RECURSIVE BeginThirdDistRelatives(uid, name, m) AS (
  SELECT uid, name, 0
  FROM members
  WHERE name='Menachem Begin'
  UNION
  SELECT mem1uid, mem1name, BeginThirdDistRelatives.m + 1
  FROM BeginThirdDistRelatives, (SELECT member1.uid AS mem1uid, member1.name AS mem1name, member2.uid AS mem2uid
                  FROM (SELECT uid, name, party, number
                       FROM members NATURAL JOIN memberInKnesset) AS member1
                   JOIN (SELECT uid, name, party, number
                       FROM members NATURAL JOIN memberInKnesset) AS member2
                  ON member1.uid!=member2.uid AND member1.party=member2.party AND member1.number=member2.number) AS membersDB
  WHERE mem2uid=BeginThirdDistRelatives.uid AND BeginThirdDistRelatives.m<=2
),
BeginRelatives(uid, name) AS (
  SELECT mem2uid, mem2name
  FROM (SELECT member1.uid AS mem1uid,
               member1.name AS mem1name,
               member2.uid AS mem2uid,
               member2.name AS mem2name
       FROM (SELECT uid, name, party, number
             FROM members NATURAL JOIN memberInKnesset) AS member1
                   JOIN (SELECT uid, name, party, number
             FROM members NATURAL JOIN memberInKnesset) AS member2
             ON member1.uid!=member2.uid
               AND member1.party=member2.party
               AND member1.number=member2.number)
   AS membersDB
  WHERE mem1name='Menachem Begin'
  UNION
  SELECT mem2uid, mem2name
  FROM BeginRelatives, (SELECT member1.uid AS mem1uid,
                               member1.name AS mem1name,
                               member2.uid AS mem2uid,
                               member2.name AS mem2name
                  FROM (SELECT uid, name, party, number
                       FROM members NATURAL JOIN memberInKnesset) AS member1
                   JOIN (SELECT uid, name, party, number
                       FROM members NATURAL JOIN memberInKnesset) AS member2
                  ON member1.uid!=member2.uid
                  AND member1.party=member2.party
                  AND member1.number=member2.number) AS membersDB
  WHERE BeginRelatives.uid=mem1uid
)
SELECT DISTINCT name
FROM BeginRelatives
WHERE uid NOT IN (SELECT uid FROM BeginThirdDistRelatives)
ORDER BY name;