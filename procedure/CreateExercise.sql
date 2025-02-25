CREATE PROCEDURE trening_dm.CreateExercise(
    IN _title VARCHAR(60),
    IN _avatar VARCHAR(1000) = '',
    IN _video VARCHAR(1000) = '',
    IN _descriptions TEXT = ''
)
LANGUAGE plpgsql
AS
$$
BEGIN
   INSERT INTO trening_dm.exercise(
        title,
        avatar,
        video,
        description
   ) VALUES (
             _title,
             _avatar,
             _video,
             _descriptions
             );
end
$$