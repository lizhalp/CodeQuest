class CreateContents < ActiveRecord::Migration[8.0]
  def change
    create_table :contents do |t|
      t.integer :creator_id
      t.string :name
      t.integer :exercise_id
      t.text :content_html

      t.timestamps
    end
  end
end
