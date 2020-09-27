-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-09-26 20:45:02.703

-- tables
-- Table: Aircraft_Models
CREATE TABLE Aircraft_Models (
    id_model serial NOT NULL,
    model varchar(50) NOT NULL,
    Manufacturer_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT Aircraft_Models_pk PRIMARY KEY (id_model)
);

-- Table: Aircraft_Types
CREATE TABLE Aircraft_Types (
    id_type serial NOT NULL,
    description varchar(100) NOT NULL,
    CONSTRAINT Aircraft_Types_pk PRIMARY KEY (id_type)
);

-- Table: Aircrafts
CREATE TABLE Aircrafts (
    N_Number varchar(6) NOT NULL,
    Companys_id BIGINT UNSIGNED NULL,
    Aircraft_Models_id BIGINT UNSIGNED NULL,
    Engine_Types_id BIGINT UNSIGNED NULL,
    Aircraft_Types_id BIGINT UNSIGNED NULL,
    year int NULL,
    CONSTRAINT Aircrafts_pk PRIMARY KEY (N_Number)
);

-- Table: Airports
CREATE TABLE Airports (
    cod char(3) NOT NULL,
    Cities_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT Airports_pk PRIMARY KEY (cod)
);

-- Table: Cities
CREATE TABLE Cities (
    id_city serial NOT NULL,
    name varchar(100) NOT NULL,
    States_abrev char(2) NOT NULL,
    CONSTRAINT Cities_pk PRIMARY KEY (id_city)
);

-- Table: Companies
CREATE TABLE Companies (
    id_company serial NOT NULL,
    name varchar(100) NOT NULL,
    Cities_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY (id_company)
);

-- Table: Delay_Causes
CREATE TABLE Delay_Causes (
    id_delay serial NOT NULL,
    cause varchar(50) NOT NULL,
    CONSTRAINT Delay_Causes_pk PRIMARY KEY (id_delay)
);

-- Table: Engine_Types
CREATE TABLE Engine_Types (
    id_type serial NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT Engine_Types_pk PRIMARY KEY (id_type)
);

-- Table: Flights
CREATE TABLE Flights (
    id_flight serial NOT NULL,
    Aircrafts_id varchar(6) NULL,
    Route_id BIGINT UNSIGNED NULL,
    Date date NULL,
    Arrival_time time NULL,
    Departure_time time NULL,
    Delay_time int NULL,
    Delay_Causes_id BIGINT UNSIGNED NULL,
    CONSTRAINT Flights_pk PRIMARY KEY (id_flight)
);

-- Table: Manufacturer
CREATE TABLE Manufacturer (
    id_manufacturer serial NOT NULL,
    Name varchar(100) NOT NULL,
    CONSTRAINT Manufacturer_pk PRIMARY KEY (id_manufacturer)
);

-- Table: Routes
CREATE TABLE Routes (
    id_route serial NOT NULL,
    Departure_Airport_id char(3) NOT NULL,
    Arrival_Airport_id char(3) NOT NULL,
    CONSTRAINT Routes_pk PRIMARY KEY (id_route)
);

-- Table: States
CREATE TABLE States (
    abreviation char(2) NOT NULL,
    name varchar(50) NOT NULL,
    CONSTRAINT States_pk PRIMARY KEY (abreviation)
);

-- foreign keys
-- Reference: Aircraft_Models_Manufacturer (table: Aircraft_Models)
ALTER TABLE Aircraft_Models ADD CONSTRAINT Aircraft_Models_Manufacturer FOREIGN KEY Aircraft_Models_Manufacturer (Manufacturer_id)
    REFERENCES Manufacturer (id_manufacturer);

-- Reference: Aircrafts_Aircraft_Models (table: Aircrafts)
ALTER TABLE Aircrafts ADD CONSTRAINT Aircrafts_Aircraft_Models FOREIGN KEY Aircrafts_Aircraft_Models (Aircraft_Models_id)
    REFERENCES Aircraft_Models (id_model);

-- Reference: Aircrafts_Aircraft_Types (table: Aircrafts)
ALTER TABLE Aircrafts ADD CONSTRAINT Aircrafts_Aircraft_Types FOREIGN KEY Aircrafts_Aircraft_Types (Aircraft_Types_id)
    REFERENCES Aircraft_Types (id_type);

-- Reference: Aircrafts_Companys (table: Aircrafts)
ALTER TABLE Aircrafts ADD CONSTRAINT Aircrafts_Companys FOREIGN KEY Aircrafts_Companys (Companys_id)
    REFERENCES Companies (id_company);

-- Reference: Aircrafts_Engine_Types (table: Aircrafts)
ALTER TABLE Aircrafts ADD CONSTRAINT Aircrafts_Engine_Types FOREIGN KEY Aircrafts_Engine_Types (Engine_Types_id)
    REFERENCES Engine_Types (id_type);

-- Reference: Airports_Citys (table: Airports)
ALTER TABLE Airports ADD CONSTRAINT Airports_Citys FOREIGN KEY Airports_Citys (Cities_id)
    REFERENCES Cities (id_city);

-- Reference: Arrival_Airport (table: Routes)
ALTER TABLE Routes ADD CONSTRAINT Arrival_Airport FOREIGN KEY Arrival_Airport (Arrival_Airport_id)
    REFERENCES Airports (cod);

-- Reference: Cities_States (table: Cities)
ALTER TABLE Cities ADD CONSTRAINT Cities_States FOREIGN KEY Cities_States (States_abrev)
    REFERENCES States (abreviation);

-- Reference: Companies_Cities (table: Companies)
ALTER TABLE Companies ADD CONSTRAINT Companies_Cities FOREIGN KEY Companies_Cities (Cities_id)
    REFERENCES Cities (id_city);

-- Reference: Departure_Airport (table: Routes)
ALTER TABLE Routes ADD CONSTRAINT Departure_Airport FOREIGN KEY Departure_Airport (Departure_Airport_id)
    REFERENCES Airports (cod);

-- Reference: Flights_Aircrafts (table: Flights)
ALTER TABLE Flights ADD CONSTRAINT Flights_Aircrafts FOREIGN KEY Flights_Aircrafts (Aircrafts_id)
    REFERENCES Aircrafts (N_Number);

-- Reference: Flights_Delay_Causes (table: Flights)
ALTER TABLE Flights ADD CONSTRAINT Flights_Delay_Causes FOREIGN KEY Flights_Delay_Causes (Delay_Causes_id)
    REFERENCES Delay_Causes (id_delay);

-- Reference: Flights_Routes (table: Flights)
ALTER TABLE Flights ADD CONSTRAINT Flights_Routes FOREIGN KEY Flights_Routes (Route_id)
    REFERENCES Routes (id_route);

-- End of file.

