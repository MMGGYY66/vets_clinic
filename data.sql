/* Populate database with sample data. */
INSERT INTO animals
  (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
  ('Agumon',
    '2020-02-03',
    0,
    true,
    10.23);


INSERT INTO animals
  (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
  ('Gabumon',
    '2018-11-15',
    2,
    true,
    8);


INSERT INTO animals
  (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
  ('Pikachu',
    '2021-01-07',
    1,
    false,
    15.04);


INSERT INTO animals
  (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
  ('Devimon',
    '2017-05-12',
    5,
    true,
    11);

-- Day 2 ADD new data

INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Agumon',
    '2020-02-03',
    0,
    true,
    10.23);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Gabumon',
    '2018-11-15',
    2,
    true,
    8);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Pikachu',
    '2021-01-07',
    1,
    false,
    15.04);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Devimon',
    '2017-05-12',
    5,
    true,
    11);

-- new records day 2

INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Charmander',
    '2020-02-08',
    0,
    false,
    -11);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Plantmon',
    '2020-11-15',
    2,
    true,
    -5.7);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Squirtle',
    '1993-04-02',
    3,
    false,
    -12.13);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Angemon',
    '2005-01-12',
    1,
    true,
    -45);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Boarmon',
    '2005-06-06',
    7,
    true,
    20.4);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Blossom',
    '1998-10-13',
    3,
    true,
    17);


INSERT INTO animals
  ( name, date_of_birth, escape_attempts, neutered, weight_kg )
VALUES
  ('Ditto',
    '2022-05-14',
    4,
    true,
    22);

-- Day 3 insert data into the owners table

INSERT INTO owners
  (full_name, age)
VALUES
  ('Sam Smith',
    34),
  ('Jennifer Orwell',
    19),
  ('Bob',
    45),
  ('Melody Pond',
    77),
  ('Dean Winchester',
    14),
  ('Jodie Whittaker',
    38);

-- Insert the data into the species table:

INSERT INTO species
  (name)
VALUES
  ('Pokemon'),
  ('Digimon');

-- Modify your inserted animals so it includes the species_id value:

UPDATE animals
SET species_id = CASE
                     WHEN name LIKE '%mon' THEN
                            ( SELECT id
FROM species
WHERE name = 'Digimon' )
                     ELSE
                            ( SELECT id
FROM species
WHERE name = 'Pokemon' )
                 END;

-- Modify your inserted animals to include owner information (owner_id):

UPDATE animals
SET owner_id = CASE
                   WHEN name = 'Agumon' THEN
                          ( SELECT id
FROM owners
WHERE full_name = 'Sam Smith' )
                   WHEN name IN ('Gabumon',
                                 'Pikachu') THEN
                          ( SELECT id
FROM owners
WHERE full_name = 'Jennifer Orwell' )
                   WHEN name IN ('Devimon',
                                 'Plantmon') THEN
                          ( SELECT id
FROM owners
WHERE full_name = 'Bob' )
                   WHEN name IN ('Charmander',
                                 'Squirtle',
                                 'Blossom') THEN
                          ( SELECT id
FROM owners
WHERE full_name = 'Melody Pond' )
                   WHEN name IN ('Angemon',
                                 'Boarmon') THEN
                          ( SELECT id
FROM owners
WHERE full_name = 'Dean Winchester' )
               END;

-- Day 4 --- Insert data for vets:

INSERT INTO vets
  (name, age, date_of_graduation)
VALUES
  ('William Tatcher',
    45,
    '2000-04-23'),
  ('Maisy Smith',
    26,
    '2019-01-17'),
  ('Stephanie Mendez',
    64,
    '1981-05-04'),
  ('Jack Harkness',
    38,
    '2008-06-08');

-- Insert these data for specialties
INSERT INTO specializations (vets_id, specialty) VALUES
  (1, 'Pokemon'),
  (3, 'Digimon'),
  (3, 'Pokemon'),
  (4, 'Digimon');
  
-- Insert these data for visits:
INSERT INTO visits (animal_name, vets_id, date_of_visit) VALUES
  ('Agumon', 1, '2020-05-24'),
  ('Agumon', 3, '2020-07-22'),
  ('Gabumon', 4, '2021-02-02'),
  ('Pikachu', 2, '2020-01-05'),
  ('Pikachu', 2, '2020-03-08'),
  ('Pikachu', 2, '2020-05-14'),
  ('Devimon', 3, '2021-05-04'),
  ('Charmander', 4, '2021-02-24'),
  ('Plantmon', 2, '2019-12-21'),
  ('Plantmon', 1, '2020-08-10'),
  ('Plantmon', 2, '2021-04-07'),
  ('Squirtle', 3, '2019-09-29'),
  ('Angemon', 4, '2020-10-03'),
  ('Angemon', 4, '2020-11-04'),
  ('Boarmon', 2, '2019-01-24'),
  ('Boarmon', 2, '2019-05-15'),
  ('Boarmon', 2, '2020-02-27'),
  ('Boarmon', 2, '2020-08-03'),
  ('Blossom', 3, '2020-05-24'),
  ('Blossom', 1, '2021-01-11');


  
