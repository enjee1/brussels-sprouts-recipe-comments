DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS comments;

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  recipe_id SERIAL references recipes(id)
);



-- SELECT comments.recipe_id, recipes.title, comments.title
-- FROM recipes
-- INNER JOIN comments ON recipes.id=comments.recipe_id
-- ORDER BY comments.recipe_id;
