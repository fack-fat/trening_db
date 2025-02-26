CREATE FUNCTION trening_dm.Add_Current_Trening_For_User(
    _programm_id INT,
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
AS $$
BEGIN
    IF NOT EXISTS(
        SELECT 1
        FROM trening_dm.subscriber s
        WHERE s.programm_id = _programm_id AND s.user_id = _user_id
    ) THEN

        INSERT INTO trening_dm.subscriber(programm_id, user_id, cdate)
        VALUES (_programm_id, _user_id, NOW());

        RETURN QUERY SELECT * FROM trening_dm.get_user_programm(_user_id);
    ELSE
        RETURN QUERY SELECT * FROM trening_dm.get_user_programm(_user_id);
    END IF;
END;
$$