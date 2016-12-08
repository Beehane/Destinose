require 'dbscan'
require 'pp'


class RecommendationsController < ApplicationController

  helper RecommendationsHelper

  def show
    create_cards_array
    # create_recommendations_array

    @hash = Gmaps4rails.build_markers(@cards) do |card, marker|
      marker.lat card.lat
      marker.lng card.lng
      marker.infowindow "<h1>" + card.name + "</h1>" + ActionController::Base.helpers.cl_image_tag(card.image, height: 200, width: 300, crop: :fill) + "<p>" + card.description + "</p>"
    end
    ##@hash contains liked cards
    cluster_cards

raise
  end

  def create_cards_array
    @liked = JSON.parse(cookies[:liked])
    @cards = []
    @liked.each do |card|
      card_found = Card.find(card)
      @cards << card_found
    end
  end

  # def create_recommendations_array
  #   @recommendations = []
  #   @cards.each do |card, index|
  #     @recommendation = Recommendation.create!(latitude: card.lat, longitude: card.lng)
  #     @recommendations << @recommendation
  #   end
  # end
  private

  coordinates = []


  def cluster_cards
    dbscan= DBSCAN([], :epsilon => 0.1, :min_points => 1, :distance => :haversine_distance2)
    pp dbscan.results
  end

end
