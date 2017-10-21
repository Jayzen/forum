class TopicImage < ApplicationRecord
  mount_uploader :attach, ImageUploader
  belongs_to :topic
end
