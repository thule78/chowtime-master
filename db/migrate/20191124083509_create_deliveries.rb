class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.text :address
      t.text :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
