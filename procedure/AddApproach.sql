CREATE PROCEDURE trening_dm.Add_Approach(
    _weigth FLOAT,
    _repeat INT,
    _rest INT,
    _exercise_id INT
)
LANGUAGE plpgsql
AS
$$
    DECLARE
        _approach_id int;
    BEGIN

            INSERT INTO trening_dm.approach(
                 weigth, repeat, rest
            ) VALUES (_weigth, _repeat, _rest)
            RETURNING id INTO _approach_id;

            INSERT INTO trening_dm.exercise_of_approach(
                approach_id, exercise_id
            ) VALUES (_approach_id, _exercise_id);

    END;
$$;