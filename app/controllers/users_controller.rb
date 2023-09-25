class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path
    else
      flash.now[:alert] = 'ユーザーネームを入力してください。'
      @user = User.find(params[:id])
      render 'edit' # エラーがある場合、editに再表示
    end
  end
  
  
  

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :goal)
  end

end
