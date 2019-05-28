require "pg"
require "faker"
require "pry"

TITLES = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"
]

comments = []
25.times do
  comments <<  Faker::ChuckNorris.fact
end



def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

db_connection  do |conn|
  TITLES.each do |recipe_title|
    conn.exec_params("INSERT INTO recipes (title) VALUES ($1)", [recipe_title])
  end

  recipe_id_array = conn.exec("SELECT id FROM recipes").to_a
  comments.each do |comment|
    recipe_index = rand(recipe_id_array.length - 1)
    conn.exec_params("INSERT INTO comments (title, recipe_id) VALUES ($1, $2)",
    [comment, recipe_id_array[recipe_index]["id"]])
  end
end
