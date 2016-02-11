class ShopsController < ApplicationController

def index
    @shops = Shop.all
end

def new
    if user_signed_in?
        @shop = Shop.new
    end
end

def create
    @shop = Shop.new(shop_params)
    if @shop.save
        redirect_to @shop
    else
        render "new"
    end
end

def shop_params
    params.require(:shop).permit(:user_id, :name, :address, :phone, :office_id)
end

def edit
    @shop = Shop.find(params[:id])
end

def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
        redirect_to @shop
    else
        render "edit"
    end
end

def show
    @shop = Shop.find(params[:id])
end

end
