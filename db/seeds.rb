# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Venue.destory_all
Town.destroy_all
Rapbattle.destroy_all
Trashbattle.destroy_all
Trashtalk.destroy_all
rappers = ["Snoop Dog","Ice Cube","Vanilla Ice","Tone Loc","Jay-Z","Sir Mix-a-Lot","LL Cool J","Eminem"]
trash = ["You went to a private school","You live in a trailer park",
          "You mamma is so fat Dora can't explore her","You mamma is so ugly people go as her for Halloween",
          "You mamma is so stupid she tried to climb mountain dew",
          "I'm sorry I hurt your feelings when I called you stupid. I thought you already knew.",
          "I'd like to see things from your point of view but I can't get my head that far up my ass",
          "You must have been born on a highway because that's where most accidents happen",
          "Wow you're even dumber than you look","When I see your face there's not a single thing I would change
           except the direction I'm walking in","You mama is so fat when she got in the scale it said, I need your
           weight not your zip code","You mamma is so stupid she returned a donut because it had a hole in it"
        ]
towns = ["Detroit","New York","Chicago","Los Angeles"]
rappers.each do |rap|
  Users.create(rap)
end
