class AddTopicToContents < ActiveRecord::Migration[8.0]
  def change
    add_column :contents, :topic_id, :integer
  end
end
