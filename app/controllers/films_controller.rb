class FilmsController < AdminController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
    @film.category_films.build
  end

  def create
    ActiveRecord::Base.transaction do
      @film = Film.create! film_params
    end
    redirect_to films_path
  end

  def edit
    @film = Film.find params[:id]
  end

  def update
    @film = Film.find params[:id]
    if @film.update film_params
      redirect_to films_path
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find params[:id]
    @film.destroy
    redirect_to films_path
  end

  private
  def film_params
    params.require(:film).permit :name, :description, :url, :image, :year_release, :country_id, :min_age, :quanlity, :running_time, :rate, :film_type, category_ids: []
  end
end
