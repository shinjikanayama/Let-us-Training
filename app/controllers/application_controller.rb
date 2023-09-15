class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def top
    # :topアクション内でゲストユーザーを作成し、ログイン状態にするコード
    if params[:guest_login]
      guest_user = User.create_guest_user
      sign_in(guest_user)
    end
  end

  def after_sign_in_path_for(resource)
    log_posts_path
  end


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
