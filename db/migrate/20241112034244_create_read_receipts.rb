class CreateReadReceipts < ActiveRecord::Migration[8.0]
  def change
    create_table :read_receipts do |t|
      t.references :message, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
    add_index :read_receipts, [ :message_id, :user_id ], unique: true
  end
end
