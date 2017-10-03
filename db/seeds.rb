User.all.each do |user|
  user.update_attributes(admin: false)
end
