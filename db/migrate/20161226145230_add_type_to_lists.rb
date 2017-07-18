class AddTypeToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :type, :string
  end
end
