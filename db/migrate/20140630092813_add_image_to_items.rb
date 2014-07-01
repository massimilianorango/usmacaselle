class AddImageToItems < ActiveRecord::Migration
  def self.up
        add_attachment :items, :image
    end
end
