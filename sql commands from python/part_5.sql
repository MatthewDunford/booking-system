#part 5
#create a query to show all the members of 2 non-solo teams, showing clearly which team each member belongs to



        SELECT 
            team.name AS team_name, 
            member.name AS member_name
        FROM team
        JOIN team_has_member ON team.team_id = team_has_member.team_id
        JOIN member ON team_has_member.member_id = member.member_id
        WHERE team.team_id IN (
            SELECT team_id
            FROM team_has_member
            GROUP BY team_id
            HAVING COUNT(member_id) > 1
        )
        ORDER BY team.name;