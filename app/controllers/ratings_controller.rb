class RatingsController < ApplicationController

def index
    @ratings = Rating.order("updated_at desc").all
    if user_signed_in?
        @user_ratings = current_user.ratings.order("updated_at desc").all
    end
end

def new
    if user_signed_in?
        @rating = Rating.new
        rating_ids = Rating.where(user_id: current_user.id).select :shop_id
        @shops = Shop.where.not(id: rating_ids)
        @current_shop_id = params[:shop_id] || ''
    end
end

def create
    @rating = Rating.new(rating_params)
    if @rating.save
        redirect_to @rating
    else
        render "new"
    end
end

def rating_params
    params.require(:rating).permit(:user_id, :shop_id, :comment, :rating)
end

def edit
    if user_signed_in?
        @rating = Rating.find(params[:id])
    end
end

def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes(rating_params)
        redirect_to @rating
    else
        render "edit"
    end
end

def show
    @rating = Rating.find(params[:id])
end

end
