class CardsController < ApplicationController

  before_action :all_card_ids

  def home
    cookies.delete(:liked)
    cookies.delete(:disliked)
    redirect_to card_path(id: Card.all.sample.id)
  end

  def show
    parse_cookies
    params[:id] = Card.all.sample.id unless params[:id]
    @current_strength = ((@liked.count.to_f / 50) * 100).round
    @current_card = Card.find(params[:id])
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

  def next_card
    @seen = @liked + @disliked
    if @all_card_ids - @seen == []
      redirect_to results_path
    else
      next_card_id = (@all_card_ids - @seen).sample
      redirect_to card_path(id: next_card_id)
    end
  end

  def all_card_ids
    @all_card_ids = []
    Card.all.each { |x| @all_card_ids << x.id }
    @all_card_ids
  end

  # private

  # def set_card
  #   @card = Card.find(params[:id])
  # end

  # def card_params
  #   params.require(:card).permit(:id, :image, :description, :lat, :lng)
  # end
end
