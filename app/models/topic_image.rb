class TopicImage < ApplicationRecord
  mount_uploader :attach, AttachmentUploader
  belongs_to :topic
end
