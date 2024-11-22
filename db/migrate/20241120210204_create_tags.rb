class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :taggable, polymorphic: true
      t.timestamps
    end
  end
end
