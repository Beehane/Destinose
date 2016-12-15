class AddTimeToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :time, :integer
  end
end
