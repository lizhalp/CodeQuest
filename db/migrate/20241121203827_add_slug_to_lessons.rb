class AddSlugToLessons < ActiveRecord::Migration[8.0]
  def change
    add_column :lessons, :slug, :string
    add_index :lessons, :slug, unique: true
  end
end
