use LBSDB   
GO

---Testing 
delete from t
output deleted.* into TagReadEventsZones_History
from TagReadEventsZones t
where (select(cast(datediff(s,'1970-01-01',getutcdate())as bigint)*1000))-t.eventTimeUTC>='7776000000'


delete FROM TagReadEventsZones
OUTPUT deleted.* into TagReadEventsZones_History
where eventTimeUTC<=1630634864595

delete FROM ZoneAssetNotifications
OUTPUT deleted.* into ZoneAssetNotifications_History
where eventTime<=1630634864595


delete from TagReadEventsZones
OUTPUT 
deleted.epcCode,deleted.peakRSSI,deleted.eventTimeUTC,deleted.hostName,
deleted.antennaPort,deleted.x,deleted.y,deleted.z,deleted.latitude,
deleted.longitude,deleted.elevation,deleted.accuracyChecked,deleted.batteryLevel,
deleted.dataType,deleted.virtualGroup,deleted.zones,deleted.assetId,
deleted.parentAssetId,deleted.assetType,deleted.program,deleted.organization,deleted.directionType
into [dbo].[TagReadEventsZones_History]
where eventTimeUTC<=1630634864595

delete from ZoneAssetNotifications output deleted.zoneName, deleted.zoneEventType,deleted.eventTime, 
deleted.lastUpdatedTime,deleted.dwellTime, deleted.archived, deleted.assetOrTagId, deleted.readerName
into ZoneAssetNotifications_History
where eventTime<=1630634864595


delete from TagReadEventsZones_History

DELETE from ZoneAssetNotifications_History