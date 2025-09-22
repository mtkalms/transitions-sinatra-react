require 'bundler/setup'
Bundler.require(:default)

# Load app code
root = File.expand_path('..', __dir__ || '.')
Dir["#{root}/app/helpers/*.rb"].sort.each { |f| require f }
Dir["#{root}/app/models/*.rb"].sort.each { |f| require f }
Dir["#{root}/app/controllers/*.rb"].sort.each { |f| require f }

# Set views path for all controllers if desired:
Sinatra::Base.set :views, File.expand_path('app/views', root)
Sinatra::Base.set :public_folder, File.expand_path('public', root)
