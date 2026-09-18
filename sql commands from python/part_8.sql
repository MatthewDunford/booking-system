#part 8
#Create a MySQL INSERT INTO query in Python, operated from the main menu. It needs to add a further 2 teams
#from the user’s input, and add at least 2 members each per team (also from user input), ensuring any relevant
#connected tables are updated too.




INSERT INTO team (name, hourly_rate) VALUES ('The Paul Jackson team', 500);


SET @last_team_id = LAST_INSERT_ID();


INSERT INTO member (name) VALUES ('Richard Hammond');


INSERT INTO team_has_member (team_id, member_id) VALUES (@last_team_id, LAST_INSERT_ID());


INSERT INTO member (name) VALUES ('James May');


INSERT INTO team_has_member (team_id, member_id) VALUES (@last_team_id, LAST_INSERT_ID());

COMMIT;