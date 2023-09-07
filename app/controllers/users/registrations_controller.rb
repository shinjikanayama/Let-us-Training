# ゲストユーザーを削除できないようにする

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@gmail.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

end