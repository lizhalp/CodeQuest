class CreateLanguages < ActiveRecord::Migration[8.0]
  def change
    create_table :languages do |t|
      t.integer :judge_id
      t.text :driver
      t.string :name

      t.timestamps
    end
  end
end
