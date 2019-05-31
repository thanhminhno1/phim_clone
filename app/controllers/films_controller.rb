class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create! category_params
  end

  private
  def category_params
    params.require(:film).permit :name, :description, :url, :image, :country_id
  end
end
