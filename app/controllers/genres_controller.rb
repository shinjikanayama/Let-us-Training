class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    def create
     @genre = Genre.new(genre_params)
       if @genre.save
        redirect_to genres_path
       else
        flash.now[:alert] = 'ジャンル名を入力してください。'
        @genres = Genre.all
        render 'index'
       end
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to genres_path, notice: '変更しました。'
    else
      flash.now[:alert] = 'ジャンル名を入力してください。'
      @genre = Genre.find(params[:id])
      render 'edit' # エラーがある場合、edit テンプレートを再表示
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

