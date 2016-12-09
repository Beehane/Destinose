class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :swipes
  # geocoded_by :city
  # after_validation :geocode, if: :latitude_changed?
end
