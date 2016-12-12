class UpdateRecommendationTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :recommendations, :dest_lat, :latitude
    rename_column :recommendations, :dest_lng, :longitude
  end
end
