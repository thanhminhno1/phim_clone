class HomeController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    facebook = Koala::Facebook::API.new(User.first.token)
    puts  "========================= ================================ =============#{User.first.token} +================================"
    @film = Film.find(params[:id])
    @link = facebook.get_object("#{@film.url}?fields=picture,source")["source"]
  end
end

