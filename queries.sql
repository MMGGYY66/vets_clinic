/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
	SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
	SELECT * FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
  
  -- List the name of all animals that are neutered and have less than 3 escape attempts.
	SELECT * FROM animals WHERE neutered=true AND escape_attempts<3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
	SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');

-- 5 - List name and escape attempts of animals that weigh more than 10.5kg
	SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;

-- 6 Find all animals that are neutered.
	SELECT * FROM animals WHERE neutered=true;
	
-- 7 Find all animals not named Gabumon.
	SELECT * FROM animals WHERE name !='Gabumon';

-- 8 Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
	SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- new Queries day 2
-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
start transaction;
savepoint B1;
UPDATE animals
SET species = 'unspecified';

-- Verify that the species column was updated.
select *
from animals;

start transaction;
ROLLBACK to B1;
commit;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
start transaction;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE'%mon';
commit;

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
start transaction;
UPDATE animals
SET species = 'pokemon'
WHERE species = '';
commit;

-- delete all records in the animals table, then roll back the transaction.
start transaction;
savepoint B3;
DELETE FROM animals;

start transaction;
ROLLBACK to B3;
commit;

-- Verify that the species column was updated.
select *
from animals;

-- Delete all animals born after Jan 1st, 2022.
start transaction;
savepoint B4;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
start transaction;
ROLLBACK to B4;
commit;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
start transaction;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
commit;

-- queries to answer the following questions:




