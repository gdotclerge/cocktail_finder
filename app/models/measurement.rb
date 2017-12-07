class Measurement < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient
end
