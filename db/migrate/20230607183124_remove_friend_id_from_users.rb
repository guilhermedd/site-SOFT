class RemoveFriendIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :friend_id, :integer
  end
end
