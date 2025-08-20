# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'

Dir.glob('./{models,controllers}/*.rb').sort.each { |file| require file }

get '/' do
  "Welcome to the Ruby side, where there's no one else but me."
end
