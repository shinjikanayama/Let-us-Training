class UsersController < ApplicationController
  before_action :set_user, only: [:likes]

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

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end




  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:profile_image, :name, :goal)
  end

end
