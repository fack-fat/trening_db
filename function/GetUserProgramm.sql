CREATE FUNCTION trening_dm.Get_User_Programm(
    _user_id INT
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
        SELECT DISTINCT ON(tp.id) tp.id,
               tp.title,
               tp.description,
               tp.image,
               prof.last_name,
               prof.first_name,
               (SELECT trening_dm.Get_Exercise(tp.id))::json AS exercise
        FROM trening_dm.subscriber s
                 INNER JOIN trening_dm.programm tp
                            ON s.programm_id = tp.id
                 INNER JOIN trening_dm.profile prof
                            ON tp.user_id = prof.id
        WHERE s.user_id = _user_id;
END;
$$;