#part 7
#A booking has a start time and end time, and each team has a fee in £ per hour. Write a query in Python to
#run a calculated field of the total event cost (as TOTAL_BOOKING_COST) for a team at a venue. Flag any potential
#booking that is going to exceed the venue maximum booking fee. (You can chose the team and the venue.)

#query has the varible pasted right into it for as an example which is dif from being a varible in python 

# 4 is the over budget entry 

SELECT 
    team.name AS team_name,
    team.hourly_rate AS team_hourly_rate,

    DATE_FORMAT(booking.start_datetime, '%d/%m/%Y %H:%i:%s') AS start_time,
    DATE_FORMAT(booking.end_datetime, '%d/%m/%Y %H:%i:%s') AS end_time,
    venue.max_booking_fee AS venue_max_fee,
    TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) AS duration_in_hours,
    (TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) * team.hourly_rate) AS total_booking_cost,
    CASE 
        WHEN (TIMESTAMPDIFF(MINUTE, booking.start_datetime, booking.end_datetime) / 60.0 * team.hourly_rate) > venue.max_booking_fee
        THEN 'OVER BUDGET' 
        ELSE 'WITHIN BUDGET' 
    END AS booking_status
FROM booking
JOIN venue ON booking.venue_id = venue.venue_id
JOIN team_presentation ON booking.team_presentation_id = team_presentation.team_presentation_id
JOIN team ON team_presentation.team_id = team.team_id
WHERE booking.venue_id = 1; 