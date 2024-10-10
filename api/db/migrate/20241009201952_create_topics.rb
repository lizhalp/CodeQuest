class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.integer :prereq_id
      t.integer :mod1_id
      t.integer :mod2_id
      t.string :name

      t.timestamps
    end
  end
end
