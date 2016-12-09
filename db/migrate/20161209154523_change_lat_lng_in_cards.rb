class ChangeLatLngInCards < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :lat, :latitude
    rename_column :cards, :lng, :longitude
  end
end
