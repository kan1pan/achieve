# 100.times do |n|
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(email: email,
#               password: password,
#               password_confirmation: password,
#               )
# end

n = 1
id = 1
while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: id
  )
  n = n + 1
end
