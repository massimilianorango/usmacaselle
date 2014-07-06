class Slide < ActiveRecord::Base
    
    belongs_to :sector
    acts_as_list :scope => :sector
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgSlideUploader
    
    validates :sector_id, presence: true
    validates :text, presence: {:message => 'Devi inserire un breve testo descrittivo della slide.' },
        length: { maximum: 80, :message => 'Il testo non può superare 80 caratteri.' }
    validates :link, presence: {:message => 'Devi inserire un link ad una pagina.' }
    validates_presence_of :image

end
