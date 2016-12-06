class CardsController < ApplicationController

  def show(card_id = Card.all.sample.id)
    @new_card = Card.find(card_id)
  end

  def swipe
    # @swipe = Swipe.new(card_id: params[:card_id], liked: params[:liked])
    cookies[:liked] = []
    cookies[:disliked] = []
    if params[:liked] == 1
      cookies[:liked] << params[:card_id].to_i
    else
      cookies[:disliked] << params[:card_id].to_i
    end
    next_card
  end

  def next_card
    @all_card_ids = []
    Card.all.each { |x| @all_card_ids << x.id }
    @seen = cookies[:liked] + cookies[:disliked]
    if @all_card_ids - @seen == []
      redirect_to out_of_cards_path
    else
      @next_card_id = (@all_card_ids - @seen).sample
      redirect_to cards_show_path(@next_card_id)
    end
  end
end
