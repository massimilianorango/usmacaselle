# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sector.create(name: "Segreteria", email: "massimiliano.rango@gmail.com", password: "segreteria", password_confirmation: "segreteria", is_root: true)
#Sector.create(name: "Segreteria", email: "segreteria@usmacaselle.it", password: "segreteria", password_confirmation: "segreteria", is_root: true)
Sector.create(name: "Calcio", email: "calcio@usmacaselle.it", password: "calcio", password_confirmation: "calcio", is_root: false)
Sector.create(name: "Basket", email: "basket@usmacaselle.it", password: "basket", password_confirmation: "basket", is_root: false)
Sector.create(name: "Volley", email: "volley@usmacaselle.it", password: "volley", password_confirmation: "volley", is_root: false)
Sector.create(name: "Atletica", email: "atletica@usmacaselle.it", password: "atletica", password_confirmation: "atletica", is_root: false)
Sector.create(name: "Motoria", email: "motoria@usmacaselle.it", password: "motoria", password_confirmation: "motoria", is_root: false)