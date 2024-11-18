class AddFieldsToCourses2 < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :has_chat, :boolean, default: true
  end
end
