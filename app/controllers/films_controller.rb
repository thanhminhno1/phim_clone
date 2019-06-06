class FilmsController < AdminController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
    @film.category_films.build
  end

  def create
    @film = Film.create! process_params
  end

  private
  def film_params
    params.require(:film).permit :name, :description, :url, :image, :country_id, { category_films_attributes: [category_id: []]}
  end

  def process_params
    process_params = film_params.to_h
    process_params["category_films_attributes"] = process_params[:category_films_attributes]["0"][:category_id].reject(&:empty?).map{|p| {category_id: p}}
    process_params
  end
end
