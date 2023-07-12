/* Database schema to keep the structure of entire database. */

-- day 2 ADD species 
 ALTER TABLE animals ADD species varchar(100);

-- Day 3 Add new TABLEs

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);

-- Create a table named species
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  PRIMARY KEY(id)
);

-- delete species column from animals table
CREATE TABLE animals (
  id int primary key GENERATED ALWAYS AS IDENTITY ,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
  );


ALTER TABLE animals
DROP COLUMN species; 

-- Add column species_id which is a foreign key referencing species
ALTER TABLE animals
ADD species_id int;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id); 

