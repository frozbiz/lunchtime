class ShopsController < ApplicationController

def index
  unless params[:tag].nil?
    logger.info("tag is " + params[:tag])
    @shops = Shop.tagged_with(params[:tag])
  else
    @shops = Shop.all
  end

  if user_signed_in?
    @shops = @shops.where(:office_id => current_user.office_id).order(distance_meters: :asc)
  else
    @shops = @shops.order(distance_meters: :asc)
  end

  @tag_cloud_tags = Shop.tag_counts.order(taggings_count: :desc)
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
    params.require(:shop).permit(:user_id, :name, :address, :phone, :office_id, :tag_list)
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
    @shop_addr = Rack::Utils.escape(@shop.address)
    @gmaps_api_key = "AIzaSyD9ZWdbd0MX0My0OjA4RmsCyj4OaE7pV4w"
end

end
