20.times do |i|
  User.create(name: "name#{i}", email: "example#{i}@qq.com", password: "111111", password_confirmation: "111111")
end
