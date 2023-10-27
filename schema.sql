/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10,2),
    PRIMARY KEY(id)
);

-- Add new column from Day 2 Task

ALTER TABLE animals ADD COLUMN species TEXT;

--  Create table species
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
 )

--  Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add species_id
ALTER TABLE species ADD PRIMARY KEY (id);
ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

--  Add owner_id
ALTER TABLE owners ADD PRIMARY KEY (id);
ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);