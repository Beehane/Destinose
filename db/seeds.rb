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

#
##
###
####
#####
###### MAKING A COUPLE RECOS AND SWIPES FOR JUAN

reco = Recommendation.create(
  user: juan,
  latitude: -43.5320544,
  longitude: 172.6362254,
  country: "New Zealand"
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

######
#####
####
###
##
#

Card.create(
  name: "Lake Hawea, New Zealand",
  latitude: -44.4696976,
  longitude: 169.3014845,
  description: "Wonder in the towering peaks of Mackenzie Country",
  image: "0015_wjr0ks.jpg",
)

Card.create(
  name: "Hobbiton, New Zealand",
  latitude: -37.8108803,
  longitude: 175.7764607,
  description: "See how Frodo and other lesser-known Hobbits lived back in the Tolkien era",
  image: "0016_tmcq9m.jpg",
)

Card.create(
  name: "Lake Tekapo, New Zealand",
  latitude: -44.004674,
  longitude: 170.477121,
  description: "See how Frodo and other Hobbits lived back in the middle ages",
  image: "0017_tsjpws.jpg",
)

Card.create(
  name: "Bamboo Forest, Kyoto",
  latitude: 35.011636,
  longitude: 135.768029,
  description: "Get absolutely bamboozled in this serene forest",
  image: "0018_y23kzd.jpg",
)

Card.create(
  name: "Tsukiji Fish Market, Tokyo",
  latitude: 35.665835,
  longitude: 139.770377,
  description: "Where all things oceanic go to be sold",
  image: "0019_o2xsyc.jpg",
)

Card.create(
  name: "Roppongi Hills Skydeck, Tokyo",
  latitude: 35.659979,
  longitude: 139.730162,
  description: "A nice place to witness Tokyo in all its calm and bustle",
  image: "0020_hwl9yp.jpg",
)

Card.create(
  name: "Ueno Cat Cafe, Tokyo",
  latitude: 35.712531,
  longitude: 139.778171,
  description: "A nice place to witness Tokyo in all its calm and bustle",
  image: "0021_rnw38d.jpg",
)

Card.create(
  name: "Spadio Capsule Hotel, Osaka",
  latitude: 34.668068,
  longitude: 135.491450,
  description: "Spend a night in a Japanese capsule hotel",
  image: "0022_svtqin.jpg",
)

Card.create(
  name: "G-Cans Underground Canals, Tokyo",
  latitude: 35.997605,
  longitude: 139.811478,
  description: "The worlds largest underwater floodwater drainage system",
  image: "0023_n3x474.jpg",
)

Card.create(
  name: "Bathing Snow Monkeys, Nagano",
  latitude: 36.733843,
  longitude: 138.462128,
  description: "See Japan's famous hot spring snow monkeys",
  image: "0024_r5bgls.jpg",
)

Card.create(
  name: "Laguna Colorada, Altiplano",
  latitude: -22.202787,
  longitude: -67.773955,
  description: "Bolivia's famous red-coloured, high-altitude, flamingo-infested lake",
  image: "0025_f3vdxc.jpg",
)

Card.create(
  name: "Glenorchy, Queenstown",
  latitude: -44.835903,
  longitude: 168.405198,
  description: "See where Frodo and Samwise got ambushed by some Orcs",
  image: "0027_fsb37n.jpg",
)

Card.create(
  name: "Lamma Island, Hong Kong",
  latitude: 22.226453,
  longitude: 114.108882,
  description: "scenic little island just outside of Hong Kong",
  image: "0028_wnbzqc.jpg",
)

Card.create(
  name: "Victoria Peak, Hong Kong",
  latitude: 22.275983,
  longitude: 114.145553,
  description: "a picturesque walkway above Hong Kong",
  image: "0029_oe2lsy.jpg",
)

Card.create(
  name: "Wan Chai, Hong Kong",
  latitude: 22.275415,
  longitude: 114.173458,
  description: "bustling downtown area of Hong Kong with plenty of great eateries and souvenir stands.",
  image: "0030_foeidl.jpg",
)

Card.create(
  name: "Stewart Island, New Zealand",
  latitude: -47.115503,
  longitude: 167.590306,
  description: "scenic little island at the bottom of New Zealand",
  image: "0031_fknhms.jpg",
)

Card.create(
  name: "Fasil Ghebbi, Gondar",
  latitude: 12.608028,
  longitude: 37.469667,
  description: "like something out of Game of Thrones, this is one of the oldest still-standing castles in the world and UNESCO protected.",
  image: "0033_atpcvs.jpg",
)

Card.create(
  name: "Vagator, Goa",
  latitude: 15.630366,
  longitude: 73.876752,
  description: "by train is one of the best ways to get around India.",
  image: "0034_bmfenu.jpg",
)

Card.create(
  name: "Spice Market, Udaipur",
  latitude: 24.562650,
  longitude: 73.704867,
  description: "overwhelm your senses",
  image: "0035_puhb8i.jpg",
)

Card.create(
  name: "King's Cemetery, Udaipur",
  latitude: 24.572903,
  longitude: 73.728979,
  description: "overwhelm your senses",
  image: "0036_rt41ck.jpg",
)

Card.create(
  name: "Blue City, Jodhpur",
  latitude: 26.296634,
  longitude: 73.021703,
  description: "overwhelm your senses",
  image: "0037_ljvb8h.jpg",
)

Card.create(
  name: "Mehrangarh Fort, Jodhpur",
  latitude: 26.297817,
  longitude: 73.018495,
  description: "giant goddamn fort in India",
  image: "0038_oocecf.jpg",
)

Card.create(
  name: "Hanuman Temple, Jaipur",
  latitude: 26.916890,
  longitude: 75.858973,
  description: "quaint little Temple over the hill from Jaipur",
  image: "0039_enjq0e.jpg",
)

Card.create(
  name: "Simien Mountains, Amhara",
  latitude: 13.250366,
  longitude: 38.357046,
  description: "incredible, peaceful views across the Simiens",
  image: "0041_jww2jm.jpg",
)

Card.create(
  name: "Simien Mountains, Amhara",
  latitude: 13.145909,
  longitude: 38.186259,
  description: "walk along spectacular ridges and peaks",
  image: "0042_cdd6zw.jpg",
)

Card.create(
  name: "Gondar, Ethiopia",
  latitude: 12.611548,
  longitude: 37.450227,
  description: "pilgrims attend church on St. Mikaels day, Ethiopia",
  image: "0043_pte00s.jpg",
)

Card.create(
  name: "Lalibela, Ethiopia",
  latitude: 12.036172,
  longitude: 39.044058,
  description: "see some of the oldest churches in the world in so-called second Jerusalem.",
  image: "0044_bzlyfv.jpg",
)

Card.create(
  name: "Erta Ale, Afar Zone 2",
  latitude: 13.450811,
  longitude: 40.552894,
  description: "drive across dried lava to the Erta Ale active crater",
  image: "0045_md0lc7.jpg",
)

Card.create(
  name: "Erta Ale Crater Rim, Afar Zone 2",
  latitude: 13.606967,
  longitude: 40.661662,
  description: "stand next to an active volcano in Ethiopia",
  image: "0046_dshwha.jpg",
)

Card.create(
  name: "Danakil Salt Flat, Afar Zone 2",
  latitude: 14.055748,
  longitude: 40.344731,
  description: "heal your wounds with this salty paradise",
  image: "0047_ehboxr.jpg",
)

Card.create(
  name: "Dallol, Danakil Depression",
  latitude: 14.241693,
  longitude: 40.298967,
  description: "one of the hottest, most colourful places on Earth",
  image: "0048_bfokpi.jpg",
)

Card.create(
  name: "Salty City, Danakil",
  latitude: 14.237461,
  longitude: 40.295554,
  description: "stand amongst towers of salt",
  image: "0049_ynauak.jpg",
)

Card.create(
  name: "Dune Bashing, Dubai",
  latitude: 23.535561,
  longitude: 54.556736,
  description: "one of the most fun things you can do in an SUV",
  image: "0050_rfezwb.jpg",
)

Card.create(
  name: "Dhow Safari, Wasini Island",
  latitude: -4.649602,
  longitude: 39.407557,
  description: "swim with dolphins and sea turtles",
  image: "0051_zx712v.jpg",
)

Card.create(
  name: "Central City, Barcelona",
  latitude: 41.386036,
  longitude: 2.164691,
  description: "see the vibrant active streets of Barcelona",
  image: "0052_czpa4k.jpg",
)

Card.create(
  name: "Parasailing, Lake Wakatipu",
  latitude: -45.047034,
  longitude: 168.637684,
  description: "one of the most incredible way to see Queenstown",
  image: "0053_kgorqt.jpg",
)


















