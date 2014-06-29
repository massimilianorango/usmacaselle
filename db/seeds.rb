# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sector.create(name: "Società", email: "massimiliano.rango@gmail.com", password: "societa", password_confirmation: "societa", 
    is_root: true, gallery_url: "https://picasaweb.google.com/segreteria.usmacaselle", sector_class: "society")
Sector.create(name: "Calcio", email: "calcio@usmacaselle.it", password: "calcio", password_confirmation: "calcio", 
    is_root: false, gallery_url: "https://picasaweb.google.com/calcio.usmacaselle", sector_class: "football")
Sector.create(name: "Basket", email: "basket@usmacaselle.it", password: "basket", password_confirmation: "basket", 
    is_root: false, gallery_url: "https://picasaweb.google.com/106336034730078316231", sector_class: "basket")
Sector.create(name: "Volley", email: "volley@usmacaselle.it", password: "volley", password_confirmation: "volley",
 is_root: false, gallery_url: "https://picasaweb.google.com/109982727638894444353", sector_class: "volley")
Sector.create(name: "Atletica", email: "atletica@usmacaselle.it", password: "atletica", password_confirmation: "atletica",
 is_root: false, gallery_url: "https://picasaweb.google.com/atletica.usmacaselle", sector_class: "athletics")
Sector.create(name: "Motoria", email: "motoria@usmacaselle.it", password: "motoria", password_confirmation: "motoria", 
    is_root: false, gallery_url: "https://picasaweb.google.com/motoria.usmacaselle", sector_class: "motoria")