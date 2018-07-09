class CreateMountainLists < ActiveRecord::Migration
  def change
    create_table :mountain_lists do |t|
      t.integer :mountain_id
      t.integer :list_id
    end
  end
end
