class CardsController < ApplicationController

  before_action :all_card_ids

  helper CardsHelper

  def from_search
    cookies.delete(:search)
    cookies.delete(:liked)
    cookies.delete(:disliked)
    @departure = params[:departure]
    @length = params[:length]
    cookies[:search] = [@departure, @length].to_json
    redirect_to card_path(id: Card.all.sample.id)
  end

  def filter_length
    case @length
    when > 14
      @filter_distance = 75_000
    end
  end

  def show
    parse_cookies
    params[:id] = Card.all.sample.id unless params[:id]
    @current_strength = ((@liked.count.to_f / 50) * 100).round
    @current_card = Card.find(params[:id])
  end

  def swipe
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
    @nearby = card.near(@departure, 250)
    @seen = @liked + @disliked
    if @all_card_ids - @seen == []
      redirect_to out_of_cards_path
    else
      next_card_id = (@all_card_ids - @seen).sample
      redirect_to card_path(id: next_card_id)
    end
  end

  def all_card_ids
    @all_card_ids = []
    Card.all.each do |card|
      next if card.near(@departure, 250)
      @all_card_ids << card.id if card.near(@departure, @filter_distance)
    end
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
