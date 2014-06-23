# Preview all emails at http://localhost:3000/rails/mailers/sector_mailer
class SectorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sector_mailer/password_reset
  def password_reset
    SectorMailer.password_reset
  end

end
