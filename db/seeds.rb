# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MatchParticipant.destroy_all
Match.destroy_all
CompetitionParticipant.destroy_all
Competition.destroy_all
User.destroy_all
Friendship.destroy_all
Sport.destroy_all

Sport.create!(name: "Tennis")
Sport.create!(name: "Table-Tennis")
Sport.create!(name: "Squash")

user = User.new(id: 0, first_name: "No", last_name: "Match", email: "draw@test.com", password: "123456", city: "Beijing")
url = "app/assets/images/profile-avatar-default.jpg"
user.profile_picture_url = url
user.save

user = User.new(first_name: "Julianne", last_name: "Joswiak", email: "Julianne@test.com", password: "123456", city: "London")
url = "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/005/064/0ec/1749a12.jpg"
user.profile_picture_url = url
user.save

user = User.new(first_name: "Guv", last_name: "Marwaha", email: "Guv@test.com", password: "123456", city: "London")
url = "https://avatars1.githubusercontent.com/u/22517547?v=3&s=400"
user.profile_picture_url = url
user.admin = true
user.save

puts "'real' users seeded"

users_urls = [
"http://blog.psychicsforetell.com/wp-content/uploads/2012/11/Feminist-Ryan-Gosling-269x300.jpg",
"http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=38096302",
"http://timothywhite.com/sites/default/files/styles/gallery_1000/public/images/portfolio/Bruce-Willis.jpg",
"http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=12862344",
"https://pmchollywoodlife.files.wordpress.com/2015/05/jessica-alba-bio-photo.jpg?w=600",
"https://timeentertainment.files.wordpress.com/2013/06/157841774.jpg?w=260",
"http://ets2.lt/wp-content/uploads/2013/02/star.jpg",
"https://pmchollywoodlife.files.wordpress.com/2015/06/colin-farrell-bio-photo.jpg?w=330",
"http://i.dailymail.co.uk/i/pix/2012/05/23/article-0-00DD8F7700000578-631_306x378.jpg",
"http://images.thehairstyler.com/attachment_resources/attachments/110/original/Celebrity_4298.jpg",
"https://s-media-cache-ak0.pinimg.com/236x/0d/3d/3e/0d3d3e6b4f4b79023f1012e4fcb7d75c.jpg",
"https://pmchollywoodlife.files.wordpress.com/2015/08/salma-hayek-bio-photo.jpg?w=330",
"https://s-media-cache-ak0.pinimg.com/236x/0a/79/44/0a7944d75ef6357aa115fe8767785fb7.jpg",
"http://i.dailymail.co.uk/i/pix/2015/01/25/2506543700000578-0-image-m-36_1422177963594.jpg",
"https://s-media-cache-ak0.pinimg.com/564x/62/20/d1/6220d1d825e63ec484bcf81eb0d57217.jpg",
"http://i.imgur.com/zj0t895.jpg"
]

users_urls.each do |user_url|
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", city: "London")
  user.profile_picture_url = user_url
  user.save
end

puts "fake users seeded"

# create friendships
id = User.find_by(email: "guv@test.com").id + 1
16.times {
  Friendship.create!(user: User.find_by(email: "julianne@test.com"), friend_id: id)
  # Friendship.create!(user: User.find_by(email: "romain@test.com"), friend_id: id)
  Friendship.create!(user: User.find_by(email: "guv@test.com"), friend_id: id)
  id += 1
}

puts "friendships between us and other users should be seeded"

User.reindex


