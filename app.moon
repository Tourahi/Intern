lapis = require "lapis"

favorite_foods = {
  "food1",
  "food2",
  "food3"
}

favorite_foods_desc = {
  "pizza": "Wow pizza is the best! Definitely my favorite"
  "egg": "A classic breakfast, never leave home without"
  "ice cream": "Can't have a food list without a dessert"
}

class App extends lapis.Application
  [index: "/"]: =>
		@html ->
			h1 "Home"
			a href: @url_for("fav_foods"), "Check out my favorite foods"

  [fav_foods: "/foods"]: =>
    @html ->
      ul ->
        for food in ipairs favorite_foods
          li ->
            print food
            a href: @url_for("fav_foods", name: favorite_foods[food]), favorite_foods[food]

  [fav_foods_dec: "/foods/:name"]: =>
    food_desc = favorite_foods_desc[@params.name]
    unless food_desc
      print favorite_foods_desc[@params.name]
      return "Not found", status: 404
    @html ->
      h1 @params.name
      h2 "My thoughts on this food"
      p food_desc
