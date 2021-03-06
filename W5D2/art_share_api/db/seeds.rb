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

user1 = User.create!(username: 'Kevin')
user2 = User.create!(username: 'Mike')
artwork1 = Artwork.create!(title: 'The Starks', image_url: 'gameofthrones.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'Breaking Bad', image_url: 'breakingbad.com', artist_id: user2.id)
artworkshare1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
artworkshare2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
comment1 = Comment.create!(artwork_id: artwork1.id, user_id: user1.id, body: "whatever 1")
comment2 = Comment.create!(artwork_id: artwork1.id, user_id: user2.id, body: "whatever 2")
comment3 = Comment.create!(artwork_id: artwork2.id, user_id: user1.id, body: "whatever 3")
comment4 = Comment.create!(artwork_id: artwork2.id, user_id: user2.id, body: "whatever 4")