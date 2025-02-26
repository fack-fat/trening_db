CREATE FUNCTION trening_dm.Get_Current_Trening(
    _programm_id INT
)
RETURNS TABLE (
                  id int,
                  title varchar,
                  description text,
                  image varchar,
                  first_name varchar,
                  last_name varchar,
                  exercise json
              )
LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN QUERY
            SELECT tp.id,
                   tp.title,
                   tp.description,
                   tp.image,
                   prof.last_name,
                   prof.first_name,
                   (SELECT trening_dm.Get_Exercise(tp.id))::json AS exercise
            FROM trening_dm.programm tp
            INNER JOIN trening_dm.profile prof
              ON tp.user_id = prof.id
            WHERE tp.id = _programm_id;
    END;
$$