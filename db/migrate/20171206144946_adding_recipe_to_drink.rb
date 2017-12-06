class AddingRecipeToDrink < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :recipe, :string
  end
end
