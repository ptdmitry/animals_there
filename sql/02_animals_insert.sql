/* Заполнить низкоуровневые таблицы именами(животных), командами,
 * которые они выполняют и датами рождения */
      
INSERT INTO animals (animal_specie_id, name, date_of_birth)
VALUES (1, 'Sharik', '2020.09.09'),
       (1, 'Zoya', '2018.11.28'),
       (2, 'Kuzya', '2012.03.03'),
       (2, 'Tihon', '2016.05.25'),
       (3, 'Petya', '2020.12.23'),
       (4, 'Gerkules', '2015.07.06'),
       (4, 'Vasya', '2016.10.14'),
       (5, 'Gavruysha', '2019.12.07'),
       (5, 'Kusaka', '2012.03.11'),
       (6, 'Tyson', '2020.09.07'),
       (6, 'Oskar', '2004.04.12');
       
INSERT INTO commands (command)
VALUES ('sit'),
       ('voice'),
       ('go'),
       ('eat'),
       ('stop'),
       ('wait'),
       ('jump');
      
INSERT INTO animal_commands (animal_id, command_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 4),
       (4, 7),
       (5, 4),
       (6, 4),
       (6, 3),
       (6, 5),
       (7, 4),
       (7, 3),
       (7, 5),
       (8, 3),
       (8, 5),
       (9, 3),
       (9, 5),
       (10, 3),
       (10, 5),
       (10, 6),
       (11, 3),
       (11, 5),
       (11, 6);
      
INSERT INTO animal_species (specie_id, animal_type_id, animal_specie)
VALUES (1, 1, 'dogs'),
       (2, 1, 'cats'),
       (3, 1, 'hamsters'),
       (4, 2, 'horses'),
       (5, 2, 'camels'),
       (6, 2, 'donkeys');
       
INSERT INTO animal_types (type_id, animal_type)
VALUES (1, 'pet_animal'),
       (2, 'pack_animal');