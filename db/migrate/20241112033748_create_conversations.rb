class CreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.boolean :is_direct_message

      t.timestamps
    end
  end
end
