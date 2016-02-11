class OutingsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @outing = Outing.new
  end

  def create
    Outing.create(params.require(:outing).permit(:user_id, :shop_id, :departure, :comment))
    flash[:notice] = "Outing Created"
    redirect_to root_url
  end

  def show
    @outing = Outing.find(params[:id])
  end

  def edit
    @outing = Outing.find(params[:id])
  end

  def destroy
    Outing.destroy(params[:id])
  end

end
