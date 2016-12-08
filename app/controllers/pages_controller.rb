class PagesController < ApplicationController
  def dashboard
    redirect_to  new_user_session_path unless user_signed_in?
  end

  def search_departure
    @search = JSON.parse(cookies[:search])
    @departure = search[0]
  end

  def search_length
    search = JSON.parse(cookies[:search])
    @departure = search[1]
  end
end
