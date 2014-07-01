class AddImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :lead_image_url, :string
    add_column :posts, :lead_image_url_small, :string
    add_column :posts, :lead_image_url_normal, :string
  end
end
