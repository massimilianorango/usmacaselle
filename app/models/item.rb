class Item < ActiveRecord::Base

    belongs_to :sector
    acts_as_list :scope => :sector
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgItemUploader

    validates :sector_id, presence: true
    validates :name, presence: {:message => "Devi inserire il nome dell'articolo." },
        length: { maximum: 80, :message => 'Il nome non può superare 80 caratteri.' }
    validates :price, presence: {:message => "Devi inserire il prezzo dell'articolo." }
    validates_presence_of :image

end
