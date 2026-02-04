# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
flowers = [
  { id: 1, name: "バラ",      word: "絆" },
  { id: 2, name: "ひまわり", word: "憧れ" },
  { id: 3, name: "チューリップ",     word: "誠実な愛" }
]

flowers.each do |attrs|
  Flower.find_or_initialize_by(name: attrs[:name]).tap do |f|
    f.word = attrs[:word]
    f.save!
  end
end
