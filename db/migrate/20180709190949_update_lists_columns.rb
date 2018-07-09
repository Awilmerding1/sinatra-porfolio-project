class UpdateListsColumns < ActiveRecord::Migration
  def change
    add_column :lists, :mountain_name, :string
    add_column :lists, :mountain_description, :string
  end
end
