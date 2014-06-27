class AddLeadImageToPosts < ActiveRecord::Migration
    def self.up
        add_attachment :posts, :lead_image
    end
end
