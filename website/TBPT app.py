from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)


def get_database_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='mysql',
        database='booking_system'
    )




#home 
@app.route('/')
def home():
    return render_template('home.html')
#home 


#A list of teams whose target audiences are suitable to perform at a chosen venue (return at least 2 teams). Choose the target audiences and a suitable venue.
#part 1 


@app.route('/suitable_team_for_venue', methods=['GET', 'POST'])
def suitable_team_for_venue():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)


    #fetching dropdown list
    cursor.execute("SELECT venue_id, name FROM venue")
    fetched_dropdown_list = cursor.fetchall()

    result = []
    selected_row = None

    #search button
    if request.method == 'POST':
        get_row = request.form.get('venue_id')
        
        #sends query to database
        cursor.execute("SELECT name FROM venue WHERE venue_id = %s", (get_row,))
        record = cursor.fetchone()

        if record:
            selected_row = (record['name'])

        query = """
            SELECT DISTINCT 
                team.name, 
                team.hourly_rate, 
                target_audience.category
            FROM team
            JOIN team_audience 
                ON team.team_id = team_audience.team_id
            JOIN target_audience 
                ON team_audience.target_audience_id = target_audience.target_audience_id
            JOIN venue_audience 
                ON target_audience.target_audience_id = venue_audience.target_audience_id
            WHERE venue_audience.venue_id = %s
        """
        cursor.execute(query, (get_row,))
        result = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'suitable_team_for_venue.html', 
        venues = fetched_dropdown_list, 
        teams = result, 
        selected_venue = selected_row
    )

############################################################################################


#A list of teams whose target audiences are suitable to perform at a chosen venue (return at least 2 teams). Choose the target audiences and a suitable venue.
#part 2

@app.route('/suitable_team_for_target_audience', methods=['GET', 'POST'])
def suitable_team_for_target_audience():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)

    #fetching dropdown list
    cursor.execute("SELECT target_audience_id, category FROM target_audience")
    fetched_dropdown_list = cursor.fetchall()

    result = []
    selected_row = None


        #search button
    if request.method == 'POST':
        get_row = request.form.get('target_audience_id')
        
        #sends query to database
        cursor.execute("SELECT category FROM target_audience WHERE target_audience_id = %s", (get_row,))
        record = cursor.fetchone()

        if record:
            selected_row = record['category']




        query = """
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
            WHERE target_audience.target_audience_id = %s;
            
        """
        cursor.execute(query, (get_row,))
        result = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'suitable_team_for_target_audience.html', 
        audiences = fetched_dropdown_list, 
        teams = result, 
        selected_venue = selected_row
    )
############################################################################################




# Output at least 2 teams that have just one solo member (must include member’s name) in the database.

@app.route('/teams_with_one_solo_member', methods=['GET', 'POST'])
def teams_with_one_solo_member():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)


    query = """
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
    """
    cursor.execute(query) 
    result = cursor.fetchall()

    cursor.close()
    conn.close()

 
    return render_template(
        'teams_with_one_solo_member.html', 
        teams = result
    )
############################################################################################



#A list of venues that host teams from 3 or more target audiences (return at least 2 venues)


@app.route('/venue_with_3_or_more_target_audiences', methods=['GET', 'POST'])
def venue_with_3_or_more_targe_audiences():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT 
            venue.name AS venue_name,
            COUNT(DISTINCT target_audience.target_audience_id) AS audience_count,
            GROUP_CONCAT(DISTINCT target_audience.category SEPARATOR ', ') AS audience_list
        FROM venue
        JOIN venue_audience ON venue.venue_id = venue_audience.venue_id
        JOIN target_audience ON venue_audience.target_audience_id = target_audience.target_audience_id
        GROUP BY venue.venue_id, venue.name
        HAVING audience_count >= 3;
    """
    cursor.execute(query) 
    result = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'venue_with_3_or_more_target_audiences.html', 
        venues = result
    )

############################################################################################




#create a query to show all the members of 2 non-solo teams, showing clearly which team each member belongs to

@app.route('/non_solo_teams')
def non_solo_teams():
    conn = get_database_connection()
    cursor = conn.cursor(dictionary=True)



    query = """
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
    """


    cursor.execute(query)
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'non_solo_teams.html', 
        team_members=results
    )

############################################################################################


#A booking has a start time and end time, and each team has a fee in £ per hour. Write a query in Python to
#run a calculated field of the total event cost (as TOTAL_BOOKING_COST) for a team at a venue. Flag any potential
#booking that is going to exceed the venue maximum booking fee. (You can chose the team and the venue.)

@app.route('/booking_costs_from_team', methods=['GET', 'POST'])
def calculate_booking_costs_team():
    connection = get_database_connection()
    cursor = connection.cursor(dictionary=True)

    #fetching dropdown list
    cursor.execute("SELECT team_id, name FROM team")
    teams_list = cursor.fetchall()

    results = []
    selected_name = None

    #search button
    if request.method == 'POST':
        chosen_id = request.form.get('team_selection_id')
        
        #sends query to database
        cursor.execute("SELECT name FROM team WHERE team_id = %s", (chosen_id,))
        team_record = cursor.fetchone()
        if team_record:
            selected_name = team_record['name']

        #brief wanted in this format (dd:mm:yyyy hh:mm:ss) this is my workaround
        correcting_datetime_format = '%d/%m/%Y %H:%i:%s'

        query = """
            SELECT 
                venue.name AS venue_name,
                venue.max_booking_fee AS venue_max_fee,
                team.name AS TEAM_NAME,
                team.hourly_rate AS team_hourly_rate,
                DATE_FORMAT(booking.start_datetime, %s) AS start_time,
                DATE_FORMAT(booking.end_datetime, %s) AS end_time,
                TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) AS duration_in_hours,
                (TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) * team.hourly_rate) AS total_booking_cost,
                CASE 
                    WHEN (TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) * team.hourly_rate) > venue.max_booking_fee 
                    THEN 'OVER BUDGET' 
                    ELSE 'WITHIN BUDGET' 
                END AS booking_status
            FROM booking
            JOIN venue ON booking.venue_id = venue.venue_id
            JOIN team_presentation ON booking.team_presentation_id = team_presentation.team_presentation_id
            JOIN team ON team_presentation.team_id = team.team_id
            WHERE team.team_id = %s
        """
        

        cursor.execute(query, (correcting_datetime_format, correcting_datetime_format, chosen_id))
        results = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        'booking_costs_from_team.html', 
        teams_dropdown = teams_list,
        bookings = results,
        selected_name = selected_name
    )


############################################################################################

#A booking has a start time and end time, and each team has a fee in £ per hour. Write a query in Python to
#run a calculated field of the total event cost (as TOTAL_BOOKING_COST) for a team at a venue. Flag any potential
#booking that is going to exceed the venue maximum booking fee. (You can chose the team and the venue.)

@app.route('/booking_costs_from_venue', methods=['GET', 'POST'])
def calculate_booking_costs_venue():
    connection = get_database_connection()
    cursor = connection.cursor(dictionary=True)

    # fetching dropdown list
    cursor.execute("SELECT venue_id, name FROM venue")
    fetched_dropdown_list = cursor.fetchall()

    results = []
    selected_name = None

    # search button
    if request.method == 'POST':
        get_row = request.form.get('venue_selection_id')

        # sends query to database to get venue name
        cursor.execute("SELECT name FROM venue WHERE venue_id = %s", (get_row,))
        record = cursor.fetchone()
        if record:
            selected_name = record['name']

        # Date format workaround
        correcting_datetime_format = '%d/%m/%Y %H:%i:%s'

        query = """
            SELECT 
                team.name AS team_name,
                team.hourly_rate AS team_hourly_rate,
                DATE_FORMAT(booking.start_datetime, %s) AS start_time,
                DATE_FORMAT(booking.end_datetime, %s) AS end_time,
                venue.max_booking_fee AS venue_max_fee,
                TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) AS duration_in_hours,
                (TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) * team.hourly_rate) AS total_booking_cost,
                CASE 
                    WHEN (TIMESTAMPDIFF(HOUR, booking.start_datetime, booking.end_datetime) * team.hourly_rate) > venue.max_booking_fee 
                    THEN 'OVER BUDGET' 
                    ELSE 'WITHIN BUDGET' 
                END AS booking_status
            FROM booking
            JOIN venue ON booking.venue_id = venue.venue_id
            JOIN team_presentation ON booking.team_presentation_id = team_presentation.team_presentation_id
            JOIN team ON team_presentation.team_id = team.team_id
            WHERE booking.venue_id = %s
        """

        # Passing the format string twice for start and end times, then the venue ID
        cursor.execute(query, (correcting_datetime_format, correcting_datetime_format, get_row))
        results = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        'booking_costs_from_venue.html', 
        venues_dropdown = fetched_dropdown_list,
        bookings = results,
        selected_name = selected_name
    )






############################################################################################



#Create a MySQL INSERT INTO query in Python, operated from the main menu. It needs to add a further 2 teams
#from the user’s input, and add at least 2 members each per team (also from user input), ensuring any relevant
#connected tables are updated too.

@app.route('/add_teams', methods=['GET', 'POST'])
def add_teams():
    message = None
    
    if request.method == 'POST':
        conn = get_database_connection()
        cursor = conn.cursor()

        try:

            # inserting team 
            insert_team_name = request.form['table_name']
            insert_hourly_rate = request.form['table_rate']
            cursor.execute("INSERT INTO team (name, hourly_rate) VALUES (%s, %s)", (insert_team_name, insert_hourly_rate))

            # get new row id
            team_id = cursor.lastrowid 

            # insert team members block
            table_members = [request.form['table_members_1'], request.form['table_members_2']]
            for member_name in table_members:

                # add new member to table
                cursor.execute("INSERT INTO member (name) VALUES (%s)", (member_name,))
                member_id = cursor.lastrowid

                # filling juntion table(team_has_member) to connect to team
                cursor.execute("INSERT INTO team_has_member (team_id, member_id) VALUES (%s, %s)", (team_id, member_id))

            conn.commit()
            message = "Successfully commited 1 teams and 2 members to the booking system"

        # rollback if there is an error
        except Exception as e:
            conn.rollback() 
            message = f"An error occurred: {e}"
        
        finally:
            cursor.close()
            conn.close()

    return render_template('add_teams.html', message=message)








#end of program dont delete this bit 


if __name__ == '__main__':
    app.run(debug=True)








