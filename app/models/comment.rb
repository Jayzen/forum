class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :topic, counter_cache: true
end
