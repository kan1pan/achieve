cnt = 0
100.times do |n|
  email = Faker::Internet.email
  password = "password"
  uid = SecureRandom.uuid
  User.create!(email: email,
              password: password,
              password_confirmation: password,
              name: "test" + cnt.to_s,
              uid: uid,
              confirmed_at: Time.now
              )
  cnt += 1
end

n = 1

while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: n
  )
  n = n + 1
end
