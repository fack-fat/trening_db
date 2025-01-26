CREATE OR REPLACE FUNCTION GetRaiting(
    id_trening int
)
RETURNS FLOAT
LANGUAGE plpgsql
AS $$
BEGIN
        return (
            select round(avg(r.rating)::numeric, 2)
            from trening_dm.raiting r
            where r.trening_id = id_trening
        );
END
$$

