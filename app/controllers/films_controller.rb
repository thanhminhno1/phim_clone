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
    redirect_to films_path
  end

  def edit
    @film = Film.find params[:id]
  end

  def update
    @film = Film.find params[:id]
    if @film.update process_params
      redirect_to films_path
    else
      render :edit
    end
  end

  private
  def film_params
    params.require(:film).permit :name, :description, :url, :image, :year_release,
      :country_id, :min_age, :quanlity, :running_time, :rate, :film_type, { category_films_attributes: [category_id: []]}
  end

  def process_params
    process_params = film_params.to_h
    process_params["category_films_attributes"] = process_params[:category_films_attributes]["0"][:category_id].reject(&:empty?).map{|p| {category_id: p}}
    process_params
  end
end
