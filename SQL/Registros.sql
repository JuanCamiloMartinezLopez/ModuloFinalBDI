/*PLACETYPE*/
INSERT INTO PLACETYPE VALUES ('1', 'País');
INSERT INTO PLACETYPE VALUES ('2', 'Estado');
INSERT INTO PLACETYPE VALUES ('3', 'Provincia');
INSERT INTO PLACETYPE VALUES ('4', 'Departamento');
INSERT INTO PLACETYPE VALUES ('5', 'Ciudad');
INSERT INTO PLACETYPE VALUES ('6', 'Comunidad');
INSERT INTO PLACETYPE VALUES ('7', 'Isla');

/*PLACE*/
/*País*/
INSERT INTO PLACE VALUES ('CAN', '1', '', 'Canada');
INSERT INTO PLACE VALUES ('USA', '1', '', 'Estados Unidos');
INSERT INTO PLACE VALUES ('MEX', '1', '', 'México');
INSERT INTO PLACE VALUES ('ARG', '1', '', 'Argentina');
INSERT INTO PLACE VALUES ('ESP', '1', '', 'España');
INSERT INTO PLACE VALUES ('COL', '1', '', 'Colombia');
/*División*/
INSERT INTO PLACE VALUES ('ON', '3', 'CAN', 'Ontario');
INSERT INTO PLACE VALUES ('QC', '3', 'CAN', 'Quebec');
INSERT INTO PLACE VALUES ('CO', '3', 'CAN', 'Columbia Británica');
INSERT INTO PLACE VALUES ('AB', '3', 'CAN', 'Alberta');
INSERT INTO PLACE VALUES ('GA', '2', 'USA', 'Georgia');
INSERT INTO PLACE VALUES ('CA', '2', 'USA', 'Caliornia');
INSERT INTO PLACE VALUES ('IL', '2', 'USA', 'Illinois');
INSERT INTO PLACE VALUES ('TX', '2', 'USA', 'Texas');
INSERT INTO PLACE VALUES ('COU', '2', 'USA', 'Columbia');
INSERT INTO PLACE VALUES ('NY', '2', 'USA', 'Nueva York');
INSERT INTO PLACE VALUES ('WA', '2', 'USA', 'Washington');
INSERT INTO PLACE VALUES ('NV', '2', 'USA', 'Denver');
INSERT INTO PLACE VALUES ('FL', '2', 'USA', 'Florida');
INSERT INTO PLACE VALUES ('NJ', '2', 'USA', 'Nueva York');
INSERT INTO PLACE VALUES ('GR', '2', 'MEX', 'Guerrero');
INSERT INTO PLACE VALUES ('AG', '2', 'MEX', 'Aguascalientes');
INSERT INTO PLACE VALUES ('SO', '2', 'MEX', 'Sonora');
INSERT INTO PLACE VALUES ('MI', '2', 'MEX', 'Michoacán');
INSERT INTO PLACE VALUES ('EM', '2', 'MEX', 'México');
INSERT INTO PLACE VALUES ('BC', '2', 'MEX', 'Baja California Sur');
INSERT INTO PLACE VALUES ('CM', '2', 'MEX', 'Campeche');
INSERT INTO PLACE VALUES ('QR', '2', 'MEX', 'Quintara Roo');
INSERT INTO PLACE VALUES ('GT', '2', 'MEX', 'Guanajuato');
INSERT INTO PLACE VALUES ('BA', '2', 'ARG', 'Buenos Aires');
INSERT INTO PLACE VALUES ('CB', '2', 'ARG', 'Cordoba');
INSERT INTO PLACE VALUES ('SF', '2', 'ARG', 'Santa Fé');
INSERT INTO PLACE VALUES ('MZ', '2', 'ARG', 'Mendoza');
INSERT INTO PLACE VALUES ('SA', '2', 'ARG', 'Saita');
INSERT INTO PLACE VALUES ('BCE', '6', 'ESP', 'Cataluña');
INSERT INTO PLACE VALUES ('MA', '6', 'ESP', 'Madrid');
INSERT INTO PLACE VALUES ('AGE', '6', 'ESP', 'Malaga');
INSERT INTO PLACE VALUES ('PM', '7', 'ESP', 'Islas Baleares');
INSERT INTO PLACE VALUES ('AL', '6', 'ESP', 'Valencia');
INSERT INTO PLACE VALUES ('VL', '6', 'ESP', 'Valencia');
INSERT INTO PLACE VALUES ('SV', '6', 'ESP', 'Anadalucia');
INSERT INTO PLACE VALUES ('AX', '4', 'COL', 'Quindio');
INSERT INTO PLACE VALUES ('BQ', '4', 'COL', 'Atlántico');
INSERT INTO PLACE VALUES ('BO', '4', 'COL', 'Distrito Capital');
INSERT INTO PLACE VALUES ('BG', '4', 'COL', 'Santander');
INSERT INTO PLACE VALUES ('CL', '4', 'COL', 'Valle del Cauca');
INSERT INTO PLACE VALUES ('CT', '4', 'COL', 'Bolivar');
INSERT INTO PLACE VALUES ('CU', '4', 'COL', 'Norte de Santander');
INSERT INTO PLACE VALUES ('LE', '4', 'COL', 'Amazonas');
INSERT INTO PLACE VALUES ('MD', '4', 'COL', 'Antioquia');
INSERT INTO PLACE VALUES ('PE', '4', 'COL', 'Risaralda');
INSERT INTO PLACE VALUES ('RH', '4', 'COL', 'La Guajira');
INSERT INTO PLACE VALUES ('AD', '4', 'COL', 'San Andrés y Providencia');
INSERT INTO PLACE VALUES ('SM', '4', 'COL', 'Magdalena');
/*Ciudad*/
INSERT INTO PLACE VALUES ('TOC', '5', 'ON', 'Toronto');
INSERT INTO PLACE VALUES ('MOC', '5', 'QC', 'Montréal');
INSERT INTO PLACE VALUES ('VAC', '5', 'CO', 'Vancouver');
INSERT INTO PLACE VALUES ('CAC', '5', 'AB', 'Calgary');
INSERT INTO PLACE VALUES ('EDC', '5', 'AB', 'Edmonton');
INSERT INTO PLACE VALUES ('QBC', '5', 'QC', 'Quebec');
INSERT INTO PLACE VALUES ('ATC', '5', 'GA', 'Atlanta');
INSERT INTO PLACE VALUES ('LAC', '5', 'CA', 'Los Ángeles');
INSERT INTO PLACE VALUES ('CHC', '5', 'IL', 'Chicago');
INSERT INTO PLACE VALUES ('DLC', '5', 'TX', 'Dallas/Fort Worth');
INSERT INTO PLACE VALUES ('DEC', '5', 'CO', 'Denver');
INSERT INTO PLACE VALUES ('NYC', '5', 'NY', 'Nueva York');
INSERT INTO PLACE VALUES ('SFC', '5', 'CA', 'San Francisco');
INSERT INTO PLACE VALUES ('SEC', '5', 'WA', 'Seattle');
INSERT INTO PLACE VALUES ('LVC', '5', 'NV', 'Las Vegas');
INSERT INTO PLACE VALUES ('ORC', '5', 'FL', 'Orlando');
INSERT INTO PLACE VALUES ('NEC', '5', 'NJ', 'Newark');
INSERT INTO PLACE VALUES ('ACC', '5', 'GR', 'Acapulco');
INSERT INTO PLACE VALUES ('AGC', '5', 'AG', 'Aguascalientes');
INSERT INTO PLACE VALUES ('AMC', '5', 'SO', 'Álamos');
INSERT INTO PLACE VALUES ('APC', '5', 'MI', 'Apatzingán');
INSERT INTO PLACE VALUES ('AZC', '5', 'EM', 'Atizapán');
INSERT INTO PLACE VALUES ('CSC', '5', 'BC', 'Cabo San Lucas');
INSERT INTO PLACE VALUES ('CMC', '5', 'CM', 'Campeche');
INSERT INTO PLACE VALUES ('CNC', '5', 'SO', 'Cananea');
INSERT INTO PLACE VALUES ('CCC', '5', 'QR', 'Cancún');
INSERT INTO PLACE VALUES ('CLC', '5', 'GT', 'Celaya');
INSERT INTO PLACE VALUES ('CTC', '5', 'QR', 'Chetumal');
INSERT INTO PLACE VALUES ('BAC', '5', 'BA', 'Buenos Aires');
INSERT INTO PLACE VALUES ('CBC', '5', 'CB', 'Cordoba');
INSERT INTO PLACE VALUES ('ROC', '5', 'SF', 'Rosarío');
INSERT INTO PLACE VALUES ('MZC', '5', 'MZ', 'Mendoza');
INSERT INTO PLACE VALUES ('STC', '5', 'SA', 'Salta');
INSERT INTO PLACE VALUES ('BCC', '5', 'BC', 'Barcelona');
INSERT INTO PLACE VALUES ('MAC', '5', 'MA', 'Madrid');
INSERT INTO PLACE VALUES ('MGC', '5', 'AG', 'Málaga');
INSERT INTO PLACE VALUES ('PMC', '5', 'PM', 'Palama De Mallorca');
INSERT INTO PLACE VALUES ('ALC', '5', 'AL', 'Alicante');
INSERT INTO PLACE VALUES ('VLC', '5', 'VL', 'Valencia');
INSERT INTO PLACE VALUES ('SVC', '5', 'SV', 'Sevilla');
INSERT INTO PLACE VALUES ('LTC', '5', 'AX', 'La Tebaida');
INSERT INTO PLACE VALUES ('SLC', '5', 'BQ', 'Soledad');
INSERT INTO PLACE VALUES ('BOC', '5', 'BO', 'Bogotá');
INSERT INTO PLACE VALUES ('LBC', '5', 'BG', 'Lebrija');
INSERT INTO PLACE VALUES ('PLC', '5', 'CL', 'Palmira');
INSERT INTO PLACE VALUES ('CGC', '5', 'CT', 'Cartagena');
INSERT INTO PLACE VALUES ('CUC', '5', 'CU', 'Cúcuta');
INSERT INTO PLACE VALUES ('LEC', '5', 'LE', 'Leticia');
INSERT INTO PLACE VALUES ('RNC', '5', 'MD', 'Rionegro');
INSERT INTO PLACE VALUES ('PEC', '5', 'PE', 'Pereira');
INSERT INTO PLACE VALUES ('RHC', '5', 'RH', 'Riohacha');
INSERT INTO PLACE VALUES ('SAC', '5', 'AD', 'San Andrés');
INSERT INTO PLACE VALUES ('SMC', '5', 'SM', 'Santa Marta');

/*AIRPORTTYPE*/

INSERT INTO AIRPORTTYPE VALUES ('Internacional');
INSERT INTO AIRPORTTYPE VALUES ('Regional');

/*AIRPORT*/
INSERT INTO AIRPORT VALUES ('YYZ', 'TOC', 'Lester B. Pearson International Airport');
INSERT INTO AIRPORT VALUES ('YUL', 'MOC', 'Montreal / Pierre Elliott Trudeau International Airport');
INSERT INTO AIRPORT VALUES ('YVR', 'VAC', 'Vancouver International Airport');
INSERT INTO AIRPORT VALUES ('YYC', 'CAC', 'Calgary International Airport ');
INSERT INTO AIRPORT VALUES ('YEG', 'EDC', 'Edmonton International Airport');
INSERT INTO AIRPORT VALUES ('YQB', 'QBC', 'Aeropuerto Internacional Jean-Lesage de Quebec');
INSERT INTO AIRPORT VALUES ('ATL', 'ATC', 'Aeropuerto Internacional Hartsfield-Jackson');
INSERT INTO AIRPORT VALUES ('LAX', 'LAC', 'Aeropuerto Internacional de Los Ángeles');
INSERT INTO AIRPORT VALUES ('ORD', 'CHC', 'Aeropuerto Internacional O''Hare');
INSERT INTO AIRPORT VALUES ('DFW', 'DLC', 'Aeropuerto Internacional de Dallas-Fort Worth');
INSERT INTO AIRPORT VALUES ('DEN', 'DEC', 'Aeropuerto Internacional de Denver');
INSERT INTO AIRPORT VALUES ('JFK', 'NYC', 'Aeropuerto Internacional John F. Kennedy');
INSERT INTO AIRPORT VALUES ('SFO', 'SFC', 'Aeropuerto Internacional de San Francisco');
INSERT INTO AIRPORT VALUES ('SEA', 'SEC', 'Aeropuerto Internacional de Seattle-Tacoma');
INSERT INTO AIRPORT VALUES ('LAS', 'LVC', 'Aeropuerto Internacional Harry Reid');
INSERT INTO AIRPORT VALUES ('MCO', 'ORC', 'Aeropuerto Internacional de Orlando');
INSERT INTO AIRPORT VALUES ('EWR', 'NEC', 'Aeropuerto Internacional Libertad de Newark');
INSERT INTO AIRPORT VALUES ('ACA', 'ACC', 'Aeropuerto Internacional de Acapulco');
INSERT INTO AIRPORT VALUES ('PIE', 'ACC', 'Base Aérea No. 7 León González Pie de la Cuesta');
INSERT INTO AIRPORT VALUES ('AGU', 'AGC', 'Aeropuerto Internacional de Aguascalientes');
INSERT INTO AIRPORT VALUES ('XAL', 'ALC', 'Aeropuerto Nacional de Álamos');
INSERT INTO AIRPORT VALUES ('AZG', 'APC', 'Aeropuerto Nacional Pablo L. Sidar');
INSERT INTO AIRPORT VALUES ('JJC', 'AZC', 'Aeropuerto Nacional Jorge Jiménez Cantú');
INSERT INTO AIRPORT VALUES ('CSL', 'CSC', 'Aeródromo Internacional de Cabo San Lucas');
INSERT INTO AIRPORT VALUES ('CPE', 'CMC', 'Aeropuerto Internacional de Campeche');
INSERT INTO AIRPORT VALUES ('CNA', 'CNC', 'Aeropuerto Nacional de Cananea');
INSERT INTO AIRPORT VALUES ('CUN', 'CCC', 'Aeropuerto Internacional de Cancún');
INSERT INTO AIRPORT VALUES ('CYW', 'CLC', 'Aeropuerto Nacional Capitán Rogelio Castillo');
INSERT INTO AIRPORT VALUES ('CTM', 'CTC', 'Aeropuerto Internacional de Chetumal');
INSERT INTO AIRPORT VALUES ('EZE', 'BAC', 'Ministro Pistarini International Airport');
INSERT INTO AIRPORT VALUES ('AEP', 'BAC', 'Jorge Newbery Airpark');
INSERT INTO AIRPORT VALUES ('COR', 'CBC', 'Ingeniero Ambrosio Taravella Airport');
INSERT INTO AIRPORT VALUES ('ROS', 'ROC', 'Islas Malvinas Airport');
INSERT INTO AIRPORT VALUES ('MDZ', 'MZC', 'El Plumerillo Airport');
INSERT INTO AIRPORT VALUES ('SLA', 'SAC', 'Martin Miguel De Guemes International Airport');
INSERT INTO AIRPORT VALUES ('BCN', 'BCC', 'Barcelona International Airport');
INSERT INTO AIRPORT VALUES ('MAD', 'MAC', 'Adolfo Suárez Madrid–Barajas Airport');
INSERT INTO AIRPORT VALUES ('AGP', 'MGC', 'Málaga Airport');
INSERT INTO AIRPORT VALUES ('PMI', 'PMC', 'Palma De Mallorca Airport');
INSERT INTO AIRPORT VALUES ('ALC', 'ACC', 'Alicante International Airport');
INSERT INTO AIRPORT VALUES ('VLC', 'VLC', 'Valencia Airport');
INSERT INTO AIRPORT VALUES ('SVQ', 'SVC', 'Sevilla Airport');
INSERT INTO AIRPORT VALUES ('AXM', 'LTC', 'Aeropuerto Internacional El Edén');
INSERT INTO AIRPORT VALUES ('BAQ', 'SLC', 'Aeropuerto Internacional Ernesto Cortissoz');
INSERT INTO AIRPORT VALUES ('BOG', 'BOC', 'Aeropuerto Internacional El Dorado');
INSERT INTO AIRPORT VALUES ('BGA', 'LBC', 'Aeropuerto Internacional Palonegro');
INSERT INTO AIRPORT VALUES ('CLO', 'PLC', 'Aeropuerto Internacional Alfonso Bonilla Aragón');
INSERT INTO AIRPORT VALUES ('CTG', 'CGC', 'Aeropuerto Internacional Rafael Núñez');
INSERT INTO AIRPORT VALUES ('CUC', 'CUC', 'Aeropuerto Internacional Camilo Daza');
INSERT INTO AIRPORT VALUES ('LET', 'LEC', 'Aeropuerto Internacional Alfredo Vásquez Cobo');
INSERT INTO AIRPORT VALUES ('MDE', 'RNC', 'Aeropuerto Internacional José María Córdova');
INSERT INTO AIRPORT VALUES ('PEI', 'PEC', 'Aeropuerto Internacional Matecaña');
INSERT INTO AIRPORT VALUES ('RCH', 'RHC', 'Aeropuerto Internacional Almirante Padilla');
INSERT INTO AIRPORT VALUES ('ADZ', 'SAC', 'Aeropuerto Internacional Gustavo Rojas Pinilla');
INSERT INTO AIRPORT VALUES ('SMR', 'SMC', 'Aeropuerto Internacional Simón Bolívar');

/*AIRLINE*/
INSERT INTO AIRLINE VALUES ('W3', '', 'Swiftair');
INSERT INTO AIRLINE VALUES ('V7', '', 'Volotea');
INSERT INTO AIRLINE VALUES ('VY', '', 'Vueling');
INSERT INTO AIRLINE VALUES ('EB', '', 'Wamos Air');
INSERT INTO AIRLINE VALUES ('AC', '', 'Air Canada');
INSERT INTO AIRLINE VALUES ('WS', '', 'WestJet');
INSERT INTO AIRLINE VALUES ('TS', '', 'Air Transat');
INSERT INTO AIRLINE VALUES ('7F', '', 'First Air');
INSERT INTO AIRLINE VALUES ('ST', '', 'Canadian North');
INSERT INTO AIRLINE VALUES ('YC', '', 'Ciel Canadien');
INSERT INTO AIRLINE VALUES ('PD', '', 'Porter Airlines');
INSERT INTO AIRLINE VALUES ('AM', '', 'Aeroméxico');
INSERT INTO AIRLINE VALUES ('4O', '', 'Interjet');
INSERT INTO AIRLINE VALUES ('Y4', '', 'Volaris');
INSERT INTO AIRLINE VALUES ('VB', '', 'Viva Aerobus');
INSERT INTO AIRLINE VALUES ('VW', '', 'Aeromar');
INSERT INTO AIRLINE VALUES ('YQ', '', 'TAR');
INSERT INTO AIRLINE VALUES ('AV', '', 'Avianca');
INSERT INTO AIRLINE VALUES ('5Z', '', 'Viva Air Colombia');
INSERT INTO AIRLINE VALUES ('P5', '', 'Wingo');
INSERT INTO AIRLINE VALUES ('VE', '', 'EasyFly');
INSERT INTO AIRLINE VALUES ('AA', '', 'American Airlines');
INSERT INTO AIRLINE VALUES ('XP', '', 'Avelo Airlines');
INSERT INTO AIRLINE VALUES ('MX', '', 'Breeze Airways');
INSERT INTO AIRLINE VALUES ('DL', '', 'Delta Air Lines');
INSERT INTO AIRLINE VALUES ('AR', '', 'Aerolineas Argentinas');
INSERT INTO AIRLINE VALUES ('AU', '', 'Austral');
INSERT INTO AIRLINE VALUES ('4M', '', 'LATAM Airlines Argentina');

/*PERSON*/
INSERT INTO PERSON VALUES ('1', 'BCC', 'Adolphe Célestin Pégoud', '13/06/1989');/*ESP*/
INSERT INTO PERSON VALUES ('2', 'BAC', 'Manfred von Richthofen', '2/5/1992');/*ARG*/
INSERT INTO PERSON VALUES ('3', 'TOC', 'William Avery Bishop', '8/2/1994');/*CAN*/
INSERT INTO PERSON VALUES ('4', 'CCC', 'Erich Alfred Hartmann', '19/4/1972');/*MEX*/
INSERT INTO PERSON VALUES ('5', 'SFC', 'Richard Ira Bong', '24/9/1970');/*USA*/
INSERT INTO PERSON VALUES ('6', 'LAC', 'Jalil Zandi', '2/5/1971');/*USA*/
INSERT INTO PERSON VALUES ('7', 'PLC', 'Heriberto Gil Martínez,', '24/11/1983');/*COL*/
INSERT INTO PERSON VALUES ('8', 'BOC', 'Camilo Daza Álvarez', '25/6/1998');
INSERT INTO PERSON VALUES ('9', 'SLC', 'Ernesto Cortissoz Álvarez-Correa', '30/12/1984');
INSERT INTO PERSON VALUES ('10', 'NYC', 'Giora Epstein', '20/5/1938');

/*EMPLOYEE*/
INSERT INTO EMPLOYEE VALUES ('VY', '6', '1', '31/8/2015');
INSERT INTO EMPLOYEE VALUES ('AR', '80', '2', '21/4/2018');
INSERT INTO EMPLOYEE VALUES ('AC', '72', '3', '11/9/2016');
INSERT INTO EMPLOYEE VALUES ('AM', '352', '4', '20/9/1993');
INSERT INTO EMPLOYEE VALUES ('DL', '40', '5', '6/8/1995');
INSERT INTO EMPLOYEE VALUES ('DL', '11', '6', '1/4/2001');
INSERT INTO EMPLOYEE VALUES ('AV', '1', '7', '21/5/2013');
INSERT INTO EMPLOYEE VALUES ('AV', '2', '8', '18/3/2020');
INSERT INTO EMPLOYEE VALUES ('AV', '3', '9', '8/6/2014');

/*PILOT*/
INSERT INTO PILOT VALUES ('521915', 'VY', '6', '5/1/2023');
INSERT INTO PILOT VALUES ('1791916', 'AR', '80', '8/3/2024');
INSERT INTO PILOT VALUES ('2531917', 'AC', '72', '14/10/2023');
INSERT INTO PILOT VALUES ('5111942', 'AM', '352', '20/12/2022');
INSERT INTO PILOT VALUES ('27121942', 'DL', '40', '3/5/2023');
INSERT INTO PILOT VALUES ('1551981', 'DL', '11', '28/7/2023');
INSERT INTO PILOT VALUES ('2631933', 'AV', '1', '4/10/2024');

/*PASSENGER*/
INSERT INTO PASSENGER VALUES ('17', '10');

/*GROUNDCREW*/
INSERT INTO GROUNDCREW VALUES ('1', 'AV', '2', '18/5/2022');
INSERT INTO GROUNDCREW VALUES ('2', 'AV', '3', '16/2/2020');
