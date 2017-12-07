class Ingredient < ActiveRecord::Base
  has_many :measurements
  has_many :drinks, through: :measurements
end
