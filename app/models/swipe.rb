class Swipe < ApplicationRecord
  belongs_to :card
  belongs_to :recommendation

  validates :card, presence: :true
  validates :liked, presence: true
end
