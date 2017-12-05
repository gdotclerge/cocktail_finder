class CreateUsersUserdrinksDrinksDrinkingredientsIngredientsTable < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :name
    end

    create_table :user_drinks do |t|
      t.integer :user_id
      t.integer :drink_id
    end

    create_table :drinks do |t|
      t.string :name
    end

    create_table :drink_ingredients do |t|
      t.integer :drink_id
      t.integer :ingredient_id
    end

    create_table :ingredients do |t|
      t.string :name
    end

  end
end
