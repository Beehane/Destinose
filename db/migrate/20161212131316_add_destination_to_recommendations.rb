class AddDestinationToRecommendations < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :destination, :string
  end
end
