class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # フォローをした、されたの関係
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower

  # プロフィール画像がない場合no_image.jpgを表示
  def get_profile_image
    if profile_image.attached?
      image
    else
      'no_image.jpg'
    end
  end

   # フォローしたときの処理
  def follow(user_id)
    follows.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follows.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

end
