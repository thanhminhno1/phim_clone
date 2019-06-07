class CountriesController < AdminController
  def new
    @country = Country.new
  end

  def create
    @country = Country.create! category_params
    redirect_to new_country_path
  end

  private
  def category_params
    params.require(:country).permit :name
  end
end
