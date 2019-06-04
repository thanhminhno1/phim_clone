class HomeController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    facebook = Koala::Facebook::API.new(User.first.token)
    a = facebook.get_object("#{Film.find(params[:id]).url}?fields=picture,source")
    @link = a["source"]
  end
end

