#part 4
#A list of venues that host teams from 3 or more target audiences (return at least 2 venues)


        SELECT 
            venue.name AS venue_name,
            COUNT(DISTINCT target_audience.target_audience_id) AS audience_count,
            GROUP_CONCAT(DISTINCT target_audience.category SEPARATOR ', ') AS audience_list
        FROM venue
        JOIN venue_audience ON venue.venue_id = venue_audience.venue_id
        JOIN target_audience ON venue_audience.target_audience_id = target_audience.target_audience_id
        GROUP BY venue.venue_id, venue.name
        HAVING audience_count >= 3;