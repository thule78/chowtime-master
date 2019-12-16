class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :meal_plan
  def delivery
    user = current_user[:id]
  end
end
