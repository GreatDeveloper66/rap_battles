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
rappers = [["Snoop Dog","SnoopDog.jpg"],
            ["Ice Cube","IceCube.jpg"],
            ["Vanilla Ice","VanillaIce.jpg"],
            ["Tone Loc","ToneLoc.jpg"],
            ["Jay-Z","JayZ.jpg"],
            ["Sir Mix-a-Lot","SirMixALot.jpg"],
            ["LL Cool J","LLCoolJ.jpg"],
            ["Eminem","Eminem.jpg"]]

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
          ["You mamma is so stupid she returned a donut because it had a hole in it",8],
          ["You mamma is so fat, she roll over a dollar and makes 4 quarters",6],
          ["You mamma is so ugly she made One direction go another direction",8],
          ["You mamma is so fat her bellybutton gets home 15 minutes before she does",5],
          ["You mamma is so fat when she sat on WalMart, she lowered the prices",5],
          ["You mamma is so ugly that she makes blind children cry",8],
          ["You mamma is so stupid that she got locked in a grocery store and starved",8],
          ["If laughter is the best medicine, your face must be curing the world",9],
          ["You're so ugly that your portraits hang themselves",7],
          ["You're so stupid that you climbed a glass wall to see what was on the other side",9],
          ["You're so hairy that when you come out of the shower it is like Gorillas in the mist",6],
          ["You're so hairy that when you went to the zoo they locked you in a cage",8],
          ["Your birth certificate is an apology from the condom factory", 9],
          ["Mirrors can't talk, lucky for you they can't laugh either", 7]
        ]
towns = [["Chicago",5,"chicago.jpg"],
         ["New York",10,"newyork.jpg"],
         ["Los Angeles",15,"losangeles.jpg"],
         ["Detroit",20,"detroit.jpg"]
         ]

def randomString
  ('a'..'z').to_a.shuffle[0,8].join
end

rappers.each do |n|
  User.create(name: n[0], email:"#{n[0]}@gmail.com",username: n[0], imgurl:n[1], password_digest: randomString)
end

towns.each do |t|
  Town.create(name: t[0],points: t[1],imgurl: t[2])
end

chicago = Town.all.to_a[0]
newyork = Town.all.to_a[1]
losangeles = Town.all.to_a[2]
detroit = Town.all.to_a[3]

chicago.addVenue("Apollo Theatre",30,"Apollo.jpg")
chicago.addVenue("Chicago Theatre",20,"chicago.jpg")
newyork.addVenue("Madison Square Garden",15,"Madison_Square_Garden.jpg")
newyork.addVenue("Radio City Music Hall",20,"Radio_City.jpg")
losangeles.addVenue("Rose Bowl",11,"Rose_Bowl.jpg")
losangeles.addVenue("Hollywood Bowl",22,"Hollywood_Bowl.jpg")
detroit.addVenue("Filmore Detroit",55,"Filmore_Detroit.jpg")
detroit.addVenue("Saint Andrews Hall",45,"Saint_Andrews.jpg")

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
