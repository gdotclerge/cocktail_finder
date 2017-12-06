class CreateMeasurementTable < ActiveRecord::Migration[5.1]

  def change
    create_table :ingredient_measurements do |t|
      t.integer :ingredient_id
      t.integer :measurement_id
    end
    create_table :measurements do |t|
      t.string :measurement
    end
  end

end
