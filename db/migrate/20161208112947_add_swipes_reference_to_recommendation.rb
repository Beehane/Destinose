class AddSwipesReferenceToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_reference :swipes, :recommendation
    add_foreign_key :swipes, :recommendations
  end
end
