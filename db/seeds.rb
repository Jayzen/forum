100.times do |i|
  Category.create(name: "tag#{i}", ancestry: nil)
end
