class SectorMailer < ActionMailer::Base
  default from: "assistenza.usmacaselle@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sector_mailer.password_reset.subject
  #
  def password_reset(sector)
    @sector = sector
    mail :to => sector.email, :subject => "Richiesta di ripristino password - usmacaselle.it"
  end

  def item_question(sector, item, name, surname, email, tel, question)
    @sector = sector
    @item = item
    @name = name
    @surname = surname
    @email = email
    @tel = tel
    @question = question
    mail :to => sector.email, :subject => "Informazioni articolo - usmacaselle.it"
  end  

end
