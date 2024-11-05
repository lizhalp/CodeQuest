class CreateMultipleChoiceQuizAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :multiple_choice_quiz_attempts do |t|
      t.integer :user_id
      t.integer :multiple_choice_quiz_id
      t.float :score

      t.timestamps
    end
  end
end
