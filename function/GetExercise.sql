create function trening_dm.get_exercise(_programm_id integer) returns json
    language plpgsql
as
$$
DECLARE
    exercise JSON;
BEGIN
    SELECT json_agg(
                   json_build_object(
                           'id', te.id,
                           'video', te.video,
                           'avatar', te.avatar,
                           'description', te.description,
                           'title', te.title,
                           'approaches', (
                               SELECT json_agg(
                                              json_build_object(
                                                      'weigth', a.weigth,
                                                      'repeat', a.repeat,
                                                      'rest', a.rest
                                              )
                                      )
                               FROM trening_dm.exercise_of_approach ea
                                        INNER JOIN trening_dm.approach a
                                                   ON ea.approach_id = a.id
                               WHERE ea.programm_id = _programm_id
                           )
                   )
           )
    INTO exercise
    FROM trening_dm.exercise_of_programm ep
             INNER JOIN trening_dm.exercise te
                        ON te.id = ep.exercise_id
    WHERE ep.programm_id = _programm_id;

    RETURN exercise;
END;
$$;


