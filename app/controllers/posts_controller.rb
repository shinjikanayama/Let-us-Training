class PostsController < ApplicationController
  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = '記録に失敗しました。'
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def log
    user_id = current_user.id
    @posts = Post.where(user_id: user_id)
  end

  # 検索のためのコントローラー
  def search
    @keyword = params[:post][:search] if params[:post]
    @posts_all = Post.search(@keyword)
    @posts = @posts_all
  end

  def update
    @post = Post.find(params[:id])
    @post.score = Language.get_data(post_params[:body])
    if @post.update(post_params)
       redirect_to posts_path
    else
      flash.now[:alert] = '記録の変更ができませんでした。'
      @post = Post.find(params[:id])
      render 'edit' # エラーがある場合、editに再表示
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :body, :start_time, :image)
  end
end
