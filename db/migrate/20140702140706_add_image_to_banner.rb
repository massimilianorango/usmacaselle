class AddImageToBanner < ActiveRecord::Migration

    def self.up
        add_attachment :banners, :image
    end

end
