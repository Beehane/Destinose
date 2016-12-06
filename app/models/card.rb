class Card < ApplicationRecord
  has_many :tags, through: :card_tags
  has_many :result_cards
end
