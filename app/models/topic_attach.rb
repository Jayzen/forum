class TopicAttach < ApplicationRecord
  belongs_to :user
  mount_uploader :image, AttachmentUploader
end
