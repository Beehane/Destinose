class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
