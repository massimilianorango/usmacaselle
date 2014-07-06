class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image
      t.string :link
      t.boolean :is_horizontal, null:false, default:false
      t.integer :position

      t.timestamps
    end
  end
end
