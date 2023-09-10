class Follow < ApplicationRecord
  # １人のユーザーはたくさんのユーザーをフォローできる
  belongs_to :follower, class_name: "User"
  # １人のユーザーはたくさんのユーザーにフォローされる
  belongs_to :followed, class_name: "User"
end
