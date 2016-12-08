class SwipesController < ApplicationController

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

  def cookies_to_swipes

  end

  def swipes_to_recommendation
  end

end
