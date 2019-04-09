class Comment < ApplicationRecord
  validates :post_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :rating, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :post
end
