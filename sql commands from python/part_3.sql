#part 3
# Output at least 2 teams that have just one solo member (must include member’s name) in the database.


        SELECT  
            team.name AS team_name,
            MAX(member.name) AS member_name
        FROM team
        JOIN team_has_member 
            ON team.team_id = team_has_member.team_id
        JOIN member 
            ON member.member_id = team_has_member.member_id
        GROUP BY team.team_id, team.name
        HAVING COUNT(team_has_member.member_id) = 1;