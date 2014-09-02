class Match < ActiveRecord::Base
    belongs_to :calendar
    acts_as_list :scope => :calendar
    default_scope -> { order('position ASC') }

    validates :calendar_id, presence: true
    validates :home, presence: {:message => "Devi inserire la squadra locale." }
    validates :guests, presence: {:message => "Devi inserire la squadra ospite." }
    validates :where, presence: {:message => "Devi inserire il luogo." }
    validates :day, presence: {:message => "Devi inserire il giorno." }
    validates :date, presence: {:message => "Devi inserire la data." }
    validates :time, presence: {:message => "Devi inserire l'ora." }
    
end
