class RemoveImageFromSlide < ActiveRecord::Migration
  def self.up
    remove_column :slides, :image
    add_attachment :slides, :image
  end
end
