class Post < ApplicationRecord
  # validates :comment_id, presence: true
  validates :title, presence: true
  validates :image, presence: true
  validates :content, presence: true

  has_many :comments
  has_many :comment_posts, through: :comments, source: 'post' 

  mount_uploader :image, ImageUploader
end
