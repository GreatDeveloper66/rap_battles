# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Venue.destroy_all
Town.destroy_all
Rapbattle.destroy_all
Trashbattle.destroy_all
Trashtalk.destroy_all
rappers = ["Snoop Dog","Ice Cube","Vanilla Ice","Tone Loc","Jay-Z","Sir Mix-a-Lot","LL Cool J","Eminem"]
trash = [["You went to a private school",3],
          ["You live in a trailer park",5],
          ["You mamma is so fat Dora can't explore her",7],
          ["You mamma is so ugly people go as her for Halloween",8],
          ["You mamma is so stupid she tried to climb mountain dew",8],
          ["I'm sorry I hurt your feelings when I called you stupid. I thought you already knew.",10],
          ["I'd like to see things from your point of view but I can't get my head that far up my ass",10],
          ["You must have been born on a highway because that's where most accidents happen",10],
          ["Wow you're even dumber than you look",6],
          ["When I see your face there's not a single thing I would change except the direction I'm walking in", 9],
          ["You mama is so fat when she got in the scale it said, I need your weight not your zip code",7],
          ["You mamma is so stupid she returned a donut because it had a hole in it",8]
        ]
towns = [["Chicago",5,"/app/assets/images/chicago.jpg"],
         ["New York",10,"/app/assets/images/newyork.jpg"],
         ["Los Angeles",15,"/app/assets/images/losangeles.jpg"],
         ["Detroit",20,"/app/assets/images/detroit.jpg"]
         ]

def randomString
  ('a'..'z').to_a.shuffle[0,8].join
end

rappers.each do |n|
  User.create(name: n, email:"#{n}@gmail.com",username: n,password_digest: randomString)
end

towns.each do |t|
  Town.create(name: t[0],points: t[1],imgurl: t[2])
end

chicago = Town.all.to_a[0]
newyork = Town.all.to_a[1]
losangeles = Town.all.to_a[2]
detroit = Town.all.to_a[3]

chicago.addVenue("Apollo Theatre",30)
chicago.addVenue("Chicago Theatre",20)
newyork.addVenue("Madison Square Garden",15)
newyork.addVenue("Radio City Music Hall",20)
losangeles.addVenue("Rose Bowl",11)
losangeles.addVenue("Hollywood Bowl",22)
detroit.addVenue("Filmore Detroit",55)
detroit.addVenue("Saint Andrews Hall",45)

trash.each do |t|
  Trashtalk.create(snippet:t[0],points:t[1])
end
allusers = User.all.to_a
limit = allusers.length
firstVenue = Venue.first
lastVenue = Venue.last
for n in 1...limit do
  allusers[0].challenge(allusers[n],firstVenue)
end

for n in 1...limit do
  allusers[0].challenge(allusers[n],lastVenue)
end
