class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :meals
  has_many :shops
  belongs_to :office
  has_and_belongs_to_many :outings

  ratyrate_rater

  validates_format_of :email, :with => /.*@sonos.com/, :message => "must be sonos.com"

end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    self.for(:sign_up) {|u| u.permit(:name, :email, :office_id, :password, :password_confirmation) }
    self.for(:account_update) {|u| u.permit(:name, :email, :sonos_id, :sonos_household_id, :office_id, :password, :password_confirmation, :current_password) }
  end
end
