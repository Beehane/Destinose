class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :swipes, through: :user
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
