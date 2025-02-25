CREATE OR REPLACE PROCEDURE trening_dm.CreateTrener(
    _user_id INT
)
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO trening_dm.trener_user(
            user_id,
            cdate
        )
        VALUES(
               _user_id,
               now()
              );

    END;
$$;