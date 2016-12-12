class AddCountryToRecommendations < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :country, :string
  end
end
