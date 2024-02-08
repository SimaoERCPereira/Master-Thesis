CREATE TABLE Matches (
    match_id INT IDENTITY(1,1) PRIMARY KEY,
    home_team VARCHAR(100) NOT NULL,
    away_team VARCHAR(100) NOT NULL,
    game_date DATE NOT NULL,
    game_time TIME NOT NULL,
   
);



CREATE TABLE Fans (
    fan_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
);


--Populate tables 

INSERT INTO Fans (name, phone_number, email)
VALUES ('John Smith', '1234567890', 'simao.er.costa.pereira@gmail.com'),
       ('Jane Doe', '9876543210', 'simao.er.costa.pereira@gmail.com'),
       ('Michael Johnson', '5551234567', 'simao.er.costa.pereira@gmail.com'),
       ('Sarah Wilson', '9998887777', 'simao.er.costa.pereira@gmail.com'),
       ('David Lee', '1112223333', 'simao.er.costa.pereira@gmail.com'),
       ('Emily Davis', '4445556666', 'simao.er.costa.pereira@gmail.com'),
       ('Robert Thompson', '2223334444', 'simao.er.costa.pereira@gmail.com'),
       ('Jennifer Brown', '7778889999', 'simao.er.costa.pereira@gmail.com'),
       ('Christopher Martinez', '6665554444', 'simao.er.costa.pereira@gmail.com'),
       ('Jessica Taylor', '3332221111', 'simao.er.costa.pereira@gmail.com');


INSERT INTO Matches (home_team, away_team, game_date, game_time)
VALUES ('Benfica', 'Sporting CP', '2023-07-15', '18:00:00'),
       ('Benfica', 'FC Porto', '2023-07-16', '18:00:00'),
       ('Benfica', 'SC Braga', '2023-07-17', '18:00:00'),
       ('Benfica', 'Arouca', '2023-07-18', '18:00:00'),
       ('FC Porto', 'Benfica', '2023-07-21', '18:00:00'),
       ('Sporting CP', 'Benfica', '2023-07-22', '18:00:00'),
       ('SC Braga', 'Benfica', '2023-07-23', '18:00:00'),
       ('Arouca', 'Benfica', '2023-07-24', '18:00:00');



--Bridge table 


CREATE TABLE fan_match_bridge (
    fan_id INT,
    match_id INT,
	has_ticket Bit,
    PRIMARY KEY (fan_id, match_id),
    FOREIGN KEY (fan_id) REFERENCES Fans(fan_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);

INSERT INTO fan_match_bridge (fan_id, match_id, has_ticket)
SELECT Fans.fan_id, Matches.match_id, FLOOR(RAND() * 2) AS has_ticket
FROM Fans
CROSS JOIN Matches;


UPDATE fan_match_bridge
SET has_ticket = CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 0 ELSE 1 END;





--Stadium occupancy table 


CREATE TABLE stadium_occupancy (
  id INT PRIMARY KEY,
  section VARCHAR(50) NOT NULL,
  seat_number INT NOT NULL,
  is_occupied BOOLEAN DEFAULT FALSE,
  occupant_name VARCHAR(100),
  ticket_type VARCHAR(50),
  match_id INT,
  occupant_id INT
);
