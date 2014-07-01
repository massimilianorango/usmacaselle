class AddImageUrlToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :image_url, :string
    add_column :slides, :image_url_small, :string
    add_column :slides, :image_url_normal, :string
  end
end
