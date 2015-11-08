Genre.delete_all

gn1 = Genre.create!(name: 'Music')
gn2 = Genre.create!(name: 'Drama')
gn3 = Genre.create!(name: 'Sport')


Gig.delete_all

# g1 = Gig.create!(name: 'Dr Feelgood', genre_id: 'gn1.id')
# g2 = Gig.create!(name: 'Motley Crue', genre_id: 'gn1.id')
# g3 = Gig.create!(name: 'Wwe Live', genre_id: 'gn3.id')

g1 = Gig.create!(name: 'Dr Feelgood', genre: gn1)
g2 = Gig.create!(name: 'Motley Crue', genre: gn1)
g3 = Gig.create!(name: 'Wwe Live', genre: gn3)

Venue.delete_all
v1 = Venue.create!(name: 'Glasgow', address: 'Bath Street', seat: 50)
v2 = Venue.create!(name: 'Manchester', address: 'Rigg Street', seat: 100)
v3 = Venue.create!(name: 'Edinburgh', address: 'Mayor Street', seat: 70)


Schedule.delete_all
Schedule.create!(gig: g1, venue: v1)
Schedule.create!(gig: g2, venue: v2)
Schedule.create!(gig: g3, venue: v3)

User.delete_all

names = ["Kelley", "Van", "Santiago", "Bev", "Halley"]
names.size.times do
  n = names.pop
  user = User.new(email: "#{n}@#{n}.#{n}", password: "password")
end



