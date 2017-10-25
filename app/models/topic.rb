class Topic < ApplicationRecord
  validates :user_id, presence: { message: "文章需指定用户" }
  validates :category_id, presence: { message: "话题分类不能为空" }
  validates :title, presence: { message: "标题不能为空" }
  validates :content, presence: { message: "内容不能为空" }
  validates :status, inclusion: { in: %w(on off), message: "话题状态必须为on|off" }
  mount_uploader :image, AttachmentUploader
  belongs_to :user
  belongs_to :category
  has_many :topic_images
  has_many :comments

  module Status
    On = 'on'
    Off = 'off'
  end
  
  searchable do 
    #boost是提高权重
    text :title, :boost => 5 
    text :content
    #关联comment
    text :comments do 
      comments.map(&:content) 
    end 
  end
end
