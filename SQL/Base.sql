/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     5/12/2022 9:14:41 p. m.                      */
/*==============================================================*/


alter table AIRLINE
   drop constraint FK_AIRLINE_AIRLINEOP_AIRLINE;

alter table AIRPORT
   drop constraint FK_AIRPORT_AIRPORTLO_PLACE;

alter table AIRPORTSERVICE
   drop constraint FK_AIRPORTS_AIRPORTPL_AIRPORT;

alter table AIRPORTSERVICE
   drop constraint FK_AIRPORTS_PLACEAIRP_PLACE;

alter table AIRPORTTYPE
   drop constraint FK_AIRPORTT_AIRPORTSE_AIRPORTS;

alter table EMPLOYEE
   drop constraint FK_EMPLOYEE_EMPLOYMEN_AIRLINE;

alter table EMPLOYEE
   drop constraint FK_EMPLOYEE_EMPPLOYEE_PARKINGS;

alter table EMPLOYEE
   drop constraint FK_EMPLOYEE_PERSONE_PERSON;

alter table FLIGHT
   drop constraint FK_FLIGHT_FLIGTHT_AIRLINE;

alter table FLIGHTCONNECTION
   drop constraint FK_FLIGHTCO_IS_ARRIVI_FLIGHTSE;

alter table FLIGHTCONNECTION
   drop constraint FK_FLIGHTCO_IS_DEPART_FLIGHTSE;

alter table FLIGHTSEGMENT
   drop constraint FK_FLIGHTSE_DESTINATI_AIRPORT;

alter table FLIGHTSEGMENT
   drop constraint FK_FLIGHTSE_FLIGHTSEG_FLIGHT;

alter table FLIGHTSEGMENT
   drop constraint FK_FLIGHTSE_ORIGIN_AIRPORT;

alter table GROUNDCREW
   drop constraint FK_GROUNDCR_ASSISTANT_EMPLOYEE;

alter table PARKINGSPACE
   drop constraint FK_PARKINGS_EMPPLOYEE_EMPLOYEE;

alter table PASSENGER
   drop constraint FK_PASSENGE_PERSONP_PERSON;

alter table PERSON
   drop constraint FK_PERSON_PLACE_PLACE;

alter table PILOT
   drop constraint FK_PILOT_EMPLOYEED_EMPLOYEE;

alter table PILOTASSIGNMENT
   drop constraint FK_PILOTASS_FLIGHTASS_FLIGHTSE;

alter table PILOTASSIGNMENT
   drop constraint FK_PILOTASS_PILOTFLIG_PILOT;

alter table PLACE
   drop constraint FK_PLACE_PLACE1_PLACE;

alter table PLACE
   drop constraint FK_PLACE_PLACETYPE_PLACETYP;

drop index AIRLINEOPERATOR_FK;

drop table AIRLINE cascade constraints;

drop index AIRPORTLOCATION_FK;

drop table AIRPORT cascade constraints;

drop index PLACEAIRPORT_FK;

drop index AIRPORTPLACE_FK;

drop table AIRPORTSERVICE cascade constraints;

drop index AIRPORTSERVICETYPE_FK;

drop table AIRPORTTYPE cascade constraints;

drop index EMPLOYMENT_FK;

drop index EMPPLOYEEPARKINGSPACE2_FK;

drop index PERSONE_FK;

drop table EMPLOYEE cascade constraints;

drop index FLIGTHT_FK;

drop table FLIGHT cascade constraints;

drop index FLIGHTCONNECTION_FK;

drop index FLIGHTCONNECTION2_FK;

drop table FLIGHTCONNECTION cascade constraints;

drop index FLIGHTSEGMENT_FK;

drop index ORIGIN_FK;

drop index DESTINATION_FK;

drop table FLIGHTSEGMENT cascade constraints;

drop index ASSISTANT_FK;

drop table GROUNDCREW cascade constraints;

drop index EMPPLOYEEPARKINGSPACE_FK;

drop table PARKINGSPACE cascade constraints;

drop index PERSONP_FK;

drop table PASSENGER cascade constraints;

drop index PLACE_FK;

drop table PERSON cascade constraints;

drop index EMPLOYEED_FK;

drop table PILOT cascade constraints;

drop index FLIGHTASSIGNMENTPILOT_FK;

drop index PILOTFLIGHTASSIGNMENT_FK;

drop table PILOTASSIGNMENT cascade constraints;

drop index PLACE1_FK;

drop index PLACETYPE_FK;

drop table PLACE cascade constraints;

drop table PLACETYPE cascade constraints;

/*==============================================================*/
/* Table: AIRLINE                                               */
/*==============================================================*/
create table AIRLINE (
   AIRLINECODE          VARCHAR2(3)           not null,
   AIR_AIRLINECODE      VARCHAR2(3),
   AIRLINENAME          VARCHAR2(30)          not null,
   constraint PK_AIRLINE primary key (AIRLINECODE)
);

/*==============================================================*/
/* Index: AIRLINEOPERATOR_FK                                    */
/*==============================================================*/
create index AIRLINEOPERATOR_FK on AIRLINE (
   AIR_AIRLINECODE ASC
);

/*==============================================================*/
/* Table: AIRPORT                                               */
/*==============================================================*/
create table AIRPORT (
   AIRPORTCODE          VARCHAR2(10)          not null,
   IDPLACE              VARCHAR2(5),
   AIRPORTNAME          VARCHAR2(30)          not null,
   constraint PK_AIRPORT primary key (AIRPORTCODE)
);

/*==============================================================*/
/* Index: AIRPORTLOCATION_FK                                    */
/*==============================================================*/
create index AIRPORTLOCATION_FK on AIRPORT (
   IDPLACE ASC
);

/*==============================================================*/
/* Table: AIRPORTSERVICE                                        */
/*==============================================================*/
create table AIRPORTSERVICE (
   AIRPORTSERVICETK     VARCHAR2(10)          not null,
   AIRPORTCODE          VARCHAR2(10)          not null,
   IDPLACE              VARCHAR2(5)           not null,
   NEVERONSUNDAY        SMALLINT,
   constraint PK_AIRPORTSERVICE primary key (AIRPORTSERVICETK)
);

/*==============================================================*/
/* Index: AIRPORTPLACE_FK                                       */
/*==============================================================*/
create index AIRPORTPLACE_FK on AIRPORTSERVICE (
   AIRPORTCODE ASC
);

/*==============================================================*/
/* Index: PLACEAIRPORT_FK                                       */
/*==============================================================*/
create index PLACEAIRPORT_FK on AIRPORTSERVICE (
   IDPLACE ASC
);

/*==============================================================*/
/* Table: AIRPORTTYPE                                           */
/*==============================================================*/
create table AIRPORTTYPE (
   AIRPORTTYPE          VARCHAR2(30)          not null,
   AIRPORTSERVICETK     VARCHAR2(10)          not null,
   constraint PK_AIRPORTTYPE primary key (AIRPORTTYPE)
);

/*==============================================================*/
/* Index: AIRPORTSERVICETYPE_FK                                 */
/*==============================================================*/
create index AIRPORTSERVICETYPE_FK on AIRPORTTYPE (
   AIRPORTSERVICETK ASC
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE (
   AIRLINECODE          VARCHAR2(3)           not null,
   EMPLOYEENUMBER       VARCHAR2(10)          not null,
   IDPERSON             VARCHAR2(5)           not null,
   PARKINGSPACE         VARCHAR2(10),
   DATEHIRED            DATE                  not null,
   constraint PK_EMPLOYEE primary key (AIRLINECODE, EMPLOYEENUMBER)
);

/*==============================================================*/
/* Index: PERSONE_FK                                            */
/*==============================================================*/
create index PERSONE_FK on EMPLOYEE (
   IDPERSON ASC
);

/*==============================================================*/
/* Index: EMPPLOYEEPARKINGSPACE2_FK                             */
/*==============================================================*/
create index EMPPLOYEEPARKINGSPACE2_FK on EMPLOYEE (
   PARKINGSPACE ASC
);

/*==============================================================*/
/* Index: EMPLOYMENT_FK                                         */
/*==============================================================*/
create index EMPLOYMENT_FK on EMPLOYEE (
   AIRLINECODE ASC
);

/*==============================================================*/
/* Table: FLIGHT                                                */
/*==============================================================*/
create table FLIGHT (
   AIRLINECODE          VARCHAR2(3)           not null,
   FLIGHTNUMBER         VARCHAR2(10)          not null,
   constraint PK_FLIGHT primary key (AIRLINECODE, FLIGHTNUMBER)
);

/*==============================================================*/
/* Index: FLIGTHT_FK                                            */
/*==============================================================*/
create index FLIGTHT_FK on FLIGHT (
   AIRLINECODE ASC
);

/*==============================================================*/
/* Table: FLIGHTCONNECTION                                      */
/*==============================================================*/
create table FLIGHTCONNECTION (
   ARR_AIRLINECODE      VARCHAR2(3)           not null,
   ARR_FLIGHTNUMBER     VARCHAR2(10)          not null,
   FLI_ARR_AIRPORTCODE  VARCHAR2(10)          not null,
   DEP_AIRLINECODE      VARCHAR2(3)           not null,
   DEP_FLIGHTNUMBER     VARCHAR2(10)          not null,
   ARR_AIRPORTCODE      VARCHAR2(10)          not null,
   constraint PK_FLIGHTCONNECTION primary key (ARR_AIRLINECODE, ARR_FLIGHTNUMBER, FLI_ARR_AIRPORTCODE, DEP_AIRLINECODE, DEP_FLIGHTNUMBER, ARR_AIRPORTCODE)
);

/*==============================================================*/
/* Index: FLIGHTCONNECTION2_FK                                  */
/*==============================================================*/
create index FLIGHTCONNECTION2_FK on FLIGHTCONNECTION (
   DEP_AIRLINECODE ASC,
   DEP_FLIGHTNUMBER ASC,
   ARR_AIRPORTCODE ASC
);

/*==============================================================*/
/* Index: FLIGHTCONNECTION_FK                                   */
/*==============================================================*/
create index FLIGHTCONNECTION_FK on FLIGHTCONNECTION (
   ARR_AIRLINECODE ASC,
   ARR_FLIGHTNUMBER ASC,
   FLI_ARR_AIRPORTCODE ASC
);

/*==============================================================*/
/* Table: FLIGHTSEGMENT                                         */
/*==============================================================*/
create table FLIGHTSEGMENT (
   AIRLINECODE          VARCHAR2(3)           not null,
   FLIGHTNUMBER         VARCHAR2(10)          not null,
   ARR_AIRPORTCODE      VARCHAR2(10)          not null,
   DEP_AIRPORTCODE      VARCHAR2(10)          not null,
   constraint PK_FLIGHTSEGMENT primary key (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE)
);

/*==============================================================*/
/* Index: DESTINATION_FK                                        */
/*==============================================================*/
create index DESTINATION_FK on FLIGHTSEGMENT (
   ARR_AIRPORTCODE ASC
);

/*==============================================================*/
/* Index: ORIGIN_FK                                             */
/*==============================================================*/
create index ORIGIN_FK on FLIGHTSEGMENT (
   DEP_AIRPORTCODE ASC
);

/*==============================================================*/
/* Index: FLIGHTSEGMENT_FK                                      */
/*==============================================================*/
create index FLIGHTSEGMENT_FK on FLIGHTSEGMENT (
   AIRLINECODE ASC,
   FLIGHTNUMBER ASC
);

/*==============================================================*/
/* Table: GROUNDCREW                                            */
/*==============================================================*/
create table GROUNDCREW (
   CONSEC               VARCHAR2(3)           not null,
   AIRLINECODE          VARCHAR2(3),
   EMPLOYEENUMBER       VARCHAR2(10),
   CERTIFICATIONDATE    DATE                  not null,
   constraint PK_GROUNDCREW primary key (CONSEC)
);

/*==============================================================*/
/* Index: ASSISTANT_FK                                          */
/*==============================================================*/
create index ASSISTANT_FK on GROUNDCREW (
   AIRLINECODE ASC,
   EMPLOYEENUMBER ASC
);

/*==============================================================*/
/* Table: PARKINGSPACE                                          */
/*==============================================================*/
create table PARKINGSPACE (
   PARKINGSPACE         VARCHAR2(10)          not null,
   AIRLINECODE          VARCHAR2(3),
   EMPLOYEENUMBER       VARCHAR2(10),
   constraint PK_PARKINGSPACE primary key (PARKINGSPACE)
);

/*==============================================================*/
/* Index: EMPPLOYEEPARKINGSPACE_FK                              */
/*==============================================================*/
create index EMPPLOYEEPARKINGSPACE_FK on PARKINGSPACE (
   AIRLINECODE ASC,
   EMPLOYEENUMBER ASC
);

/*==============================================================*/
/* Table: PASSENGER                                             */
/*==============================================================*/
create table PASSENGER (
   IDPASSSANGER         VARCHAR2(5)           not null,
   IDPERSON             VARCHAR2(5)           not null,
   constraint PK_PASSENGER primary key (IDPASSSANGER)
);

/*==============================================================*/
/* Index: PERSONP_FK                                            */
/*==============================================================*/
create index PERSONP_FK on PASSENGER (
   IDPERSON ASC
);

/*==============================================================*/
/* Table: PERSON                                                */
/*==============================================================*/
create table PERSON (
   IDPERSON             VARCHAR2(5)           not null,
   IDPLACE              VARCHAR2(5),
   NAME                 VARCHAR2(30)          not null,
   DOB                  VARCHAR2(30),
   constraint PK_PERSON primary key (IDPERSON)
);

/*==============================================================*/
/* Index: PLACE_FK                                              */
/*==============================================================*/
create index PLACE_FK on PERSON (
   IDPLACE ASC
);

/*==============================================================*/
/* Table: PILOT                                                 */
/*==============================================================*/
create table PILOT (
   PILOTLICENSE         VARCHAR2(30)          not null,
   AIRLINECODE          VARCHAR2(3)           not null,
   EMPLOYEENUMBER       VARCHAR2(10)          not null,
   PILOTLICENSEEXP      DATE                  not null,
   constraint PK_PILOT primary key (PILOTLICENSE)
);

/*==============================================================*/
/* Index: EMPLOYEED_FK                                          */
/*==============================================================*/
create index EMPLOYEED_FK on PILOT (
   AIRLINECODE ASC,
   EMPLOYEENUMBER ASC
);

/*==============================================================*/
/* Table: PILOTASSIGNMENT                                       */
/*==============================================================*/
create table PILOTASSIGNMENT (
   AIRLINECODE          VARCHAR2(3)           not null,
   FLIGHTNUMBER         VARCHAR2(10)          not null,
   ARR_AIRPORTCODE      VARCHAR2(10)          not null,
   PILOTLICENSE         VARCHAR2(30)          not null,
   constraint PK_PILOTASSIGNMENT primary key (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE, PILOTLICENSE)
);

/*==============================================================*/
/* Index: PILOTFLIGHTASSIGNMENT_FK                              */
/*==============================================================*/
create index PILOTFLIGHTASSIGNMENT_FK on PILOTASSIGNMENT (
   PILOTLICENSE ASC
);

/*==============================================================*/
/* Index: FLIGHTASSIGNMENTPILOT_FK                              */
/*==============================================================*/
create index FLIGHTASSIGNMENTPILOT_FK on PILOTASSIGNMENT (
   AIRLINECODE ASC,
   FLIGHTNUMBER ASC,
   ARR_AIRPORTCODE ASC
);

/*==============================================================*/
/* Table: PLACE                                                 */
/*==============================================================*/
create table PLACE (
   IDPLACE              VARCHAR2(5)           not null,
   IDPLACETYPE          VARCHAR2(3),
   PLA_IDPLACE          VARCHAR2(5),
   PLACENAME            VARCHAR2(30)          not null,
   constraint PK_PLACE primary key (IDPLACE)
);

/*==============================================================*/
/* Index: PLACETYPE_FK                                          */
/*==============================================================*/
create index PLACETYPE_FK on PLACE (
   IDPLACETYPE ASC
);

/*==============================================================*/
/* Index: PLACE1_FK                                             */
/*==============================================================*/
create index PLACE1_FK on PLACE (
   PLA_IDPLACE ASC
);

/*==============================================================*/
/* Table: PLACETYPE                                             */
/*==============================================================*/
create table PLACETYPE (
   IDPLACETYPE          VARCHAR2(3)           not null,
   DESPLACETYPE         VARCHAR2(30)          not null,
   constraint PK_PLACETYPE primary key (IDPLACETYPE)
);

alter table AIRLINE
   add constraint FK_AIRLINE_AIRLINEOP_AIRLINE foreign key (AIR_AIRLINECODE)
      references AIRLINE (AIRLINECODE);

alter table AIRPORT
   add constraint FK_AIRPORT_AIRPORTLO_PLACE foreign key (IDPLACE)
      references PLACE (IDPLACE);

alter table AIRPORTSERVICE
   add constraint FK_AIRPORTS_AIRPORTPL_AIRPORT foreign key (AIRPORTCODE)
      references AIRPORT (AIRPORTCODE);

alter table AIRPORTSERVICE
   add constraint FK_AIRPORTS_PLACEAIRP_PLACE foreign key (IDPLACE)
      references PLACE (IDPLACE);

alter table AIRPORTTYPE
   add constraint FK_AIRPORTT_AIRPORTSE_AIRPORTS foreign key (AIRPORTSERVICETK)
      references AIRPORTSERVICE (AIRPORTSERVICETK);

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_EMPLOYMEN_AIRLINE foreign key (AIRLINECODE)
      references AIRLINE (AIRLINECODE);

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_EMPPLOYEE_PARKINGS foreign key (PARKINGSPACE)
      references PARKINGSPACE (PARKINGSPACE);

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_PERSONE_PERSON foreign key (IDPERSON)
      references PERSON (IDPERSON);

alter table FLIGHT
   add constraint FK_FLIGHT_FLIGTHT_AIRLINE foreign key (AIRLINECODE)
      references AIRLINE (AIRLINECODE);

alter table FLIGHTCONNECTION
   add constraint FK_FLIGHTCO_IS_ARRIVI_FLIGHTSE foreign key (ARR_AIRLINECODE, ARR_FLIGHTNUMBER, FLI_ARR_AIRPORTCODE)
      references FLIGHTSEGMENT (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE);

alter table FLIGHTCONNECTION
   add constraint FK_FLIGHTCO_IS_DEPART_FLIGHTSE foreign key (DEP_AIRLINECODE, DEP_FLIGHTNUMBER, ARR_AIRPORTCODE)
      references FLIGHTSEGMENT (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE);

alter table FLIGHTSEGMENT
   add constraint FK_FLIGHTSE_DESTINATI_AIRPORT foreign key (ARR_AIRPORTCODE)
      references AIRPORT (AIRPORTCODE);

alter table FLIGHTSEGMENT
   add constraint FK_FLIGHTSE_FLIGHTSEG_FLIGHT foreign key (AIRLINECODE, FLIGHTNUMBER)
      references FLIGHT (AIRLINECODE, FLIGHTNUMBER);

alter table FLIGHTSEGMENT
   add constraint FK_FLIGHTSE_ORIGIN_AIRPORT foreign key (DEP_AIRPORTCODE)
      references AIRPORT (AIRPORTCODE);

alter table GROUNDCREW
   add constraint FK_GROUNDCR_ASSISTANT_EMPLOYEE foreign key (AIRLINECODE, EMPLOYEENUMBER)
      references EMPLOYEE (AIRLINECODE, EMPLOYEENUMBER);

alter table PARKINGSPACE
   add constraint FK_PARKINGS_EMPPLOYEE_EMPLOYEE foreign key (AIRLINECODE, EMPLOYEENUMBER)
      references EMPLOYEE (AIRLINECODE, EMPLOYEENUMBER);

alter table PASSENGER
   add constraint FK_PASSENGE_PERSONP_PERSON foreign key (IDPERSON)
      references PERSON (IDPERSON);

alter table PERSON
   add constraint FK_PERSON_PLACE_PLACE foreign key (IDPLACE)
      references PLACE (IDPLACE);

alter table PILOT
   add constraint FK_PILOT_EMPLOYEED_EMPLOYEE foreign key (AIRLINECODE, EMPLOYEENUMBER)
      references EMPLOYEE (AIRLINECODE, EMPLOYEENUMBER);

alter table PILOTASSIGNMENT
   add constraint FK_PILOTASS_FLIGHTASS_FLIGHTSE foreign key (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE)
      references FLIGHTSEGMENT (AIRLINECODE, FLIGHTNUMBER, ARR_AIRPORTCODE);

alter table PILOTASSIGNMENT
   add constraint FK_PILOTASS_PILOTFLIG_PILOT foreign key (PILOTLICENSE)
      references PILOT (PILOTLICENSE);

alter table PLACE
   add constraint FK_PLACE_PLACE1_PLACE foreign key (PLA_IDPLACE)
      references PLACE (IDPLACE);

alter table PLACE
   add constraint FK_PLACE_PLACETYPE_PLACETYP foreign key (IDPLACETYPE)
      references PLACETYPE (IDPLACETYPE);

