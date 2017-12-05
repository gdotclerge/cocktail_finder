class Drink < ActiveRecord::Base
  has_many :user_drinks
  has_many :users, through: :user_drinks
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients
end
