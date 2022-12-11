from urllib import request
from flask import Flask, make_response, render_template, request, redirect, url_for, flash
##import jyserver.Flask as jsf

app=Flask(__name__)

app.secret_key = 'mysecretkey'

@app.route('/')
def index():
    return redirect(url_for('create_flight'))

@app.route('/create_flight', methods=['GET', 'POST'])
def create_flight():
    if request.method=='POST':

        print(request.form)
        flash('vuelo creados')
        print(request.form['airpot_1'])
        return redirect(url_for('show_flight',flight_code='puto'))
    elif request.method=='GET':
        aerolines=get_airlines()
        airports=get_airports()
        return render_template('create_flight.html',aerolines=aerolines, airports=airports)

@app.route('/show_flight/<flight_code>', methods=['GET'])
def show_flight(flight_code):
    
    return render_template('show_flight.html',flight_code=flight_code)

@app.route('/get_airlines', methods=['GET'])
def get_airlines():
    aerolines=[('W3', '', 'Swiftair'),('V7', '', 'Volotea'),('VY', '', 'Vueling')]

    return aerolines

@app.route('/get_airport', methods=['GET'])
def get_airports():
    aerolines=[('YYZ', 'TOC', 'Lester B. Pearson International Airport'),('YUL', 'MOC', 'Montreal / Pierre Elliott Trudeau International Airport'),('YVR', 'VAC', 'Vancouver International Airport')]
    return aerolines

@app.route('/get_pilots_airline/<airline_code>', methods=['GET'])
def get_pilots_airline(airline_code):
    pilots=[('521915', 'VY', '6', '5/1/2023'),('1791916', 'AR', '80', '8/3/2024'),('2531917', 'AC', '72', '14/10/2023')]
    return pilots



if __name__ == '__main__':
    app.run(port=3000, debug=True)