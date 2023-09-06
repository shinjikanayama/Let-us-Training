class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
