class CountriesController < AdminController
  before_action :load_country, only: %i(edit update delete)
  def new
    @country = Country.new
  end

  def create
    @country = Country.create! country_params
    redirect_to countries_path
  end

  def update
    if @country.update country_params
      redirect_to countries_path
    else
      render :new
    end
  end

  def delete
    @country.destroy
    redirect_to countries_path
  end

  def index
    @countries = Country.all.recent
  end

  private
  def country_params
    params.require(:country).permit :name
  end

  def load_country
    @country = Country.find params[:id]
  end
end
