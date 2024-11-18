class Fix < ActiveRecord::Migration[8.0]
  def change
    drop_table :friendships
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
