class Schedule < ActiveRecord::Base
    belongs_to :category
    acts_as_list :scope => :category
    default_scope -> { order('position ASC') }

    validates :category_id, presence: true
    validates :day, presence: {:message => "Devi inserire il giorno." }
    validates :time, presence: {:message => "Devi inserire l'ora." }
    validates :where, presence: {:message => "Devi inserire il luogo." }
    validates :map, length: { in: 0..255, allow_nil: false, 
        message: "Il codice della mappa inserito non è corretto. Assicurati di copiare e incollare il codice corretto." }

end
