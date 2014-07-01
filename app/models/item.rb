class Item < ActiveRecord::Base
    acts_as_list :scope => :sector
    default_scope -> { order('position ASC') }

    belongs_to :sector
    validates :sector_id, presence: true
    validates :name, presence: {:message => "Devi inserire il nome dell'articolo." },
        length: { maximum: 80, :message => 'Il nome non può superare 80 caratteri.' }
    validates :price, presence: {:message => "Devi inserire il prezzo dell'articolo." }

    has_attached_file :image, :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
        :path => proc {|style| "/sectors/sector_#{sector_id}/items/#{style}/#{id}_#{image.original_filename}"},
        :unique_filename => true
    },
    :styles => {
        :small  => "300x300",
        :normal => "500x500" #TODO: choose public dimensions
    }

    validates_attachment :image, attachment_presence: {:message => "Devi inserire un'immagine."},
        :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"],
                                             message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}
    def set_image_url
        self.update_column(:image_url, self.image.url)
        self.update_column(:image_url_small, self.image.url(:small))
        self.update_column(:image_url_normal, self.image.url(:normal))
    end
end
