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
  end

  def create_cards_array
    @liked = JSON.parse(cookies[:liked])
    @cards = []
    @liked.each do |card|
      card_found = Card.find(card)
      @cards << card_found
    end
  end

  def parse_cookies
    @liked = JSON.parse(cookies[:liked])
    @disliked = JSON.parse(cookies[:disliked])
  end

  def save_to_recommendation
    parse_cookies
    reco = Recommendation.new(user: current_user)
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
    flash[:notice] = 'result saved successfully'
  end

end
