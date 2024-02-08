/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Latitude]
      ,[Longitude]
      ,[EventEnqueuedUtcTime]
  FROM [dbo].[Location]
  order by [EventEnqueuedUtcTime]


select *, left([EventEnqueuedUtcTime],11) as EventDate, right([EventEnqueuedUtcTime],6) as EventTime, geography::Point(Latitude, Longitude, 4326).STAsText() AS Location , ReverseGeocode(Latitude, Longitude, 2) AS description
from [Location];


--SELECT geography::STPointFromText('POINT(latitude longitude)', 4326) as location;

--SELECT location1.STDistance(location2) as distance_in_meters





CREATE VIEW Location_pbi AS
SELECT *, left([EventEnqueuedUtcTime],11) as EventDate, right([EventEnqueuedUtcTime],6) as EventTime
FROM [Location]

select *
from Location_pbi