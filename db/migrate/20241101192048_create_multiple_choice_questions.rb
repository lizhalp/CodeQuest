class CreateMultipleChoiceQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :multiple_choice_questions do |t|
      t.integer :quiz_id
      t.text :text
      t.string :options
      t.string :answer

      t.timestamps
    end
  end
end
