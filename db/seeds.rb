# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Team.destroy_all

# Создание примерных команд
teams_data = [
  { name: 'Лейкерс' },
  { name: 'Бостон' },
  { name: 'Чикаго' },
  { name: 'Майами' }
]

teams_data.each do |data|
  Team.create(data)
end

puts 'Примерные команды созданы'

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
