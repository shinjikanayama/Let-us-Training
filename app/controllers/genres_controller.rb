class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = current_user.genres
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      redirect_to genres_path
    else
      flash.now[:alert] = 'ジャンル名を入力してください。'
      @genre = Genre.new
      @genres = current_user.genres
      render 'index'
    end
  end


  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to genres_path
    else
      flash.now[:alert] = 'ジャンル名を入力してください。'
      render 'edit' # エラーがある場合、editに再表示
    end
  end


  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end

