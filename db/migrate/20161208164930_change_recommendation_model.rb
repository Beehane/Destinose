class ChangeRecommendationModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :recommendations, :dep_lat
    remove_column :recommendations, :dep_lng
    remove_column :recommendations, :latitude
    remove_column :recommendations, :longitude
    add_column :recommendations, :departure, :string
  end
end
