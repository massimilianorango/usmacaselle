class Slide < ActiveRecord::Base
    default_scope -> { order('priority DESC') }

    belongs_to :sector
    before_validation :set_priority
    validates :sector_id, presence: true
    validates :text, presence: {:message => 'Devi inserire un breve testo descrittivo della slide.' }, 
                    length: { maximum: 80, :message => 'Il testo non può superare 80 caratteri.' }
    validates :link, presence: {:message => 'Devi inserire un link ad una pagina.' }
    validates :priority, :presence => true
    has_attached_file :image, :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
        :dropbox_options => {
            :path => proc {"/sectors/sector_#{sector_id}/slides/#{id}_#{image.original_filename}"},
            :unique_filename => true
        }
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
