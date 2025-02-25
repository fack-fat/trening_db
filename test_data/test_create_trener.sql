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

        call trening_dm.CreateProgramm(
                1, '65 Сисный кач 2235',
                'dassdasasddas', '',
             0
             );



        call trening_dm.CreateProgramm(
                13, 'Сисный кач2',
                'dassdasasddas', '',
                0
             );

        call trening_dm.CreateProgramm(
                13, '4343 Сисный кач244',
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

        call trening_dm.CreateExercise(
                'Жим на горизонтальной'
             );

        call trening_dm.Add_Approach(
                110,
                3,
             '90',
             1
             );

        select trening_dm.get_exercise(1);

        select * from trening_dm.approach;
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