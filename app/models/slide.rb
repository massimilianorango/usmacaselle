class Slide < ActiveRecord::Base
    belongs_to :sector
    before_validation :set_priority
    default_scope -> { order('priority DESC') }
    validates :text, length: { maximum: 80, :message => 'Il testo non può superare 80 caratteri.' }
    validates :link, presence: {:message => 'Devi inserire un link ad una pagina.' }
    validates :sector_id, presence: true
    validates :priority, :presence => true
    has_attached_file :image
    validates_attachment :image, attachment_presence: {:message => "Devi inserire un'immagine."},
        :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"], 
            message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}

    private
    def set_priority
        if self.priority.nil?
            first_slide = Slide.order('priority DESC').first
            self.priority = 1 + (first_slide.nil? ? 0 : first_slide.priority)
        end
    end
end
