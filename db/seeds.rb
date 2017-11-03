Topic.all.each do |topic|
  topic.update_attributes(comments_count: topic.comments.count)
end
