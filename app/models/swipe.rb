class Swipe < ApplicationRecord
  belongs_to :card
  belongs_to :recommendation
  belongs_to :user, through: :recommendation

  validates :card, presence: :true
  validates :user, presence: :true
  validates :liked, presence: true, numericality: { less_than_or_equal_to: 1 }
end
