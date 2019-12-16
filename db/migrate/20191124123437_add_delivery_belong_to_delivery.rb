class AddDeliveryBelongToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :meal_plan, foreign_key: true
  end
end
