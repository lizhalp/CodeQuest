class AddVisibilityToCourse < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :public, :boolean, default: true
  end
end
