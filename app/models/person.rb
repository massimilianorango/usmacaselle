class Person < ActiveRecord::Base
    belongs_to :category
    acts_as_list :scope => :category
    default_scope -> { order('position ASC') }

    mount_uploader :image, ImgPersonUploader

    validates :category_id, presence: true
    validates :first_name, presence: {:message => "Devi inserire il nome della persona." },
        length: { maximum: 30, :message => 'Il nome non può superare 30 caratteri.' }
    validates :last_name, presence: {:message => "Devi inserire il cognome della persona." },
        length: { maximum: 30, :message => 'Il cognome non può superare 30 caratteri.' }
    validates :role, presence: {:message => "Devi inserire il ruolo della persona." },
        length: { maximum: 30, :message => 'Il ruolo non può superare 20 caratteri.' }

end
