# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando as Moedas"

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "http://www.pngall.com/wp-content/uploads/1/Bitcoin-PNG-Pic.png"
)

Coin.create!(
    description: "Etherium",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/256px-Ethereum_logo_2014.svg.png"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png"
)

puts "Moedas Cadastradas com sucesso!"
