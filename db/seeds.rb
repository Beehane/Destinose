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
  name: "Auckland",
  latitude: -36.84846,
  longitude: 174.763332,
  description: "A view from Mount Roskill",
  image: "0001_wtzczu.jpg",
  time: (60 + rand(0..4) * 30)
  )

card2 = Card.create(
  name: "Dar Es Salam",
  latitude: -6.792354,
  longitude: 39.208328,
  description: "A view from the center",
  image: "0002_kn7mgv.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Magnet Bay",
  latitude: -43.84356,
  longitude: 172.739434,
  description: "A paradise for surfers",
  image: "0003_o4wppe.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Udaipur",
  latitude: 24.585445,
  longitude: 73.712479,
  description: "A spiritural retreat in India",
  image: "0004_yfslxz.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Semien Mountains",
  latitude: 13.301634,
  longitude: 38.295738,
  description: "A resourcing trip for nature lovers",
  image: "0005_la0kl2.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Kendwa",
  latitude: -6.165917,
  longitude: 39.202641,
  description: "A peaceful pool and beach retreat",
  image: "0006_sifyoy.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Tempelhof Berlin",
  latitude: 52.457553,
  longitude: 13.391103,
  description: "The starting point of your journey to Germany",
  image: "0007_tdobfx.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Wellington",
  latitude: -41.28646,
  longitude: 174.776236,
  description: "A view from Mount Roskill",
  image: "0008_mmoahn.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Bronte Beach Sydney",
  latitude: -33.86882,
  longitude: 151.209296,
  description: "The next coolest beach",
  image: "0009_tzla0d.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Joshua Tree CA",
  latitude: 34.134728,
  longitude: -116.313066,
  description: "The Good, the Bad and the Ugly, or so...",
  image: "0010_iccdep.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Machu Picchu",
  latitude: -13.163141,
  longitude: -72.544963,
  description: "Your one and only immersion into the sacred world of Incas",
  image: "0011_oqdju0.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Valle de Cocora",
  latitude: 4.638054,
  longitude: -75.487783,
  description: "Nature offers you its finest",
  image: "0012_cyh4ik.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Old Town, Cartagena",
  latitude: 10.391049,
  longitude: -75.479426,
  description: "Witness history in the colorful colonial streets of Cartagena",
  image: "0013_w7vqx8.jpg",
  time: (60 + rand(0..4) * 30)
  )

Card.create(
  name: "Asakusa, Tokyo",
  latitude: 35.711877,
  longitude: 139.796697,
  description: "Deep dive into vibrant capital of Japan",
  image: "0014_gvmbxp.jpg",
  time: (60 + rand(0..4) * 30)
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
  name: "Lake Hawea",
  latitude: -44.4696976,
  longitude: 169.3014845,
  description: "Wonder in the towering peaks of Mackenzie Country",
  image: "0015_wjr0ks.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Hobbiton",
  latitude: -37.8108803,
  longitude: 175.7764607,
  description: "See how Frodo and other lesser-known Hobbits lived back in the Tolkien era",
  image: "0016_tmcq9m.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Lake Tekapo",
  latitude: -44.004674,
  longitude: 170.477121,
  description: "See how Frodo and other Hobbits lived back in the middle ages",
  image: "0017_tsjpws.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Bamboo Forest, Kyoto",
  latitude: 35.011636,
  longitude: 135.768029,
  description: "Get absolutely bamboozled in this serene forest",
  image: "0018_h9xc6h.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Tsukiji Fish Market, Tokyo",
  latitude: 35.665835,
  longitude: 139.770377,
  description: "Where all things oceanic go to be sold",
  image: "0019_o2xsyc.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Roppongi Hills Skydeck, Tokyo",
  latitude: 35.659979,
  longitude: 139.730162,
  description: "A nice place to witness Tokyo in all its calm and bustle",
  image: "0020_hwl9yp.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Ueno Cat Cafe, Tokyo",
  latitude: 35.712531,
  longitude: 139.778171,
  description: "A nice place to witness Tokyo in all its calm and bustle",
  image: "0021_rnw38d.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Spadio Capsule Hotel, Osaka",
  latitude: 34.668068,
  longitude: 135.491450,
  description: "Spend a night in a Japanese capsule hotel",
  image: "0022_svtqin.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "G-Cans Underground Canals, Tokyo",
  latitude: 35.997605,
  longitude: 139.811478,
  description: "The worlds largest underwater floodwater drainage system",
  image: "0023_n3x474.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Bathing Snow Monkeys, Nagano",
  latitude: 36.733843,
  longitude: 138.462128,
  description: "See Japan's famous hot spring snow monkeys",
  image: "0024_r5bgls.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Laguna Colorada, Altiplano",
  latitude: -22.202787,
  longitude: -67.773955,
  description: "Bolivia's famous red-coloured, high-altitude, flamingo-infested lake",
  image: "0025_f3vdxc.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Glenorchy",
  latitude: -44.835903,
  longitude: 168.405198,
  description: "See where Frodo and Samwise got ambushed by some Orcs",
  image: "0027_fsb37n.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Lamma Island, Hong Kong",
  latitude: 22.226453,
  longitude: 114.108882,
  description: "scenic little island just outside of Hong Kong",
  image: "0028_wnbzqc.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Victoria Peak, Hong Kong",
  latitude: 22.275983,
  longitude: 114.145553,
  description: "a picturesque walkway above Hong Kong",
  image: "0029_oe2lsy.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Wan Chai, Hong Kong",
  latitude: 22.275415,
  longitude: 114.173458,
  description: "bustling downtown area of Hong Kong with plenty of great eateries and souvenir stands.",
  image: "0030_foeidl.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Stewart Island",
  latitude: -47.115503,
  longitude: 167.590306,
  description: "scenic little island at the bottom of New Zealand",
  image: "0031_fknhms.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Fasil Ghebbi, Gondar",
  latitude: 12.608028,
  longitude: 37.469667,
  description: "like something out of Game of Thrones, this is one of the oldest still-standing castles in the world and UNESCO protected.",
  image: "0033_atpcvs.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Vagator, Goa",
  latitude: 15.630366,
  longitude: 73.876752,
  description: "by train is one of the best ways to get around India.",
  image: "0034_bmfenu.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Spice Market, Udaipur",
  latitude: 24.562650,
  longitude: 73.704867,
  description: "overwhelm your senses",
  image: "0035_puhb8i.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "King's Cemetery, Udaipur",
  latitude: 24.572903,
  longitude: 73.728979,
  description: "overwhelm your senses",
  image: "0036_rt41ck.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Blue City, Jodhpur",
  latitude: 26.296634,
  longitude: 73.021703,
  description: "overwhelm your senses",
  image: "0037_ljvb8h.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Mehrangarh Fort, Jodhpur",
  latitude: 26.297817,
  longitude: 73.018495,
  description: "giant goddamn fort in India",
  image: "0038_oocecf.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Hanuman Temple, Jaipur",
  latitude: 26.916890,
  longitude: 75.858973,
  description: "quaint little Temple over the hill from Jaipur",
  image: "0039_enjq0e.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Simien Mountains, Amhara",
  latitude: 13.250366,
  longitude: 38.357046,
  description: "incredible, peaceful views across the Simiens",
  image: "0041_jww2jm.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Simien Mountains, Amhara",
  latitude: 13.145909,
  longitude: 38.186259,
  description: "walk along spectacular ridges and peaks",
  image: "0042_cdd6zw.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Gondar",
  latitude: 12.611548,
  longitude: 37.450227,
  description: "pilgrims attend church on St. Mikaels day, Ethiopia",
  image: "0043_pte00s.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Lalibela",
  latitude: 12.036172,
  longitude: 39.044058,
  description: "see some of the oldest churches in the world in so-called second Jerusalem.",
  image: "0044_bzlyfv.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Erta Ale, Afar Zone 2",
  latitude: 13.450811,
  longitude: 40.552894,
  description: "drive across dried lava to the Erta Ale active crater",
  image: "0045_md0lc7.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Erta Ale Crater Rim, Afar Zone 2",
  latitude: 13.606967,
  longitude: 40.661662,
  description: "stand next to an active volcano in Ethiopia",
  image: "0046_dshwha.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Danakil Salt Flat, Afar Zone 2",
  latitude: 14.055748,
  longitude: 40.344731,
  description: "heal your wounds with this salty paradise",
  image: "0047_ehboxr.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Dallol, Danakil Depression",
  latitude: 14.241693,
  longitude: 40.298967,
  description: "one of the hottest, most colourful places on Earth",
  image: "0048_bfokpi.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Salty City, Danakil",
  latitude: 14.237461,
  longitude: 40.295554,
  description: "stand amongst towers of salt",
  image: "0049_ynauak.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Dune Bashing, Dubai",
  latitude: 23.535561,
  longitude: 54.556736,
  description: "one of the most fun things you can do in an SUV",
  image: "0050_rfezwb.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Dhow Safari, Wasini Island",
  latitude: -4.649602,
  longitude: 39.407557,
  description: "swim with dolphins and sea turtles",
  image: "0051_zx712v.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Central City, Barcelona",
  latitude: 41.386036,
  longitude: 2.164691,
  description: "see the vibrant active streets of Barcelona",
  image: "0052_czpa4k.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Parasailing, Lake Wakatipu",
  latitude: -45.047034,
  longitude: 168.637684,
  description: "one of the most incredible way to see Queenstown",
  image: "0053_kgorqt.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Robot Restaurant, Shinjuku",
  latitude: 35.694293,
  longitude: 139.702865,
  description: "be dazzled by robots, animals and dancers at this glitzy restaurant",
  image: "0054_jiy2ts.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Arrowtown Village",
  latitude: -44.94168759999999,
  longitude: 168.8358624,
  description: "a romantic espace in paradise",
  image: "0055_ktr8nt.jpg",
  time: (60 + rand(0..4) * 30)
)


Card.create(
  name: "Fergburger, Queenstown",
  latitude: -45.03175009999999,
  longitude: 168.65947819999997,
  description: "the mind-blowing burger experience of a lifetime",
  image: "0056_al5dlx.jpg",
  time: (60 + rand(0..4) * 30)
)

Card.create(
  name: "Lake Wanaka",
  latitude: -44.5276371,
  longitude: 169.12629259999994,
  description: "a fantastic hike into resourceful New Zealand nature reserve land",
  image: "0057_s2sk5j.jpg",
  time: (60 + rand(0..4) * 30)
)


Card.create(
  name: "Prime Waterfront Restaurant, Queenstown",
  latitude: -45.0325887,
  longitude: 168.6599562,
  description: "a fancy night out in magical Queenstown",
  image: "0058_nvpm0b.jpg",
  time: (60 + rand(0..4) * 30)
)


Card.create(
  name: "AJ Hackett Bungy, Queenstown",
  latitude: -45.009472,
  longitude: 168.90014500000007,
  description: "a thrilling plummet towards the earth",
  image: "0059_nyx14s.png",
  time: (60 + rand(0..4) * 30)
)


Card.create(
  name: "Shotover jet, Queenstown",
  latitude: -45.0311622,
  longitude: 168.66264350000006,
  description: "rip through the narrow rivers of Otago in high speed",
  image: "0060_tsbrzn.jpg",
  time: (60 + rand(0..4) * 30)
)

