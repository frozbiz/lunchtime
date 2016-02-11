class Outing < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  has_one :outing_state

  has_and_belongs_to_many :users
end
