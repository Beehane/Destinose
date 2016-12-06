class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.string :length
      t.float :dep_lat
      t.float :dep_lng
      t.float :dest_lat
      t.float :dest_lng
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
