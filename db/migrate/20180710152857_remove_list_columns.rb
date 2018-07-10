class RemoveListColumns < ActiveRecord::Migration
  def change
    remove_column :lists, :mountain_name
    remove_column :lists, :mountain_description
  end
end
