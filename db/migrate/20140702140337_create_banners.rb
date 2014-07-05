class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :link
      t.boolean :is_horizontal, null:false, default:false
      t.integer :position
      t.string :image_url
      t.string :image_url_small
      t.string :image_url_normal

      t.timestamps
    end
  end
end
