CREATE OR REPLACE FUNCTION trening_dm.Get_Programm (
    in _limit int,
    in _offset int
)
    RETURNS TABLE (
                    id int,
                    title varchar,
                    description varchar,
                    image varchar,
                    price float,
                    first_name varchar,
                    last_name varchar,
                    exercise json
                  )
    LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
        WITH programm_trening AS (
            SELECT pt.trener_id,
                   pt.programm_id
            FROM trening_dm.programm_fo_trener pt
            ORDER BY pt.cdate
            LIMIT _limit
            OFFSET  _offset
        ),
             _user AS (
                 SELECT p2.id as id_user,
                        p2.first_name,
                        p2.last_name,
                        tu.id as id_trener
                 FROM trening_dm.trener_user tu
                          INNER JOIN programm_trening pt
                                     ON tu.id = pt.trener_id
                          INNER JOIN trening_dm.profile p2
                                     ON tu.user_id = p2.id
             )


        SELECT p.id::int,
               p.title::varchar,
               p.description::varchar,
               p.image::varchar,
               p.price,
               u.first_name::varchar,
               u.last_name::varchar,
               (select trening_dm.Get_Exercise(p.id))::json AS exercise
        FROM trening_dm.programm p
                INNER JOIN programm_trening pt
                            ON p.id = pt.programm_id
                INNER JOIN _user u
                            ON u.id_trener = pt.trener_id;

END
$$;
