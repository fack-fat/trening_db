CREATE FUNCTION trening_dm.Delete_Programm_User(
    _user_id INT,
    _programm_id INT
)
    RETURNS TABLE (
                      id int,
                      title varchar,
                      description text,
                      image varchar,
                      exercise json
                  )
    LANGUAGE plpgsql
AS
$$
    BEGIN


            UPDATE trening_dm.programm p
            SET deleted = TRUE
            WHERE p.id = _programm_id AND p.user_id = _user_id;

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