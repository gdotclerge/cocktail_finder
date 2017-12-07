class CreateUsersUserdrinksDrinksDrinkingredientsIngredientsTable < ActiveRecord::Migration[5.1]
  def change

    create_table :drinks do |t|
      t.string :name
      t.string :recipe
    end

    create_table :measurements do |t|
      t.integer :drink_id
      t.integer :ingredient_id
      t.string :amount
    end

    create_table :ingredients do |t|
      t.string :name
    end

  end
end
