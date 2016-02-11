class Outing < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  has_and_belongs_to_many :users

  scope :by_distance, -> { joins(:shop).order('shops.distance_meters ASC')}
  scope :after, ->(time) {  where('departure > ?', time) }

  before_create :add_creator_as_member

  def add_creator_as_member
    self.users << User.find(user_id)
  end
end
