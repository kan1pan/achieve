# 100.times do |n|
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(email: email,
#               password: password,
#               password_confirmation: password,
#               )
# end

n = 1
email = Faker::Internet.email
user = User.create(
  name: "テスト太郎",
  email: email,
  password: "123456",
  password_confirmation: "123456"
)

while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: user.id
  )
  n = n + 1
end
