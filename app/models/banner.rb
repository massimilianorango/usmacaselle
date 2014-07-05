class Banner < ActiveRecord::Base
    acts_as_list
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgBannerUploader

    validates :link, presence: {:message => "Devi inserire il link alla pagina dello sponsor." }

    # validates_attachment :image, attachment_presence: {:message => "Devi inserire un'immagine."},
    #     :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"],
    #                                          message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}

end
