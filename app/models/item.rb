class Item < ActiveRecord::Base
    acts_as_list
    default_scope -> { order('position ASC') }

    belongs_to :sector
    validates :sector_id, presence: true
    validates :name, presence: {:message => "Devi inserire il nome dell'articolo." }, 
                    length: { maximum: 80, :message => 'Il nome non può superare 80 caratteri.' }
    validates :price, presence: {:message => "Devi inserire il prezzo dell'articolo." }
    validates :priority, :presence => true
    has_attached_file :image, :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
        :dropbox_options => {
            :path => proc {"/sectors/sector_#{sector_id}/items/#{id}_#{image.original_filename}"},
            :unique_filename => true
        }
    validates_attachment :image, attachment_presence: {:message => "Devi inserire un'immagine."},
        :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"],
                                             message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}
end
