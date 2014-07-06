class UploadedFile < ActiveRecord::Base

    mount_uploader :attachment, UpFileUploader

    validates :att_type, :presence => true
    validates :uploaded_by, :presence => true
    validates_presence_of :attachment
    
end
