class ShopsController < ApplicationController

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    authorize @shop
    @shop.user = current_user
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @shop.meal_plan = @meal_plan

    if @shop.save
      redirect_to meal_plans_show_path(@meal_plan)
    else
      render :new, alert: 'Invalid information.'
    end
  end

  def shop_params
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:shop).permit(:user)
  end
end
