require 'sinatra'
require 'sinatra/activerecord'

Dir.glob('./{models,controllers}/*.rb').each { |file| require file }

get '/' do
  'Hello world!'
end