# app/controllers/application_controller.rb
require "sinatra/base"

class ApplicationController < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :views, File.expand_path("../../views", __dir__)
  set :public_folder, File.expand_path("../../public", __dir__)

  before do
    @app_name = "Modular Sinatra App"
  end

  get '/' do
    "Welcome to the Ruby side, where there's no one else but me."
  end

  not_found do
    "This is not the page you are looking for."
  end

  error do
    status 500
  end
end
