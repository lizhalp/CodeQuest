class AddValueToVotes < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :value, :integer
  end
end
