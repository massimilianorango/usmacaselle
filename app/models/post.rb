class Post < ActiveRecord::Base
    default_scope -> { order('created_at DESC') }

    belongs_to :sector
    validates :sector_id, presence: true
    validates :title, length: { maximum: 100, :message => "Il titolo non può superare i 100 caratteri." }
    validates :content, presence: {:message => "Inserisci il contenuto dell'articolo." }

    has_attached_file :lead_image, :storage => :dropbox,
        :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
        :path => proc {|style| "/sectors/sector_#{sector_id}/posts/#{style}/#{id}_lead_#{lead_image.original_filename}"},
        :unique_filename => true
    },
    :styles => {
        :small  => "550x200",
        :normal => "700x400" #TODO: choose public dimensions
    }
    validates_attachment :lead_image,
        :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/png", "image/gif"],
                                             message: "L'immagine deve essere in formato jpg, jpeg, png o gif."}

    def set_image_url
        self.update_column(:lead_image_url, self.lead_image.url)
        self.update_column(:lead_image_url_small, self.lead_image.url(:small))
        self.update_column(:lead_image_url_normal, self.lead_image.url(:normal))
    end

end
