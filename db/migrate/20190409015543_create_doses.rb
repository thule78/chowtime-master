class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.references :meal_plan, foreign_key: true
      t.float :value
      t.string :unit
      t.boolean :purchased, default: false
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
