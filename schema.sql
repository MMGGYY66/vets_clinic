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

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id int;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id); 

-- Day 4 project -- create vets table
CREATE TABLE vets (
  id int primary key GENERATED ALWAYS AS IDENTITY,
  name varchar(255),
  age integer,
  date_of_graduation date
);

-- Create a "join table" called specializations to handle a many-to-many relationship between the tables species and vets
CREATE TABLE specializations(
  specializations_id SERIAL PRIMARY KEY,
  species_id INTEGER REFERENCES species(id),
  vets_id INTEGER REFERENCES vets(id)
);

-- Create a join table called visits to handle a many-to-many relationship between the tables animals and vets
CREATE TABLE visits (
  animal_name VARCHAR(100),
  vets_id INTEGER REFERENCES vets(id),
  date_of_visit DATE
);




