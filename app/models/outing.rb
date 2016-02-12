class Outing < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  has_and_belongs_to_many :users

  OUTING_STATES = [:PROPOSED, :IMINENT, :UNDERWAY, :COMPLETE, :CANCELLED]

  scope :by_distance, -> { joins(:shop).order('shops.distance_meters ASC')}
  scope :after, ->(time) {  where('departure > ?', time) }
  scope :by_office, ->(office) { joins(:shop).where('shops.office_id = ?', office)}
  scope :active, -> { where('outing_state in (?)', [:PROPOSED, :IMINENT, :UNDERWAY]) }

  before_create :add_creator_as_member


  def add_creator_as_member
    self.users << User.find(user_id)
  end

  def advance
    if self.departure < Time.now.in_time_zone(self.shop.office.tz) - 2.hours
      self.update_attributes(outing_state: :COMPLETE)
    elsif self.departure < Time.now.in_time_zone(self.shop.office.tz)
      self.update_attributes(outing_state: :UNDERWAY)
    elsif self.departure < Time.now.in_time_zone(self.shop.office.tz) + 5.minutes
      self.update_attributes(outing_state: :IMINENT)
    end
  end

end
