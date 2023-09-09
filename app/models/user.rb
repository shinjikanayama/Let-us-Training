class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

# プロフィール画像がない場合no_image.jpgを表示
  def get_profile_image
    if profile_image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
