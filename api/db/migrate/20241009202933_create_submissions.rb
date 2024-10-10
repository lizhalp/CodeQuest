class CreateSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.text :raw_submission
      t.text :raw_response

      t.timestamps
    end
  end
end
