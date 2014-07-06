class UploadedFile < ActiveRecord::Base

    mount_uploader :attachment, UpFileUploader

    validates_presence_of :attachment
    validates :att_type, :presence => true
    validates :uploaded_by, :presence => true
    
end
