class IngredientMeasurement < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measurement
end
