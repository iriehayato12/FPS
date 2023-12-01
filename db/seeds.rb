


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: "admin@admin") do |admin| 
   admin.password = 'admin1'
end


olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.introduction = "ID：1234567 ３年ぐらいFPSしてます！！"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.introduction = "FPSは初めてなので優しくしてください～"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.introduction = "FPS歴10年です！！ランク主体でプレーしてます。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Report.find_or_create_by!(reason:"不適切な表現") do |report|
   report.reporter_id = "1"
   report.reported_id = "3"
   report.status = 0
end

Category.create(name: "APEX")
Category.create(name: "VALORANT") 
Category.create(name: "overwatch")
Category.create(name: "COD")


Post.find_or_create_by!(title: "フレンド募集！！") do |post|
  post.body = "初心者大歓迎です！フレンドになりましょう"
  post.user = olivia
  post.user_id = "1"
  post.category_id = "1"
end

Post.find_or_create_by!(title: "ランクメンバー募集！！") do |post|
  post.body = "ランク帯がゴールド以上の方募集中！！"
  post.user = lucas
  post.user_id = "3"
  post.category_id = "2"
end

Post.find_or_create_by!(title: "まったりしましょう") do |post|
  post.body = '基本ランク以外でプレーしましょう！緩い雰囲気で～～'
  post.category_id = "3"
  post.user_id = "2"
  post.user = james
end
  
PostComment.find_or_create_by!(comment: "フレンドになりましょう！！") do |comment|
   comment.user = james
   comment.post_id = "1"
end

PostComment.find_or_create_by!(comment: "ぜひお願いします") do |comment|
   comment.user = olivia
   comment.post_id = "1"
end



