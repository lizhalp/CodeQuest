class CreateContents < ActiveRecord::Migration[8.0]
  def change
    create_table :contents do |t|
      t.integer :user_id
      t.string :title
      t.text :content_text

      t.timestamps
    end
  end
end
