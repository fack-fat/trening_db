insert into trening_dm.TRENING(title, description, image) VALUES ('Качаем жопу', 'Качаем жопу через ноги', '');
insert into trening_dm.USER(name, lastname) values ('Пупкин', 'Залупкин');
insert into trening_dm.USER(name, lastname) values ('Пупкин1', 'Залупкин2');
insert into trening_dm.USER(name, lastname) values ('Пупкин2', 'Залупкин3');
insert into trening_dm.RAITING(rating, trening_id, User_id)  VALUES (4.5, 1, 1);
insert into trening_dm.RAITING(rating, trening_id, User_id)  VALUES (5, 1, 2);
insert into trening_dm.RAITING(rating, trening_id, User_id)  VALUES (5, 1, 3);
insert into trening_dm.TRENING_INFO(title, avatar, trening_id) VALUES ('Жим гантелей', '', 1);
insert into trening_dm.TRENING_INFO(title, avatar, trening_id) VALUES ('Жим ногами', '', 1);

insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 1, 60, 1);
insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 1, 70, 2);
insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 1, 80, 3);
insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 2, 60, 1);
insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 2, 70, 2);
insert into trening_dm.APPROACH(trening_id, Trening_Info_ID, weigth, approach) VALUES (1, 2, 80, 3);

