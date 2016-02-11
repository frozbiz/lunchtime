class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :meals
  has_many :ratings
  has_many :shops
  belongs_to :office
  has_and_belongs_to_many :outings

end
