class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercises do |t|
      t.text :options

      t.timestamps
    end
  end
end
