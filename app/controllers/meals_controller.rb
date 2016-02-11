class MealsController < ApplicationController

def index
    @limitless = params[:limitless]
    lim = @limitless ? nil : 100
    @meals = Meal.order(created_at: :desc).limit(lim)
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
