class CreateResultCards < ActiveRecord::Migration[5.0]
  def change
    create_table :result_cards do |t|
      t.references :result, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
