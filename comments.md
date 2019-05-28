## How many recipes are there in total?
  SELECT COUNT(id) FROM recipes;
## How many comments are there in total?
  SELECT COUNT(id) FROM comments;
## Add a new recipe titled Brussels Sprouts with Goat Cheese. Add    two comments to it.
  INSERT INTO recipes (title) VALUES ('Brussels Sprouts with Goat Cheese');

  INSERT INTO comments (recipe_id, title)                                                    
  VALUES (
    (SELECT id
      FROM recipes
      WHERE title = 'Brussels Sprouts with Goat Cheese'),
    'This is the first comment.'
  );

  INSERT INTO comments (recipe_id, title)                                                    
  VALUES (
    (SELECT id
      FROM recipes
      WHERE title = 'Brussels Sprouts with Goat Cheese'),
    'This is the second comment.'
  );

## How would you find out how many comments each of the recipes have? (Optional)
    
## What is the name of the recipe that is associated with a specific comment? (Optional)
