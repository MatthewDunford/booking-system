#part 2
#A list of teams whose target audiences are suitable to perform at a chosen venue (return at least 2 teams). Choose the target audiences and a suitable venue.




            SELECT DISTINCT 
                team.name AS team_name, 
                team.hourly_rate, 
                target_audience.category,
                venue.name AS venue_name
            FROM team
            JOIN team_audience 
                ON team.team_id = team_audience.team_id
            JOIN target_audience 
                ON team_audience.target_audience_id = target_audience.target_audience_id
            JOIN venue_audience 
                ON target_audience.target_audience_id = venue_audience.target_audience_id
            JOIN venue
                ON venue_audience.venue_id = venue.venue_ID
            WHERE target_audience.target_audience_id = 1;