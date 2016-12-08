class RecommendationsController < ApplicationController

  def show
    # @marker = Card.find(params[:id])

    # @alert_message = "You are viewing #{@marker.name}"
    create_cards_array
    create_recommendations_array

    @hash = Gmaps4rails.build_markers(@recommendations) do |recommendation, marker|
      marker.lat recommendation.latitude
      marker.lng recommendation.longitude
      @card = Card.find_by(lat: recommendation.latitude, lng: recommendation.longitude)
      # @image_url = cl_image_tag(@card.image)
      # raise
      # byebug
            # marker.infowindow "<h1>" + @card.name + "</h1><img src='"+@card.image+" height='200'><p>" + @card.name + "</p>"

      marker.infowindow "<h1>" + @card.name + "</h1>" + ActionController::Base.helpers.cl_image_tag(@card.image, height: 200, width: 300, crop: :fill) + "<p>" + @card.description + "</p>"
      # @card.name + @card.description + @card.image
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
      @recommendations << @recommendation
    end
  end

  def parse_cookies
    @liked = JSON.parse(cookies[:liked])
    @disliked = JSON.parse(cookies[:disliked])
  end

  def save_to_recommendation
    parse_cookies
    reco = Recommendation.new(user_id: current_user.id)
    @liked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, user_id: current_user, liked: 1, recommendation: reco)
      swipe.save
    end
    @disliked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, user: current_user, liked: 0, recommendation: reco)
      swipe.save
    end
    reco.save
    flash[:notice] = 'result saved successfully'
  end
end
