class OutingsController < ApplicationController

  before_action :authenticate_user!

  def index
    @outings = Outing.after(Time.now)
  end

  def new
    @outing = Outing.new
  end

  def create
    Outing.create(outing_params)
    flash[:notice] = "Outing Created"
    redirect_to root_url
  end

  def show
    @outing = Outing.find(params[:id])
  end

  def join
    @outing = Outing.find(params[:id])
    o = Outing.includes(:users).find_by('users.id' => current_user.id)
    if not o.nil? and o.id != @outing.id
      o.users.delete(current_user)
    end
    @outing.users << current_user
    redirect_to root_url
  end

  def leave
    @outing = Outing.find(params[:id])
    @outing.users.delete(current_user)
    redirect_to root_url
  end

  def cancel
    @outing = Outing.find(params[:id])
    @outing.update_attributes(:outing_state => "CANCELED")
    redirect_to root_url
  end

  def edit
    @outing = Outing.find(params[:id])
  end

  def update
    @outing = Outing.find(params[:id])
    if @outing.update_attributes(outing_params)
      redirect_to root_url
    end
  end

  def outing_params
    params.require(:outing).permit(:user_id, :shop_id, :departure, :comment, :outing_state)
  end

  def destroy
    Outing.destroy(params[:id])
  end

end
