class CreateJudgedExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :judged_exercises do |t|
      t.integer :language_id
      t.text :solution
      t.text :test_cases

      t.timestamps
    end
  end
end
