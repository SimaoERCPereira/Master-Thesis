--select a.fan_id, name, email, c.*, b.has_ticket
--from Fans a
--left join fan_match_bridge b
--on a.fan_id = b.fan_id
--left join Matches c
--on b.match_id = c.match_id


CREATE VIEW fan_details AS
SELECT a.fan_id, a.name, a.email, c.*, b.has_ticket
FROM fans a
LEFT JOIN fan_match_bridge b ON a.fan_id = b.fan_id
LEFT JOIN matches c ON b.match_id = c.match_id;


