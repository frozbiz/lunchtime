class UsersController < ApplicationController


  def find_user
    @user = User.find(params[:id])
    raise "User Not Found" unless @user
  end

  def show
    find_user()
    @my_outings = Outing.includes(:users).where('users.id' => @user.id).order('departure DESC')
    @my_meals = Meal.where(user: @user.id).order('created_at DESC')
  end

end
