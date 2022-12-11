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
 
        return redirect(url_for('show_flight',flight_code=data[0]+1))
    elif request.method=='GET':
        airlines=get_airlines()
        airports=get_airports()
        return render_template('create_flight.html',airlines=airlines, airports=airports)

@app.route('/show_flight/<flight_code>', methods=['GET'])
def show_flight(flight_code):
    
    return render_template('show_flight.html',flight_code=flight_code)

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
    sql = """SELECT P.PILOTLICENSE, PE.NAME FROM PILOT P, EMPLOYEE E, PERSON PE WHERE P.EMPLOYEENUMBER = E.EMPLOYEENUMBER AND E.IDPERSON = PE.IDPERSON AND P.AIRLINECODE = :airline_code"""
    cursor.execute(sql, [airline_code])
    data = cursor.fetchall()
    pilots = data
    return pilots



if __name__ == '__main__':
    app.run(port=3000, debug=True)