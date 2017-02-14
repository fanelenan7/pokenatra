DROP TABLE IF EXISTS pokemons;

create table pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  poke_type VARCHAR,
  cp INTEGER,
  img_url VARCHAR
);
