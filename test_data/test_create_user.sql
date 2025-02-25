DO $$
    declare ids int;

    BEGIN

        CALL trening_dm.createuser(
                'john.doe',
                'secret123',
                'john.doe@example.com',
                'John Doe',
                ids
             );

        RAISE NOTICE 'ids: %' ,ids;

    END;
$$;

select * from trening_dm.profile;