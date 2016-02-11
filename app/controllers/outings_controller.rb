class OutingsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @outing = Outing.new
  end

  def create
    Outing.create(outing_params)
    flash[:notice] = "Outing Created"
    redirect_to :back
  end

  def show
    @outing = Outing.find(params[:id])
    @user_is_member = not(@outing.users.find_by(:id => current_user.id).nil?)
    @global_ratings = Rating.where(:shop_id => @outing.shop.id)
    @user_rating = @global_ratings.find_by(:user_id => current_user.id)
    @shop_addr = Rack::Utils.escape(@outing.shop.address)
    @office_addr = Rack::Utils.escape(@outing.shop.office.address)
    @gmaps_api_key = "AIzaSyD9ZWdbd0MX0My0OjA4RmsCyj4OaE7pV4w"
  end

  def join
    @outing = Outing.find(params[:id])
    o = Outing.includes(:users).find_by('users.id' => current_user.id)
    if not o.nil? and o.id != @outing.id
      o.users.delete(current_user)
    end
    @outing.users << current_user
    redirect_to :back
  end

  def leave
    @outing = Outing.find(params[:id])
    @outing.users.delete(current_user)
    redirect_to :back
  end

  def cancel
    @outing = Outing.find(params[:id])
    @outing.update_attributes(:outing_state => "CANCELED")
    redirect_to :back
  end

  def complete
    @outing = Outing.find(params[:id])
    @outing.update_attributes(:outing_state => "COMPLETE")
    redirect_to :back
  end

  def update
    @outing = Outing.find(params[:id])
    if @outing.update_attributes(outing_params)
      redirect_to :back
    end
  end

  def outing_params
    params.require(:outing).permit(:user_id, :shop_id, :departure, :comment, :outing_state)
  end

end
