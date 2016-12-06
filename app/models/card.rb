class Card < ApplicationRecord
  has_many :tags, through: :card_tags
  has_many :swipes
end
