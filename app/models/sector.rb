class Sector < ActiveRecord::Base
    default_scope -> { order('id') }

    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :name,  presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
        format: { with: VALID_EMAIL_REGEX }

    attr_accessor :password_old
    validate :password_old_matches

    validates :password, format: { with: /\A[\Sa-zA-Z0-9$!?\^#@_\.\-+=&%\S]{6,}\Z/, 
    :message => 'La password deve essere lunga almeno 6 caratteri e può contenere solo caratteri alfanumerici (maiuscole, minuscole e numeri) e i simboli $ ! ? ^ # @ _ . - + = & %' }
    
    has_secure_password

    has_many :slides, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :items, dependent: :destroy

    def to_param
        unique_name
    end

    def send_password_reset
        begin
            self.password_reset_token = Sector.new_remember_token
        end while Sector.exists?(:password_reset_token => self.password_reset_token)
        self.update_attribute('password_reset_sent_at', Time.zone.now)
        SectorMailer.password_reset(self).deliver
    end

    def Sector.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def Sector.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private
    def create_remember_token
        self.remember_token = Sector.digest(Sector.new_remember_token)
    end

    private
    def password_old_matches
        if password_old.present? && !Sector.find(id).try(:authenticate, password_old)
            errors[:password_old] = "La vecchia password è errata."
        end
    end
end
