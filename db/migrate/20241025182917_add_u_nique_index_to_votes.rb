class AddUNiqueIndexToVotes < ActiveRecord::Migration[8.0]
  def change
    add_index :votes, [ :user_id, :content_id ], unique: true
  end
end
