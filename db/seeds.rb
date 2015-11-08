Genre.delete_all

gn1 = Genre.create!(name: 'Music')
gn2 = Genre.create!(name: 'Drama')
gn3 = Genre.create!(name: 'Sport')
gn4 = Genre.create!(name: 'Comedy')
gn5 = Genre.create!(name: 'Show')


Gig.delete_all
d1 = "Matilda The Musical is the multi-award winning musical from the Royal Shakespeare Company. With book by Dennis Kelly and original songs by Tim Minchin, Matilda The Musical is the story of an extraordinary little girl who, armed with a vivid imagination and a sharp mind, dares to take a stand and change her own destiny."
d2 = "Beverley Knight MBE (born Beverley Anne Smith on 22 March 1973) is a British recording artist, radio presenter and musical theatre actress"
d3 = "Adam Mitchel Lambert is an American singer, songwriter and stage actor. Since 2009, he has sold over 2.5 million albums and 5 million singles worldwide."
d4 = "Faithless is a British electronica band consisting of Maxi Jazz, Sister Bliss and Rollo. The group is best known for their dance songs."
d5 = "Jimmy Carr been described as the hardest working man in comedy."
d6 = "The Richard Wolfenden Show is a fortnightly comedy chat show, bringing in music acts and comedy guests from around the country"
d7 = "A musical purist who began singing at age three and learned to play drums and guitar by the time she was 16, Kelly forgoes over-the-top production in favour of laying bare her natural musicianship and ingenuity in songwriting."
d8 = "With more than 50 Top 40 hits-Mandy,Cant Smile Without You and many more, Manilow's unparalleled career encompasses virtually every area of music, including performing, composing, arranging and producing."
d9 = "Lethal Bizzle (also known as Lethal B) is one of the fastest growing East London Grime artists. In December, 2004 he released Pow (Forward), also known as Forward Riddim, which was banned from airplay by some mainstream stations."
d10 = "WWE, the more common terminology for World Wrestling Entertainment, Inc., is an American publicly traded, privately controlled entertainment company that deals primarily in professional wrestling, with major revenue sources also coming from film, music, product licensing and direct product sales."


g1 = Gig.create!(name: 'Matilda the Musical', genre: gn2, description: d1)
g2 = Gig.create!(name: 'Beverley Knight', genre: gn1, description: d2)
g3 = Gig.create!(name: 'Adam Lambert', genre: gn1, description: d3)
g4 = Gig.create!(name: 'FAITHLESS', genre: gn1, description: d4)
g5 = Gig.create!(name: 'Jimmy CARR', genre: gn4, description: d5)
g6 = Gig.create!(name: 'The Richard Wolfenden Show', genre: gn5, description: d6)
g7 = Gig.create!(name: 'Tori Kelly', genre: gn1, description: d7)
g8 = Gig.create!(name: 'Barry Manilow', genre: gn1, description: d8)
g9 = Gig.create!(name: 'Lethal Bizzle', genre: gn1, description: d9)
g10 = Gig.create!(name: 'WWE Wrestling', genre: gn3, description: d10)

Venue.delete_all
v1 = Venue.create!(name: 'Glasgow', address: 'Bath Street', seat: 50)
v2 = Venue.create!(name: 'Manchester', address: 'Rigg Street', seat: 100)
v3 = Venue.create!(name: 'Edinburgh', address: 'Mayor Street', seat: 70)

Schedule.delete_all

Schedule.create!(gig: g1, venue: v1)
Schedule.create!(gig: g2, venue: v2)
Schedule.create!(gig: g3, venue: v3)

User.delete_all

User.create!(email: "rick@rick.com", password: "password", role: 'user')
User.create!(email: "sandy@sandy.com", password: "password", role: 'user')
User.create!(email: "tony@tony.com", password: "password", role: 'user')
User.create!(email: "syed@syed.com", password: "abcd1234", role: 'admin')



