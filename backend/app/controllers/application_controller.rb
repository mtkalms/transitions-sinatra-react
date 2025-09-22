# app/controllers/application_controller.rb
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  helpers AuthenticationHelper

  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET', 'some-long-dev-secret-that-is-at-least-64-spaces-long-and-also-a-lot-more')
    register Sinatra::Flash
  end

  get '/' do
    authenticate!
    erb :home
  end

  not_found do
    erb :not_found
  end

  error do
    'There was an error while processing your request.'
  end

  # LOGIN
  get '/login' do
    erb :login
  end

  post '/login' do
    user = login!(params[:email], params[:password])
    original_request = session[:original_request]
    session[:original_request] = nil
    flash[:notice] = "Welcome back #{user.name}"
    redirect original_request || '/'
  rescue StandardError
    flash[:error] = 'Login failed. Please try again.'
    redirect '/login'
  end

  # SIGNUP
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create!(
      name: params['name'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )
    flash[:notice] = 'Successfully signed up.'
    redirect '/login'
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Signup failed. Please try again.'
    redirect '/signup'
  end

  get '/logout' do
    logout!
    flash[:notice] = 'Successfully logged out.'
    redirect '/login'
  end
end
