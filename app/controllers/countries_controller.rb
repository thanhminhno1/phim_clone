class CountriesController < ApplicationController
  def new
    @country = Country.new
  end

  def create
    @country = Country.create! category_params
  end

  private
  def category_params
    params.require(:country).permit :name
  end
end
