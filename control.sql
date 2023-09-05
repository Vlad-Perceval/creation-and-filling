--Создание таблиц
create table shops(
    id INTEGER  NOT NULL
        constraint shops_pk
            primary key autoincrement ,
    shop_name TEXT NOT NULL);
create table types(
    id INTEGER not null
        constraint types_pk
            primary key autoincrement ,
    type_name TEXT not null
);
create table gifs(
    id INTEGER not null
        constraint gifs_pk
            primary key autoincrement ,
    gif_name TEXT not null,
    id_type INTEGER not null
        constraint type_fk
            references types
            on update cascade on delete cascade
);
create table gifs_in_shops(
    id_gif INTEGER not null
        constraint gif_fk
            references gifs
            on update cascade on delete cascade,
    id_shop INTEGER not null
        constraint shop_fk
            references shops
            on update cascade on delete cascade,
    amount INTEGER not null ,
    price INTEGER not null
);
--Заполнение таблиц
INSERT INTO shops(shop_name) VALUES
    ('Самый лучший магазин'),
    ('Самый дешёвый магазин'),
    ('Распродажа'),
    ('Семейный'),
    ('Магнит'),
    ('Пятёрочка'),
    ('Смешные цены');
INSERT INTO types(type_name) VALUES
    ('Овощи'),
    ('Фрукты'),
    ('Игрушки'),
    ('Одежда'),
    ('Магниты'),
    ('Украшения'),
    ('Сертификат на косметику');
INSERT INTO gifs(gif_name,id_type) VALUES
    ('Груша',2),
    ('Яблоко',2),
    ('Морковь',1),
    ('Помидор',1),
    ('Мишка',3),
    ('Единорог',3),
    ('Юбка',4),
    ('Пижама',4),
    ('С городом',5),
    ('Кольцо',6),
    ('Веселый гном',3);
INSERT INTO gifs_in_shops(id_gif,id_shop,amount,price) VALUES
    (2,5,42,12),
    (10,3,3,12000),
    (9,4,21,300),
    (8,6,29,1200),
    (5,7,41,3000),
    (1,5,28,40),
    (1,6,19,13);
--Удаление магазинов где "Самый"
DELETE FROM shops
WHERE shop_name >='Самый';
--Вывести все записи из таблицы «Подарки в магазинах», в которых идентификатор магазина не меньше идентификатора подарка.
SELECT * FROM gifs_in_shops
Where id_shop >= id_gif;

SELECT * from shops
where id<10
order by id desc,shop_name;

SELECT * FROM gifs
where gifs.gif_name LIKE 'Веселый%';

select * from types
where types.type_name LIKE '%Сертифика%';
