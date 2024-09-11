class GenresController < ApplicationController

  def index 
    @genres = Genre.all 
    render json: @genres, serializer: GenreSerializer
  end

  def index_for_admin 
    @genres = Genre.all 
  end

  def show 
    @genre = Genre.find(params[:id])
    render json: @genre, serializer: GenreSerializer
  end

  def show_for_admin
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new 
  end

  def create 
    @genre = Genre.new(genre_params)
    @genre.save 
    redirect_to root_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.delete
    redirect_to root_path  
  end

  private 

  def genre_params
    params.require(:genre).permit(:name)
  end
end
