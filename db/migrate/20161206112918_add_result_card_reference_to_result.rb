class AddResultCardReferenceToResult < ActiveRecord::Migration[5.0]
  def change
    add_reference :results, :result_card, foreign_key: true
  end
end
