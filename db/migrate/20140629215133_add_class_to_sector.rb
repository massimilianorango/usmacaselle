class AddClassToSector < ActiveRecord::Migration
  def change
    add_column :sectors, :sector_class, :string
  end
end
