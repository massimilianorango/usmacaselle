class AddGalleryToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :gallery_url, :string
  end
end
