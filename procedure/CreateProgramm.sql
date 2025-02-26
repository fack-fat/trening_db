CREATE OR REPLACE PROCEDURE trening_dm.Create_Programm(
    in _user_id INT,
    in _title VARCHAR(50),
    in _description TEXT,
    in _image VARCHAR(2000),
    in _price NUMERIC
)
    LANGUAGE plpgsql
AS $$
DECLARE
    _trener int;
    _programm_id int;
BEGIN
    -- Проверка входных данных
    IF _title IS NULL OR _title = '' THEN
        RAISE EXCEPTION 'Title cannot be empty.';
    END IF;

    IF _price IS NULL THEN
        RAISE EXCEPTION 'Price must be positive.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM trening_dm.profile WHERE id = _user_id) THEN
        RAISE EXCEPTION 'User does not exist: %', _user_id;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM trening_dm.trener_user WHERE user_id = _user_id) THEN
        RAISE EXCEPTION 'Trener does not exist for user: %', _user_id;
    END IF;

    SELECT tu.id
    INTO _trener
    FROM trening_dm.trener_user tu
    WHERE tu.user_id = _user_id;

    BEGIN
        INSERT INTO trening_dm.programm(
            title, description,
            image, price, cdate, user_id, trener_id
        )
        VALUES(
                  _title,
                  _description,
                  _image,
                  _price,
                  now()::timestamp,
                  _user_id,
                  _trener
              )
        RETURNING id INTO _programm_id;

        INSERT INTO trening_dm.programm_fo_trener(
            programm_id, trener_id, cdate
        )
        VALUES(
                  _programm_id,
                  _trener,
                  now()::timestamp
              );
    EXCEPTION
        WHEN others THEN
            RAISE EXCEPTION 'Error creating programm: %', SQLERRM;
    END;

END;
$$;