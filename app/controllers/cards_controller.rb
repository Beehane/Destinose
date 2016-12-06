class CardsController < ApplicationController

  def show
  end

  def select
    @cards = Card.all
    @new_card = @cards.sample
  end
end
