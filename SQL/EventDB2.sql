use LBSDB
go


IF OBJECT_ID('dbo.GetNums') IS NOT NULL
  DROP FUNCTION dbo.GetNums;
GO
 
CREATE FUNCTION dbo.GetNums(@n AS BIGINT) RETURNS TABLE AS RETURN
  WITH
  L0   AS(SELECT 1 AS c UNION ALL SELECT 1),
  L1   AS(SELECT 1 AS c FROM L0 AS A CROSS JOIN L0 AS B),
  L2   AS(SELECT 1 AS c FROM L1 AS A CROSS JOIN L1 AS B),
  L3   AS(SELECT 1 AS c FROM L2 AS A CROSS JOIN L2 AS B),
  L4   AS(SELECT 1 AS c FROM L3 AS A CROSS JOIN L3 AS B),
  L5   AS(SELECT 1 AS c FROM L4 AS A CROSS JOIN L4 AS B),
  Nums AS(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS n FROM L5)
  SELECT TOP (@n) n FROM Nums ORDER BY n;
GO

SELECT n FROM dbo.GetNums(100000);
GO

INSERT INTO tagreadeventszones SELECT
'000000000000000001272519',-56,1630634864595,'impinj-14-04-53.chs.sc.boeing.com',3,53.3938340671302,
-1.37869584361141,1,53.3938340671302,-1.37869584361141,1,0,0,'NA','NA','[{"building":"99-F59","floor":"1","zoneId":"8a7ffaa57b71baf0017b77de521d0012","zoneName":"ff4576"},
{"building":"99-F59","floor":"1","zoneId":"8a7ffaa57b71baf0017b77eb40770021","zoneName":"zaq23"}]',
NULL,NULL,NULL,NULL,NULL,NULL
 FROM dbo.GetNums(100000);

 INSERT into ZoneAssetNotifications SELECT
'gg567','EXIT',1630634864595,1630634864595,1150,1,'asset-80','testreader9'
from dbo.GetNums(100000)


insert into TagReadEventsZones values(
'000000000000000001272519',-56,1630634864595,'impinj-14-04-53.chs.sc.boeing.com',3,53.3938340671302,
-1.37869584361141,1,53.3938340671302,-1.37869584361141,1,0,0,'NA','NA','[{"building":"99-F59","floor":"1","zoneId":"8a7ffaa57b71baf0017b77de521d0012","zoneName":"ff4576"},
{"building":"99-F59","floor":"1","zoneId":"8a7ffaa57b71baf0017b77eb40770021","zoneName":"zaq23"}]',
NULL,NULL,NULL,NULL,NULL,NULL)
go 10


select top 1000 * 
from tagreadeventszones t
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as float)*1000))-t.eventTimeUTC<='7776000000'

select top 1000 * 
from ZoneAssetNotifications t
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as float)*1000))-t.eventTime<='7776000000'


