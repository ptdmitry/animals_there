/* Удалить из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку */

USE human_friends;

DELETE FROM animals
WHERE animal_specie_id = (SELECT specie_id FROM animal_species
WHERE animal_specie = 'camels');

/* Объединить таблицы лошади и ослы в одну таблицу */

DROP TABLE IF EXISTS horses_and_donkeys;
CREATE TABLE horses_and_donkeys (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    animal_specie_id INT NOT NULL,
    animal_specie VARCHAR(100),
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

INSERT INTO horses_and_donkeys (animal_specie_id, animal_specie, name, date_of_birth)
SELECT s.specie_id, s.animal_specie, a.name, a.date_of_birth FROM animals a, animal_species s
WHERE a.animal_specie_id = s.specie_id
AND (s.animal_specie = 'horses' OR s.animal_specie = 'donkeys');

/* Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице */
                         
DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    animal_specie_id INT NOT NULL,
    animal_specie VARCHAR(100),
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    age_month INT
);

INSERT INTO young_animals (animal_specie_id, animal_specie, name, date_of_birth, age_month)
SELECT
    s.specie_id,
    s.animal_specie,
    a.name,
    a.date_of_birth,
    TIMESTAMPDIFF(MONTH, date_of_birth, now()) AS age_month
FROM animals a, animal_species s
WHERE a.animal_specie_id = s.specie_id
AND (TIMESTAMPDIFF(YEAR, date_of_birth, now()) > 1 AND TIMESTAMPDIFF(YEAR, date_of_birth, now()) <= 3);

/* Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам */

DROP TABLE IF EXISTS common_table;
CREATE TABLE common_table (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    animal_specie_id INT NOT NULL,
    animal_specie VARCHAR(100),
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    age_month INT
);

INSERT INTO common_table (animal_specie_id, animal_specie, name, date_of_birth, age_month)
SELECT
    a.animal_specie_id,
    s.animal_specie,
    a.name,
    a.date_of_birth,
    TIMESTAMPDIFF(MONTH, date_of_birth, now()) AS age_month
FROM animals a, animal_species s
WHERE a.animal_specie_id = s.specie_id
UNION ALL 
SELECT
    animal_specie_id,
    animal_specie,
    name,
    date_of_birth,
    TIMESTAMPDIFF(MONTH, date_of_birth, now()) AS age_month
FROM horses_and_donkeys
UNION ALL
SELECT
    animal_specie_id,
    animal_specie,
    name,
    date_of_birth,
    age_month
FROM young_animals;