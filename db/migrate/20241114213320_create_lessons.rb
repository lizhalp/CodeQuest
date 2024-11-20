class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :chapter, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
