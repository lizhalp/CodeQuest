class CreateMultipleChoiceQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :multiple_choice_quizzes do |t|
      t.string :name
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
