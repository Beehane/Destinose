module RecommendationsHelper
  def save_to_recommendation
    parse_cookies
    reco = Recommendation.new(user: current_user)
    @liked.each do |x|
      card = Card.find(x)
      swipe = Swipe.new(card: card, user: current_user, liked: 1, recommendation: reco)
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
