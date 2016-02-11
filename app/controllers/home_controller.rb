class HomeController < ApplicationController

def index
  @outings = Outing.where(:outing_state => ["PROPOSED", "IMMINENT"])
  @user_owned_outing = user_signed_in? ? @outings.find_by(:user_id => current_user.id) : nil
  @user_member_outing = user_signed_in? ? @outings.includes(:users).find_by('users.id' => current_user.id) : nil
end

end
