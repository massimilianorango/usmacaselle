class Category < ActiveRecord::Base

    belongs_to :sector
    acts_as_list :scope => :sector
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgCategoryUploader

    validates :sector_id, presence: true
    validates :name, presence: {:message => "Devi inserire il nome della categoria." },
        length: { maximum: 30, :message => 'Il nome non può superare 30 caratteri.' }

end
