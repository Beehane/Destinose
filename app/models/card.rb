class Card < ApplicationRecord
  has_many :tags, through: :card_tags
  has_many :swipes
  geocoded_by :latitude  => :lat, :longitude => :lng

  validates :lat, presence: :true, uniqueness: :true
  validates :lng, presence: :true, uniqueness: :true
  validates :image, presence: true
end
