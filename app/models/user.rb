class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}  #「~ @ ~ . ~」の形だけ許可

  has_secure_password
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
end
# 8~32アルファベットと数字はそれぞれ1文字以上含まないといけない
