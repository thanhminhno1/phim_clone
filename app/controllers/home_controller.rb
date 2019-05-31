class HomeController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    response = HTTParty.get(Film.find(params[:id]).url)
    @link = response.to_s.match(/hd_src:"([A-Za-z0-9\/\.\-\=\&\?\_\:])+"/).to_s[8...-1]
  end
end

