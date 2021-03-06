class Banner < ActiveRecord::Base
    
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgBannerUploader

    validates :link, presence: {:message => "Devi inserire il link alla pagina dello sponsor." }
    validates_presence_of :image
    
end
