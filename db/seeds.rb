# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
    Sector.create(name: "Società", email: "massimiliano.rango@gmail.com", password: "societa", password_confirmation: "societa",
                                is_root: true, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645442727025/", sector_class: "society")
    Sector.create(name: "Calcio", email: "massimiliano.rango@gmail.com", password: "calcio", password_confirmation: "calcio",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846813/", sector_class: "football")
    Sector.create(name: "Basket", email: "massimiliano.rango@gmail.com", password: "basket", password_confirmation: "basket",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846523/", sector_class: "basket")
    Sector.create(name: "Volley", email: "massimiliano.rango@gmail.com", password: "volley", password_confirmation: "volley",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645428448501/", sector_class: "volley")
    Sector.create(name: "Atletica", email: "massimiliano.rango@gmail.com", password: "atletica", password_confirmation: "atletica",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028483848/", sector_class: "athletics")
    Sector.create(name: "Motoria", email: "massimiliano.rango@gmail.com", password: "motoria", password_confirmation: "motoria",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028308879/", sector_class: "motoria")
when "production"
    Sector.create(name: "Società", email: "segreteria.usmacaselle@gmail.com", password: "societa", password_confirmation: "societa",
                                is_root: true, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645442727025/", sector_class: "society")
    Sector.create(name: "Calcio", email: "segreteria.usmacaselle@gmail.com", password: "calcio", password_confirmation: "calcio",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846813/", sector_class: "football")
    Sector.create(name: "Basket", email: "segreteria.usmacaselle@gmail.com", password: "basket", password_confirmation: "basket",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846523/", sector_class: "basket")
    Sector.create(name: "Volley", email: "segreteria.usmacaselle@gmail.com", password: "volley", password_confirmation: "volley",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645428448501/", sector_class: "volley")
    Sector.create(name: "Atletica", email: "segreteria.usmacaselle@gmail.com", password: "atletica", password_confirmation: "atletica",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028483848/", sector_class: "athletics")
    Sector.create(name: "Motoria", email: "segreteria.usmacaselle@gmail.com", password: "motoria", password_confirmation: "motoria",
                                is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028308879/", sector_class: "motoria")
end
