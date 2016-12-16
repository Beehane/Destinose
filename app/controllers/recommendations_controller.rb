require 'dbscan'
require 'open-uri'
require 'nokogiri'

class RecommendationsController < ApplicationController

  helper RecommendationsHelper

  def show

    create_cards_array

      @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
        marker.lat card.latitude
        marker.lng card.longitude
        marker.infowindow "<h5>" + card.name + "</h5>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 100, width: 150, crop: :fill) + "<p>" + card.description + "</p>"
      end
    barycenter
  end

  def regular_result
      create_cards_array

      @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
        marker.lat card.latitude
        marker.lng card.longitude
        marker.infowindow "<h5>" + card.name + "</h5>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 100, width: 150, crop: :fill) + "<p>" + card.description + "</p>"
      end

  end

  def barycenter

    coordinates = []
    @hash.each do |hash|
     coordinates << hash[:lat]
     coordinates << hash[:lng]
    end

    @coordinates = coordinates.each_slice(2).to_a

    @cluster = cluster_cards

    largest_cluster

    if @cluster[0].nil?
      redirect_to regular_result_path
    else
      @centroid = find_centroid(@cluster[0])
      address = Geocoder.search(@cluster[0][1]).first.data["address_components"]
      @country = address.find { |component| component["types"].include? 'country' }["long_name"]
      @country_iso = address.find { |component| component["types"].include? 'country' }["short_name"]
      @user_country = request.location.country
      if request.location.country_code == "RD"
        @user_country_iso = "ES"
      else
        @user_country_iso = request.location.country_code
      end
      get_quote
    end

    # FINDS THE SECOND AND THIRD LARGEST CLUSTERS

    # if @cluster.key?(1)
    #   @centroid_b = find_centroid(@cluster[1])
    #   @country_b = find_country(@cluster[1])
    # end

    # if @cluster.key?(2)
    #   @centroid_c = find_centroid(@cluster[2])
    #   @country_c = find_country(@cluster[2])
    # end

  end

  def largest_cluster
    @cluster[0] = (@cluster.sort_by { |key, val| -val.count })[0][1]
  end

  def find_centroid(cluster)
    # all_lat = @cluster[0].map{ |val| val[0] }
    # all_long = @cluster[0].map{ |val| val[1] }
    # average_lat = (all_lat.sum / all_lat.count).round(6)
    # average_long = (all_long.sum / all_long.count).round(6)
    # return [average_lat, average_long]
    return Geocoder::Calculations.geographic_center(cluster)
  end

  def find_country(cluster)
    address = Geocoder.search(cluster[1]).first.data["address_components"]
    return address.find { |component| component["types"].include? 'country' }["long_name"]
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


  # def existing
  #   existing_recommendation


  #   @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
  #     marker.lat card.latitude
  #     marker.lng card.longitude
  #     marker.infowindow "<h1>" + card.name + "</h1>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 200, width: 300, crop: :fill) + "<p>" + card.description + "</p>"
  #   end

  #   barycenter
  # end

  def improve
    authenticate_user!
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
    cookies[:trip] = "true" if @liked.count > 9
    redirect_to next_card_path
  end

  def existing
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
    cookies[:trip] = "true"
    redirect_to results_path
  end

  def parse_cookies
    @liked = JSON.parse(cookies[:liked])
    @disliked = JSON.parse(cookies[:disliked])
  end

  def save_to_recommendation
    authenticate_user!
    parse_cookies

    if params[:centroid].nil?
      reco = Recommendation.new(user: current_user)
    else
      @centroid = params[:centroid].map(&:to_f)
      reco = Recommendation.new(user: current_user, latitude: @centroid[0].round(6), longitude: @centroid[1].round(6), country: params[:country])
    end

    @disliked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, liked: false, recommendation: reco)
      swipe.save
    end

    @liked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, liked: true, recommendation: reco)
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

  def get_quote
    # change BCN to #{@user_country} before production!!!!
    url = "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/GB/EUR/en-ES/#{@user_country_iso}/#{@country_iso}/anytime/anytime?apiKey=#{ENV['SKYSCANNER']}"
    file = open(url).read
    skyscanner = JSON.parse(file)
    @quote = skyscanner["Quotes"][0]["MinPrice"]
    @skyscanner_url = "https://www.skyscanner.net/transport/flights/#{@user_country_iso}/#{@country_iso}/anytime/anytime/"
  end

  def itinerary
    create_cards_array

    @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
        marker.lat card.latitude
        marker.lng card.longitude
        marker.infowindow "<h5>" + card.name + "</h5>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 100, width: 150, crop: :fill) + "<p>" + card.description + "</p>"
      end
    barycenter
    get_quote
    @cards_near = Card.near(@centroid, 1000)
    @trip_array = []
    @cards_near.each do |x|
      @trip_array << x if @liked.include? x.id
    end
  end

  private


  def cluster_cards
    dbscan = DBSCAN(@coordinates, :epsilon => 1800, :min_points => 2, :distance => :haversine_distance2)
    dbscan.results
  end
end
