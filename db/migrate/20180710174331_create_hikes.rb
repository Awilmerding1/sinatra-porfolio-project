class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.string :description
      t.integer :user_id
    end
  end
end
