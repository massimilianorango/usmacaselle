# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sector.create(unique_name: "societa", name: "Società", email: ENV['SOCIETY_EMAIL'], password: "societa", password_confirmation: "societa",
                            is_root: true, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645442727025/", 
                            sector_class: "society")
Sector.create(unique_name: "calcio", name: "Calcio", email: ENV['FOOTBALL_EMAIL'], password: "calcio", password_confirmation: "calcio",
                            is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846813/", 
                            sector_class: "football")
Sector.create(unique_name: "basket", name: "Basket", email: ENV['BASKET_EMAIL'], password: "basket", password_confirmation: "basket",
                            is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645482846523/", 
                            sector_class: "basket")
Sector.create(unique_name: "volley", name: "Volley", email: ENV['VOLLEY_EMAIL'], password: "volley", password_confirmation: "volley",
                            is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645428448501/", 
                            sector_class: "volley")
Sector.create(unique_name: "atletica", name: "Atletica", email: ENV['ATHLETICS_EMAIL'], password: "atletica", password_confirmation: "atletica",
                            is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028483848/", 
                            sector_class: "athletics")
Sector.create(unique_name: "motoria", name: "Motoria", email: ENV['MOTORIA_EMAIL'], password: "motoria", password_confirmation: "motoria",
                            is_root: false, gallery_url: "https://www.flickr.com/photos/125769009@N02/collections/72157645028308879/", 
                            sector_class: "motoria")

StaticPage.create(page_id: "contatti", title: "Contatti")
StaticPage.create(page_id: "polisportiva", title: "La polisportiva")
StaticPage.create(page_id: "statuto", title: "Statuto")
StaticPage.create(page_id: "storia", title: "Storia")
StaticPage.create(page_id: "codice_etico", title: "Codice Etico")
