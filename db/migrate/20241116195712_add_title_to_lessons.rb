class AddTitleToLessons < ActiveRecord::Migration[8.0]
  def change
    add_column :lessons, :title, :string
  end
end
