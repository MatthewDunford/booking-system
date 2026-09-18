USE booking_system;

SELECT 
    member.name AS member_name, 
    team.name AS team_name
FROM member
INNER JOIN team_has_member ON member.member_id = team_has_member.member_id
INNER JOIN team ON team_has_member.team_id = team.team_id
ORDER BY member.name ASC;