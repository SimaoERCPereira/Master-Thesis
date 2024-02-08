SELECT distinct [Latitude]
      ,[Longitude]
      ,[EventEnqueuedUtcTime]
  FROM [dbo].[Location]
  order by [EventEnqueuedUtcTime] desc



--ALTER TABLE [Location]
--ADD Email varchar(50);

ALTER TABLE [Location]
DROP COLUMN Email;


ALTER TABLE [Location]
ADD CONSTRAINT DF_Location_Email DEFAULT(
    CASE WHEN Latitude > 38.73 THEN 'simao.er.costa.pereira@gmail.com' ELSE 'nina.urbancic.si' END
) FOR Email;

select *
from location



--CREATING A TABLE TO SIMULATE FANS WITH TICKETS FOR THE GAME 


CREATE TABLE Fans (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    has_ticket BIT NOT NULL DEFAULT 0
);


INSERT INTO Fans (name, phone_number, email, has_ticket)
VALUES ('John Smith', '1234567890', 'simao.er.costa.pereira@gmail.com', 1),
       ('Jane Doe', '9876543210', 'simao.er.costa.pereira@gmail.com', 1),
       ('Michael Johnson', '5551234567', 'simao.er.costa.pereira@gmail.com', 0),
       ('Sarah Wilson', '9998887777', 'simao.er.costa.pereira@gmail.com', 1),
       ('David Lee', '1112223333', 'simao.er.costa.pereira@gmail.com', 0),
       ('Emily Davis', '4445556666', 'simao.er.costa.pereira@gmail.com', 1),
       ('Robert Thompson', '2223334444', 'simao.er.costa.pereira@gmail.com', 0),
       ('Jennifer Brown', '7778889999', 'simao.er.costa.pereira@gmail.com', 1),
       ('Christopher Martinez', '6665554444', 'simao.er.costa.pereira@gmail.com', 1),
       ('Jessica Taylor', '3332221111', 'simao.er.costa.pereira@gmail.com', 0);
