# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.destroy_all
User.destroy_all
Recommendation.destroy_all
Swipe.destroy_all

juan = User.create(
  first_name: "Juan",
  last_name: "Neel",
  email: "juan@gmail.com",
  password: "password",
  )

card1 = Card.create(
  name: "Auckland, New Zealand",
  latitude: -36.84846,
  longitude: 174.763332,
  description: "A view from Mount Roskill",
  image: "0001_wtzczu.jpg",
  )

card2 = Card.create(
  name: "Dar Es Salam, Tanzania",
  latitude: -6.792354,
  longitude: 39.208328,
  description: "A view from the center",
  image: "0002_kn7mgv.jpg",
  )

Card.create(
  name: "Magnet Bay, New Zealand",
  latitude: -43.84356,
  longitude: 172.739434,
  description: "A paradise for surfers",
  image: "0003_o4wppe.jpg",
  )

Card.create(
  name: "Udaipur, India",
  latitude: 24.585445,
  longitude: 73.712479,
  description: "A spiritural retreat in India",
  image: "0004_yfslxz.jpg",
  )

Card.create(
  name: "Semien Mountains, Ethiopia",
  latitude: 13.301634,
  longitude: 38.295738,
  description: "A resourcing trip for nature lovers",
  image: "0005_la0kl2.jpg",
  )

Card.create(
  name: "Kendwa, Zanzibar",
  latitude: -6.165917,
  longitude: 39.202641,
  description: "A peaceful pool and beach retreat",
  image: "0006_sifyoy.jpg",
  )

Card.create(
  name: "Tempelhof Berlin, Germany",
  latitude: 52.457553,
  longitude: 13.391103,
  description: "The starting point of your journey to Germany",
  image: "0007_tdobfx.jpg",
  )

Card.create(
  name: "Wellington, New Zealand",
  latitude: -41.28646,
  longitude: 174.776236,
  description: "A view from Mount Roskill",
  image: "0008_mmoahn.jpg",
  )

Card.create(
  name: "Bronte Beach Sydney, Australia",
  latitude: -33.86882,
  longitude: 151.209296,
  description: "The next coolest beach",
  image: "0009_tzla0d.jpg",
  )

Card.create(
  name: "Joshua Tree CA, USA",
  latitude: 34.134728,
  longitude: -116.313066,
  description: "The Good, the Bad and the Ugly, or so...",
  image: "0010_iccdep.jpg",
  )

Card.create(
  name: "Machu Picchu, Peru",
  latitude: -13.163141,
  longitude: -72.544963,
  description: "Your one and only immersion into the sacred world of Incas",
  image: "0011_oqdju0.jpg",
  )

Card.create(
  name: "Valle de Cocora, Colombia",
  latitude: 4.638054,
  longitude: -75.487783,
  description: "Nature offers you its finest",
  image: "0012_cyh4ik.jpg",
  )

Card.create(
  name: "Old Town, Cartagena, Colombia",
  latitude: 10.391049,
  longitude: -75.479426,
  description: "Witness history in the colorful colonial streets of Cartagena",
  image: "0013_w7vqx8.jpg",
  )

Card.create(
  name: "Asakusa, Tokyo, Japan",
  latitude: 35.711877,
  longitude: 139.796697,
  description: "Deep dive into vibrant capital of Japan",
  image: "0014_gvmbxp.jpg",
  )

reco = Recommendation.create(
  user: juan
  departure: "Christchurch, New Zealand",
  length: "5 weeks"
)

Swipe.create(
  card: card1,
  liked: true,
  recommendation: reco
)

Swipe.create(
  card: card2,
  liked: false,
  recommendation: reco
)
