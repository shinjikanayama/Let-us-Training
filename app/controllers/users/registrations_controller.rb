# ゲストユーザーを削除できないようにする

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@gmail.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

  def create
    ActiveRecord::Base.transaction do
      super
      Genre.create(name: "胸トレ", user_id: current_user.id)
      Genre.create(name: "背中トレ", user_id: current_user.id)
      Genre.create(name: "足トレ", user_id: current_user.id)
      Genre.create(name: "肩トレ", user_id: current_user.id)
      Genre.create(name: "その他", user_id: current_user.id)
    end
  end
end