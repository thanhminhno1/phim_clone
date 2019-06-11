class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    films_path
  end
end
