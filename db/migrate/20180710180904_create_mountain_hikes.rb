class CreateMountainHikes < ActiveRecord::Migration
  def change
    create_table :mountain_hikes do |t|
      t.integer :hike_id
      t.integer :mountain_id
    end
  end
end
