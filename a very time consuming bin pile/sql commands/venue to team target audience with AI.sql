SELECT 
    venue.name AS 'Selected Venue',
    target_audience.target_type AS 'Matching Audience',
    team.name AS 'Suitable Team',
    team.hourly_rate AS 'Rate'
FROM venue
JOIN venue_audience ON venue.venue_id = venue_audience.venue_id
JOIN target_audience ON venue_audience.target_id = target_audience.target_id
JOIN team_audience ON target_audience.target_id = team_audience.target_id
JOIN team ON team_audience.team_id = team.team_id
WHERE venue.name = 'Engine Shed';