class AddNumberToChapters < ActiveRecord::Migration[8.0]
  def change
    add_column :chapters, :number, :integer
  end
end
