class AddImageUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :image_url, :string
    add_column :items, :image_url_small, :string
    add_column :items, :image_url_normal, :string
  end
end
