---Insert Healthfeed
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

insert into healthfeed Select
'8a7f9d3676289e5d01762deec76607b2','SUCCESS_06','Impinj C','FPA healthcheck','Health is Good',1607088391978
FROM dbo.GetNums(100000)

---Insert ScalarTransactions
insert into scalartransactions select
'8a7f01bc7e28e135017e29b63ece0001','CONTAINER_CREATE_SUCCESS',
'TestNewDeviceService','START','FPAcontainercreatedsuccessfully',1607088391978
from dbo.GetNums(100000)

---Insert FpatRansactions
insert into fpatransactions select '8a7f29e57e28e125017e29b906f00000','SUCCESS_01',
'Uwbvalid','start','SUCCESS_01:Device is started successfully',1607088391978
from dbo.GetNums(100000)


create table dummy(
  id varchar(40)
)

select COUNT(*) from dummy