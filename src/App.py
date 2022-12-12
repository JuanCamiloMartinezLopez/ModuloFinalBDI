from urllib import request
import cx_Oracle
from flask import Flask, make_response, render_template, request, redirect, url_for, flash
import Config
##import jyserver.Flask as jsf

app=Flask(__name__)

# conexion con oracle
connection = None
datosauxiliar = []
fecha = ''
programa = []
docente = []
elemento = []
try:
    connection = cx_Oracle.connect(
        Config.username,
        Config.password,
        Config.dsn,
        encoding=Config.encoding)

    # imprime la version de la base de datos
    print("conectado", connection.version)
    cursor = connection.cursor()
    sentencia = cursor.execute("SELECT * FROM empleado")
    rows = cursor.fetchall()
    # print(rows)

    #oracle = oracle(app)

except cx_Oracle.Error as error:
    print(error)

finally:
    # release the connection
    if connection:
        None
        # connection.close()

# configuracion de session
app.secret_key = 'mysecretkey'

@app.route('/')
def index():
    return redirect(url_for('create_flight'))

@app.route('/create_flight', methods=['GET', 'POST'])
def create_flight():
    if request.method=='POST':

        print(request.form)
        flash('Vuelo creado')
        print(request.form['airpot_1'])
        airline_code = request.form['airline']
        cursor = connection.cursor()
        sql = """SELECT COUNT(*) FROM FLIGHT WHERE AIRLINECODE LIKE :airline_code"""
        cursor.execute(sql, [airline_code])
        data = cursor.fetchone()
        flight_number = data[0]+1

        try:
            sql = "INSERT INTO FLIGHT VALUES (:airline_code, :flight_number)"
            cursor.execute(sql, [airline_code, flight_number])
            for i in range(1, int(request.form['num_segment'])+1):
                arrival = request.form['airpot_' + str(i+1)]
                departure = request.form['airpot_' + str(i)]
                sql = "INSERT INTO FLIGHTSEGMENT VALUES (:airlline_code, :flight_number, :arrival, :departure)"
                cursor.execute(sql, [airline_code, flight_number, arrival, departure])
                
                pilot_license = request.form['pilots']
                sql = "INSERT INTO PILOTASSIGNMENT VALUES (:airline_code, :flight_number, :arrival, :pilot_license)"
                cursor.execute(sql, [airline_code, flight_number, arrival, pilot_license])

            connection.commit()
        except cx_Oracle.Error as error:
            print(error)

        return redirect(url_for('show_flight', flight_code = airline_code + '-' + str(flight_number)))
    elif request.method=='GET':
        airlines=get_airlines()
        airports=get_airports()
        return render_template('create_flight.html',airlines=airlines, airports=airports)

@app.route('/create_connection/<flight>', methods=['POST'])
def create_connection(flight):
    if request.method=='POST':

        try:
            airline_code1 = request.form['airline_vueloinicial']
            flight_number1 = request.form['flight_vueloinicial'].split('_')[1]
            airport = request.form['airport_vueloinicial']
            airline_code2 = request.form['airline_vuelofinal']
            flight_number2 = request.form['flight_vuelofinal'].split('_')[1]
            cursor = connection.cursor()
            sql = """INSERT INTO FLIGHTCONNECTION VALUES (:airline_code1, :flight_number1, :airport, :airline_code2, :flight_number2, :airport)"""
            cursor.execute(sql, [airline_code1, flight_number1, airport, airline_code2, flight_number2])
            connection.commit()
            flash('Conexión creada')
        except cx_Oracle.Error as error:
            print(error)

        return redirect(url_for('show_flight',flight_code = flight, connection = None))

@app.route('/show_flight/<flight_code>', methods=['GET'])
def show_flight(flight_code):
    airlines = get_airlines()

    print(flight_code.split('-'))

    airline_code = flight_code.split('-')[0]
    flight_num = flight_code.split('-')[1]
    flight = airline_code + flight_num

    info_flight = get_info_flights(airline_code, flight_num)
    info_segment = get_segment_fligth(airline_code, flight_num)

    aux = []


    for seg in info_segment:
        if seg[2] not in aux:
            aux.append(seg[2])

    aux.append(info_segment[len(info_segment)-1][3])     


    info_airports = []

    for i in aux:
        info_airports.append(get_info_airport(i))


    info_con = get_info_con(airline_code, flight_num)

    if len(info_con) != 0:
        con = True
    else:
        con = False
        info_con = []

    print(info_con)

    return render_template('show_flight.html',flight_code = flight_code, connection = con, airlines = airlines, 
    info_flight = info_flight[0], info_segment = info_segment, info_airports = info_airports, info_con = info_con, flight = flight)

@app.route('/get_airlines', methods=['GET'])
def get_airlines():
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM AIRLINE')
    data = cursor.fetchall()
    aerolines = data


    return aerolines

@app.route('/get_airport', methods=['GET'])
def get_airports():
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM AIRPORT')
    data = cursor.fetchall()
    airports = data
    return airports

@app.route('/get_pilots_airline/<airline_code>', methods=['GET'])
def get_pilots_airline(airline_code):
    cursor = connection.cursor()
    sql = """SELECT P.PILOTLICENSE, PE.NAME FROM PILOT P, EMPLOYEE E, PERSON PE WHERE P.EMPLOYEENUMBER = E.EMPLOYEENUMBER 
    AND E.IDPERSON = PE.IDPERSON AND P.AIRLINECODE = :airline_code"""
    cursor.execute(sql, [airline_code])
    data = cursor.fetchall()
    pilots = data
    return pilots


@app.route('/get_flights_airline/<airline_code>', methods=['GET'])
def get_flights_airline(airline_code):
    cursor = connection.cursor()
    sql = """SELECT F.* FROM FLIGHT F WHERE F.AIRLINECODE LIKE :airline_code"""
    cursor.execute(sql, [airline_code])
    data = cursor.fetchall()
    print(data)
    flights = data
    return flights

@app.route('/get_airports_flight/<airline_code>/<flight_code>', methods=['GET'])
def get_airports_flight(airline_code, flight_code):
    cursor = connection.cursor()
    sql = """SELECT FS.*, A.AIRPORTNAME FROM FLIGHTSEGMENT FS, FLIGHT F, AIRPORT A WHERE FS.AIRLINECODE = F.AIRLINECODE AND FS.FLIGHTNUMBER = F.FLIGHTNUMBER 
    AND F.AIRLINECODE LIKE :airline_code AND F.FLIGHTNUMBER = :flight_code AND FS.ARR_AIRPORTCODE = A.AIRPORTCODE"""
    cursor.execute(sql, [airline_code, flight_code])
    data = cursor.fetchall()
    airports = data
    return airports

@app.route('/get_info_flight/<airline_code>/<flight_code>', methods = ['GET'])
def get_info_flights(airline_code, flight_code):
    cursor = connection.cursor()
    sql = """SELECT AL.AIRLINENAME, FL.FLIGHTNUMBER, (SELECT COUNT(*) FROM FLIGHTSEGMENT FS, FLIGHT F, AIRPORT A 
    WHERE FS.AIRLINECODE = F.AIRLINECODE AND FS.FLIGHTNUMBER = F.FLIGHTNUMBER 
    AND F.AIRLINECODE LIKE :airline_code AND F.FLIGHTNUMBER = :flight_code 
    AND FS.DEP_AIRPORTCODE = A.AIRPORTCODE) NUM, (SELECT A.AIRPORTNAME FROM FLIGHTSEGMENT FS, FLIGHT F, AIRPORT A 
    WHERE FS.AIRLINECODE = F.AIRLINECODE AND FS.FLIGHTNUMBER = F.FLIGHTNUMBER 
    AND F.AIRLINECODE LIKE :airline_code AND F.FLIGHTNUMBER = :flight_code 
    AND FS.DEP_AIRPORTCODE = A.AIRPORTCODE AND ROWNUM <= 1) NAME, (SELECT PE.NAME FROM PILOT P, EMPLOYEE E, PERSON PE, PILOTASSIGNMENT PA 
    WHERE P.EMPLOYEENUMBER = E.EMPLOYEENUMBER AND E.IDPERSON = PE.IDPERSON
    AND PA.PILOTLICENSE = P.PILOTLICENSE AND PA.AIRLINECODE = :airline_code 
    AND PA.FLIGHTNUMBER = :flight_code AND ROWNUM <= 1) PILOT
    FROM  AIRLINE AL, FLIGHT FL WHERE AL.AIRLINECODE = FL.AIRLINECODE AND
    FL.AIRLINECODE = :airline_code AND FL.FLIGHTNUMBER = :flight_code"""
    cursor.execute(sql, [airline_code, flight_code])
    data = cursor.fetchall()
    info_flight = data
    return info_flight

@app.route('/get_segment_flight/<airline_code>/<flight_code>', methods = ['GET'])
def get_segment_fligth(airline_code, flight_code):
    cursor = connection.cursor()
    sql = """SELECT FS.AIRLINECODE ||''|| FS.FLIGHTNUMBER VUELO, AL.AIRLINENAME AEROLINEA, 
    FS.DEP_AIRPORTCODE, FS.ARR_AIRPORTCODE, (SELECT PE.NAME FROM PILOT P, EMPLOYEE E, PERSON PE, PILOTASSIGNMENT PA 
    WHERE P.EMPLOYEENUMBER = E.EMPLOYEENUMBER AND E.IDPERSON = PE.IDPERSON
    AND PA.PILOTLICENSE = P.PILOTLICENSE AND PA.AIRLINECODE = :airline_code 
    AND PA.FLIGHTNUMBER = :flight_code AND ROWNUM <= 1) PILOTO FROM FLIGHTSEGMENT FS, AIRLINE AL, 
    FLIGHT F WHERE AL.AIRLINECODE = FS.AIRLINECODE 
    AND FS.AIRLINECODE = F.AIRLINECODE AND FS.FLIGHTNUMBER = F.FLIGHTNUMBER
    AND FS.FLIGHTNUMBER = :flight_code AND FS.AIRLINECODE LIKE :airline_code"""
    cursor.execute(sql, [airline_code, flight_code])
    data = cursor.fetchall()
    segment_flight = data
    return segment_flight

@app.route('/get_info_con/<airline_code>/<flight_code>', methods = ['GET'])
def get_info_con(airline_code, flight_code):
    cursor = connection.cursor()
    sql = """SELECT AL.AIRLINENAME AEROLINEA, FC.DEP_FLIGHTNUMBER NUM, 
    AP.AIRPORTNAME AIRPORT FROM FLIGHTCONNECTION FC, AIRPORT AP, AIRLINE AL 
    WHERE FC.ARR_AIRPORTCODE = AP.AIRPORTCODE AND FC.DEP_AIRLINECODE = AL.AIRLINECODE 
    AND FC.ARR_FLIGHTNUMBER = :flight_code AND FC.ARR_AIRLINECODE LIKE :airline_code"""
    cursor.execute(sql, [flight_code, airline_code])
    data = cursor.fetchall()
    info_con = data
    return info_con

@app.route('/get_info_airport/<airport_code>', methods = ['GET'])
def get_info_airport(airport_code):
    cursor = connection.cursor()
    sql = """SELECT P1.PLACENAME PAIS, PT.DESPLACETYPE TIPO,P2.PLACENAME DIVISION, 
    P3.PLACENAME CIUDAD, A.AIRPORTNAME AEROPUERTO FROM PLACE P1, PLACE P2, PLACE P3, 
    PLACETYPE PT, AIRPORT A WHERE P3.IDPLACE = A.IDPLACE 
    AND P3.PLA_IDPLACE = P2.IDPLACE AND P2.PLA_IDPLACE = P1.IDPLACE 
    AND PT.IDPLACETYPE = P2.IDPLACETYPE AND A.AIRPORTCODE LIKE :airport_code"""
    cursor.execute(sql, [airport_code])
    data = cursor.fetchall()
    info_airport = data
    return info_airport

@app.route('/report', methods = ['POST'])
def report():
    
    dep_airport = request.form['dep_airport']
    arr_airport = request.form['arr_airport']
    
    cursor = connection.cursor()
    sql = """SELECT FS.AIRLINECODE, FS.FLIGHTNUMBER
    FROM FLIGHTSEGMENT FS WHERE FS.ARR_AIRPORTCODE = :arr_airport 
    OR FS.DEP_AIRPORTCODE = :dep_airport GROUP BY FS.AIRLINECODE, FS.FLIGHTNUMBER
    HAVING COUNT(*)>=2"""
    cursor.execute(sql, [arr_airport, dep_airport])
    data = cursor.fetchall()

    airport = get_airports()

    itinerary = []


    for i in data:
        


        flights = []
        flights.append(get_info_flights(i[0], i[1]))
        flights.append(get_segment_fligth(i[0], i[1]))

        aux = []


        for seg in flights[1]:
            if seg[2] not in aux:
                aux.append(seg[2])

        aux.append(flights[1][len(flights[1])-1][3])     


        info_airports = []

        for i in aux:
            info_airports.append(get_info_airport(i))

        flights.append(info_airports)

        itinerary.append(flights)
        

    print("Segmentos", itinerary)



    return render_template('report.html', itinerary = itinerary, airports = airport)

@app.route('/generate_report', methods = ['GET'])
def generate_report():

    airport = get_airports()



    return render_template('report.html', airports = airport, itinerary = [])

if __name__ == '__main__':
    app.run(port=3000, debug=True)