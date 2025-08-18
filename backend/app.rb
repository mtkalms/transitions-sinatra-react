require 'sinatra'
require 'sinatra/activerecord'

Dir.glob('./{models,controllers}/*.rb').each { |file| require file }

get '/' do
  "Welcome to the Ruby side, where there's no one else but me."
end