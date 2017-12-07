require 'rest-client'
require 'json'
require 'pry'

alchoholic_hash = JSON.parse(RestClient.get('http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'))

iddrink_array = alchoholic_hash["drinks"].map {
  |drink_hash|
  drink_hash["idDrink"]
}

iddrink_url_array = iddrink_array.map {
  |iddrink|
  "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{iddrink}"
}

drink_hash_array = iddrink_url_array.map {
  |url|
  JSON.parse(RestClient.get("#{url}"))
}.map {
  |drink_hash|
  drink_hash["drinks"][0]
}

instruction_array = drink_hash_array.map {
  |drink|

}

# binding.pry

drink_hash_array.each do
  |drink|
  new_drink = Drink.create(name: drink["strDrink"])
  i = 1
  while i <= 15
    if drink["strIngredient#{i}"] == "" || drink["strIngredient#{i}"] == " " || drink["strIngredient#{i}"] == nil
      i += 1
    else
      if Ingredient.exists?(name: drink["strIngredient#{i}"])
        new_drink.ingredients << Ingredient.find_by(name: drink["strIngredient#{i}"])
        new_ingredient = Ingredient.find_by(name: drink["strIngredient#{i}"])
      else
      new_ingredient = Ingredient.create(name: drink["strIngredient#{i}"])
      new_drink.ingredients << new_ingredient
      end
      new_amount = Measurement.find_by(drink_id: new_drink.id, ingredient_id: new_ingredient.id)
      new_amount.amount = drink["strMeasure#{i}"]
      new_amount.save
      new_drink.recipe = drink["strInstructions"]
      new_drink.save
      i += 1
    end
  end
end
