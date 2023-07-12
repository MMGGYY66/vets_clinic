/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id int primary key GENERATED ALWAYS AS IDENTITY ,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
  );

-- day 2 ADD species 
 ALTER TABLE animals ADD species varchar(100);

-- Day 3 Add new TABLEs

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);


