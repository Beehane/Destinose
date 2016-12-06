class CreateSwipes < ActiveRecord::Migration[5.0]
  def change
    create_table :swipes do |t|
      t.references :card, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :liked

      t.timestamps
    end
  end
end
