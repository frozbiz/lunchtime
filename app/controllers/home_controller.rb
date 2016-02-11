class HomeController < ApplicationController

def index
  @outings = Outing.where(:outing_state => ["PROPOSED", "IMMINENT"])
  @user_owned_outing = @outings.find_by(:user_id => current_user.id)
  @user_member_outing = @outings.includes(:users).find_by('users.id' => current_user.id)
end

end
