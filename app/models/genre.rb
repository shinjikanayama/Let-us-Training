class Genre < ApplicationRecord
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  belongs_to :user
end
