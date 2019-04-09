class Post < ApplicationRecord
  # validates :comment_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :image, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  has_many :comments


  mount_uploader :image, ImageUploader
end
