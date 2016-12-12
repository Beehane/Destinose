require 'dbscan'
require 'pp'


class RecommendationsController < ApplicationController

  helper RecommendationsHelper

  def show

    create_cards_array

      @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
        marker.lat card.latitude
        marker.lng card.longitude
        marker.infowindow "<h1>" + card.name + "</h1>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 200, width: 300, crop: :fill) + "<p>" + card.description + "</p>"
      end
    barycenter
  end

  def barycenter

    coordinates = []
    @hash.each do |hash|
     coordinates << hash[:lat]
     coordinates << hash[:lng]
    end

    @coordinates = coordinates.each_slice(2).to_a

    @cluster = cluster_cards
    if @cluster[0].nil?
      redirect_to need_more_info_path
    else
      @centroid = find_centroid
      address = Geocoder.search(@cluster[0][1]).first.data["address_components"]
      @country = address.find { |component| component["types"].include? 'country' }["long_name"]
    end
  end

  def find_centroid
    # all_lat = @cluster[0].map{ |val| val[0] }
    # all_long = @cluster[0].map{ |val| val[1] }
    # average_lat = (all_lat.sum / all_lat.count).round(6)
    # average_long = (all_long.sum / all_long.count).round(6)
    # return [average_lat, average_long]
    return Geocoder::Calculations.geographic_center(@cluster[0])
  end

  def create_cards_array
    @liked = JSON.parse(cookies[:liked])
    @disliked = JSON.parse(cookies[:disliked])
    @cards = []
    @liked.each do |card|
      card_found = Card.find(card)
      @cards << card_found
    end
  end


  def existing
    existing_recommendation


    @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
      marker.lat card.latitude
      marker.lng card.longitude
      marker.infowindow "<h1>" + card.name + "</h1>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 200, width: 300, crop: :fill) + "<p>" + card.description + "</p>"
    end

    barycenter
  end

  def improve
    existing_recommendation
    authenticate_user!
    redirect_to next_card_path
  end

  def existing_recommendation
    @cards = []
    @recommendation = Recommendation.find(params[:id])
    cookies.delete(:liked)
    cookies.delete(:disliked)
    @liked = []
    @disliked = []
    @recommendation.swipes.each do |swipe|
      if swipe.liked?
        card_found = Card.find(swipe.card_id)
        @liked << card_found.id
        @cards << card_found
      else
        card_found = Card.find(swipe.card_id)
        @disliked << card_found.id
        @cards << card_found
      end
    end
    cookies[:liked] = @liked.to_json
    cookies[:disliked] = @disliked.to_json
  end

  def parse_cookies
    @liked = JSON.parse(cookies[:liked])
    @disliked = JSON.parse(cookies[:disliked])
  end

  def save_to_recommendation
    authenticate_user!
    parse_cookies
    @centroid = params[:centroid].map(&:to_f)
    reco = Recommendation.new(user: current_user, latitude: @centroid[0].round(6), longitude: @centroid[1].round(6), country: params[:country])
    @liked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, liked: true, recommendation: reco)
      swipe.save
    end
    @disliked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, liked: false, recommendation: reco)
      swipe.save
    end
    reco.save
    redirect_to dashboard_path
    flash[:notice] = 'search saved successfully'
  end

  def destroy
    Recommendation.find(params[:id]).destroy
    redirect_to dashboard_path
    flash[:notice] = 'saved search deleted successfully'
  end

  private


  def cluster_cards
  #   test_coordinates = [
  #   [-25.279878, -57.524864],
  #   [-25.275594, -57.513830],
  #   [-25.279858, -57.529757],
  #   [-25.280052, -57.530679],
  #   [-36.84846, 174.763332],
  #   [-43.84356, 172.739434],
  #   [-41.28646, 174.776236],
  #   [-13.163141, -72.544963],
  #   [10.391049, -75.479426]
  # ]
    dbscan = DBSCAN(@coordinates, :epsilon => 2200, :min_points => 2, :distance => :haversine_distance2)
    dbscan.results
  end
end
