CREATE TABLE IF NOT EXISTS trening_dm.Profile(
    Id SERIAL PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Password VARCHAR(100),
    Login VARCHAR(50) UNIQUE,
    Trener_flag BOOLEAN DEFAULT FALSE,
    Cdate TIMESTAMP,
    Mdate TIMESTAMP
);

CREATE INDEX ON trening_dm.Profile(Login, id, trener_flag);

CREATE TABLE IF NOT EXISTS trening_dm.TRENER_USER (
    Id SERIAL PRIMARY KEY,
    Checked BOOLEAN DEFAULT FALSE,
    User_iD INT NOT NULL,
    Trening_Id INT,
    Cdate TIMESTAMP,
    Mdate TIMESTAMP,
    FOREIGN KEY (User_iD) REFERENCES trening_dm.Profile(Id) ON DELETE CASCADE
);

CREATE INDEX ON trening_dm.TRENER_USER(id, user_id, trening_id);

CREATE TABLE IF NOT EXISTS trening_dm.Programm (
    Id SERIAL PRIMARY KEY,
    Title CHARACTER VARYING(50),
    Description TEXT,
    Image CHARACTER varying(2000) DEFAULT NULL,
    Cdate TIMESTAMP,
    Mdate TIMESTAMP,
    Paid BOOLEAN DEFAULT FALSE,
    Price FLOAT,
    Deleted BOOLEAN DEFAULT false,
    User_id INT REFERENCES trening_dm.Profile(id),
    Trener_id INT REFERENCES trening_dm.TRENER_USER(Id)
);


CREATE TABLE IF NOT EXISTS trening_dm.Programm_fo_Trener(
    Programm_id INT REFERENCES trening_dm.Programm,
    Trener_id INT REFERENCES trening_dm.TRENER_USER,
    Cdate TIMESTAMP,
    Mdate TIMESTAMP,
    PRIMARY KEY (Trener_id, Programm_id)
);

CREATE INDEX ON trening_dm.Programm_fo_Trener(Programm_id, Trener_id);


CREATE TABLE IF NOT EXISTS trening_dm.Subscriber (
    Programm_id INT REFERENCES trening_dm.Programm,
    User_id INT REFERENCES trening_dm.Profile,
    Cdate TIMESTAMP,
    Mdate TIMESTAMP,
    Active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (User_id, Programm_id)
);


CREATE TABLE IF NOT EXISTS trening_dm.Exercise(
    Id serial PRIMARY KEY,
    Title CHARACTER varying(60) UNIQUE,
    Avatar CHARACTER VARYING(1000),
    Video CHARACTER VARYING(1000),
    Description TEXT
);

CREATE TABLE IF NOT EXISTS trening_dm.Exercise_of_Programm (
    programm_id INT REFERENCES trening_dm.Programm,
    exercise_id INT REFERENCES trening_dm.Exercise,
    PRIMARY KEY (programm_id, exercise_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.APPROACH (
    Id SERIAL PRIMARY KEY,
    Weigth FLOAT,
    Repeat INT,
    Rest INT,
    Exercise_id INT,
    FOREIGN KEY (Exercise_id) REFERENCES trening_dm.Exercise
);


CREATE TABLE IF NOT EXISTS trening_dm.Exercise_of_Approach (
    approach_id INT REFERENCES trening_dm.APPROACH,
    exercise_id INT REFERENCES trening_dm.Exercise,
    programm_id INT REFERENCES trening_dm.Programm,
    PRIMARY KEY (approach_id, exercise_id, programm_id)
);


CREATE TABLE IF NOT EXISTS trening_dm.RAITING_Programm(
    Rating float,
    Programm_id INT REFERENCES trening_dm.Programm(Id) ON DELETE CASCADE,
    User_id int not null,
    FOREIGN KEY (User_id) REFERENCES trening_dm.Profile(id),
    PRIMARY KEY (Programm_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Raiting_Trening (
    Rating float,
    Trener_id INT REFERENCES trening_dm.TRENER_USER ON DELETE CASCADE,
    User_id int not null,
    FOREIGN KEY (User_id) REFERENCES trening_dm.Profile(id),
    PRIMARY KEY (Trener_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Student (
    User_id INT REFERENCES trening_dm.Profile,
    Trener_id INT REFERENCES trening_dm.TRENER_USER,
    Paid BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (User_id, Trener_id)
);

CREATE TABLE IF NOT EXISTS trening_dm.Date_on_User (
    User_id INT REFERENCES trening_dm.Profile PRIMARY KEY,
    Weigth FLOAT,
    Age INT
);

