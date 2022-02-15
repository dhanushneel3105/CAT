use I2LDeviceDB
go

---HealthFeed
select count(*) 
from healthfeed h 
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-h.timestamp>='7776000000'

---Scalar
select count(*) 
from scalartransactions s 
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-s.timestamp>='7776000000'

--Fpa
select count(*) 
from fpatransactions f 
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-f.timestamp>=7776000000

delete from fpatransactions 
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-fpatransactions.timestamp>='7776000000'

delete from scalartransactions 
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-scalartransactions.timestamp>='7776000000'



insert into fpatransactions
values(
	'8dfdgfhhreredhanushsamp','Error_03','Dir1',
'start','ERROR_03: Error connecting to the reader (114.55.67.43) : Failed to get the session.',
1634417951000),
	('8dfdgfhhreredhanush','Error_03','Dir1',
'start','ERROR_03: Error connecting to the reader (114.55.67.43) : Failed to get the session.',
1633417951000)

insert into scalartransactions
values
('8a7f2c6b7d8f5f28017d93940cdhanush','CONTAINER_CREATE_FAIL',
'10f0a43f7d8e2f62017d8e6c51880007','START','FPA container creation failed',1633417951000),
('8a7f2c6b7d8f5f28017d93940csamp','CONTAINER_CREATE_FAIL',
'10f0a43f7d8e2f62017d8e6c51880007','START','FPA container creation failed',1634417951000)


	

select * from fpatransactions f order by timestamp asc

select top(10) * from scalartransactions s

