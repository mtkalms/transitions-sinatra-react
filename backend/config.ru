require_relative 'config/environment'

map '/todos' do
  run TodoListController
end

map '/' do
  run ApplicationController
end
