class CreateChapters < ActiveRecord::Migration[8.0]
  def change
    create_table :chapters do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
