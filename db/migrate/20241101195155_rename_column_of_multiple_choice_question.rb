class RenameColumnOfMultipleChoiceQuestion < ActiveRecord::Migration[8.0]
  def change
    rename_column :multiple_choice_questions, :quiz_id, :multiple_choice_quiz_id
  end
end
