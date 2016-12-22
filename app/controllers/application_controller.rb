class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def barycenter

    coordinates = []
    @hash.each do |hash|
     coordinates << hash[:lat]
     coordinates << hash[:lng]
    end

    @coordinates = coordinates.each_slice(2).to_a

    @cluster = cluster_cards

    if @cluster[0].nil?
      redirect_to regular_result_path
    else
      largest_cluster
      @centroid = find_centroid(@largest_cluster)
      address = Geocoder.search(@largest_cluster[1]).first.data["address_components"]
      @country = address.find { |component| component["types"].include? 'country' }["long_name"]
      @country_iso = address.find { |component| component["types"].include? 'country' }["short_name"]
      @user_country = request.location.country
      if request.location.country_code == "RD"
        @user_country_iso = "GB"
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


end
