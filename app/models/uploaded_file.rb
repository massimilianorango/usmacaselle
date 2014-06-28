class UploadedFile < ActiveRecord::Base

    has_attached_file :attachment, :default_url => "", 
        :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
        :dropbox_options => {
            :path => proc {"/sectors/sector_#{@sector_id}/uploaded_#{att_type}/#{id}_#{attachment.original_filename}"},
            :unique_filename => true
        }

    validates :att_type, :presence => true
    do_not_validate_attachment_file_type :attachment
    validates_attachment :image, attachment_presence: {:message => "Devi inserire un file."}

    def sector_id=(id)
        @sector_id = id
    end
end
