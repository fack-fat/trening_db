CREATE FUNCTION trening_dm.Get_User_Trenings(
    _user_id INT
)
    RETURNS TABLE (
                      id int,
                      title varchar,
                      description text,
                      image varchar,
                      exercise json
                  )
    LANGUAGE plpgsql
AS $$
BEGIN
     RETURN QUERY
        SELECT p.id,
               p.title,
               p.description,
               p.image,
               (SELECT trening_dm.Get_Exercise(p.id))::json AS exercise
        FROM trening_dm.programm p
        WHERE p.user_id = _user_id AND p.deleted = FALSE;
END;
$$