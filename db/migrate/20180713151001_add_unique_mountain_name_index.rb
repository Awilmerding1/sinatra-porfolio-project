class AddUniqueMountainNameIndex < ActiveRecord::Migration
  def change
    add_index :mountains, :name, unique: true
  end
end
