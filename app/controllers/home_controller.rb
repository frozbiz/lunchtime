class HomeController < ApplicationController

  def index
    @outings = Outing.active.by_office(user_signed_in? ? current_user.office : 1).by_distance
    @user_owned_outing = user_signed_in? ? @outings.find_by(:user_id => current_user.id) : nil
    @user_member_outing = user_signed_in? ? @outings.includes(:users).find_by('users.id' => current_user.id) : nil
  end

end
