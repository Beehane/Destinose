require 'dbscan'

class CardsController < ApplicationController

  before_action :parse_cookies, :all_card_ids

  # def from_search
  #   cookies.delete(:search)
  #   cookies.delete(:liked)
  #   cookies.delete(:disliked)
  #   @departure = params[:departure]
  #   @length = params[:length]
  #   cookies[:search] = [@departure, @length].to_json
  #   all_card_ids
  #   next_card
  # end

  # def filter_distance
  #   @search = JSON.parse(cookies[:search])
  #   case @search[1]
  #   when "2+ weeks"
  #     @filter_distance = 50_000
  #   when "2 weeks"
  #     @filter_distance = 30_000
  #   when "1 week"
  #     @filter_distance = 6_000
  #   when "3-5 days"
  #     @filter_distance = 2_500
  #   when "1-2 days"
  #     @filter_distance = 250
  #   end
  # end

  def show
    parse_cookies
    params[:id] = Card.all.sample.id unless params[:id]
    @current_strength = ((((@disliked.count*0.4) + @liked.count).to_f / 80) * 100).round
    @current_card = Card.find(params[:id])
  end

  def nearby
    parse_cookies
    params[:id] = Card.all.sample.id unless params[:id]
    @current_card = Card.find(params[:id])
  end

  def restart
    cookies.delete(:liked)
    cookies.delete(:disliked)
    cookies.delete(:trip)
    redirect_to next_card_path
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
    if @liked.count >= 40 || cookies[:trip] == "true"
      cluster_biasing #the hunt begins
    else
      all_card_ids
      @seen = @liked + @disliked
      if @all_card_ids - @seen == []
        redirect_to out_of_cards_path
      else
        next_card_id = (@all_card_ids - @seen).sample
        redirect_to card_path(id: next_card_id)
      end
    end
  end

  def cluster_biasing
    @liked_coordinates = []
    @liked.each do |like|
      card = Card.find(like)
      @liked_coordinates << [card[:latitude], card[:longitude]]
    end
    @likes_cluster = cluster_current_likes
    @likes_centroid = Geocoder::Calculations.geographic_center(@likes_cluster[0])

    near_card_ids

    @seen = @liked + @disliked
    if @near_card_ids - @seen == []
      redirect_to out_of_cards_path
    elsif cookies[:trip] == "true"
      next_card_id = (@near_card_ids - @seen).sample
      redirect_to nearby_path(id: next_card_id)
    else
      next_card_id = (@near_card_ids - @seen).sample
      redirect_to card_path(id: next_card_id)
    end
  end

  def trip_grow
    cookies[:trip] = "true"
    next_card
  end

  def near_card_ids
    @near_card_ids = []
    Card.near(@likes_centroid, 1_800).each do |x|
    @near_card_ids << x.id
    end
  end

  def all_card_ids
    @all_card_ids = []
    Card.all.each do |x|
    @all_card_ids << x.id
    end
  end

private
  def cluster_current_likes
    dbscan = DBSCAN(@liked_coordinates, :epsilon => 1800, :min_points => 2, :distance => :haversine_distance2)
    dbscan.results
  end

  # def filter_by_distance
  #   @search = JSON.parse(cookies[:search])
  #   filter_distance
  #   @all_card_ids = []
  #   Card.near(@search[0], @filter_distance).each do |card|
  #     @all_card_ids << card.id
  #   end
  #   @all_card_ids
  # end

  # private

  # def set_card
  #   @card = Card.find(params[:id])
  # end

  # def card_params
  #   params.require(:card).permit(:id, :image, :description, :lat, :lng)
  # end
end
