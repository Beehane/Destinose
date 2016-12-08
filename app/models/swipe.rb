class Swipe < ApplicationRecord
  belongs_to :card
  belongs_to :recommendation

  validates :card, presence: :true
  validates :liked, presence: true, numericality: { less_than_or_equal_to: 1 }
end
