class RemoveUnnecessaryFromSector < ActiveRecord::Migration
  def change
    remove_column :sectors, :picasa_url, :string
    remove_column :sectors, :icon, :string
    remove_column :sectors, :color, :string
  end
end
