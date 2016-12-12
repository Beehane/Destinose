class RenameDestinationInRecommendationsToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :recommendations, :destination, :address
  end
end
