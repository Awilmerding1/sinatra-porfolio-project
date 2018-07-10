class UpdateMountainsColumns < ActiveRecord::Migration
  def change
    add_column :mountains, :elevation, :integer
  end
end
