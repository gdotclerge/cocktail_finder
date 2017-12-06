class Ingredient < ActiveRecord::Base
  has_many :drink_ingredients
  has_many :drinks, through: :drink_ingredients
  has_many :ingredient_measurements
  has_many :measurements, through: :ingredient_measurements
end
