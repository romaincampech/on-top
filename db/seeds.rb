# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create users
me = User.create!(email: "juliannej@mac.com", password: "123456")
romain = User.create!(email: "romain@mac.com", password: "123456")
guv = User.create!(email: "guv@mac.com", password: "123456")

# create sport
tennis = Sport.create!(name: "Tennis", sport_rules: "www.google.com")

puts "sports created"

# competition-side testing
  # create Julianne's competition
  comp = Competition.new(category: "knockout", number_of_players: 4)
  comp.creator = me
  comp.sport = tennis
  comp.save

  # create Guv's competition
  compi = Competition.new(category: "round robin", number_of_players: 8)
  compi.creator = guv
  compi.sport = tennis
  compi.save

  # assign users to J's competition
  comp_pi = CompetitionParticipant.new(player: false) # guv is not a player on the knockout
  comp_pi.user = guv
  comp_pi.competition = comp
  comp_pi.save

  comp_pii = CompetitionParticipant.new(player: true)
  comp_pii.user = romain
  comp_pii.competition = comp
  comp_pii.save

  comp_piii = CompetitionParticipant.new(player: true)
  comp_piii.user = me
  comp_piii.competition = comp
  comp_piii.save

  # assign users to G's competition
  compi_pi = CompetitionParticipant.new(player: true) # guv is a player on the round robin
  compi_pi.user = guv
  compi_pi.competition = compi
  compi_pi.save

  compi_pii = CompetitionParticipant.new(player: true)
  compi_pii.user = romain
  compi_pii.competition = compi
  compi_pii.save

  compi_piii = CompetitionParticipant.new(player: true)
  compi_piii.user = me
  compi_piii.competition = compi
  compi_piii.save

  comp.champion = romain
  comp.save
# match-side testing

matchy = Match.new(status: "unplayed", round: 1)
matchy.competition = comp
matchy.save

matchy_p = MatchParticipant.new
matchy_p.player = guv
matchy_p.match = matchy
matchy_p.save

matchy_pi = MatchParticipant.new
matchy_pi.player = romain
matchy_pi.match = matchy
matchy_pi.save

matchx = Match.new(status: "played", round: 1)
matchx.competition = comp
matchx.winner = romain
matchx.save

puts "matches created"




