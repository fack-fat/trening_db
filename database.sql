

CREATE OR REPLACE FUNCTION Get_trening(
    id_trening int
)
RETURNS TABLE (
            Id int,
            Title varchar(60)

              )
AS $$
    DECLARE
        rating float;

    BEGIN

        with cte_trening_info AS (
            select * from trening_dm.trening_info ti
            where ti.trening_id = 1
        )


        with cte_approach as (
            select weigth, approach, trening_info_id from trening_dm.APPROACH a
            where a.trening_id in (1)
              and a.trening_info_id is not null
            group by trening_info_id, weigth, approach
        )
        select id = t.id from trening_dm.TRENING t
            where t.Id = id_trening;


        return query (
            select * from trening_dm.trening t
                              inner join trening_dm.raiting r
                                         on t.id = r.id
                              inner join trening_dm.trening_info ti
                                         on t.id = ti.id
                              inner join trening_dm.approach a
                                         on ti.id = a.trening_id
            where t.id = id_trening
            );

    END;
$$
LANGUAGE plpgsql;

DROP FUNCTION Get_trening;

select * from GetRaiting(1);


