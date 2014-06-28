class AddAttachmentToUploadedFile < ActiveRecord::Migration
    def self.up
        add_attachment :uploaded_files, :attachment
    end
end
