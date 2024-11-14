class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all.select { |m| @list.movies.include?(m)}
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)

    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
