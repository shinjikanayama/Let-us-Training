class PostsController < ApplicationController
  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_parameter)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def log
    @posts = Post.all
  end

  def post_parameter
    params.require(:post).permit(:genre_id, :body, :start_time,)
  end
end
