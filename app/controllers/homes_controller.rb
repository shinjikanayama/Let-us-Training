class HomesController < ApplicationController
  def top
  end

  def about
  end

  # ゲストログイン
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@gmail.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to log_posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end



end
