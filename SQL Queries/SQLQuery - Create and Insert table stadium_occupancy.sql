CREATE TABLE stadium_occupancy (
  id INT IDENTITY(1,1) PRIMARY KEY,
  match_id INT,
  occupant_id INT,
  section VARCHAR(50) NOT NULL,
  seat_number INT NOT NULL,
  is_occupied BIT,
  occupant_name VARCHAR(100),
  ticket_type VARCHAR(50),
);


INSERT INTO stadium_occupancy (match_id,occupant_id, section, seat_number, is_occupied, occupant_name, ticket_type )
VALUES
  (1,1, 'East Stand', 101, 1, 'John Smith', 'Premium'),
  (1,7, 'East Stand', 102, 1, 'Robert Thompson', 'Standard'),
  (1,NULL, 'East Stand', 103, 0, NULL, 'Standard'),
  (1,8, 'West Stand', 201, 1, 'Jennifer Brown', 'Premium'),
  (1, 9, 'West Stand', 202, 1, 'Christopher Martinez', 'Standard'),
  (1, 10, 'West Stand', 203, 1, 'Jessica Taylor', 'Standard'),
  (1, NULL , 'West Stand', 203, 0, NULL, 'Standard');


ALTER TABLE stadium_occupancy
ADD ticket_price DECIMAL(10, 2);

UPDATE stadium_occupancy
SET ticket_price = CASE
    WHEN ticket_type = 'Premium' THEN 50.00
    WHEN ticket_type = 'Standard' THEN 35.00
    ELSE 0.00 
  END;



select *
from stadium_occupancy
