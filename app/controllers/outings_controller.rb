class OutingsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :advance_outings

  def index
    @outings = Outing.active.order(departure: :desc)
    @recent_outings = Outing.where(outing_state: :COMPLETE).order(departure: :desc).limit(10)
  end

  def new
    @outing = Outing.new
    @prefill_shop_id = params[:shop_id] || ''
  end

  def create
    @outing = Outing.create(outing_params)
    redirect_to outing_url(@outing)
  end

  def show
    @outing = Outing.find(params[:id])
    @user_is_member = current_user && @outing.users.find_by(:id => current_user.id)
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
      redirect_to outing_url(@outing)
    end
  end

protected
  def outing_params
    params.require(:outing).permit(:user_id, :shop_id, :departure, :comment, :outing_state)
  end

  def advance_outings
    Outing.active.each {|o| o.advance() }
  end

end
