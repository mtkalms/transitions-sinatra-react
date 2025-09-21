require "bundler/setup"
Bundler.require(:default)

# Load app code
root = File.expand_path("..", __dir__)
Dir["#{root}/app/helpers/*.rb"].each { |f| require f }
Dir["#{root}/app/models/*.rb"].each { |f| require f }
Dir["#{root}/app/controllers/*.rb"].each { |f| require f }

# Set views path for all controllers if desired:
Sinatra::Base.set :views, File.expand_path("../app/views", __dir__)
Sinatra::Base.set :public_folder, File.expand_path("../public", __dir__)
