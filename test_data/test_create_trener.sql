DO $$
    declare ids int;

    BEGIN

        call trening_dm.createuser('das'::varchar,
                                   'dassa'::varchar,
                                   'dasasd'::varchar,
                                   'cxgы2ы2'::varchar,
                                   ids
             );
        RAISE NOTICE 'ids: %' ,ids;


         select * from trening_dm.profile;
         select * from trening_dm.trener_user;

        call trening_dm.Create_Programm(
                1, 'test',
                'dassdasasddas', '',
             0
             );



        call trening_dm.Create_Programm(
                1, 'Сисный кач2',
                'dassdasasddas', '',
                0
             );

        call trening_dm.Create_Programm(
                1, '4343 Сисный кач244',
                'dassdasasddas', '',
             0
             );
 call trening_dm.CreateProgramm(
                1, '3232 Сисный кач3122',
                'dassdasasddas', '',
             0
             );

        call trening_dm.CreateProgramm(
                13, '24 Сисный кач 312',
                'dassdasasddas', '',
             0
             );
 call trening_dm.CreateProgramm(
                13, '34 Сисный кач12',
                'dassdasasddas', '',
             0
             );

        call trening_dm.CreateProgramm(
                13, ' 21 Сисный кач22',
                'dassdasasddas', '',
             0
             );

        select * from trening_dm.programm;
        select * from trening_dm.programm_fo_trener;
        select * from trening_dm.exercise;

        select * from trening_dm.Get_Programm(_limit := 100, _offset := 0 );

        call trening_dm.AddExerciseInProgramm(1,1);

        select * from trening_dm.exercise_of_programm;

        call trening_dm.CreateExercise(
                'Жим на горизонтальной'
             );

        call trening_dm.Add_Approach(
                100,
                1,
             '90',
             1,
             6
             );

        select trening_dm.get_exercise(6);

        select * from trening_dm.approach;

        select * from trening_dm.subscriber;

        select * from trening_dm.profile;

        select * from trening_dm.programm_fo_trener;

        SELECT * FROM trening_dm.Add_Current_Trening_For_User(1, 1);

        select * from trening_dm.Get_User_Programm(1);

        select * from trening_dm.Get_User_Trenings(1);

        SELECT * FROM trening_dm.delete_programm_user(_programm_id := 3, _user_id := 1);

    END;
$$;

DO $$
    declare ids int;

    BEGIN

        call trening_dm.createuser('das'::varchar,
                                   'dassa'::varchar,
                                   'dasasd'::varchar,
                                   'cxgы2ы2'::varchar,
                                   ids
             );
        RAISE NOTICE 'ids: %' ,ids;
    END;
$$;