class HomeController < ApplicationController
  def index
    response = HTTParty.get('https://www.facebook.com/vieshows/videos/378987882953688/')
    @link = response.to_s.match(/hd_src:"([A-Za-z0-9\/\.\-\=\&\?\_\:])+"/).to_s[8...-1]
    byebug
  end
end

