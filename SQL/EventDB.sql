use LBSDB
GO

---Tag Read Events
select count(*) 
from TagReadEventsZones t
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-t.eventTimeUTC>='7776000000'


--ZoneAssetNotifications
select count(*) 
from zoneassetnotifications z
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as float)*1000))-z.eventTime>='7776000000'

select top 100 * 
from zoneassetnotifications z
where
(select(Cast(datediff(s,'1970-01-01',getutcdate())as float)*1000))-z.eventTime>='7776000000'

select top 20000 * 
from tagreadeventszones t
where 
(select(cast(datediff(s,'1970-01-01',getutcdate())as float)*1000))-t.eventTimeUTC>='7776000000'

select count(*) from ZoneAssetNotifications

select count(*) from TagReadEventsZones_History

select count(*) from ZoneAssetNotifications_History

select top(1) * from TagReadEventsZones_History

select top(1) * from ZoneAssetNotifications_History

SELECT top(1) * from ZoneAssetNotifications

delete from TagReadEventsZones_History

delete from ZoneAssetNotifications_History where eventTime=1630634864595

select COUNT(*) from TagReadEventsZones t where t.eventTimeUTC=1630634864595 
select COUNT(*) from ZoneAssetNotifications t where t.eventTime=1630634864595


select(CAST(DATEDIFF(s,'1970-01-01',GETUTCDATE()) as bigint)*1000)-1630634864595