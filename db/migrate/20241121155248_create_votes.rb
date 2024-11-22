class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :votable, polymorphic: true, null: false

      t.timestamps

      t.index %i[user_id votable_type votable_id], unique: true
    end
  end
end
