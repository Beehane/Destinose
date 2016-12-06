class Recommendation < ApplicationRecord
  belongs_to :user
  has_many :swipes, through: :user
end
