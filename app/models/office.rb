class Office < ActiveRecord::Base
    has_many :shops
    has_many :users
end
