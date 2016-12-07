class RecommendationsController < ApplicationController

  def show
    # @marker = Card.find(params[:id])

    # @alert_message = "You are viewing #{@marker.name}"
    create_cards_array
    create_recommendations_array

    @hash = Gmaps4rails.build_markers(@recommendations) do |recommendation, marker|
      marker.lat recommendation.latitude
      marker.lng recommendation.longitude
    end
  end

  def create_cards_array
    @liked = JSON.parse(cookies[:liked])
    # shift alt L
    @cards = []
    @liked.each do |card|
      card_found = Card.find(card)
      @cards << card_found
    end
  end

  def create_recommendations_array
    @recommendations = []
    @cards.each do |card, index|
      @recommendation = Recommendation.create!(latitude: card.lat, longitude: card.lng)

      # @recommendation"#{index}" = Recommendation.create!(latitude: card.lat, longitude: card.lng)
      # @recommendation"#{index}".save!
      @recommendations << @recommendation
    end
  end
end
