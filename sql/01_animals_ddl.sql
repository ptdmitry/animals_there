-- Создать базу данных “Друзья человека”

DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE human_friends;
USE human_friends;

-- Создать таблицы с иерархией из диаграммы в БД

CREATE TABLE animals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    animal_specie_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE animal_species (
    id INT PRIMARY KEY AUTO_INCREMENT,
    specie_id INT,
    animal_type_id INT NOT NULL,
    animal_specie VARCHAR(100) NOT NULL,
    FOREIGN KEY (specie_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE animal_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_id INT,
    animal_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (type_id) REFERENCES animal_species(specie_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE commands (
    id INT PRIMARY KEY AUTO_INCREMENT,
    command VARCHAR(100)
);

CREATE TABLE animal_commands (
    id INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT,
    command_id INT,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (command_id) REFERENCES commands(id) ON UPDATE CASCADE ON DELETE CASCADE
);