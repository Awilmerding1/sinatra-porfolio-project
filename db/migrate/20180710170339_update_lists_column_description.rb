class UpdateListsColumnDescription < ActiveRecord::Migration
  def change
    add_column :lists, :description, :string, :default => ""
  end
end
