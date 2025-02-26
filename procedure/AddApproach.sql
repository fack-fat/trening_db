CREATE PROCEDURE trening_dm.Add_Approach(
    _weigth FLOAT,
    _repeat INT,
    _rest INT,
    _exercise_id INT,
    _programm_id INT
)
LANGUAGE plpgsql
AS
$$
    DECLARE
        _approach_id int;

    BEGIN
        IF EXISTS(
            SELECT 1
            FROM trening_dm.exercise_of_programm ea
            WHERE ea.programm_id = _programm_id and ea.exercise_id = _exercise_id
        ) THEN

                INSERT INTO trening_dm.approach(
                    weigth, repeat, rest, exercise_id
                ) VALUES (_weigth, _repeat, _rest, _exercise_id)
                RETURNING id INTO _approach_id;

                INSERT INTO trening_dm.exercise_of_approach(
                    approach_id, exercise_id, programm_id
                ) VALUES (_approach_id, _exercise_id, _programm_id);

        ELSE
            RAISE NOTICE 'Упражнения в тренировке нет';
        END IF;

    END;
$$;