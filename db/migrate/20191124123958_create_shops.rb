class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.references :meal_plan, foreign_key: true

      t.timestamps
    end
  end
end
