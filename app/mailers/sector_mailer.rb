class SectorMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sector_mailer.password_reset.subject
  #
  def password_reset(sector)
    @sector = sector
    mail :to => sector.email, :subject => "Richiesta di ripristino password - usmacaselle.it"
  end
end
