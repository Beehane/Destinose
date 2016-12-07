class CardsController < ApplicationController

  def show(card_id = Card.all.sample.id)
    @new_card = Card.find(card_id)
  end

  def swipe
    # @swipe = Swipe.new(card_id: params[:card_id], liked: params[:liked])
    parse_cookies
    if params[:liked].to_i == 1
      @liked << params[:card_id].to_i
    else
      @disliked << params[:card_id].to_i
    end
    cookies[:liked] = @liked.to_json
    cookies[:disliked] = @disliked.to_json
    next_card
  end

  def parse_cookies
    if cookies[:liked].blank?
      @liked = []
    else
      @liked = JSON.parse(cookies[:liked])
    end

    if cookies[:disliked].blank?
      @disliked = []
    else
      @disliked = JSON.parse(cookies[:disliked])
    end
  end

  def current_strength
    @current_strength = (@liked.count.to_f / 50 * 100).round
  end

  def next_card
    @all_card_ids = []
    Card.all.each { |x| @all_card_ids << x.id }
    @seen = @liked + @disliked
    if (@all_card_ids - @seen) == []
      redirect_to out_of_cards_path
    else
      next_card_id = (@all_card_ids - @seen).sample
      redirect_to cards_show_path(next_card_id)
    end
  end
end
