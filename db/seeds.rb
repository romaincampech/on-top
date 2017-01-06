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
Sport.create!(name: "Football")
Sport.create!(name: "Basketball")
Sport.create!(name: "Rugby")

user = User.new(id: 0, first_name: "No", last_name: "Match", email: "draw@test.com", password: "123456", city: "Beijing")
url = "app/assets/images/profile-avatar-default.jpg"
user.photo_url = url
user.save

user = User.new(first_name: "Julianne", last_name: "Joswiak", email: "Julianne@test.com", password: "123456", city: "London")
url = "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/7/005/064/0ec/1749a12.jpg"
user.photo_url = url
user.save

user = User.new(first_name: "Romain", last_name: "Campech", email: "Romain@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/396662_4904536692155_1483845542_n.jpg?oh=28d073dc50b821c20b8cd4313af04e4d&oe=58BBBD8F"
user.photo_url = url
user.save

user = User.new(first_name: "Guv", last_name: "Marwaha", email: "Guv@test.com", password: "123456", city: "London")
url = "https://avatars1.githubusercontent.com/u/22517547?v=3&s=400"
user.photo_url = url
user.save


user = User.new(first_name: "Sian", last_name: "Ditchfield", email: "Sian@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/1536608_10151972665337736_261307068_n.jpg?oh=b809c069322a6f767130f3f9962d8ebc&oe=58CD125E"
user.photo_url = url
user.save

user = User.new(first_name: "Ben", last_name: "Taylor", email: "Ben@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/1374283_10151576261717242_1484652063_n.jpg?oh=729ff13950789f2e08a5d6a13410158e&oe=58AFFDA3"
user.photo_url = url
user.save

user = User.new(first_name: "Cameron", last_name: "Flewitt", email: "Cameron@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/1376606_10200857745604858_408929695_n.jpg?oh=470424313966445601919097678f0a12&oe=58B74318"
user.photo_url = url
user.save

user = User.new(first_name: "Marco", last_name: "Gigantino", email: "Marco@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/12507116_10208305928195365_2752709793386925212_n.jpg?oh=954eec3202c9985461be4e8fbff84559&oe=58B8D2D8"
user.photo_url = url
user.save

user = User.new(first_name: "Greg", last_name: "Street", email: "Greg@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/316010_268794049816617_5508651_n.jpg?oh=a7b4c82d608441c323bee27df1b113f6&oe=58BC4371"
user.photo_url = url
user.save

user = User.new(first_name: "Francine", last_name: "Counsell", email: "Francine@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/14141888_10157293299700487_1562368623698011705_n.jpg?oh=ba019140c0174392980ee0bebf373eaf&oe=58C1D4ED"
user.photo_url = url
user.save

user = User.new(first_name: "Freddie", last_name: "Wright", email: "Freddie@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/1497525_10203587590113762_609128032_n.jpg?oh=9941bf5266cad7add79fce1e29d20733&oe=58BC319C"
user.photo_url = url
user.save

user = User.new(first_name: "Mark", last_name: "Rickerby", email: "Mark@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/12219451_10156322462565106_9189074120115918006_n.jpg?oh=d7f13d2ca7afe9d723ed3534a87b3aab&oe=58C98A4D"
user.photo_url = url
user.save

user = User.new(first_name: "Tina", last_name: "Lasisi", email: "Tina@test.com", password: "123456", city: "London")
url = "https://scontent.xx.fbcdn.net/v/t1.0-9/384245_10153800203112748_2892637335954867492_n.jpg?oh=94c74543c2b75d60d2b7f6a297f16a03&oe=58D05F19"
user.photo_url = url
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
"http://i.imgur.com/zj0t895.jpg",
"http://www.amiaceleb.com/media/galleries/197/675_profile.jpg",
"http://www.amiaceleb.com/media/galleries/182/629_profile.jpg"
]

users_urls.each do |user_url|
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", city: "London")
  user.photo_url = user_url
  user.save
end

puts "fake users seeded"

# create friendships
id = User.find_by(email: "guv@test.com").id + 1
20.times {
  Friendship.create!(user: User.find_by(email: "julianne@test.com"), friend_id: id)
  Friendship.create!(user: User.find_by(email: "romain@test.com"), friend_id: id)
  Friendship.create!(user: User.find_by(email: "guv@test.com"), friend_id: id)
  id += 1
}

puts "friendships between us and other users should be seeded"

User.reindex


