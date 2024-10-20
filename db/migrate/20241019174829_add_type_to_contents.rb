class AddTypeToContents < ActiveRecord::Migration[8.0]
  def change
    add_column :contents, :type, :string 
  end
end
