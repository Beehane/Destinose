class RemoveUserFromSwipes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :swipes, :user
  end
end
