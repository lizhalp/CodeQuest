class CreateCompletions < ActiveRecord::Migration[8.0]
  def change
    create_table :completions do |t|
      t.integer :user_id
      t.integer :content_id

      t.timestamps
    end
  end
end
