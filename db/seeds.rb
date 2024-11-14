# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

10.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::Movie.quote,
                poster_url: Faker::Avatar.image, rating: rand(0.1..10).round(1))
end

List.create!(name: 'Horror')
List.create!(name: 'Romance')

5.times do
  Bookmark.create!(comment: Faker::Movie.quote, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
end
