CREATE DATABASE TRENINGS;
CREATE SCHEMA trening_dm;


CREATE TABLE IF NOT EXISTS trening_dm.Programm (
    Id SERIAL PRIMARY KEY,
    Title CHARACTER VARYING(50),
    Description TEXT,
    Image CHARACTER varying(200),
    Cdate DATE,
    Mdate DATE,
    Paid BOOLEAN DEFAULT FALSE,
    Price FLOAT,
    Trener_id INT REFERENCES TRENER_USER(Id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Subscriber (
    Programm_id INT REFERENCES Programm,
    User_id INT REFERENCES "user",
    Cdate DATE,
    Mdate DATE,
    PRIMARY KEY (User_id, Programm_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Exercise_of_Programm (
    programm_id INT REFERENCES Programm,
    exercise_id INT REFERENCES Exercise,
    PRIMARY KEY (programm_id, exercise_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Exercise(
    Id serial PRIMARY KEY,
    Title CHARACTER varying(60),
    Avatar CHARACTER VARYING(1000),
    Video CHARACTER VARYING(1000)
);

CREATE TABLE IF NOT EXISTS trening_dm.APPROACH (
    Id SERIAL PRIMARY KEY,
    Weigth FLOAT
);

CREATE TABLE IF NOT EXISTS trening_dm.Exercise_of_Approach (
    approach_id INT REFERENCES APPROACH,
    exercise_id INT REFERENCES Exercise,
    PRIMARY KEY (approach_id, exercise_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.USER (
    Id SERIAL PRIMARY KEY,
    First_name CHARACTER VARYING(50),
    Last_name CHARACTER VARYING(50),
    Password CHARACTER VARYING(100),
    Login CHARACTER VARYING(50),
    Trener_flag BOOLEAN DEFAULT FALSE,
    Cdate DATE,
    Mdate DATE
);


CREATE TABLE IF NOT EXISTS trening_dm.RAITING_Programm(
    Rating float,
    Programm_id INT REFERENCES trening_dm.Programm(Id) ON DELETE CASCADE,
    User_id int not null,
    FOREIGN KEY (User_id) REFERENCES trening_dm.USER(id),
    PRIMARY KEY (Programm_id)
);


CREATE TABLE IF NOT EXISTS trening_dm.TRENER_USER (
    Id SERIAL PRIMARY KEY,
    Checked BOOLEAN DEFAULT FALSE,
    User_iD INT NOT NULL,
    Trening_Id INT,
    Cdate DATE,
    Mdate DATE,
    FOREIGN KEY (User_iD) REFERENCES trening_dm.USER(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS trening_dm.Raiting_Trening (
    Rating float,
    Trener_id INT REFERENCES trening_dm.TRENER_USER ON DELETE CASCADE,
    User_id int not null,
    FOREIGN KEY (User_id) REFERENCES trening_dm.USER(id),
    PRIMARY KEY (Trener_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Student (
    User_id INT REFERENCES "user",
    Trener_id INT REFERENCES TRENER_USER,
    Paid BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (User_id, Trener_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Date_on_User (
    User_id INT REFERENCES "user" PRIMARY KEY,
    Weigth FLOAT,
    Age INT
);