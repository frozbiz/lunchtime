class MealsController < ApplicationController

def index
  @limitless = params[:limit] == 'none'
  lim = @limitless ? nil : (params[:limit] || 100)
  @meals = Meal.order(created_at: :desc).limit(lim)
  @total_meals = Meal.count
end

def show
  @meal = Meal.find(params[:id])
end

def new
    if user_signed_in?
        @meal = Meal.new
        @current_shop_id = params[:shop_id] || ''
    end
end

def create
    @meal = Meal.new(meal_params)
    if @meal.save
        redirect_to @meal
    else
        render "new"
    end
end

def meal_params
    params.require(:meal).permit(:order, :price, :shop_id, :description, :user_id)
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
