class Slide < ActiveRecord::Base
    acts_as_list :scope => :sector
    default_scope -> { order('position ASC') }

    belongs_to :sector
    validates :sector_id, presence: true
    validates :text, presence: {:message => 'Devi inserire un breve testo descrittivo della slide.' }, 
                    length: { maximum: 80, :message => 'Il testo non può superare 80 caratteri.' }
    validates :link, presence: {:message => 'Devi inserire un link ad una pagina.' }
    
    has_attached_file :image, :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
        :dropbox_options => {
            :path => proc {"/sectors/sector_#{sector_id}/slides/#{id}_#{image.original_filename}"},
            :unique_filename => true
        }
    validates_attachment :image, attachment_presence: {:message => "Devi inserire un'immagine."},
        :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"],
                                             message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}
end
