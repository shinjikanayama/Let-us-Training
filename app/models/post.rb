class Post < ApplicationRecord
  validates :genre_id, presence: true
  validates :body, presence: true

  has_one_attached :image

  belongs_to :user
  belongs_to :genre

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # bodyカラムを検索する
  def self.search(search)
    return Post.all unless search
     Post.joins(:genre).where('posts.body LIKE(?) OR genres.name LIKE(?)', "%#{search}%", "%#{search}%")
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
