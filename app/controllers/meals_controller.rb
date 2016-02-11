class MealsController < ApplicationController

def index
    unless user_signed_in?
        @meals = Meal.all
    else
        @meals = current_user.meals
    end
    @recent_meals = @meals.order(created_at: :desc).last(10)
end

def new
    if user_signed_in?
        @meal = Meal.new
    end
end

def create
    @meal = Meal.new(meal_params)
    if @meal.save
        redirect_to action: "index"
    else
        render "new"
    end
end

def meal_params
    params.require(:meal).permit(:order, :price, :rating, :shop_id, :description, :user_id)
end

def edit
    if user_signed_in?
        @meal = Meal.find(params[:id])
    end
end

def update
    @meal = Meal.find(params[:id])
    if @meal.update_attributes(meal_params)
        redirect_to action: "index"
    else
        render "edit"
    end
end

end
