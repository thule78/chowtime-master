class DeliveriesController < ApplicationController
  def show
    @deliveries = DeliveryPolicy.find(params[:id])
    authorize @delivery
  end

  def new
    @delivery = Delivery.new
    authorize @delivery
  end

  def create
    @delivery = Delivery.new(delivery_params)
    authorize @delivery
    @delivery.user = current_user
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @delivery.meal_plan = @meal_plan

    if @delivery.save
      redirect_to  edit_meal_plan_path(@meal_plan)
    else
      render :new, alert: 'Invalid information.'
    end
  end

  def update
    @meal = Delivery.find(params[:id])
    authorize @delivery

    redirect_to meal_plan_meal_path(@meal.meal_plan, @meal)
  end
  private

  def delivery_params
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:delivery).permit(:address, :note, :user)
  end
end
