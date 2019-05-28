-- Define the structure of your database, here.
DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS comments;



CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  recipe_id SERIAL references recipes(id)
);
