SELECT 
    member.member_id, 
    member.name AS member_name, 
    member.email, 
    member.phone
FROM member
JOIN team_has_member ON member.member_id = team_has_member.member_id
JOIN team ON team_has_member.team_id = team.team_id
WHERE team.name = 'The Paul Jackson team';