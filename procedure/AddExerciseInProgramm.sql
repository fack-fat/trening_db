CREATE PROCEDURE trening_dm.AddExerciseInProgramm(
    _programm_id int,
    _exercise_id int
)
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO trening_dm.exercise_of_programm(
            programm_id, exercise_id
        )
        VALUES (_programm_id, _exercise_id);
    end;
$$;