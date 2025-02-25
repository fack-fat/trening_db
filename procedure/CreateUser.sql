CREATE OR REPLACE PROCEDURE trening_dm.CreateUser(
    in _first_name varchar(50),
    in _last_name varchar(50),
    in _password varchar(100),
    in _login varchar(50),
    OUT ids INT
)
    LANGUAGE plpgsql
AS $$
BEGIN
    -- Проверка входных данных
    IF _first_name IS NULL OR _first_name = '' THEN
        RAISE EXCEPTION 'First name cannot be empty.';
    END IF;
    IF _last_name IS NULL OR _last_name = '' THEN
        RAISE EXCEPTION 'Last name cannot be empty.';
    END IF;
    IF _password IS NULL OR _password = '' THEN
        RAISE EXCEPTION 'Password cannot be empty.';
    END IF;
    IF _login IS NULL OR _login = '' THEN
        RAISE EXCEPTION 'Login cannot be empty.';
    END IF;

    BEGIN
        INSERT INTO trening_dm.profile(
            first_name, last_name, password, login, cdate
        )
        VALUES (
                   _first_name,
                   _last_name,
                   _password,
                   _login,
                   now()
               )
        returning id into ids;

        CALL trening_dm.createtrener(ids);
    EXCEPTION
        WHEN others THEN
            RAISE EXCEPTION 'Error inserting profile data: %', SQLERRM;
    END;

END;
$$;
