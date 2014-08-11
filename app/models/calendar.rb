class Calendar < ActiveRecord::Base
    belongs_to :category
    acts_as_list :scope => :category
    default_scope -> { order('position ASC') }

    validates :category_id, presence: true
    validates :name, presence: {:message => "Devi inserire il nome del calendario." },
        length: { maximum: 30, :message => 'Il nome non può superare 30 caratteri.' }

    has_many :matches, dependent: :destroy
end
