# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

User.create!(username: "Alex")
User.create!(username: "Theo")
User.create!(username: "James")
User.create!(username: "Peter")

Artwork.create!(title: "Frogs", image_url: "frogs.jpg", artist_id: 1)
Artwork.create!(title: "Cows", image_url: "cows.jpg", artist_id: 2)
Artwork.create!(title: "Pigeons", image_url: "pigeon.jpg", artist_id: 2)
Artwork.create!(title: "Duck", image_url: "duck.jpg", artist_id: 1)

ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
ArtworkShare.create!(artwork_id: 2, viewer_id: 1)
ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
ArtworkShare.create!(artwork_id: 4, viewer_id: 3)
ArtworkShare.create!(artwork_id: 4, viewer_id: 4)
ArtworkShare.create!(artwork_id: 4, viewer_id: 2)