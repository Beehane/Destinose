class Card < ApplicationRecord
  has_many :tags, through: :card_tags
  has_many :swipes, dependent: :destroy

  validates :latitude, presence: :true, uniqueness: :true
  validates :longitude, presence: :true, uniqueness: :true
  validates :image, presence: true
end
