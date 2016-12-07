class RecommendationsController < ApplicationController

  def show
    raise
    @marker = Card.find(params[:id])

    @alert_message = "You are viewing #{@marker.name}"
  end
end
