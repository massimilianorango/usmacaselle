class Post < ActiveRecord::Base

    belongs_to :sector
    default_scope -> { order('created_at DESC') }

    mount_uploader :lead_image, ImgPostUploader

    validates :sector_id, presence: true
    validates :title, length: { maximum: 100, :message => "Il titolo non può superare i 100 caratteri." }
    validates :content, presence: {:message => "Inserisci il contenuto dell'articolo." }

end
