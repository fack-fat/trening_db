CREATE OR REPLACE FUNCTION trening_dm.Get_Exercise(
    in _programm_id int
)
RETURNS JSON
LANGUAGE plpgsql
AS $$
    DECLARE result JSON;
    BEGIN

        SELECT json_agg(row_to_json(t))
        INTO result
        FROM (SELECT te.id::int,
                     te.video::varchar,
                     te.avatar::varchar,
                     te.description::text,
                     te.title::varchar,
                     a.weigth::float,
                     a.repeat::int,
                     a.rest::int
              FROM trening_dm.exercise_of_programm ep
                       INNER JOIN trening_dm.exercise te
                                  ON te.id = ep.exercise_id
                       LEFT JOIN trening_dm.exercise_of_approach ea
                                 ON te.id = ea.exercise_id
                       LEFT JOIN trening_dm.approach a
                                 ON ea.approach_id = a.id
              WHERE ep.programm_id = _programm_id
        ) t;

        RETURN result;
    END
$$