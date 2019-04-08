class Comment < ApplicationRecord
  validates :post_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
  validates :rating, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :post
end
