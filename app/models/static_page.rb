class StaticPage < ActiveRecord::Base
    validates :page_id, presence: true
    validates :title, presence: true

    def to_param
        page_id
    end
end
