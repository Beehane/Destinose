class RemoveAddressFromRecommendations < ActiveRecord::Migration[5.0]
  def change
    remove_column :recommendations, :address
  end
end
