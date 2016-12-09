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
    ##@hash contains liked cards
    cluster_cards
  end

  def create_cards_array
    @liked = JSON.parse(cookies[:liked])
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
  end

  def improve
    existing_recommendation
    redirect_to card_path(id: @liked.sample)
  end

  def existing_recommendation
    @cards = []
    @recommendation = Recommendation.find(params[:id])
    cookies.delete(:search)
    cookies.delete(:liked)
    cookies.delete(:disliked)
    @liked = []
    @disliked = []
    cookies[:search] = [@recommendation.departure, @recommendation.length].to_json
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
    @search = JSON.parse(cookies[:search])
  end

  def save_to_recommendation
    authenticate_user!
    parse_cookies
    reco = Recommendation.new(user: current_user, departure: @search[0], length: @search[1])
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

  coordinates = []


  def cluster_cards
    dbscan= DBSCAN([], :epsilon => 0.1, :min_points => 1, :distance => :haversine_distance2)
    pp dbscan.results
  end
end
